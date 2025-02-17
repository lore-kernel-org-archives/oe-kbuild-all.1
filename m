Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EE335968
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 13:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739800306; cv=none; b=WW2L/PjFItQ9O/xnomVqJyaiFQgz6sGPLEBklp8AbeYc+45lU8D/zxkq4S0KdqQTEz4ZIj+7Yj32y07cL5/4uXK+viFcu5qcps8VS2NT9XWqbumKZHvP3o1KwUOK1NwD0du1VsBK0OIjF8QRMImRR4NyTae/JaoN+Il1zGs1rFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739800306; c=relaxed/simple;
	bh=8SOrm47J2PhTL8Tqc6+yBg6TgGzLu2vNddsVc++PlHw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qIpfX1/qyh0GvhOZjBHx2ztw/lP1sd3gs04pjiHZMoC+Vbgn03ZPgFYcPiM0UEasLQpwxQ+HvOXOPCyTQvQj7wiPXkUoy4EyP7ZbID0hU/+Q2er617lb7QD+WmB8UfYdJOXB+8LXcLd7xKbJKmgmelrJTwgnWcpNhQnHy+xzCwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbXG1fL+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbXG1fL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739800304; x=1771336304;
  h=date:from:cc:subject:message-id:mime-version;
  bh=8SOrm47J2PhTL8Tqc6+yBg6TgGzLu2vNddsVc++PlHw=;
  b=gbXG1fL+kyvq8UmWPvxOKkZKpH0oJEA/rVxQIrFsfe8Yfi90AgheIY7K
   6E/OTnLd6QHKEzDYTstTk9tiTgLSkNzRNd+ePEkpr+8aQXaTzns0N43PX
   g4fm92BT9QFosji77zYuEPrqJlcrr2M8KF46FngZgo/FPovkYi+se/Iaq
   JcHJ2fsVjbh7AhMo/n8UM40Df6A33Ng0zdpvVG0J96vBAB4v/F2bD/EtF
   zdRJVfkfkPif/UCLW7JffGZwILwd2HjtotSNE7bfi18+ciTkVtfz29/mG
   mB2oNmT2hVxKyOrnURAU/Ga9Vau13JdkW4MTINiXENOmLqSXkTfR7wIoA
   g==;
X-CSE-ConnectionGUID: UBCzr4OYTEGokb/7uA+m1A==
X-CSE-MsgGUID: bNBS5fsyT+G5HzYnIO6btA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="50697041"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="50697041"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 05:51:43 -0800
X-CSE-ConnectionGUID: 92/I1KmlS1Sraq5cbQrEsA==
X-CSE-MsgGUID: y48sJmOETgCSD1i+BuSXQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="113999609"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Feb 2025 05:51:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk1X9-001DB1-1j
	for oe-kbuild-all@lists.linux.dev;
	Mon, 17 Feb 2025 13:51:39 +0000
Date: Mon, 17 Feb 2025 21:51:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/dma/dmatest.c:730:24: warning: array
 subscript <unknown> is outside array bounds of 'dma_addr_t[0]' {aka 'long
 long unsigned int[]'}
Message-ID: <202502172121.VuUzwKEa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexandru,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 361deb7243d275ba8ce6e27db7727fce6fd39f3e [1/1] dmaengine: dmatest: wrap src & dst data into a struct
config: sparc64-randconfig-002-20250217 (https://download.01.org/0day-ci/archive/20250217/202502172121.VuUzwKEa-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502172121.VuUzwKEa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502172121.VuUzwKEa-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/dynamic_debug.h:126:9: note: in expansion of macro 'if'
     126 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |         ^~
   include/linux/printk.h:335:9: note: in expansion of macro 'dynamic_pr_debug'
     335 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/dma/dmatest.c:833:17: note: in expansion of macro 'pr_debug'
     833 |                 pr_debug("%s: verifying dest buffer...\n", current->comm);
         |                 ^~~~~~~~
   drivers/dma/dmatest.c: In function 'dmatest_cleanup_channel':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/dynamic_debug.h:126:9: note: in expansion of macro 'if'
     126 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:472:9: note: in expansion of macro 'unlikely'
     472 |         unlikely(branch);                                                       \
         |         ^~~~~~~~
   include/linux/dynamic_debug.h:103:9: note: in expansion of macro 'static_branch_unlikely'
     103 |         static_branch_unlikely(&descriptor.key.dd_key_false)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:126:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     126 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:335:9: note: in expansion of macro 'dynamic_pr_debug'
     335 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/dma/dmatest.c:906:17: note: in expansion of macro 'pr_debug'
     906 |                 pr_debug("thread %s exited with status %d\n",
         |                 ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/dynamic_debug.h:126:9: note: in expansion of macro 'if'
     126 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |         ^~
   include/linux/printk.h:335:9: note: in expansion of macro 'dynamic_pr_debug'
     335 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/dma/dmatest.c:906:17: note: in expansion of macro 'pr_debug'
     906 |                 pr_debug("thread %s exited with status %d\n",
         |                 ^~~~~~~~
   drivers/dma/dmatest.c: In function 'stop_threaded_test':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/dynamic_debug.h:126:9: note: in expansion of macro 'if'
     126 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:472:9: note: in expansion of macro 'unlikely'
     472 |         unlikely(branch);                                                       \
         |         ^~~~~~~~
   include/linux/dynamic_debug.h:103:9: note: in expansion of macro 'static_branch_unlikely'
     103 |         static_branch_unlikely(&descriptor.key.dd_key_false)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:126:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     126 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:335:9: note: in expansion of macro 'dynamic_pr_debug'
     335 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/dma/dmatest.c:1107:17: note: in expansion of macro 'pr_debug'
    1107 |                 pr_debug("dropped channel %s\n", dma_chan_name(chan));
         |                 ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/dynamic_debug.h:126:9: note: in expansion of macro 'if'
     126 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |         ^~
   include/linux/printk.h:335:9: note: in expansion of macro 'dynamic_pr_debug'
     335 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/dma/dmatest.c:1107:17: note: in expansion of macro 'pr_debug'
    1107 |                 pr_debug("dropped channel %s\n", dma_chan_name(chan));
         |                 ^~~~~~~~
   drivers/dma/dmatest.c: In function 'dmatest_func':
>> drivers/dma/dmatest.c:730:24: warning: array subscript <unknown> is outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
     730 |                 dsts = &um->addr[src->cnt];
         |                        ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/dma/dmatest.c:15:
   include/linux/dmaengine.h:487:20: note: while referencing 'addr'
     487 |         dma_addr_t addr[0];
         |                    ^~~~
   drivers/dma/dmatest.c:730:33: warning: array subscript <unknown> is outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
     730 |                 dsts = &um->addr[src->cnt];
         |                         ~~~~~~~~^~~~~~~~~~
   include/linux/dmaengine.h:487:20: note: while referencing 'addr'
     487 |         dma_addr_t addr[0];
         |                    ^~~~
   drivers/dma/dmatest.c:730:33: warning: array subscript <unknown> is outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
     730 |                 dsts = &um->addr[src->cnt];
         |                         ~~~~~~~~^~~~~~~~~~
   include/linux/dmaengine.h:487:20: note: while referencing 'addr'
     487 |         dma_addr_t addr[0];
         |                    ^~~~
   drivers/dma/dmatest.c:730:33: warning: array subscript <unknown> is outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
     730 |                 dsts = &um->addr[src->cnt];
         |                         ~~~~~~~~^~~~~~~~~~
   include/linux/dmaengine.h:487:20: note: while referencing 'addr'
     487 |         dma_addr_t addr[0];
         |                    ^~~~
   drivers/dma/dmatest.c:716:33: warning: array subscript i is outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
     716 |                         um->addr[i] = dma_map_page(dev->dev, pg, pg_off,
         |                         ~~~~~~~~^~~
   include/linux/dmaengine.h:487:20: note: while referencing 'addr'
     487 |         dma_addr_t addr[0];
         |                    ^~~~
   drivers/dma/dmatest.c:719:31: warning: array subscript i is outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
     719 |                         ret = dma_mapping_error(dev->dev, um->addr[i]);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dmaengine.h:487:20: note: while referencing 'addr'
     487 |         dma_addr_t addr[0];
         |                    ^~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMPAT_BINFMT_ELF
   Depends on [n]: COMPAT [=y] && BINFMT_ELF [=n]
   Selected by [y]:
   - COMPAT [=y] && SPARC64 [=y]
   WARNING: unmet direct dependencies detected for COMPAT_BINFMT_ELF
   Depends on [n]: COMPAT [=y] && BINFMT_ELF [=n]
   Selected by [y]:
   - COMPAT [=y] && SPARC64 [=y]


vim +730 drivers/dma/dmatest.c

   488	
   489	/*
   490	 * This function repeatedly tests DMA transfers of various lengths and
   491	 * offsets for a given operation type until it is told to exit by
   492	 * kthread_stop(). There may be multiple threads running this function
   493	 * in parallel for a single channel, and there may be multiple channels
   494	 * being tested in parallel.
   495	 *
   496	 * Before each test, the source and destination buffer is initialized
   497	 * with a known pattern. This pattern is different depending on
   498	 * whether it's in an area which is supposed to be copied or
   499	 * overwritten, and different in the source and destination buffers.
   500	 * So if the DMA engine doesn't copy exactly what we tell it to copy,
   501	 * we'll notice.
   502	 */
   503	static int dmatest_func(void *data)
   504	{
   505		struct dmatest_thread	*thread = data;
   506		struct dmatest_done	*done = &thread->test_done;
   507		struct dmatest_info	*info;
   508		struct dmatest_params	*params;
   509		struct dma_chan		*chan;
   510		struct dma_device	*dev;
   511		unsigned int		error_count;
   512		unsigned int		failed_tests = 0;
   513		unsigned int		total_tests = 0;
   514		dma_cookie_t		cookie;
   515		enum dma_status		status;
   516		enum dma_ctrl_flags 	flags;
   517		u8			*pq_coefs = NULL;
   518		int			ret;
   519		struct dmatest_data	*src;
   520		struct dmatest_data	*dst;
   521		int			i;
   522		ktime_t			ktime, start, diff;
   523		ktime_t			filltime = 0;
   524		ktime_t			comparetime = 0;
   525		s64			runtime = 0;
   526		unsigned long long	total_len = 0;
   527		unsigned long long	iops = 0;
   528		u8			align = 0;
   529		bool			is_memset = false;
   530		dma_addr_t		*srcs;
   531		dma_addr_t		*dma_pq;
   532	
   533		set_freezable();
   534	
   535		ret = -ENOMEM;
   536	
   537		smp_rmb();
   538		thread->pending = false;
   539		info = thread->info;
   540		params = &info->params;
   541		chan = thread->chan;
   542		dev = chan->device;
   543		src = &thread->src;
   544		dst = &thread->dst;
   545		if (thread->type == DMA_MEMCPY) {
   546			align = params->alignment < 0 ? dev->copy_align :
   547							params->alignment;
   548			src->cnt = dst->cnt = 1;
   549		} else if (thread->type == DMA_MEMSET) {
   550			align = params->alignment < 0 ? dev->fill_align :
   551							params->alignment;
   552			src->cnt = dst->cnt = 1;
   553			is_memset = true;
   554		} else if (thread->type == DMA_XOR) {
   555			/* force odd to ensure dst = src */
   556			src->cnt = min_odd(params->xor_sources | 1, dev->max_xor);
   557			dst->cnt = 1;
   558			align = params->alignment < 0 ? dev->xor_align :
   559							params->alignment;
   560		} else if (thread->type == DMA_PQ) {
   561			/* force odd to ensure dst = src */
   562			src->cnt = min_odd(params->pq_sources | 1, dma_maxpq(dev, 0));
   563			dst->cnt = 2;
   564			align = params->alignment < 0 ? dev->pq_align :
   565							params->alignment;
   566	
   567			pq_coefs = kmalloc(params->pq_sources + 1, GFP_KERNEL);
   568			if (!pq_coefs)
   569				goto err_thread_type;
   570	
   571			for (i = 0; i < src->cnt; i++)
   572				pq_coefs[i] = 1;
   573		} else
   574			goto err_thread_type;
   575	
   576		/* Check if buffer count fits into map count variable (u8) */
   577		if ((src->cnt + dst->cnt) >= 255) {
   578			pr_err("too many buffers (%d of 255 supported)\n",
   579			       src->cnt + dst->cnt);
   580			goto err_free_coefs;
   581		}
   582	
   583		if (1 << align > params->buf_size) {
   584			pr_err("%u-byte buffer too small for %d-byte alignment\n",
   585			       params->buf_size, 1 << align);
   586			goto err_free_coefs;
   587		}
   588	
   589		src->aligned = kcalloc(src->cnt + 1, sizeof(u8 *), GFP_KERNEL);
   590		if (!src->aligned)
   591			goto err_free_coefs;
   592	
   593		src->raw = kcalloc(src->cnt + 1, sizeof(u8 *), GFP_KERNEL);
   594		if (!src->raw)
   595			goto err_usrcs;
   596	
   597		for (i = 0; i < src->cnt; i++) {
   598			src->raw[i] = kmalloc(params->buf_size + align,
   599						   GFP_KERNEL);
   600			if (!src->raw[i])
   601				goto err_srcbuf;
   602	
   603			/* align srcs to alignment restriction */
   604			if (align)
   605				src->aligned[i] = PTR_ALIGN(src->raw[i], align);
   606			else
   607				src->aligned[i] = src->raw[i];
   608		}
   609		src->aligned[i] = NULL;
   610	
   611		dst->aligned = kcalloc(dst->cnt + 1, sizeof(u8 *), GFP_KERNEL);
   612		if (!dst->aligned)
   613			goto err_dsts;
   614	
   615		dst->raw = kcalloc(dst->cnt + 1, sizeof(u8 *), GFP_KERNEL);
   616		if (!dst->raw)
   617			goto err_udsts;
   618	
   619		for (i = 0; i < dst->cnt; i++) {
   620			dst->raw[i] = kmalloc(params->buf_size + align,
   621						   GFP_KERNEL);
   622			if (!dst->raw[i])
   623				goto err_dstbuf;
   624	
   625			/* align dsts to alignment restriction */
   626			if (align)
   627				dst->aligned[i] = PTR_ALIGN(dst->raw[i], align);
   628			else
   629				dst->aligned[i] = dst->raw[i];
   630		}
   631		dst->aligned[i] = NULL;
   632	
   633		set_user_nice(current, 10);
   634	
   635		srcs = kcalloc(src->cnt, sizeof(dma_addr_t), GFP_KERNEL);
   636		if (!srcs)
   637			goto err_dstbuf;
   638	
   639		dma_pq = kcalloc(dst->cnt, sizeof(dma_addr_t), GFP_KERNEL);
   640		if (!dma_pq)
   641			goto err_srcs_array;
   642	
   643		/*
   644		 * src and dst buffers are freed by ourselves below
   645		 */
   646		flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
   647	
   648		ktime = ktime_get();
   649		while (!kthread_should_stop()
   650		       && !(params->iterations && total_tests >= params->iterations)) {
   651			struct dma_async_tx_descriptor *tx = NULL;
   652			struct dmaengine_unmap_data *um;
   653			dma_addr_t *dsts;
   654			unsigned int len;
   655	
   656			total_tests++;
   657	
   658			if (params->transfer_size) {
   659				if (params->transfer_size >= params->buf_size) {
   660					pr_err("%u-byte transfer size must be lower than %u-buffer size\n",
   661					       params->transfer_size, params->buf_size);
   662					break;
   663				}
   664				len = params->transfer_size;
   665			} else if (params->norandom) {
   666				len = params->buf_size;
   667			} else {
   668				len = dmatest_random() % params->buf_size + 1;
   669			}
   670	
   671			/* Do not alter transfer size explicitly defined by user */
   672			if (!params->transfer_size) {
   673				len = (len >> align) << align;
   674				if (!len)
   675					len = 1 << align;
   676			}
   677			total_len += len;
   678	
   679			if (params->norandom) {
   680				src->off = 0;
   681				dst->off = 0;
   682			} else {
   683				src->off = dmatest_random() % (params->buf_size - len + 1);
   684				dst->off = dmatest_random() % (params->buf_size - len + 1);
   685	
   686				src->off = (src->off >> align) << align;
   687				dst->off = (dst->off >> align) << align;
   688			}
   689	
   690			if (!params->noverify) {
   691				start = ktime_get();
   692				dmatest_init_srcs(src->aligned, src->off, len,
   693						  params->buf_size, is_memset);
   694				dmatest_init_dsts(dst->aligned, dst->off, len,
   695						  params->buf_size, is_memset);
   696	
   697				diff = ktime_sub(ktime_get(), start);
   698				filltime = ktime_add(filltime, diff);
   699			}
   700	
   701			um = dmaengine_get_unmap_data(dev->dev, src->cnt + dst->cnt,
   702						      GFP_KERNEL);
   703			if (!um) {
   704				failed_tests++;
   705				result("unmap data NULL", total_tests,
   706				       src->off, dst->off, len, ret);
   707				continue;
   708			}
   709	
   710			um->len = params->buf_size;
   711			for (i = 0; i < src->cnt; i++) {
   712				void *buf = src->aligned[i];
   713				struct page *pg = virt_to_page(buf);
   714				unsigned long pg_off = offset_in_page(buf);
   715	
   716				um->addr[i] = dma_map_page(dev->dev, pg, pg_off,
   717							   um->len, DMA_TO_DEVICE);
   718				srcs[i] = um->addr[i] + src->off;
   719				ret = dma_mapping_error(dev->dev, um->addr[i]);
   720				if (ret) {
   721					dmaengine_unmap_put(um);
   722					result("src mapping error", total_tests,
   723					       src->off, dst->off, len, ret);
   724					failed_tests++;
   725					continue;
   726				}
   727				um->to_cnt++;
   728			}
   729			/* map with DMA_BIDIRECTIONAL to force writeback/invalidate */
 > 730			dsts = &um->addr[src->cnt];
   731			for (i = 0; i < dst->cnt; i++) {
   732				void *buf = dst->aligned[i];
   733				struct page *pg = virt_to_page(buf);
   734				unsigned long pg_off = offset_in_page(buf);
   735	
   736				dsts[i] = dma_map_page(dev->dev, pg, pg_off, um->len,
   737						       DMA_BIDIRECTIONAL);
   738				ret = dma_mapping_error(dev->dev, dsts[i]);
   739				if (ret) {
   740					dmaengine_unmap_put(um);
   741					result("dst mapping error", total_tests,
   742					       src->off, dst->off, len, ret);
   743					failed_tests++;
   744					continue;
   745				}
   746				um->bidi_cnt++;
   747			}
   748	
   749			if (thread->type == DMA_MEMCPY)
   750				tx = dev->device_prep_dma_memcpy(chan,
   751								 dsts[0] + dst->off,
   752								 srcs[0], len, flags);
   753			else if (thread->type == DMA_MEMSET)
   754				tx = dev->device_prep_dma_memset(chan,
   755							dsts[0] + dst->off,
   756							*(src->aligned[0] + src->off),
   757							len, flags);
   758			else if (thread->type == DMA_XOR)
   759				tx = dev->device_prep_dma_xor(chan,
   760							      dsts[0] + dst->off,
   761							      srcs, src->cnt,
   762							      len, flags);
   763			else if (thread->type == DMA_PQ) {
   764				for (i = 0; i < dst->cnt; i++)
   765					dma_pq[i] = dsts[i] + dst->off;
   766				tx = dev->device_prep_dma_pq(chan, dma_pq, srcs,
   767							     src->cnt, pq_coefs,
   768							     len, flags);
   769			}
   770	
   771			if (!tx) {
   772				dmaengine_unmap_put(um);
   773				result("prep error", total_tests, src->off,
   774				       dst->off, len, ret);
   775				msleep(100);
   776				failed_tests++;
   777				continue;
   778			}
   779	
   780			done->done = false;
   781			tx->callback = dmatest_callback;
   782			tx->callback_param = done;
   783			cookie = tx->tx_submit(tx);
   784	
   785			if (dma_submit_error(cookie)) {
   786				dmaengine_unmap_put(um);
   787				result("submit error", total_tests, src->off,
   788				       dst->off, len, ret);
   789				msleep(100);
   790				failed_tests++;
   791				continue;
   792			}
   793			dma_async_issue_pending(chan);
   794	
   795			wait_event_freezable_timeout(thread->done_wait, done->done,
   796						     msecs_to_jiffies(params->timeout));
   797	
   798			status = dma_async_is_tx_complete(chan, cookie, NULL, NULL);
   799	
   800			dmaengine_unmap_put(um);
   801	
   802			if (!done->done) {
   803				result("test timed out", total_tests, src->off, dst->off,
   804				       len, 0);
   805				failed_tests++;
   806				continue;
   807			} else if (status != DMA_COMPLETE) {
   808				result(status == DMA_ERROR ?
   809				       "completion error status" :
   810				       "completion busy status", total_tests, src->off,
   811				       dst->off, len, ret);
   812				failed_tests++;
   813				continue;
   814			}
   815	
   816			if (params->noverify) {
   817				verbose_result("test passed", total_tests, src->off,
   818					       dst->off, len, 0);
   819				continue;
   820			}
   821	
   822			start = ktime_get();
   823			pr_debug("%s: verifying source buffer...\n", current->comm);
   824			error_count = dmatest_verify(src->aligned, 0, src->off,
   825					0, PATTERN_SRC, true, is_memset);
   826			error_count += dmatest_verify(src->aligned, src->off,
   827					src->off + len, src->off,
   828					PATTERN_SRC | PATTERN_COPY, true, is_memset);
   829			error_count += dmatest_verify(src->aligned, src->off + len,
   830					params->buf_size, src->off + len,
   831					PATTERN_SRC, true, is_memset);
   832	
   833			pr_debug("%s: verifying dest buffer...\n", current->comm);
   834			error_count += dmatest_verify(dst->aligned, 0, dst->off,
   835					0, PATTERN_DST, false, is_memset);
   836	
   837			error_count += dmatest_verify(dst->aligned, dst->off,
   838					dst->off + len, src->off,
   839					PATTERN_SRC | PATTERN_COPY, false, is_memset);
   840	
   841			error_count += dmatest_verify(dst->aligned, dst->off + len,
   842					params->buf_size, dst->off + len,
   843					PATTERN_DST, false, is_memset);
   844	
   845			diff = ktime_sub(ktime_get(), start);
   846			comparetime = ktime_add(comparetime, diff);
   847	
   848			if (error_count) {
   849				result("data error", total_tests, src->off, dst->off,
   850				       len, error_count);
   851				failed_tests++;
   852			} else {
   853				verbose_result("test passed", total_tests, src->off,
   854					       dst->off, len, 0);
   855			}
   856		}
   857		ktime = ktime_sub(ktime_get(), ktime);
   858		ktime = ktime_sub(ktime, comparetime);
   859		ktime = ktime_sub(ktime, filltime);
   860		runtime = ktime_to_us(ktime);
   861	
   862		ret = 0;
   863		kfree(dma_pq);
   864	err_srcs_array:
   865		kfree(srcs);
   866	err_dstbuf:
   867		for (i = 0; dst->raw[i]; i++)
   868			kfree(dst->raw[i]);
   869		kfree(dst->raw);
   870	err_udsts:
   871		kfree(dst->aligned);
   872	err_dsts:
   873	err_srcbuf:
   874		for (i = 0; src->raw[i]; i++)
   875			kfree(src->raw[i]);
   876		kfree(src->raw);
   877	err_usrcs:
   878		kfree(src->aligned);
   879	err_free_coefs:
   880		kfree(pq_coefs);
   881	err_thread_type:
   882		iops = dmatest_persec(runtime, total_tests);
   883		pr_info("%s: summary %u tests, %u failures %llu.%02llu iops %llu KB/s (%d)\n",
   884			current->comm, total_tests, failed_tests,
   885			FIXPT_TO_INT(iops), FIXPT_GET_FRAC(iops),
   886			dmatest_KBs(runtime, total_len), ret);
   887	
   888		/* terminate all transfers on specified channels */
   889		if (ret || failed_tests)
   890			dmaengine_terminate_sync(chan);
   891	
   892		thread->done = true;
   893		wake_up(&thread_wait);
   894	
   895		return ret;
   896	}
   897	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
