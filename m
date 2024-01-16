Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD4A11706
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KvDrOILC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705392949; x=1736928949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WU36ocGO6k0NXyGrLiO7MlDZDDyptfINp83pY0yJa+8=;
  b=KvDrOILCOxKvi48bS8Rg+qHAu3XUkYos3rSmUIZE6JXzFrCXHfAHoCle
   O/N+KDoFjAfJTNq/MJoDS4FyiqDND0/JyZCWsqILWexqEf2YoERsoO2im
   sV/qOGRv/Ue11kZydKfiHc80Xmp5LDxzkpafhx+RC6kNAq8y/dqrHtehC
   /ZXsVFClmuWkvGQmZU39yTrNP81kH/RCp54Ib8bHg+pBYT6tEeDX7sKvr
   mWLMSyUC9zs0JThwbCMMgypznukGI0oB2Bbjirz4CWZ9PFFeMBVW6GLma
   Osjrx1hnYsswJO1M26VGqpr0239eoOYPVkL4dVDCvSuMP7etpHWZjI8Ap
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="399458634"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="399458634"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 00:15:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="907304219"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="907304219"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Jan 2024 00:15:47 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPebo-0000DU-2f;
	Tue, 16 Jan 2024 08:15:44 +0000
Date: Tue, 16 Jan 2024 16:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 148/175]
 kernel/trace/ring_buffer.c:1833: warning: Function parameter or member
 'writer' not described in '__ring_buffer_alloc'
Message-ID: <202401161634.EQKR7L8L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   58104a7a488632b39f3712aa1641d7c693c8c7a5
commit: 8ab8966bc35292c86fed0985e28c73fd94df9a3b [148/175] ANDROID: ring-buffer: Introducing ring-buffer writer
config: i386-buildonly-randconfig-002-20240116 (https://download.01.org/0day-ci/archive/20240116/202401161634.EQKR7L8L-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401161634.EQKR7L8L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401161634.EQKR7L8L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/ring_buffer.c:936: warning: Function parameter or member 'cpu' not described in 'ring_buffer_wake_waiters'
>> kernel/trace/ring_buffer.c:1833: warning: Function parameter or member 'writer' not described in '__ring_buffer_alloc'
   kernel/trace/ring_buffer.c:5427: warning: Excess function parameter 'cpu' description in 'ring_buffer_reset_online_cpus'


vim +1833 kernel/trace/ring_buffer.c

7a8e76a3829f10 Steven Rostedt            2008-09-29  1818  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1819  /**
d611851b421731 zhangwei(Jovi             2013-07-15  1820)  * __ring_buffer_alloc - allocate a new ring_buffer
68814b58c52077 Robert Richter            2008-11-24  1821   * @size: the size in bytes per cpu that is needed.
7a8e76a3829f10 Steven Rostedt            2008-09-29  1822   * @flags: attributes to set for the ring buffer.
59e7cffe5cca6f Fabian Frederick          2014-06-05  1823   * @key: ring buffer reader_lock_key.
7a8e76a3829f10 Steven Rostedt            2008-09-29  1824   *
7a8e76a3829f10 Steven Rostedt            2008-09-29  1825   * Currently the only flag that is available is the RB_FL_OVERWRITE
7a8e76a3829f10 Steven Rostedt            2008-09-29  1826   * flag. This flag means that the buffer will overwrite old data
7a8e76a3829f10 Steven Rostedt            2008-09-29  1827   * when the buffer wraps. If this flag is not set, the buffer will
7a8e76a3829f10 Steven Rostedt            2008-09-29  1828   * drop data when the tail hits the head.
7a8e76a3829f10 Steven Rostedt            2008-09-29  1829   */
13292494379f92 Steven Rostedt (VMware    2019-12-13  1830) struct trace_buffer *__ring_buffer_alloc(unsigned long size, unsigned flags,
8ab8966bc35292 Vincent Donnefort         2023-06-09  1831  					struct lock_class_key *key,
8ab8966bc35292 Vincent Donnefort         2023-06-09  1832  					struct ring_buffer_writer *writer)
7a8e76a3829f10 Steven Rostedt            2008-09-29 @1833  {
13292494379f92 Steven Rostedt (VMware    2019-12-13  1834) 	struct trace_buffer *buffer;
9b94a8fba501f3 Steven Rostedt (Red Hat   2016-05-12  1835) 	long nr_pages;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1836  	int bsize;
9b94a8fba501f3 Steven Rostedt (Red Hat   2016-05-12  1837) 	int cpu;
b32614c03413f8 Sebastian Andrzej Siewior 2016-11-27  1838  	int ret;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1839  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1840  	/* keep it in its own cache line */
7a8e76a3829f10 Steven Rostedt            2008-09-29  1841  	buffer = kzalloc(ALIGN(sizeof(*buffer), cache_line_size()),
7a8e76a3829f10 Steven Rostedt            2008-09-29  1842  			 GFP_KERNEL);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1843  	if (!buffer)
7a8e76a3829f10 Steven Rostedt            2008-09-29  1844  		return NULL;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1845  
b18cc3de00ec34 Sebastian Andrzej Siewior 2016-12-07  1846  	if (!zalloc_cpumask_var(&buffer->cpumask, GFP_KERNEL))
9e01c1b74c9531 Rusty Russell             2009-01-01  1847  		goto fail_free_buffer;
9e01c1b74c9531 Rusty Russell             2009-01-01  1848  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  1849  	nr_pages = DIV_ROUND_UP(size, BUF_PAGE_SIZE);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1850  	buffer->flags = flags;
37886f6a9f62d2 Steven Rostedt            2009-03-17  1851  	buffer->clock = trace_clock_local;
1f8a6a10fb9437 Peter Zijlstra            2009-06-08  1852  	buffer->reader_lock_key = key;
8ab8966bc35292 Vincent Donnefort         2023-06-09  1853  	if (writer) {
8ab8966bc35292 Vincent Donnefort         2023-06-09  1854  		buffer->writer = writer;
8ab8966bc35292 Vincent Donnefort         2023-06-09  1855  		atomic_inc(&buffer->record_disabled);
8ab8966bc35292 Vincent Donnefort         2023-06-09  1856  	}
7a8e76a3829f10 Steven Rostedt            2008-09-29  1857  
15693458c4bc06 Steven Rostedt (Red Hat   2013-02-28  1858) 	init_irq_work(&buffer->irq_work.work, rb_wake_up_waiters);
f1dc6725882b5c Steven Rostedt (Red Hat   2013-03-04  1859) 	init_waitqueue_head(&buffer->irq_work.waiters);
15693458c4bc06 Steven Rostedt (Red Hat   2013-02-28  1860) 
7a8e76a3829f10 Steven Rostedt            2008-09-29  1861  	/* need at least two pages */
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  1862  	if (nr_pages < 2)
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  1863  		nr_pages = 2;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1864  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1865  	buffer->cpus = nr_cpu_ids;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1866  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1867  	bsize = sizeof(void *) * nr_cpu_ids;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1868  	buffer->buffers = kzalloc(ALIGN(bsize, cache_line_size()),
7a8e76a3829f10 Steven Rostedt            2008-09-29  1869  				  GFP_KERNEL);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1870  	if (!buffer->buffers)
9e01c1b74c9531 Rusty Russell             2009-01-01  1871  		goto fail_free_cpumask;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1872  
b32614c03413f8 Sebastian Andrzej Siewior 2016-11-27  1873  	cpu = raw_smp_processor_id();
b32614c03413f8 Sebastian Andrzej Siewior 2016-11-27  1874  	cpumask_set_cpu(cpu, buffer->cpumask);
b32614c03413f8 Sebastian Andrzej Siewior 2016-11-27  1875  	buffer->buffers[cpu] = rb_allocate_cpu_buffer(buffer, nr_pages, cpu);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1876  	if (!buffer->buffers[cpu])
7a8e76a3829f10 Steven Rostedt            2008-09-29  1877  		goto fail_free_buffers;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1878  
b32614c03413f8 Sebastian Andrzej Siewior 2016-11-27  1879  	ret = cpuhp_state_add_instance(CPUHP_TRACE_RB_PREPARE, &buffer->node);
b32614c03413f8 Sebastian Andrzej Siewior 2016-11-27  1880  	if (ret < 0)
b32614c03413f8 Sebastian Andrzej Siewior 2016-11-27  1881  		goto fail_free_buffers;
554f786e284a6c Steven Rostedt            2009-03-11  1882  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1883  	mutex_init(&buffer->mutex);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1884  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1885  	return buffer;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1886  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1887   fail_free_buffers:
7a8e76a3829f10 Steven Rostedt            2008-09-29  1888  	for_each_buffer_cpu(buffer, cpu) {
7a8e76a3829f10 Steven Rostedt            2008-09-29  1889  		if (buffer->buffers[cpu])
7a8e76a3829f10 Steven Rostedt            2008-09-29  1890  			rb_free_cpu_buffer(buffer->buffers[cpu]);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1891  	}
7a8e76a3829f10 Steven Rostedt            2008-09-29  1892  	kfree(buffer->buffers);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1893  
9e01c1b74c9531 Rusty Russell             2009-01-01  1894   fail_free_cpumask:
9e01c1b74c9531 Rusty Russell             2009-01-01  1895  	free_cpumask_var(buffer->cpumask);
9e01c1b74c9531 Rusty Russell             2009-01-01  1896  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1897   fail_free_buffer:
7a8e76a3829f10 Steven Rostedt            2008-09-29  1898  	kfree(buffer);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1899  	return NULL;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1900  }
1f8a6a10fb9437 Peter Zijlstra            2009-06-08  1901  EXPORT_SYMBOL_GPL(__ring_buffer_alloc);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1902  

:::::: The code at line 1833 was first introduced by commit
:::::: 7a8e76a3829f1067b70f715771ff88baf2fbf3c3 tracing: unified trace buffer

:::::: TO: Steven Rostedt <rostedt@goodmis.org>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
