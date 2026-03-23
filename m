Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7270372B53
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 23:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308986; cv=none; b=eCLtGkBM7cJA1raltsgilgTX/7RexNXNo8A0M2f2VIn1Rloa0GHTtNs3/pgSuz7rIsUv310Utk41we8fjfSGU6sqCbDNAKUXNUYJ6qId9KTqJUaA73xMp0Vvb01INpyJr7Q0WlDuroeAxtLkvLqEzVZGFi0djhz7Ydhu/PQEzpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308986; c=relaxed/simple;
	bh=om/4WTsH0avrplmibpmmkZqkKznqraryRYWY9bdnwdE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g9OumGAJsIBDGrJd5hbOWxsf0a1GPX0ZhbVgSXy/wlsqlk1FHM9JDMwmFOASBSPs2Zzsrl3BLWLg7pk0dB3nN7EieTnTR3LH9WB6MVsfWLawECja4BRdOsOiIHb+eMvDxL9XtBk1I8MoVEffkd0i/bljg1caN7/NR7PVVPKgZnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYv66EfQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYv66EfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774308985; x=1805844985;
  h=date:from:to:cc:subject:message-id;
  bh=om/4WTsH0avrplmibpmmkZqkKznqraryRYWY9bdnwdE=;
  b=ZYv66EfQH5SIjZyBFP7plnfON5sNzSNZzHYijRIbI6ejbkE8a7oIIWzi
   +mQS3HS0CvCqjgmPXLQHA5d+34PAQho/V4a8kTxHgaivjxJttG6L7nlqi
   8kXiu7+3qoR+KDeU+zmbAv6DAZN0meQvbsvRn9C6mxez7lrXQiHlYKSfd
   IXKwxIVrirceLIIuQ9AZYujgtGJPdyrBBcH65XB5T9j5Dq0uikvoGyP25
   NPuLgMS65pRGY90zwYrqEPP6SmSiL+L39vaD9a8TI4MtfLVXn4QP7mMUC
   07gTrZPTmsfcMnBvPM/pVA1yPnef3b2BfJGWsG3kzP1wj5Nwk4YMifbpJ
   A==;
X-CSE-ConnectionGUID: nrgOhgM2QdWlkxyoRFhxiQ==
X-CSE-MsgGUID: YbODxYNNTLuIHt75VPjRZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="92895884"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="92895884"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 16:36:24 -0700
X-CSE-ConnectionGUID: AsSEXqUxRXSo5vfimn+Tqg==
X-CSE-MsgGUID: XxxR+AO3Sjqz9J93Y9fZqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247862124"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Mar 2026 16:36:22 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4oom-000000003On-2cxy;
	Mon, 23 Mar 2026 23:36:20 +0000
Date: Tue, 24 Mar 2026 07:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 kernel/trace/ring_buffer.c:1821: warning: Function parameter or member
 'writer' not described in '__ring_buffer_alloc'
Message-ID: <202603240739.zzeHLKKA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3a8949cdc45bfeb1a68ac0e70e90909c13d3910e
commit: bc115ff00f4cd4d21ddf7e6e200f389d81acc69e [0/1] ANDROID: ring-buffer: Introducing ring-buffer writer
config: i386-buildonly-randconfig-001-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240739.zzeHLKKA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240739.zzeHLKKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240739.zzeHLKKA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/ring_buffer.c:1821: warning: Function parameter or member 'writer' not described in '__ring_buffer_alloc'


vim +1821 kernel/trace/ring_buffer.c

7a8e76a3829f10 Steven Rostedt            2008-09-29  1806  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1807  /**
d611851b421731 zhangwei(Jovi             2013-07-15  1808)  * __ring_buffer_alloc - allocate a new ring_buffer
68814b58c52077 Robert Richter            2008-11-24  1809   * @size: the size in bytes per cpu that is needed.
7a8e76a3829f10 Steven Rostedt            2008-09-29  1810   * @flags: attributes to set for the ring buffer.
59e7cffe5cca6f Fabian Frederick          2014-06-05  1811   * @key: ring buffer reader_lock_key.
7a8e76a3829f10 Steven Rostedt            2008-09-29  1812   *
7a8e76a3829f10 Steven Rostedt            2008-09-29  1813   * Currently the only flag that is available is the RB_FL_OVERWRITE
7a8e76a3829f10 Steven Rostedt            2008-09-29  1814   * flag. This flag means that the buffer will overwrite old data
7a8e76a3829f10 Steven Rostedt            2008-09-29  1815   * when the buffer wraps. If this flag is not set, the buffer will
7a8e76a3829f10 Steven Rostedt            2008-09-29  1816   * drop data when the tail hits the head.
7a8e76a3829f10 Steven Rostedt            2008-09-29  1817   */
13292494379f92 Steven Rostedt (VMware    2019-12-13  1818) struct trace_buffer *__ring_buffer_alloc(unsigned long size, unsigned flags,
bc115ff00f4cd4 Vincent Donnefort         2023-06-09  1819  					struct lock_class_key *key,
bc115ff00f4cd4 Vincent Donnefort         2023-06-09  1820  					struct ring_buffer_writer *writer)
7a8e76a3829f10 Steven Rostedt            2008-09-29 @1821  {
13292494379f92 Steven Rostedt (VMware    2019-12-13  1822) 	struct trace_buffer *buffer;
9b94a8fba501f3 Steven Rostedt (Red Hat   2016-05-12  1823) 	long nr_pages;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1824  	int bsize;
9b94a8fba501f3 Steven Rostedt (Red Hat   2016-05-12  1825) 	int cpu;
b32614c03413f8 Sebastian Andrzej Siewior 2016-11-27  1826  	int ret;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1827  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1828  	/* keep it in its own cache line */
7a8e76a3829f10 Steven Rostedt            2008-09-29  1829  	buffer = kzalloc(ALIGN(sizeof(*buffer), cache_line_size()),
7a8e76a3829f10 Steven Rostedt            2008-09-29  1830  			 GFP_KERNEL);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1831  	if (!buffer)
7a8e76a3829f10 Steven Rostedt            2008-09-29  1832  		return NULL;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1833  
b18cc3de00ec34 Sebastian Andrzej Siewior 2016-12-07  1834  	if (!zalloc_cpumask_var(&buffer->cpumask, GFP_KERNEL))
9e01c1b74c9531 Rusty Russell             2009-01-01  1835  		goto fail_free_buffer;
9e01c1b74c9531 Rusty Russell             2009-01-01  1836  
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  1837  	nr_pages = DIV_ROUND_UP(size, BUF_PAGE_SIZE);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1838  	buffer->flags = flags;
37886f6a9f62d2 Steven Rostedt            2009-03-17  1839  	buffer->clock = trace_clock_local;
1f8a6a10fb9437 Peter Zijlstra            2009-06-08  1840  	buffer->reader_lock_key = key;
bc115ff00f4cd4 Vincent Donnefort         2023-06-09  1841  	if (writer) {
bc115ff00f4cd4 Vincent Donnefort         2023-06-09  1842  		buffer->writer = writer;
bc115ff00f4cd4 Vincent Donnefort         2023-06-09  1843  		atomic_inc(&buffer->record_disabled);
bc115ff00f4cd4 Vincent Donnefort         2023-06-09  1844  	}
7a8e76a3829f10 Steven Rostedt            2008-09-29  1845  
15693458c4bc06 Steven Rostedt (Red Hat   2013-02-28  1846) 	init_irq_work(&buffer->irq_work.work, rb_wake_up_waiters);
f1dc6725882b5c Steven Rostedt (Red Hat   2013-03-04  1847) 	init_waitqueue_head(&buffer->irq_work.waiters);
15693458c4bc06 Steven Rostedt (Red Hat   2013-02-28  1848) 
7a8e76a3829f10 Steven Rostedt            2008-09-29  1849  	/* need at least two pages */
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  1850  	if (nr_pages < 2)
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  1851  		nr_pages = 2;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1852  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1853  	buffer->cpus = nr_cpu_ids;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1854  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1855  	bsize = sizeof(void *) * nr_cpu_ids;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1856  	buffer->buffers = kzalloc(ALIGN(bsize, cache_line_size()),
7a8e76a3829f10 Steven Rostedt            2008-09-29  1857  				  GFP_KERNEL);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1858  	if (!buffer->buffers)
9e01c1b74c9531 Rusty Russell             2009-01-01  1859  		goto fail_free_cpumask;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1860  
b32614c03413f8 Sebastian Andrzej Siewior 2016-11-27  1861  	cpu = raw_smp_processor_id();
b32614c03413f8 Sebastian Andrzej Siewior 2016-11-27  1862  	cpumask_set_cpu(cpu, buffer->cpumask);
b32614c03413f8 Sebastian Andrzej Siewior 2016-11-27  1863  	buffer->buffers[cpu] = rb_allocate_cpu_buffer(buffer, nr_pages, cpu);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1864  	if (!buffer->buffers[cpu])
7a8e76a3829f10 Steven Rostedt            2008-09-29  1865  		goto fail_free_buffers;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1866  
b32614c03413f8 Sebastian Andrzej Siewior 2016-11-27  1867  	ret = cpuhp_state_add_instance(CPUHP_TRACE_RB_PREPARE, &buffer->node);
b32614c03413f8 Sebastian Andrzej Siewior 2016-11-27  1868  	if (ret < 0)
b32614c03413f8 Sebastian Andrzej Siewior 2016-11-27  1869  		goto fail_free_buffers;
554f786e284a6c Steven Rostedt            2009-03-11  1870  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1871  	mutex_init(&buffer->mutex);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1872  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1873  	return buffer;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1874  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1875   fail_free_buffers:
7a8e76a3829f10 Steven Rostedt            2008-09-29  1876  	for_each_buffer_cpu(buffer, cpu) {
7a8e76a3829f10 Steven Rostedt            2008-09-29  1877  		if (buffer->buffers[cpu])
7a8e76a3829f10 Steven Rostedt            2008-09-29  1878  			rb_free_cpu_buffer(buffer->buffers[cpu]);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1879  	}
7a8e76a3829f10 Steven Rostedt            2008-09-29  1880  	kfree(buffer->buffers);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1881  
9e01c1b74c9531 Rusty Russell             2009-01-01  1882   fail_free_cpumask:
9e01c1b74c9531 Rusty Russell             2009-01-01  1883  	free_cpumask_var(buffer->cpumask);
9e01c1b74c9531 Rusty Russell             2009-01-01  1884  
7a8e76a3829f10 Steven Rostedt            2008-09-29  1885   fail_free_buffer:
7a8e76a3829f10 Steven Rostedt            2008-09-29  1886  	kfree(buffer);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1887  	return NULL;
7a8e76a3829f10 Steven Rostedt            2008-09-29  1888  }
1f8a6a10fb9437 Peter Zijlstra            2009-06-08  1889  EXPORT_SYMBOL_GPL(__ring_buffer_alloc);
7a8e76a3829f10 Steven Rostedt            2008-09-29  1890  

:::::: The code at line 1821 was first introduced by commit
:::::: 7a8e76a3829f1067b70f715771ff88baf2fbf3c3 tracing: unified trace buffer

:::::: TO: Steven Rostedt <rostedt@goodmis.org>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
