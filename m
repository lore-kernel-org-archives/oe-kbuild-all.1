Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680D92D0C72
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 05:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762234815; cv=none; b=bJgo5b8b2ze24RTF3naTbyn8oY3RXcdkaSfEJ10RFpxzi6GdLhQHw8SXd33C33Hn51c47f/RW182dTVsY/u5r/aNd0AAmi/GSFGT5o4KDURmnyasRTXHqmzrmuAgQS0JvWxp8IbCmZmkXRUK1sQR0enRLvmpWevUtzLEFsP1BoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762234815; c=relaxed/simple;
	bh=kBwd+Y8mpaTFtl7aHM8Nn5hRZPLEedTG/vyaKbxApxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GG3Y7oABG/B2o3DsTLgUDVnhCGIn79cWeenm/TGLF6U16p7D1gkaB+d5PNkuA9ke6Y+OoeJaJHGrK/4BgezRTJn8BXcfVyYxxvst/Hejg7QQIyFZP7WjhFsa/zfQjYTmnTOSA8sRXCkLv/qQAQslC0sp1btDW+xffvtXJtsgA8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1vT5e9Y; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1vT5e9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762234813; x=1793770813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kBwd+Y8mpaTFtl7aHM8Nn5hRZPLEedTG/vyaKbxApxg=;
  b=F1vT5e9YUonFfjgcWDb5/HDyLXPxzIFIKGSEpM2c72WdOQW846B9Ogzs
   0WJJS4wLDvGgCOTJrH2bodv8Wnip9Zi9DKCMRNaf+HuP1bS3I2i0g2OJ6
   Pc/5CfvsQs4iniFki9S3KQHQObmg68eJ1R8EE3wAzVR0dVkybvxE3qmhD
   2Wf3iN3bfPLnES5+nQLU2Et7/0k/OpYd5YH2ZC0b26cGE5Ynb1GpGf++2
   XgqECBiUsSFSSOASwCvW/3d4D93hAztqFA6pmlo+zvo9oR5L7YhKVDGaB
   F3FxOOExEBiecveCJ8tspgL9HI1PLbRyH3bjLKT6Q93jLM1rNvu1ylw9k
   A==;
X-CSE-ConnectionGUID: RlIV+yLwTICBv8zMx/CoNA==
X-CSE-MsgGUID: /fGXc2/HR42jiQn9MFS9kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64238377"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="64238377"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 21:40:12 -0800
X-CSE-ConnectionGUID: qbpcz/QGQUK+xYXJxsWo8A==
X-CSE-MsgGUID: FtfXEZh2TdKPdxQzNfTGSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="191151821"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Nov 2025 21:40:12 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG9m5-000QxO-0d;
	Tue, 04 Nov 2025 05:40:09 +0000
Date: Tue, 4 Nov 2025 13:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:kernel-6.19.cred 37/39]
 kernel/trace/trace_events_user.c:1456:23: error: redeclaration of 'cred'
 with no linkage
Message-ID: <202511041315.yIdRMrNh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git kernel-6.19.cred
head:   59e578cf86c391d6595e005247ebefd4f371242c
commit: 9dd471f9caa5eb3aba71eebec26fab60dd0a220a [37/39] trace: use prepare credential guard
config: parisc-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041315.yIdRMrNh-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041315.yIdRMrNh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041315.yIdRMrNh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:17,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/parisc/include/asm/cmpxchg.h:87,
                    from arch/parisc/include/asm/atomic.h:10,
                    from include/linux/atomic.h:7,
                    from arch/parisc/include/asm/bitops.h:13,
                    from include/linux/bitops.h:67,
                    from include/linux/bitmap.h:8,
                    from kernel/trace/trace_events_user.c:9:
   kernel/trace/trace_events_user.c: In function 'user_event_set_call_visible':
>> kernel/trace/trace_events_user.c:1456:23: error: redeclaration of 'cred' with no linkage
     CLASS(prepare_creds, cred)();
                          ^~~~
   include/linux/cleanup.h:290:20: note: in definition of macro 'CLASS'
     class_##_name##_t var __cleanup(class_##_name##_destructor) = \
                       ^~~
   kernel/trace/trace_events_user.c:1454:15: note: previous declaration of 'cred' was here
     struct cred *cred;
                  ^~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y] && HAS_IOMEM [=y]
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/cred +1456 kernel/trace/trace_events_user.c

  1449	
  1450	static int user_event_set_call_visible(struct user_event *user, bool visible)
  1451	{
  1452		int ret;
  1453		const struct cred *old_cred;
  1454		struct cred *cred;
  1455	
> 1456		CLASS(prepare_creds, cred)();
  1457		if (!cred)
  1458			return -ENOMEM;
  1459	
  1460		/*
  1461		 * While by default tracefs is locked down, systems can be configured
  1462		 * to allow user_event files to be less locked down. The extreme case
  1463		 * being "other" has read/write access to user_events_data/status.
  1464		 *
  1465		 * When not locked down, processes may not have permissions to
  1466		 * add/remove calls themselves to tracefs. We need to temporarily
  1467		 * switch to root file permission to allow for this scenario.
  1468		 */
  1469		cred->fsuid = GLOBAL_ROOT_UID;
  1470	
  1471		old_cred = override_creds(cred);
  1472	
  1473		if (visible)
  1474			ret = trace_add_event_call(&user->call);
  1475		else
  1476			ret = trace_remove_event_call(&user->call);
  1477	
  1478		revert_creds(old_cred);
  1479	
  1480		return ret;
  1481	}
  1482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
