Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAF9165F1A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 04:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763784204; cv=none; b=MweN0sBfwioqN1XeoIL5Tz2dBG+Mnu1qqwGioNV60y0GjiiGqSqLlWI5SkEkYI9aGoYXcYOSqKaM4FpdKj/bcXbzDsSmT7NLgsN9sYUCVcbSLHucBGLuIm/JXNp9O+ZuQAP9s9zzqwmUpff/g6U7D80rCNMNjCnQ79Bka5tlrsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763784204; c=relaxed/simple;
	bh=t5C/wro0UmcJEYGBNyXeb1WmLQWMjn+6funAwP7Lqhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gS/bcjkgH/wy1ZfDDM4kODQFgpssUhP+alTcKNR6WOmBaHtlP1Cx52GKP4NnbJey/74JUiOzXkgsUbnY6H6hfTtQSOFlHxMmyTUVG3cI6REHMdrsX81sZ0X2JakZPNEEV14wsU+fpDgQCYfA4YQXkCIw/9wK8NVVaAdRwhqFv5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPIYZzPM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPIYZzPM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763784203; x=1795320203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t5C/wro0UmcJEYGBNyXeb1WmLQWMjn+6funAwP7Lqhw=;
  b=WPIYZzPMMgvB41ywaxxDVPsd5vJLSGUW+sKrpF0gaz/8VjKWqm0D5Hfs
   9aQ10yENcsaJMn/grGnAG+sJ2sT3sT1LFFPdo3ig9BJZXMSKJmNnSIABN
   YYyPjwUlpUTmwIJfw4Zc4No5UGZ7wjS6zcbOW2PWKeHx5B2nqUa5xtdXg
   A3UmgmtuHsp6xnjA9iUboNM+8JkWWMhOMNLstoUKyuFhyHIWAm7PrHx2q
   QoI53RWUF6bEEI0JaiaCMsavouuYAZ3mfvTsqOPTXeefnKJz6tCJfagwm
   mFrSGeCN6rGS0R1Azw4XAbUUMfK59sRH7AbVU34ePDZS2aFNFg3KBVzRM
   A==;
X-CSE-ConnectionGUID: e5Ad9T+GTWC9gK5Yfna/Tg==
X-CSE-MsgGUID: i0b0AFbYTBWrUwTQdF/dRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="76561575"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="76561575"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 20:03:22 -0800
X-CSE-ConnectionGUID: PyemlSryTyWDd/OIsihj+A==
X-CSE-MsgGUID: ZDiGT5wnTiOq1s4tjGUcPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="196015879"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2025 20:03:21 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMeqE-00078p-36;
	Sat, 22 Nov 2025 04:03:18 +0000
Date: Sat, 22 Nov 2025 12:02:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1]
 drivers/platform/x86/thinkpad_acpi.c:10701:9: error: too few arguments to
 function 'platform_profile_remove'
Message-ID: <202511221118.EmICBieC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   40435e5332925bf7429f8e4c796040981fcc4968
commit: 8842a242e72a30f923d927e0a9bbcc13e40240bc [0/1] BACKPORT: UPSTREAM: ACPI: platform_profile: Add platform handler argument to platform_profile_remove()
config: i386-randconfig-014-20251122 (https://download.01.org/0day-ci/archive/20251122/202511221118.EmICBieC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221118.EmICBieC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221118.EmICBieC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/thinkpad_acpi.c: In function 'dytc_profile_exit':
>> drivers/platform/x86/thinkpad_acpi.c:10701:9: error: too few arguments to function 'platform_profile_remove'
   10701 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/thinkpad_acpi.c:60:
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]


vim +/platform_profile_remove +10701 drivers/platform/x86/thinkpad_acpi.c

c3bfcd4c676238 Mark Pearson 2021-01-11  10698  
c3bfcd4c676238 Mark Pearson 2021-01-11  10699  static void dytc_profile_exit(void)
c3bfcd4c676238 Mark Pearson 2021-01-11  10700  {
c3bfcd4c676238 Mark Pearson 2021-01-11 @10701  	platform_profile_remove();
c3bfcd4c676238 Mark Pearson 2021-01-11  10702  }
c3bfcd4c676238 Mark Pearson 2021-01-11  10703  

:::::: The code at line 10701 was first introduced by commit
:::::: c3bfcd4c676238e198d5a798b50e5d424bf05497 platform/x86: thinkpad_acpi: Add platform profile support

:::::: TO: Mark Pearson <markpearson@lenovo.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
