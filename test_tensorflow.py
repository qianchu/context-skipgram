
# coding: utf-8

# In[4]:


from __future__ import absolute_import, division, print_function

import os
os.environ["CUDA_VISIBLE_DEVICES"]="2"

import tensorflow as tf
import tensorflow.contrib.eager as tfe



tfe.executing_eagerly()        # => True
tf.executing_eagerly()


x = [[2.]]
m = tf.matmul(x, x)
print("hello, {}".format(m))

# Runs the op.


# In[6]:


is_gpu_available = tfe.num_gpus() > 0

# Create some Tensors
SIZE = 1000
cpu_tensor = tf.random_normal([SIZE, SIZE])

if is_gpu_available:
  gpu_tensor = cpu_tensor.gpu()
else:
  print("GPU not available.")


# In[7]:


if is_gpu_available:
  # First use of the GPU will be slow:
  print("Time to conduct first matmul on GPU:")
  get_ipython().run_line_magic('time', 'tf.matmul(gpu_tensor, gpu_tensor)')
  print()

  # Subsequent uses are much faster:
  print("Time to conduct second matmul on GPU:")
  get_ipython().run_line_magic('time', 'tf.matmul(gpu_tensor, gpu_tensor)')


# In[8]:


cpu_tensor = tf.random_normal([SIZE, SIZE])
print("Time to conduct CPU matmul:")
get_ipython().run_line_magic('time', 'tf.matmul(cpu_tensor, cpu_tensor)')
print()

if is_gpu_available:
  gpu_tensor = cpu_tensor.gpu()
  print("Time to conduct GPU matmul:")
  get_ipython().run_line_magic('time', 'tf.matmul(gpu_tensor, gpu_tensor)')

