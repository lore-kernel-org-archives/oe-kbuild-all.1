Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEADF10FE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 05:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O54gcbd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697866733; x=1729402733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=x4G75Z4XrdMB5SOSKkuUdZ9XeRLHd/MDaN0kZrCVtzg=;
  b=O54gcbd1+CXhOmLzJwyz7/xKEVWV8fnVMWWY5QP52KDw2zX+YIf4i3XH
   FGuWoQbzTCiRHsKXgOf5eGOyum4fY6NX0P4cXwz7wQ0BJwjACcgQVuPpO
   UYd9CyDMkYtZaxMCs7clPcMrLS+VWh2p3VvxwmId98t3WvfdGxjISN+aG
   Ln1aTY6yWUunF70doGHRdaaU51LQFbY0EBLocuhhnAvkFBpbFJQ2517ZT
   ehBGcdnC7EyjKpv40NjWG7ZpIz1QrotHX8fF3Fu+Y8EKnVHcxcjwuq3rH
   BNO+/fe5RpH68y93+qfoalixcizvFQhJ56LeKuh4oaUx4C78S4M0R9h65
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="472835742"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="472835742"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 22:38:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="786983065"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="786983065"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Oct 2023 22:38:50 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu4hE-0004TE-1f;
	Sat, 21 Oct 2023 05:38:48 +0000
Date: Sat, 21 Oct 2023 13:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: Michael =?iso-8859-1?Q?Wei=DF?= <michael.weiss@aisec.fraunhofer.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 11/14] vfs: Wire up security hooks for lsm-based
 device guard in userns
Message-ID: <202310211311.u3FknXEW-lkp@intel.com>
References: <20231018105033.13669-12-michael.weiss@aisec.fraunhofer.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231018105033.13669-12-michael.weiss@aisec.fraunhofer.de>

Hi Michael,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 58720809f52779dc0f08e53e54b014209d13eebb]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Wei/device_cgroup-Implement-devcgroup-hooks-as-lsm-security-hooks/20231018-185850
base:   58720809f52779dc0f08e53e54b014209d13eebb
patch link:    https://lore.kernel.org/r/20231018105033.13669-12-michael.weiss%40aisec.fraunhofer.de
patch subject: [RFC PATCH v2 11/14] vfs: Wire up security hooks for lsm-based device guard in userns
config: arc-randconfig-001-20231021 (https://download.01.org/0day-ci/archive/20231021/202310211311.u3FknXEW-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310211311.u3FknXEW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310211311.u3FknXEW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/namei.c:29:
   include/linux/security.h:1409:1: error: expected identifier or '(' before '{' token
    1409 | {
         | ^
>> include/linux/security.h:1406:19: warning: 'security_inode_mknod_nscap' used but never defined
    1406 | static inline int security_inode_mknod_nscap(struct inode *dir,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/security_inode_mknod_nscap +1406 include/linux/security.h

6f3be9f562e302 Andreas Gruenbacher 2015-12-24  1385  
1ee65e37e904b9 David P. Quigley    2009-09-03  1386  static inline int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen)
1ee65e37e904b9 David P. Quigley    2009-09-03  1387  {
1ee65e37e904b9 David P. Quigley    2009-09-03  1388  	return -EOPNOTSUPP;
1ee65e37e904b9 David P. Quigley    2009-09-03  1389  }
1ee65e37e904b9 David P. Quigley    2009-09-03  1390  static inline int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)
1ee65e37e904b9 David P. Quigley    2009-09-03  1391  {
1ee65e37e904b9 David P. Quigley    2009-09-03  1392  	return -EOPNOTSUPP;
1ee65e37e904b9 David P. Quigley    2009-09-03  1393  }
1ee65e37e904b9 David P. Quigley    2009-09-03  1394  static inline int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen)
1ee65e37e904b9 David P. Quigley    2009-09-03  1395  {
1ee65e37e904b9 David P. Quigley    2009-09-03  1396  	return -EOPNOTSUPP;
1ee65e37e904b9 David P. Quigley    2009-09-03  1397  }
9e47d31d6a57b5 Matthew Garrett     2019-08-19  1398  static inline int security_locked_down(enum lockdown_reason what)
9e47d31d6a57b5 Matthew Garrett     2019-08-19  1399  {
9e47d31d6a57b5 Matthew Garrett     2019-08-19  1400  	return 0;
9e47d31d6a57b5 Matthew Garrett     2019-08-19  1401  }
88f39109e4a2d2 Michael Weiﬂ        2023-10-18  1402  static inline int security_dev_permission(umode_t mode, dev_t dev, int mask)
88f39109e4a2d2 Michael Weiﬂ        2023-10-18  1403  {
88f39109e4a2d2 Michael Weiﬂ        2023-10-18  1404  	return 0;
88f39109e4a2d2 Michael Weiﬂ        2023-10-18  1405  }
86e1c59e2b6a4a Michael Weiﬂ        2023-10-18 @1406  static inline int security_inode_mknod_nscap(struct inode *dir,
86e1c59e2b6a4a Michael Weiﬂ        2023-10-18  1407  					     struct dentry *dentry,
86e1c59e2b6a4a Michael Weiﬂ        2023-10-18  1408  					     umode_t mode, dev_t dev);
86e1c59e2b6a4a Michael Weiﬂ        2023-10-18  1409  {
86e1c59e2b6a4a Michael Weiﬂ        2023-10-18  1410  	return -EPERM;
86e1c59e2b6a4a Michael Weiﬂ        2023-10-18  1411  }
4763b8302ad269 Michael Weiﬂ        2023-10-18  1412  static inline int security_sb_alloc_userns(struct super_block *sb)
4763b8302ad269 Michael Weiﬂ        2023-10-18  1413  {
4763b8302ad269 Michael Weiﬂ        2023-10-18  1414  	return -EPERM;
4763b8302ad269 Michael Weiﬂ        2023-10-18  1415  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  1416  #endif	/* CONFIG_SECURITY */
^1da177e4c3f41 Linus Torvalds      2005-04-16  1417  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
