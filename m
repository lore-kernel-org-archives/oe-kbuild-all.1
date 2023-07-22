Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CBA648
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 20:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690057619; x=1721593619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tqkenZMJ0cfUofl2a7zhnutnZNHDOv1avE79Oie0V1k=;
  b=nTdvvc84GNADvpsxoWnrI9dDbE7DPARH6JG/9yo/DbU218E4sUb58498
   2C4TejCAJQLXvsZDnWuJwDnTvdED+q94hN4R4XcU6rsqXbUv92mSzl4EH
   4U4AVp8PLUfXzBJilR+CtXNtQ3MLvOmNvK8pzm/EKWn6MClZ6j2gZ7hej
   SAitpyAtUnh/2N3pVIgJGKDCvy2yCk32iO5Erf40zJ00sNblMJ3e2C8kO
   098IQ+MzAJcU2f26XELUVtqdfy8lvPLSNZmMarx90a2KnQRb0GIFGI69C
   3T9o1x0EgPQnOsBDGV1MbOYGZe3f6q7qsbEhr4by8fcwbF2kx3mIYTAwR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="369897365"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="369897365"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 13:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="754864150"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="754864150"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 22 Jul 2023 13:26:57 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNJBo-0008Zp-1Z;
	Sat, 22 Jul 2023 20:26:56 +0000
Date: Sun, 23 Jul 2023 04:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: kuifeng@meta.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 2/5] bpf: Provide bpf_copy_from_user() and
 bpf_copy_to_user().
Message-ID: <202307230401.pDIhqDbi-lkp@intel.com>
References: <20230722052248.1062582-3-kuifeng@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230722052248.1062582-3-kuifeng@meta.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/kuifeng-meta-com/bpf-enable-sleepable-BPF-programs-attached-to-cgroup-get-set-sockopt/20230722-132551
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230722052248.1062582-3-kuifeng%40meta.com
patch subject: [RFC bpf-next 2/5] bpf: Provide bpf_copy_from_user() and bpf_copy_to_user().
config: sparc64-randconfig-r081-20230720 (https://download.01.org/0day-ci/archive/20230723/202307230401.pDIhqDbi-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230401.pDIhqDbi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230401.pDIhqDbi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/helpers.c:684:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *dst__uninit @@
   kernel/bpf/helpers.c:684:32: sparse:     expected void [noderef] __user *to
   kernel/bpf/helpers.c:684:32: sparse:     got void *dst__uninit
   kernel/bpf/helpers.c: note: in included file (through arch/sparc/include/asm/cmpxchg.h, arch/sparc/include/asm/atomic_64.h, arch/sparc/include/asm/atomic.h, ...):
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (eb9f becomes 9f)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (eb9f becomes 9f)
   kernel/bpf/helpers.c:2442:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c:2447:18: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +684 kernel/bpf/helpers.c

   671	
   672	/**
   673	 * long bpf_copy_to_user(void *dst, u32 size, const void *kern_ptr)
   674	 *     Description
   675	 *             Read *size* bytes from kernel space address *kern_ptr* and
   676	 *              store the data in user space address *dst*. This is a
   677	 *              wrapper of **copy_to_user**\ ().
   678	 *     Return
   679	 *             0 on success, or a negative error in case of failure.
   680	 */
   681	__bpf_kfunc int bpf_copy_to_user(void *dst__uninit, u32 dst__sz,
   682					 const void *src__ign)
   683	{
 > 684		int ret = copy_to_user(dst__uninit, src__ign, dst__sz);
   685	
   686		if (unlikely(ret))
   687			return -EFAULT;
   688	
   689		return ret;
   690	}
   691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
