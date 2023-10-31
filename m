Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3124D29A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 22:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSfX7QiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698792926; x=1730328926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4tTcSX/JR8cw2ZUG6Zc8oGHNUY4p63KcOw+msnjym+U=;
  b=lSfX7QiPyCxwI/vWmCjza9deFdymc3ICZBR5Tha6pOv/w1RZibQa47c1
   oygVUlFxqRk66Mxe+fS3qTrzi6cw40AgBb47w8f+75/CvcYW/yXS2cROL
   X8Mg7lJ2/0NKC+43RGYnzgnHUYONOwqORUIyb2Vzk0KXG8aIpz516+Qpq
   kCoObKCc/1tscIMAVzlcjqO7JlFcxlwu+Ttx4fVxHY49lkaZqwBaYtOLA
   hCbkVR5WjneBbmNE7H1tPM1yYbkP++/SGg8ssecOQ1kVhZ2JkNgljZoc4
   seq+tCcyjtInx5nSotqB2ezs+/ep7Rke1yUNe2W1w/rGBUpISbpHUOTbr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="388210093"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="388210093"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 15:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="795713771"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="795713771"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 Oct 2023 15:55:24 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxxdq-0000RT-0s;
	Tue, 31 Oct 2023 22:55:22 +0000
Date: Wed, 1 Nov 2023 06:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: Michael =?iso-8859-1?Q?Wei=DF?= <michael.weiss@aisec.fraunhofer.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RESEND RFC PATCH v2 09/14] lsm: Add
 security_inode_mknod_nscap() hook
Message-ID: <202311010616.A53oaUEP-lkp@intel.com>
References: <20231025094224.72858-10-michael.weiss@aisec.fraunhofer.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025094224.72858-10-michael.weiss@aisec.fraunhofer.de>

Hi Michael,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 58720809f52779dc0f08e53e54b014209d13eebb]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Wei/device_cgroup-Implement-devcgroup-hooks-as-lsm-security-hooks/20231025-174946
base:   58720809f52779dc0f08e53e54b014209d13eebb
patch link:    https://lore.kernel.org/r/20231025094224.72858-10-michael.weiss%40aisec.fraunhofer.de
patch subject: [RESEND RFC PATCH v2 09/14] lsm: Add security_inode_mknod_nscap() hook
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20231101/202311010616.A53oaUEP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311010616.A53oaUEP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311010616.A53oaUEP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:62,
                    from include/kvm/arm_pmu.h:10,
                    from arch/arm64/include/asm/kvm_host.h:37,
                    from include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:16:
>> include/linux/security.h:1408:1: error: expected identifier or '(' before '{' token
    1408 | {
         | ^
   include/linux/security.h:1405:19: warning: 'security_inode_mknod_nscap' declared 'static' but never defined [-Wunused-function]
    1405 | static inline int security_inode_mknod_nscap(struct inode *dir,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/arm64/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1408 include/linux/security.h

  1384	
  1385	static inline int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen)
  1386	{
  1387		return -EOPNOTSUPP;
  1388	}
  1389	static inline int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)
  1390	{
  1391		return -EOPNOTSUPP;
  1392	}
  1393	static inline int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen)
  1394	{
  1395		return -EOPNOTSUPP;
  1396	}
  1397	static inline int security_locked_down(enum lockdown_reason what)
  1398	{
  1399		return 0;
  1400	}
  1401	static inline int security_dev_permission(umode_t mode, dev_t dev, int mask)
  1402	{
  1403		return 0;
  1404	}
  1405	static inline int security_inode_mknod_nscap(struct inode *dir,
  1406						     struct dentry *dentry,
  1407						     umode_t mode, dev_t dev);
> 1408	{
  1409		return -EPERM;
  1410	}
  1411	#endif	/* CONFIG_SECURITY */
  1412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
