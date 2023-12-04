Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46557FBFA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+6KxwuF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701680205; x=1733216205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+t2+yyPyUrQCfSpJjBr0FhUONqnv2F1M5hSqljhJqi4=;
  b=R+6KxwuFLT6qCR0zWtUursEdoIm23nu6A8/kbs7/66Fd+IpKawfO9jbg
   g+B3uJkHaqbxnC3B3274L1/vE+LguM0UO8p8wP5S19iRtdlFSfUNrQVEl
   aWi9rUTkJtX2c8AxGR+6IEEdOniVFlaptN+2M8TPfB/qMk+UwMf6huuR2
   9do0DHKAedMGIkUaptPDIDVAKTGJtJPuJEnWefXVgXvY2XRU8sZXRQSkS
   GccoOT03rfgHr5UcNkRhTqIyfjkMjRxIeRGYdsYs0A6oNc2cvo3CIJmg7
   G21oZYveGA2XO6ZD+ZCUXbH0zhntElggeJbNQRHq/Uhpk14GuBMNEKRtK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373136600"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="373136600"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 00:56:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="746769744"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="746769744"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Dec 2023 00:56:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rA4kn-0007bq-1T;
	Mon, 04 Dec 2023 08:56:37 +0000
Date: Mon, 4 Dec 2023 16:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/trace/ftrace.c:5675: warning: Function parameter or member
 'ops' not described in 'ftrace_set_filter_ips'
Message-ID: <202312041603.gW5Vw2Pj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiri,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 4f554e955614f19425cee86de4669351741a6280 ftrace: Add ftrace_set_filter_ips function
date:   1 year, 9 months ago
config: x86_64-randconfig-161-20230927 (https://download.01.org/0day-ci/archive/20231204/202312041603.gW5Vw2Pj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231204/202312041603.gW5Vw2Pj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312041603.gW5Vw2Pj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/ftrace.c:5553: warning: Function parameter or member 'addr' not described in 'unregister_ftrace_direct_multi'
   kernel/trace/ftrace.c:5656: warning: Function parameter or member 'ops' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:5656: warning: Function parameter or member 'ip' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:5656: warning: Function parameter or member 'remove' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:5656: warning: Function parameter or member 'reset' not described in 'ftrace_set_filter_ip'
>> kernel/trace/ftrace.c:5675: warning: Function parameter or member 'ops' not described in 'ftrace_set_filter_ips'
>> kernel/trace/ftrace.c:5675: warning: Function parameter or member 'ips' not described in 'ftrace_set_filter_ips'
>> kernel/trace/ftrace.c:5675: warning: Function parameter or member 'cnt' not described in 'ftrace_set_filter_ips'
>> kernel/trace/ftrace.c:5675: warning: Function parameter or member 'remove' not described in 'ftrace_set_filter_ips'
>> kernel/trace/ftrace.c:5675: warning: Function parameter or member 'reset' not described in 'ftrace_set_filter_ips'
   kernel/trace/ftrace.c:5689: warning: Function parameter or member 'ops' not described in 'ftrace_ops_set_global_filter'
   kernel/trace/ftrace.c:5717: warning: Function parameter or member 'ops' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:5717: warning: Function parameter or member 'buf' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:5717: warning: Function parameter or member 'len' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:5717: warning: Function parameter or member 'reset' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:5736: warning: Function parameter or member 'ops' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:5736: warning: Function parameter or member 'buf' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:5736: warning: Function parameter or member 'len' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:5736: warning: Function parameter or member 'reset' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:5751: warning: Function parameter or member 'buf' not described in 'ftrace_set_global_filter'
   kernel/trace/ftrace.c:5751: warning: Function parameter or member 'len' not described in 'ftrace_set_global_filter'
   kernel/trace/ftrace.c:5751: warning: Function parameter or member 'reset' not described in 'ftrace_set_global_filter'
   kernel/trace/ftrace.c:5767: warning: Function parameter or member 'buf' not described in 'ftrace_set_global_notrace'
   kernel/trace/ftrace.c:5767: warning: Function parameter or member 'len' not described in 'ftrace_set_global_notrace'
   kernel/trace/ftrace.c:5767: warning: Function parameter or member 'reset' not described in 'ftrace_set_global_notrace'
   kernel/trace/ftrace.c:7843: warning: Function parameter or member 'ops' not described in 'register_ftrace_function'
   kernel/trace/ftrace.c:7865: warning: Function parameter or member 'ops' not described in 'unregister_ftrace_function'


vim +5675 kernel/trace/ftrace.c

  5538	
  5539	/**
  5540	 * unregister_ftrace_direct_multi - Remove calls to custom trampoline
  5541	 * previously registered by register_ftrace_direct_multi for @ops object.
  5542	 * @ops: The address of the struct ftrace_ops object
  5543	 *
  5544	 * This is used to remove a direct calls to @addr from the nop locations
  5545	 * of the functions registered in @ops (with by ftrace_set_filter_ip
  5546	 * function).
  5547	 *
  5548	 * Returns:
  5549	 *  0 on success
  5550	 *  -EINVAL - The @ops object was not properly registered.
  5551	 */
  5552	int unregister_ftrace_direct_multi(struct ftrace_ops *ops, unsigned long addr)
> 5553	{
  5554		struct ftrace_hash *hash = ops->func_hash->filter_hash;
  5555		int err;
  5556	
  5557		if (check_direct_multi(ops))
  5558			return -EINVAL;
  5559		if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
  5560			return -EINVAL;
  5561	
  5562		mutex_lock(&direct_mutex);
  5563		err = unregister_ftrace_function(ops);
  5564		remove_direct_functions_hash(hash, addr);
  5565		mutex_unlock(&direct_mutex);
  5566	
  5567		/* cleanup for possible another register call */
  5568		ops->func = NULL;
  5569		ops->trampoline = 0;
  5570		return err;
  5571	}
  5572	EXPORT_SYMBOL_GPL(unregister_ftrace_direct_multi);
  5573	
  5574	/**
  5575	 * modify_ftrace_direct_multi - Modify an existing direct 'multi' call
  5576	 * to call something else
  5577	 * @ops: The address of the struct ftrace_ops object
  5578	 * @addr: The address of the new trampoline to call at @ops functions
  5579	 *
  5580	 * This is used to unregister currently registered direct caller and
  5581	 * register new one @addr on functions registered in @ops object.
  5582	 *
  5583	 * Note there's window between ftrace_shutdown and ftrace_startup calls
  5584	 * where there will be no callbacks called.
  5585	 *
  5586	 * Returns: zero on success. Non zero on error, which includes:
  5587	 *  -EINVAL - The @ops object was not properly registered.
  5588	 */
  5589	int modify_ftrace_direct_multi(struct ftrace_ops *ops, unsigned long addr)
  5590	{
  5591		struct ftrace_hash *hash;
  5592		struct ftrace_func_entry *entry, *iter;
  5593		static struct ftrace_ops tmp_ops = {
  5594			.func		= ftrace_stub,
  5595			.flags		= FTRACE_OPS_FL_STUB,
  5596		};
  5597		int i, size;
  5598		int err;
  5599	
  5600		if (check_direct_multi(ops))
  5601			return -EINVAL;
  5602		if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
  5603			return -EINVAL;
  5604	
  5605		mutex_lock(&direct_mutex);
  5606	
  5607		/* Enable the tmp_ops to have the same functions as the direct ops */
  5608		ftrace_ops_init(&tmp_ops);
  5609		tmp_ops.func_hash = ops->func_hash;
  5610	
  5611		err = register_ftrace_function(&tmp_ops);
  5612		if (err)
  5613			goto out_direct;
  5614	
  5615		/*
  5616		 * Now the ftrace_ops_list_func() is called to do the direct callers.
  5617		 * We can safely change the direct functions attached to each entry.
  5618		 */
  5619		mutex_lock(&ftrace_lock);
  5620	
  5621		hash = ops->func_hash->filter_hash;
  5622		size = 1 << hash->size_bits;
  5623		for (i = 0; i < size; i++) {
  5624			hlist_for_each_entry(iter, &hash->buckets[i], hlist) {
  5625				entry = __ftrace_lookup_ip(direct_functions, iter->ip);
  5626				if (!entry)
  5627					continue;
  5628				entry->direct = addr;
  5629			}
  5630		}
  5631	
  5632		mutex_unlock(&ftrace_lock);
  5633	
  5634		/* Removing the tmp_ops will add the updated direct callers to the functions */
  5635		unregister_ftrace_function(&tmp_ops);
  5636	
  5637	 out_direct:
  5638		mutex_unlock(&direct_mutex);
  5639		return err;
  5640	}
  5641	EXPORT_SYMBOL_GPL(modify_ftrace_direct_multi);
  5642	#endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
  5643	
  5644	/**
  5645	 * ftrace_set_filter_ip - set a function to filter on in ftrace by address
  5646	 * @ops - the ops to set the filter with
  5647	 * @ip - the address to add to or remove from the filter.
  5648	 * @remove - non zero to remove the ip from the filter
  5649	 * @reset - non zero to reset all filters before applying this filter.
  5650	 *
  5651	 * Filters denote which functions should be enabled when tracing is enabled
  5652	 * If @ip is NULL, it fails to update filter.
  5653	 */
  5654	int ftrace_set_filter_ip(struct ftrace_ops *ops, unsigned long ip,
  5655				 int remove, int reset)
  5656	{
  5657		ftrace_ops_init(ops);
  5658		return ftrace_set_addr(ops, &ip, 1, remove, reset, 1);
  5659	}
  5660	EXPORT_SYMBOL_GPL(ftrace_set_filter_ip);
  5661	
  5662	/**
  5663	 * ftrace_set_filter_ips - set functions to filter on in ftrace by addresses
  5664	 * @ops - the ops to set the filter with
  5665	 * @ips - the array of addresses to add to or remove from the filter.
  5666	 * @cnt - the number of addresses in @ips
  5667	 * @remove - non zero to remove ips from the filter
  5668	 * @reset - non zero to reset all filters before applying this filter.
  5669	 *
  5670	 * Filters denote which functions should be enabled when tracing is enabled
  5671	 * If @ips array or any ip specified within is NULL , it fails to update filter.
  5672	 */
  5673	int ftrace_set_filter_ips(struct ftrace_ops *ops, unsigned long *ips,
  5674				  unsigned int cnt, int remove, int reset)
> 5675	{
  5676		ftrace_ops_init(ops);
  5677		return ftrace_set_addr(ops, ips, cnt, remove, reset, 1);
  5678	}
  5679	EXPORT_SYMBOL_GPL(ftrace_set_filter_ips);
  5680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
