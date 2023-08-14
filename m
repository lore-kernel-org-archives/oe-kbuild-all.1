Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5447E3D72
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 05:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691989425; x=1723525425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0hsmcnjRiXt4W8D0myCIByscOaI040NtClApRoZ5rJk=;
  b=U5iiqk0gl/sTGjbiMpe+GC3N8kuJcod8h/tdmL8rHmQpUlNhFsRvip6S
   b8FkDzO8DB9/uI5yDqqc3Fd8Pmmv5dYUc4Hz59O/C5gI9K4uqINMZfNgu
   v/hujh0OeaS/x2NwRKba7nvEVSrGl2toiOeOavz9uRCxjl+l55LVH/X0q
   EQTnReUwfj0CZse1bT0KbRWFpW+GINQwy/j1ltPVzPro+YyRgJIVqVUxG
   tWOZRVpHeo58mOEfrHZ0cj6FTGW0NZZcExjgQPiQwe/KLIrb+UIY2vqn5
   N5dv4xBV0f9WJqHcmC0SJuteKs7Ha1SMb+OC8Vod5iSTi6VB0ZE5ijKq5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="369433859"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="369433859"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 22:03:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="847500330"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="847500330"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Aug 2023 22:03:43 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVPjy-0009NA-15;
	Mon, 14 Aug 2023 05:03:42 +0000
Date: Mon, 14 Aug 2023 13:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: thinker.li@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next v2 5/6] bpf: Add a new dynptr type for
 CGRUP_SOCKOPT.
Message-ID: <202308141248.9fi9h13X-lkp@intel.com>
References: <20230811043127.1318152-6-thinker.li@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811043127.1318152-6-thinker.li@gmail.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/thinker-li-gmail-com/bpf-enable-sleepable-BPF-programs-attached-to-cgroup-get-set-sockopt/20230811-123333
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230811043127.1318152-6-thinker.li%40gmail.com
patch subject: [RFC bpf-next v2 5/6] bpf: Add a new dynptr type for CGRUP_SOCKOPT.
config: x86_64-randconfig-r081-20230814 (https://download.01.org/0day-ci/archive/20230814/202308141248.9fi9h13X-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308141248.9fi9h13X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308141248.9fi9h13X-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c:684:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *dst__uninit @@
   kernel/bpf/helpers.c:684:32: sparse:     expected void [noderef] __user *to
   kernel/bpf/helpers.c:684:32: sparse:     got void *dst__uninit
>> kernel/bpf/helpers.c:2588:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] *optval @@
   kernel/bpf/helpers.c:2588:55: sparse:     expected void const [noderef] __user *from
   kernel/bpf/helpers.c:2588:55: sparse:     got unsigned char [usertype] *optval
>> kernel/bpf/helpers.c:2619:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char [usertype] *optval @@
   kernel/bpf/helpers.c:2619:45: sparse:     expected void [noderef] __user *to
   kernel/bpf/helpers.c:2619:45: sparse:     got unsigned char [usertype] *optval
   kernel/bpf/helpers.c:2446:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c: note: in included file (through include/linux/workqueue.h, include/linux/bpf.h):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +2588 kernel/bpf/helpers.c

  2548	
  2549	/* Initialize a sockopt dynptr from a user or installed optval pointer.
  2550	 *
  2551	 * sopt->optval can be a user pointer or a kernel pointer. A kernel pointer
  2552	 * can be a buffer allocated by the caller of the BPF program or a buffer
  2553	 * installed by other BPF programs through bpf_so_optval_install().
  2554	 *
  2555	 * Atmost one dynptr shall be created by this function at any moment, or
  2556	 * it will return -EINVAL. You can create another dypptr by this function
  2557	 * after release the previous one by bpf_so_optval_release().
  2558	 *
  2559	 * A dynptr that is initialized when optval is a user pointer is an
  2560	 * exception. In this case, the dynptr will point to a kernel buffer with
  2561	 * the same content as the user buffer. To simplify the code, users should
  2562	 * always make sure having only one dynptr initialized by this function at
  2563	 * any moment.
  2564	 */
  2565	__bpf_kfunc int bpf_so_optval_from(struct bpf_sockopt *sopt,
  2566					   struct bpf_dynptr_kern *ptr__uninit,
  2567					   unsigned int size)
  2568	{
  2569		struct bpf_sockopt_kern *sopt_kern = (struct bpf_sockopt_kern *)sopt;
  2570		int err;
  2571	
  2572		bpf_dynptr_set_null(ptr__uninit);
  2573	
  2574		if (size > (sopt_kern->optval_end - sopt_kern->optval))
  2575			return -EINVAL;
  2576	
  2577		if (size == 0)
  2578			size = min(sopt_kern->optlen,
  2579				   (int)(sopt_kern->optval_end - sopt_kern->optval));
  2580	
  2581		if (sopt_kern->flags & BPF_SOCKOPT_FLAG_OPTVAL_DYNPTR)
  2582			return -EINVAL;
  2583	
  2584		if (sopt_kern->flags & BPF_SOCKOPT_FLAG_OPTVAL_USER) {
  2585			err = bpf_so_optval_alloc(sopt, sopt_kern->optlen, ptr__uninit);
  2586			if (err >= 0)
  2587				err = copy_from_user(ptr__uninit->data,
> 2588						     sopt_kern->optval,
  2589						     size);
  2590			return err;
  2591		}
  2592	
  2593		bpf_dynptr_init(ptr__uninit, sopt_kern->optval,
  2594				BPF_DYNPTR_TYPE_CGROUP_SOCKOPT, 0,
  2595				size);
  2596		sopt_kern->flags |= BPF_SOCKOPT_FLAG_OPTVAL_DYNPTR;
  2597	
  2598		return size;
  2599	}
  2600	
  2601	/**
  2602	 * int bpf_so_optval_copy_to_r(struct bpf_sockopt *sopt,
  2603	 *                             void *ptr, u32 ptr__sz)
  2604	 *     Description
  2605	 *             Copy data from *ptr* to *sopt->optval*.
  2606	 *     Return
  2607	 *             >= 0 on success, or a negative error in case of failure.
  2608	 */
  2609	__bpf_kfunc int bpf_so_optval_copy_to_r(struct bpf_sockopt *sopt,
  2610						void *ptr, u32 ptr__sz)
  2611	{
  2612		struct bpf_sockopt_kern *sopt_kern = (struct bpf_sockopt_kern *)sopt;
  2613		int ret;
  2614	
  2615		if (ptr__sz > (sopt_kern->optval_end - sopt_kern->optval))
  2616			return -EINVAL;
  2617	
  2618		if (sopt_kern->flags & BPF_SOCKOPT_FLAG_OPTVAL_USER) {
> 2619			ret = copy_to_user(sopt_kern->optval, ptr,
  2620					   ptr__sz);
  2621			if (unlikely(ret))
  2622				return -EFAULT;
  2623		} else {
  2624			/* Use memmove() in case of optval & ptr overlap. */
  2625			memmove(sopt_kern->optval, ptr, ptr__sz);
  2626			ret = ptr__sz;
  2627		}
  2628	
  2629		return ret;
  2630	}
  2631	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
