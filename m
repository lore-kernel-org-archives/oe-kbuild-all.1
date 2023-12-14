Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5F865B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 01:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUnq7ErE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702518386; x=1734054386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xbG/d0x6Brrghq/2/kJqUrjQrrpZAO1c1dJt75diRfM=;
  b=gUnq7ErEgt4qMh8GrAlaibx3JuwP9LbLEvpzxvRIhFB24omjV7dkXFm9
   fwVUHbZneBBhVGVzgxelJhF0guzhAVPho5gdtJp7y1vKn1+v8S68iANcX
   jDqXYNd7z/Q6jQMbxR7PMjruD05SiUtPpUvZSlB7ica7Dl5aORjZ8Q0Ki
   BNVMgO8D9+d1qIxW8/WHKroL1MhV+SJI2SCmNVufzC4KRDPUCCDPawXH5
   hXqOGzoJKNtMcWnZ+8q3B3zNL6eNCyHbz1dp3DfgqvA5rPgMNarVEK0YK
   /vkQ43cr542ALw8jYxHh1OPNXDL//CL9uZJejkR87j4nW2QXeCDbZG5Ei
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="393925394"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="393925394"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 17:46:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="22198622"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Dec 2023 17:46:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDanr-000LP5-1E;
	Thu, 14 Dec 2023 01:46:19 +0000
Date: Thu, 14 Dec 2023 09:46:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Tzvetomir Stoyanov (VMware)" <tz.stoyanov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [rostedt-trace:ring-buffer-multi-page-subbufers 37/47]
 kernel/trace/ring_buffer.c:5690: warning: Function parameter or member
 'data_page' not described in 'ring_buffer_free_read_page'
Message-ID: <202312140927.PZMqTtJh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git ring-buffer-multi-page-subbufers
head:   e24541a2a1a09ed1c10d0d0a887fe8cf0b350bb9
commit: 24791879a84daada5528634c4b515d0d20e5c3f8 [37/47] ring-buffer: Read and write to ring buffers with custom sub buffer size
config: i386-buildonly-randconfig-002-20231214 (https://download.01.org/0day-ci/archive/20231214/202312140927.PZMqTtJh-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312140927.PZMqTtJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140927.PZMqTtJh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/ring_buffer.c:5690: warning: Function parameter or member 'data_page' not described in 'ring_buffer_free_read_page'
>> kernel/trace/ring_buffer.c:5690: warning: Excess function parameter 'page' description in 'ring_buffer_free_read_page'


vim +5690 kernel/trace/ring_buffer.c

8789a9e7df6bf9b Steven Rostedt              2008-12-02  5679  
8789a9e7df6bf9b Steven Rostedt              2008-12-02  5680  /**
8789a9e7df6bf9b Steven Rostedt              2008-12-02  5681   * ring_buffer_free_read_page - free an allocated read page
8789a9e7df6bf9b Steven Rostedt              2008-12-02  5682   * @buffer: the buffer the page was allocate for
73a757e63114dfd Steven Rostedt (VMware      2017-05-01  5683)  * @cpu: the cpu buffer the page came from
24791879a84daad Tzvetomir Stoyanov (VMware  2021-12-13  5684)  * @page: the page to free
8789a9e7df6bf9b Steven Rostedt              2008-12-02  5685   *
8789a9e7df6bf9b Steven Rostedt              2008-12-02  5686   * Free a page allocated from ring_buffer_alloc_read_page.
8789a9e7df6bf9b Steven Rostedt              2008-12-02  5687   */
24791879a84daad Tzvetomir Stoyanov (VMware  2021-12-13  5688) void ring_buffer_free_read_page(struct trace_buffer *buffer, int cpu,
24791879a84daad Tzvetomir Stoyanov (VMware  2021-12-13  5689) 				struct buffer_data_read_page *data_page)
8789a9e7df6bf9b Steven Rostedt              2008-12-02 @5690  {
3e4272b99540949 Jia-Ju Bai                  2023-01-13  5691  	struct ring_buffer_per_cpu *cpu_buffer;
24791879a84daad Tzvetomir Stoyanov (VMware  2021-12-13  5692) 	struct buffer_data_page *bpage = data_page->data;
ae415fa4c5248a8 Steven Rostedt (VMware      2017-12-22  5693) 	struct page *page = virt_to_page(bpage);
73a757e63114dfd Steven Rostedt (VMware      2017-05-01  5694) 	unsigned long flags;
73a757e63114dfd Steven Rostedt (VMware      2017-05-01  5695) 
3e4272b99540949 Jia-Ju Bai                  2023-01-13  5696  	if (!buffer || !buffer->buffers || !buffer->buffers[cpu])
3e4272b99540949 Jia-Ju Bai                  2023-01-13  5697  		return;
3e4272b99540949 Jia-Ju Bai                  2023-01-13  5698  
3e4272b99540949 Jia-Ju Bai                  2023-01-13  5699  	cpu_buffer = buffer->buffers[cpu];
3e4272b99540949 Jia-Ju Bai                  2023-01-13  5700  
24791879a84daad Tzvetomir Stoyanov (VMware  2021-12-13  5701) 	/*
24791879a84daad Tzvetomir Stoyanov (VMware  2021-12-13  5702) 	 * If the page is still in use someplace else, or order of the page
24791879a84daad Tzvetomir Stoyanov (VMware  2021-12-13  5703) 	 * is different from the subbuffer order of the buffer -
24791879a84daad Tzvetomir Stoyanov (VMware  2021-12-13  5704) 	 * we can't reuse it
24791879a84daad Tzvetomir Stoyanov (VMware  2021-12-13  5705) 	 */
24791879a84daad Tzvetomir Stoyanov (VMware  2021-12-13  5706) 	if (page_ref_count(page) > 1 || data_page->order != buffer->subbuf_order)
ae415fa4c5248a8 Steven Rostedt (VMware      2017-12-22  5707) 		goto out;
ae415fa4c5248a8 Steven Rostedt (VMware      2017-12-22  5708) 
73a757e63114dfd Steven Rostedt (VMware      2017-05-01  5709) 	local_irq_save(flags);
73a757e63114dfd Steven Rostedt (VMware      2017-05-01  5710) 	arch_spin_lock(&cpu_buffer->lock);
73a757e63114dfd Steven Rostedt (VMware      2017-05-01  5711) 
73a757e63114dfd Steven Rostedt (VMware      2017-05-01  5712) 	if (!cpu_buffer->free_page) {
73a757e63114dfd Steven Rostedt (VMware      2017-05-01  5713) 		cpu_buffer->free_page = bpage;
73a757e63114dfd Steven Rostedt (VMware      2017-05-01  5714) 		bpage = NULL;
73a757e63114dfd Steven Rostedt (VMware      2017-05-01  5715) 	}
73a757e63114dfd Steven Rostedt (VMware      2017-05-01  5716) 
73a757e63114dfd Steven Rostedt (VMware      2017-05-01  5717) 	arch_spin_unlock(&cpu_buffer->lock);
73a757e63114dfd Steven Rostedt (VMware      2017-05-01  5718) 	local_irq_restore(flags);
73a757e63114dfd Steven Rostedt (VMware      2017-05-01  5719) 
ae415fa4c5248a8 Steven Rostedt (VMware      2017-12-22  5720)  out:
24791879a84daad Tzvetomir Stoyanov (VMware  2021-12-13  5721) 	free_pages((unsigned long)bpage, data_page->order);
24791879a84daad Tzvetomir Stoyanov (VMware  2021-12-13  5722) 	kfree(data_page);
8789a9e7df6bf9b Steven Rostedt              2008-12-02  5723  }
d6ce96dabe2c440 Steven Rostedt              2009-05-05  5724  EXPORT_SYMBOL_GPL(ring_buffer_free_read_page);
8789a9e7df6bf9b Steven Rostedt              2008-12-02  5725  

:::::: The code at line 5690 was first introduced by commit
:::::: 8789a9e7df6bf9b93739c4c7d4e380725bc9e936 ring-buffer: read page interface

:::::: TO: Steven Rostedt <srostedt@redhat.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
