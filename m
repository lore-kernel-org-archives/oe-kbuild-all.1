Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3FB2F4A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 04:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743568726; cv=none; b=H3BsfJ3IjJiIcpNJIQO058Pdbn0dznxEoNfkXxfrXwwXpFmHM+DiVs6uCjBQM9pQ7DWU3Dm5STWyXh9Lc3+v+Aa0pXtKxn0ru9wS0I2d89pjWm6OST47iHS1ySm+ZYmWwFf3KwwRIJrrcCC/3OU7g8QAZUmz864zcxJDTxhv870=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743568726; c=relaxed/simple;
	bh=x+YBJM5fwWDe9ypETEuu0ZAd3lOYHtBcL/+X8lWmujY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z9ZB+fO3iQSZqP84cADFI/We3jg65P7IeYViPTEpbPBNJJ9KiO1ExOSNlTtrayo/URRH5eVPvR8ZOfI6UVOru8pTWMYc16Ze6NwXjssO+bKoOpRdoKAnoP/jHYb2rFUgpDNTrLVbi246rcKyN/QLU/IUhcbQ9VnkGYUMOtSFKfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jg0iZ29y; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jg0iZ29y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743568725; x=1775104725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x+YBJM5fwWDe9ypETEuu0ZAd3lOYHtBcL/+X8lWmujY=;
  b=Jg0iZ29yiwYLjUrDLEmT3QL4En0h5wiDryowoG6Me4Rv3i8JH4eaE9iB
   m0dnExYFrWrJoenoYCyLaMJPmwYPOdsubCquRmlEkFXAsYz86iiuSm8m2
   IjIcKV8WGYpKHcUAbSes4VaHRoshyybDggXQOpOvpE044DUQzno/UtJpl
   19wKgz4T/myBKyGAabJ1iwDwkys6GYRpAPZZO/v7bEBIRKNutGA/Sj3rL
   RxRCBCSnzyfDd0BuqHtov4/H0Z8vYXaNs2PNUqBWOQRcqp8VidVinPdsw
   JgmMxLE3AlcMpEruQidsPXCnvTaUmyFJPxQwHUTH4JR8sG5q9XpXTrpu6
   A==;
X-CSE-ConnectionGUID: GYQF8ZrRTAy/aIIvEPkRUw==
X-CSE-MsgGUID: Zs6wf1pfQuyF909WOT3sLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44798723"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="44798723"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 21:38:44 -0700
X-CSE-ConnectionGUID: Yo+xGak1R62ZRC/tzWi+Gg==
X-CSE-MsgGUID: m6q4kB3BR4GFClSgNQ4PnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="131305569"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Apr 2025 21:38:43 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzps9-000ATS-08;
	Wed, 02 Apr 2025 04:38:41 +0000
Date: Wed, 2 Apr 2025 12:37:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_dl_pfs_parent_v2 1/2] include/linux/init.h:182:21:
 error: passing argument 1 of 'faux_device_create' from incompatible pointer
 type
Message-ID: <202504021208.pnTuQUbr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw wip_dl_pfs_parent_v2
head:   7f1e9aee5ae311c2f5c2296ce444f08dfa8b6ff0
commit: ef188d299e790f2dbfd6d5272e26fb1f1a543d4a [1/2] net/mlx5: Introduce shared devlink instance for PFs on same chip
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250402/202504021208.pnTuQUbr-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021208.pnTuQUbr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021208.pnTuQUbr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/s390/include/asm/bug.h:69,
                    from include/linux/bug.h:5,
                    from arch/s390/include/asm/ctlreg.h:85,
                    from arch/s390/include/asm/lowcore.h:14,
                    from arch/s390/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/device/faux.h:17,
                    from drivers/net/ethernet/mellanox/mlx5/core/sh_devlink.c:4:
   drivers/net/ethernet/mellanox/mlx5/core/sh_devlink.c: In function 'mlx5_shd_create':
>> include/linux/init.h:182:21: error: passing argument 1 of 'faux_device_create' from incompatible pointer type [-Wincompatible-pointer-types]
     182 | #define THIS_MODULE ((struct module *)0)
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     struct module *
   drivers/net/ethernet/mellanox/mlx5/core/sh_devlink.c:68:39: note: in expansion of macro 'THIS_MODULE'
      68 |         faux_dev = faux_device_create(THIS_MODULE, sn, NULL, &mlx5_shd_faux_ops);
         |                                       ^~~~~~~~~~~
   include/linux/device/faux.h:50:52: note: expected 'const char *' but argument is of type 'struct module *'
      50 | struct faux_device *faux_device_create(const char *name,
         |                                        ~~~~~~~~~~~~^~~~
>> drivers/net/ethernet/mellanox/mlx5/core/sh_devlink.c:68:52: error: passing argument 2 of 'faux_device_create' from incompatible pointer type [-Wincompatible-pointer-types]
      68 |         faux_dev = faux_device_create(THIS_MODULE, sn, NULL, &mlx5_shd_faux_ops);
         |                                                    ^~
         |                                                    |
         |                                                    const char *
   include/linux/device/faux.h:51:55: note: expected 'struct device *' but argument is of type 'const char *'
      51 |                                        struct device *parent,
         |                                        ~~~~~~~~~~~~~~~^~~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/sh_devlink.c:68:20: error: too many arguments to function 'faux_device_create'
      68 |         faux_dev = faux_device_create(THIS_MODULE, sn, NULL, &mlx5_shd_faux_ops);
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/device/faux.h:50:21: note: declared here
      50 | struct faux_device *faux_device_create(const char *name,
         |                     ^~~~~~~~~~~~~~~~~~


vim +/faux_device_create +182 include/linux/init.h

f2511774863487 Arjan van de Ven 2009-12-13  177  
5b20755b778046 Masahiro Yamada  2023-11-26  178  #ifdef MODULE
5b20755b778046 Masahiro Yamada  2023-11-26  179  extern struct module __this_module;
5b20755b778046 Masahiro Yamada  2023-11-26  180  #define THIS_MODULE (&__this_module)
5b20755b778046 Masahiro Yamada  2023-11-26  181  #else
5b20755b778046 Masahiro Yamada  2023-11-26 @182  #define THIS_MODULE ((struct module *)0)
5b20755b778046 Masahiro Yamada  2023-11-26  183  #endif
5b20755b778046 Masahiro Yamada  2023-11-26  184  

:::::: The code at line 182 was first introduced by commit
:::::: 5b20755b7780464fea3e54af0af744258dcc2841 init: move THIS_MODULE from <linux/export.h> to <linux/init.h>

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
