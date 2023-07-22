Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3256A63CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 06:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690008023; x=1721544023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XZPhLyUYtc/ipdPoufTy8oRn5FeGlC/umyyEsCZmWwE=;
  b=VTqK0KvGMO3fI9VtVMz7EQRZU2MBEa1+pns3YH7r4Q9h1Uwa4cxnpLo1
   axqA/OYINQVshiHhCRhSyBq4fEoAq0iGHcpCDqJGoKREjz4kura6wi3t7
   MnwfXXjIP0dwxUK0dkbQVth54ZTplv402Hz4gyZmzaquEzd96WqGqHYiS
   bFvgbnqYrWEP5t/DW08s4kaGVt0+1pCKk0PsBAOrZ2YBnSW28YXQn38rs
   jj1G52OIu0s2Kgbii3Ss+wcsnLaSXrROZWuuxP+krkxXVbvfYMmgM5yi0
   BIP1wI8hA6C+YDXZvYF44nscTJEnpFDDTotALtMFzE7dNV4pd8X18XO8p
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="352064525"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="352064525"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 23:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="838807700"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="838807700"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2023 23:40:20 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN6Hr-00085h-3B;
	Sat, 22 Jul 2023 06:40:19 +0000
Date: Sat, 22 Jul 2023 14:39:21 +0800
From: kernel test robot <lkp@intel.com>
To: kuifeng@meta.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 2/5] bpf: Provide bpf_copy_from_user() and
 bpf_copy_to_user().
Message-ID: <202307221430.DScut0GF-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-r003-20230720 (https://download.01.org/0day-ci/archive/20230722/202307221430.DScut0GF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221430.DScut0GF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221430.DScut0GF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/helpers.c:681:17: warning: no previous prototype for 'bpf_copy_to_user' [-Wmissing-prototypes]
     681 | __bpf_kfunc int bpf_copy_to_user(void *dst__uninit, u32 dst__sz,
         |                 ^~~~~~~~~~~~~~~~
--
>> kernel/bpf/helpers.c:673: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * long bpf_copy_to_user(void *dst, u32 size, const void *kern_ptr)


vim +/bpf_copy_to_user +681 kernel/bpf/helpers.c

   671	
   672	/**
 > 673	 * long bpf_copy_to_user(void *dst, u32 size, const void *kern_ptr)
   674	 *     Description
   675	 *             Read *size* bytes from kernel space address *kern_ptr* and
   676	 *              store the data in user space address *dst*. This is a
   677	 *              wrapper of **copy_to_user**\ ().
   678	 *     Return
   679	 *             0 on success, or a negative error in case of failure.
   680	 */
 > 681	__bpf_kfunc int bpf_copy_to_user(void *dst__uninit, u32 dst__sz,
   682					 const void *src__ign)
   683	{
   684		int ret = copy_to_user(dst__uninit, src__ign, dst__sz);
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
