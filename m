Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DE42568
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683478117; x=1715014117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p+mtQkT2NHCAfrfjuSrFeNYll4zZVDjMhsCcGjILW9w=;
  b=VdQkCHSl8SIt38LVJd1zFdI16Np7fyZu0vIxe0aQJ7eXFId/rhAgrE+v
   JWtbW8A5j3LCYJnFsDlKJfYEvqgkW57X3R25Fi9TpdmClukiLRnjnlWHY
   tftv+jSVqXt8Vi3MWe4cpbJwRLrxqLtLvpHqHt8sw3cFUgx94jyIihVCs
   b7soQwvGK89+XmUYvdyESdelDk7pKkqWz75AUF1KryHOu8WOGZu62dFZ1
   lcZ4HgWorQgh5uO4iT7Eyq7UeGw05tmABf3RrdTjXU9qYdbQK1lzQY+M+
   RAoiWcQ540Z9FrV3V+SCAUyUPM9Wxggf604dL/Ydq2Eq8bbyZsU+wVHH/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="329121652"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="329121652"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 09:48:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="842461135"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="842461135"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 May 2023 09:48:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvhYp-0000nz-12;
	Sun, 07 May 2023 16:48:35 +0000
Date: Mon, 8 May 2023 00:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: Faycal Benmlih <faycal.benmlih@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/platform/x86/socwatch/sw_output_buffer.c:344:22: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202305080012.eBtcczkm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Faycal,

First bad commit (maybe != root cause):

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_10
head:   c55df4a2b60fc7c6c4d00fd9f9fb447087833513
commit: e65547c5a9bb37e907edecece4da7cb12dadea96 platform/x86: Use $(srctree) instead of $(src) to adapt to kbuild regression
date:   2 years, 7 months ago
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230508/202305080012.eBtcczkm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/mchinth/linux/commit/e65547c5a9bb37e907edecece4da7cb12dadea96
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth sep_socwatch_linux_5_10
        git checkout e65547c5a9bb37e907edecece4da7cb12dadea96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/socperf/ drivers/platform/x86/socwatch/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305080012.eBtcczkm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/socwatch/sw_output_buffer.c:344:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *dest @@
   drivers/platform/x86/socwatch/sw_output_buffer.c:344:22: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socwatch/sw_output_buffer.c:344:22: sparse:     got void *dest
>> drivers/platform/x86/socwatch/sw_output_buffer.c:352:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   drivers/platform/x86/socwatch/sw_output_buffer.c:352:43: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socwatch/sw_output_buffer.c:352:43: sparse:     got void *
>> drivers/platform/x86/socwatch/sw_output_buffer.c:378:46: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_output_buffer.c:378:46: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_output_buffer.c:378:46: sparse:     got restricted gfp_t
   drivers/platform/x86/socwatch/sw_output_buffer.c:562:46: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_output_buffer.c:562:46: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_output_buffer.c:562:46: sparse:     got restricted gfp_t
   drivers/platform/x86/socwatch/sw_output_buffer.c:575:67: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_output_buffer.c:575:67: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_output_buffer.c:575:67: sparse:     got restricted gfp_t
>> drivers/platform/x86/socwatch/sw_output_buffer.c:774:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dest @@     got void [noderef] __user *buffer @@
   drivers/platform/x86/socwatch/sw_output_buffer.c:774:48: sparse:     expected void *dest
   drivers/platform/x86/socwatch/sw_output_buffer.c:774:48: sparse:     got void [noderef] __user *buffer
--
>> drivers/platform/x86/socwatch/sw_mem.c:141:18: sparse: sparse: cast to restricted gfp_t
   drivers/platform/x86/socwatch/sw_mem.c:305:38: sparse: sparse: cast to restricted gfp_t
--
>> drivers/platform/x86/socwatch/sw_collector.c:99:68: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_collector.c:99:68: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_collector.c:99:68: sparse:     got restricted gfp_t
>> drivers/platform/x86/socwatch/sw_collector.c:85:33: sparse: sparse: symbol 'sw_copy_driver_interface_info_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:116:5: sparse: sparse: symbol 'sw_init_driver_interface_info_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:138:5: sparse: sparse: symbol 'sw_init_ops_i' was not declared. Should it be static?
   drivers/platform/x86/socwatch/sw_collector.c:186:57: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_collector.c:186:57: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_collector.c:186:57: sparse:     got restricted gfp_t
   drivers/platform/x86/socwatch/sw_collector.c:214:57: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_collector.c:214:57: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_collector.c:214:57: sparse:     got restricted gfp_t
>> drivers/platform/x86/socwatch/sw_collector.c:211:24: sparse: sparse: symbol 'sw_alloc_ops_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:323:6: sparse: sparse: symbol 'sw_free_driver_interface_info_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:329:6: sparse: sparse: symbol 'sw_free_ops_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:335:5: sparse: sparse: symbol 'sw_reset_driver_interface_info_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:453:6: sparse: sparse: symbol 'sw_free_collector_msg_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:459:6: sparse: sparse: symbol 'sw_handle_per_cpu_msg_i' was not declared. Should it be static?
   drivers/platform/x86/socwatch/sw_collector.c:516:51: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_collector.c:516:51: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_collector.c:516:51: sparse:     got restricted gfp_t
--
>> drivers/platform/x86/socwatch/sw_hardware_io.c:149:55: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_hardware_io.c:149:55: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_hardware_io.c:149:55: sparse:     got restricted gfp_t
--
>> drivers/platform/x86/socwatch/sw_internal.c:176:50: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_internal.c:176:50: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_internal.c:176:50: sparse:     got restricted gfp_t
--
>> drivers/platform/x86/socwatch/sw_tracepoint_handlers.c:237:44: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_tracepoint_handlers.c:237:44: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_tracepoint_handlers.c:237:44: sparse:     got restricted gfp_t
--
>> drivers/platform/x86/socwatch/sw_driver.c:1309:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *[assigned] out_arg @@
   drivers/platform/x86/socwatch/sw_driver.c:1309:52: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socwatch/sw_driver.c:1309:52: sparse:     got char *[assigned] out_arg
>> drivers/platform/x86/socwatch/sw_driver.c:1053:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *buffer @@     got char *remote_buffer @@
   drivers/platform/x86/socwatch/sw_driver.c:1053:58: sparse:     expected void [noderef] __user *buffer
   drivers/platform/x86/socwatch/sw_driver.c:1053:58: sparse:     got char *remote_buffer
>> drivers/platform/x86/socwatch/sw_driver.c:1070:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *remote_cfg @@
   drivers/platform/x86/socwatch/sw_driver.c:1070:39: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socwatch/sw_driver.c:1070:39: sparse:     got char *remote_cfg

vim +344 drivers/platform/x86/socwatch/sw_output_buffer.c

688e338c753b33 Faycal Benmlih 2019-04-23  292  
688e338c753b33 Faycal Benmlih 2019-04-23  293  /*
688e338c753b33 Faycal Benmlih 2019-04-23  294   * Returns # of bytes successfully consumed on success
688e338c753b33 Faycal Benmlih 2019-04-23  295   * 0 on EOF (no error condition)
688e338c753b33 Faycal Benmlih 2019-04-23  296   */
688e338c753b33 Faycal Benmlih 2019-04-23  297  static size_t consume_buffer(void *dest, size_t bytes_to_read)
688e338c753b33 Faycal Benmlih 2019-04-23  298  {
688e338c753b33 Faycal Benmlih 2019-04-23  299  	size_t read_index = 0, write_index = 0, dst_index = 0;
688e338c753b33 Faycal Benmlih 2019-04-23  300  	size_t to_read = 0;
688e338c753b33 Faycal Benmlih 2019-04-23  301  	bool wrapped = false;
688e338c753b33 Faycal Benmlih 2019-04-23  302  	size_t read_size = bytes_to_read;
688e338c753b33 Faycal Benmlih 2019-04-23  303  	unsigned long bytes_not_copied = 0;
688e338c753b33 Faycal Benmlih 2019-04-23  304  	struct sw_driver_continuous_collect data = {0};
688e338c753b33 Faycal Benmlih 2019-04-23  305  
688e338c753b33 Faycal Benmlih 2019-04-23  306  	WRITE_LOCK(sw_continuous_lock);
688e338c753b33 Faycal Benmlih 2019-04-23  307  	smp_mb(); /* memory access ordering */
688e338c753b33 Faycal Benmlih 2019-04-23  308  	read_index = buffer.read_index;
688e338c753b33 Faycal Benmlih 2019-04-23  309  	write_index = buffer.write_index;
688e338c753b33 Faycal Benmlih 2019-04-23  310  	/* EXE sends size as header + payload; we only want payload */
688e338c753b33 Faycal Benmlih 2019-04-23  311  	read_size -= SW_DRIVER_CONTINUOUS_COLLECT_HEADER_SIZE();
688e338c753b33 Faycal Benmlih 2019-04-23  312  	data.collection_size = to_read =
688e338c753b33 Faycal Benmlih 2019-04-23  313  		MIN(read_size, get_data_available(&buffer));
688e338c753b33 Faycal Benmlih 2019-04-23  314  	pw_pr_debug(
688e338c753b33 Faycal Benmlih 2019-04-23  315  		"DEBUG: read = %zu, write = %zu, avail = %zu, to_read = %zu\n",
688e338c753b33 Faycal Benmlih 2019-04-23  316  		read_index, write_index, get_data_available(&buffer), to_read);
688e338c753b33 Faycal Benmlih 2019-04-23  317  	while (to_read) {
688e338c753b33 Faycal Benmlih 2019-04-23  318  		size_t curr_read = to_read;
688e338c753b33 Faycal Benmlih 2019-04-23  319  
688e338c753b33 Faycal Benmlih 2019-04-23  320  		if (read_index + to_read > buffer.size) {
688e338c753b33 Faycal Benmlih 2019-04-23  321  			curr_read = buffer.size - read_index;
688e338c753b33 Faycal Benmlih 2019-04-23  322  			wrapped = true;
688e338c753b33 Faycal Benmlih 2019-04-23  323  			pw_pr_debug(
688e338c753b33 Faycal Benmlih 2019-04-23  324  				"DEBUG: read = %zu, to_read = %zu, curr_read = %zu, buffer.size = %lu, WRAPPED!\n",
688e338c753b33 Faycal Benmlih 2019-04-23  325  				read_index, to_read, curr_read, buffer.size);
688e338c753b33 Faycal Benmlih 2019-04-23  326  		}
688e338c753b33 Faycal Benmlih 2019-04-23  327  		memcpy(&output_buffer[dst_index],
688e338c753b33 Faycal Benmlih 2019-04-23  328  			&buffer.data[read_index], curr_read);
688e338c753b33 Faycal Benmlih 2019-04-23  329  		read_index = (read_index + curr_read) & (buffer.size - 1);
688e338c753b33 Faycal Benmlih 2019-04-23  330  		to_read -= curr_read;
688e338c753b33 Faycal Benmlih 2019-04-23  331  		dst_index += curr_read;
688e338c753b33 Faycal Benmlih 2019-04-23  332  	}
688e338c753b33 Faycal Benmlih 2019-04-23  333  	buffer.read_index = read_index;
688e338c753b33 Faycal Benmlih 2019-04-23  334  	smp_mb(); /* memory access ordering */
688e338c753b33 Faycal Benmlih 2019-04-23  335  	pw_pr_debug("DEBUG: read at end of while = %zu\n", buffer.read_index);
688e338c753b33 Faycal Benmlih 2019-04-23  336  	WRITE_UNLOCK(sw_continuous_lock);
688e338c753b33 Faycal Benmlih 2019-04-23  337  
688e338c753b33 Faycal Benmlih 2019-04-23  338  	/*
688e338c753b33 Faycal Benmlih 2019-04-23  339  	 * Call 'copy_to_user' instead of 'sw_copy_to_user' since
688e338c753b33 Faycal Benmlih 2019-04-23  340  	 * sw_copy_to_user expects to see a 'struct uio' while this
688e338c753b33 Faycal Benmlih 2019-04-23  341  	 * is called from an IOCTL which does NOT have a 'struct uio'
688e338c753b33 Faycal Benmlih 2019-04-23  342  	 */
688e338c753b33 Faycal Benmlih 2019-04-23  343  	bytes_not_copied =
688e338c753b33 Faycal Benmlih 2019-04-23 @344  	copy_to_user(dest, (char *)&data,
688e338c753b33 Faycal Benmlih 2019-04-23  345  		SW_DRIVER_CONTINUOUS_COLLECT_HEADER_SIZE());
688e338c753b33 Faycal Benmlih 2019-04-23  346  	if (bytes_not_copied)
688e338c753b33 Faycal Benmlih 2019-04-23  347  		return 0;
688e338c753b33 Faycal Benmlih 2019-04-23  348  
688e338c753b33 Faycal Benmlih 2019-04-23  349  	pw_pr_debug("DEBUG: collection size = %u\n", data.collection_size);
688e338c753b33 Faycal Benmlih 2019-04-23  350  	if (data.collection_size) {
688e338c753b33 Faycal Benmlih 2019-04-23  351  		bytes_not_copied =
688e338c753b33 Faycal Benmlih 2019-04-23 @352  			copy_to_user(dest +
688e338c753b33 Faycal Benmlih 2019-04-23  353  				SW_DRIVER_CONTINUOUS_COLLECT_HEADER_SIZE(),
688e338c753b33 Faycal Benmlih 2019-04-23  354  				output_buffer, data.collection_size);
688e338c753b33 Faycal Benmlih 2019-04-23  355  		if (bytes_not_copied)
688e338c753b33 Faycal Benmlih 2019-04-23  356  			return 0;
688e338c753b33 Faycal Benmlih 2019-04-23  357  
688e338c753b33 Faycal Benmlih 2019-04-23  358  	}
688e338c753b33 Faycal Benmlih 2019-04-23  359  	return data.collection_size;
688e338c753b33 Faycal Benmlih 2019-04-23  360  }
688e338c753b33 Faycal Benmlih 2019-04-23  361  
688e338c753b33 Faycal Benmlih 2019-04-23  362  long initialize_circular_buffer(size_t size)
688e338c753b33 Faycal Benmlih 2019-04-23  363  {
688e338c753b33 Faycal Benmlih 2019-04-23  364  	size_t alloc_size = size, read_size = size;
688e338c753b33 Faycal Benmlih 2019-04-23  365  	/*
688e338c753b33 Faycal Benmlih 2019-04-23  366  	 * We require a power of two size
688e338c753b33 Faycal Benmlih 2019-04-23  367  	 */
688e338c753b33 Faycal Benmlih 2019-04-23  368  	pw_pr_debug("DEBUG: old alloc size = %zu\n", alloc_size);
688e338c753b33 Faycal Benmlih 2019-04-23  369  	if ((alloc_size & (alloc_size - 1)) != 0)
688e338c753b33 Faycal Benmlih 2019-04-23  370  		alloc_size = 1 << fls(alloc_size);
688e338c753b33 Faycal Benmlih 2019-04-23  371  
688e338c753b33 Faycal Benmlih 2019-04-23  372  	pw_pr_debug("DEBUG: new alloc size = %zu\n", alloc_size);
688e338c753b33 Faycal Benmlih 2019-04-23  373  	/* Create double-sized buffer */
688e338c753b33 Faycal Benmlih 2019-04-23  374  	alloc_size <<= 1;
688e338c753b33 Faycal Benmlih 2019-04-23  375  	pw_pr_debug("DEBUG: double alloc size = %zu\n", alloc_size);
688e338c753b33 Faycal Benmlih 2019-04-23  376  	memset(&buffer, 0, sizeof(buffer));
688e338c753b33 Faycal Benmlih 2019-04-23  377  	buffer.free_pages =
688e338c753b33 Faycal Benmlih 2019-04-23 @378  		sw_allocate_pages(GFP_KERNEL | __GFP_ZERO, alloc_size);
688e338c753b33 Faycal Benmlih 2019-04-23  379  	if (!buffer.free_pages) {
688e338c753b33 Faycal Benmlih 2019-04-23  380  		pw_pr_error("Couldn't allocate space for buffer!\n");
688e338c753b33 Faycal Benmlih 2019-04-23  381  		return -ENOMEM;
688e338c753b33 Faycal Benmlih 2019-04-23  382  	}
688e338c753b33 Faycal Benmlih 2019-04-23  383  	buffer.read_index = buffer.write_index = 0;
688e338c753b33 Faycal Benmlih 2019-04-23  384  	buffer.size = alloc_size;
688e338c753b33 Faycal Benmlih 2019-04-23  385  	SW_INIT_RWLOCK(sw_continuous_lock);
688e338c753b33 Faycal Benmlih 2019-04-23  386  	/*
688e338c753b33 Faycal Benmlih 2019-04-23  387  	 * Create temp output buffer
688e338c753b33 Faycal Benmlih 2019-04-23  388  	 */
688e338c753b33 Faycal Benmlih 2019-04-23  389  	output_buffer = vmalloc(read_size);
688e338c753b33 Faycal Benmlih 2019-04-23  390  	if (!output_buffer) {
688e338c753b33 Faycal Benmlih 2019-04-23  391  		pw_pr_error(
688e338c753b33 Faycal Benmlih 2019-04-23  392  			"Couldn't create temporary buffer for data output!\n");
688e338c753b33 Faycal Benmlih 2019-04-23  393  		return -ENOMEM;
688e338c753b33 Faycal Benmlih 2019-04-23  394  	}
688e338c753b33 Faycal Benmlih 2019-04-23  395  	return 0;
688e338c753b33 Faycal Benmlih 2019-04-23  396  }
688e338c753b33 Faycal Benmlih 2019-04-23  397  

:::::: The code at line 344 was first introduced by commit
:::::: 688e338c753b33c023de3b774f7347effbf537a4 Platform/x86: Update SoCWatch driver code to 2.10

:::::: TO: Faycal Benmlih <faycal.benmlih@intel.com>
:::::: CC: Faycal Benmlih <faycal.benmlih@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
