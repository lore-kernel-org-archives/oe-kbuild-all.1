Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E92317E4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 07:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763798145; cv=none; b=lPGOOJM6pD3mv5eVNSKY+wRwiHGla8RQxkGffHfQbRPZE7yjcV60FxyKezTolNvoBbzYBdCNSw19sosMM+jPeuspzSOpWtC5suwyS5GlC2MEDS5o4Nv2rDY7O94nMkYafs4I54KQ+9MCeJ+TTfUDpBkF1FXXN1JoUmkFJL3YLec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763798145; c=relaxed/simple;
	bh=MY3WwXzaFmix1l3RN2mmRkoAM55cXcuBR2x/5bWkJnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tTVpP7P2aKr25PxSK0H8tX8dOHnM2Hq5Wi6EWR6u+P6ScVvenXFpZS+B+uyVZJvZbdPoNsRBwZAXQsvxm6vvjWbSOD+wdcxYgax+QiHo5lFOf/hyQSZfWZpL7+5JLkS37QILJnPlZhRRnQFJylzKNWFqt0ZAX5/PEZCHraiLW5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaS2Kavi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaS2Kavi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763798144; x=1795334144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MY3WwXzaFmix1l3RN2mmRkoAM55cXcuBR2x/5bWkJnk=;
  b=HaS2Kavi5BtXxqDnbotvtpS+PJVV8RKEK04Ru0LERzgYK3iGtWiBrczm
   H5EBs41D3ufYUuL+yYblCdLeaqQxM5sDSRSYhKs+1PS+6BEsu17fmWGTN
   peqexP91nKofz+cMgAkoFwKFriksXM2g/1b5yFf9hertg4tg+9o7YhS/2
   c7Ze2ht2/Vlj+p+zTAStK45HcDtxo/vhBtCFfC9MgjIDCVL5E0i+5UGv3
   oEmjVeAi3cHNBzWZp+kquMPR0v2HG+3/XcbRPU+WhXvW0l0EnBI0yqElY
   Rrr8BZq1sl/6xog/EPsj3g20Qj/jO6Yn0O5QKciHs6F+xVmFAL+XLwpaG
   g==;
X-CSE-ConnectionGUID: b7apIB40QX2bjcp/YhLWmA==
X-CSE-MsgGUID: pmslPoZUQCWHy7rG9M6m5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="66043613"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="66043613"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 23:55:43 -0800
X-CSE-ConnectionGUID: 7xTUkKrkQk+BYrIWDvWUOg==
X-CSE-MsgGUID: eqpFuDHEQ46I0A/NYHg7Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="191668720"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2025 23:55:43 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMiT6-0007Gr-1e;
	Sat, 22 Nov 2025 07:55:40 +0000
Date: Sat, 22 Nov 2025 15:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1]
 drivers/platform/x86/thinkpad_acpi.c:10603:17: error: too few arguments to
 function 'platform_profile_notify'
Message-ID: <202511221548.NhQm2JNO-lkp@intel.com>
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
commit: 58b78ed61cea4cf0ab4d8e1b07b208d6513e4077 [0/1] BACKPORT: UPSTREAM: ACPI: platform_profile: Pass the profile handler into platform_profile_notify()
config: i386-randconfig-014-20251122 (https://download.01.org/0day-ci/archive/20251122/202511221548.NhQm2JNO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221548.NhQm2JNO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221548.NhQm2JNO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/thinkpad_acpi.c: In function 'dytc_profile_refresh':
>> drivers/platform/x86/thinkpad_acpi.c:10603:17: error: too few arguments to function 'platform_profile_notify'
   10603 |                 platform_profile_notify();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/thinkpad_acpi.c:60:
   include/linux/platform_profile.h:42:6: note: declared here
      42 | void platform_profile_notify(struct platform_profile_handler *pprof);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c: In function 'dytc_profile_exit':
   drivers/platform/x86/thinkpad_acpi.c:10701:9: error: too few arguments to function 'platform_profile_remove'
   10701 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]


vim +/platform_profile_notify +10603 drivers/platform/x86/thinkpad_acpi.c

c3bfcd4c676238e Mark Pearson      2021-01-11  10574  
c3bfcd4c676238e Mark Pearson      2021-01-11  10575  static void dytc_profile_refresh(void)
c3bfcd4c676238e Mark Pearson      2021-01-11  10576  {
c3bfcd4c676238e Mark Pearson      2021-01-11  10577  	enum platform_profile_option profile;
f999e23ce66c155 Mark Pearson      2023-06-06  10578  	int output = 0, err = 0;
f999e23ce66c155 Mark Pearson      2023-06-06  10579  	int perfmode, funcmode = 0;
c3bfcd4c676238e Mark Pearson      2021-01-11  10580  
c3bfcd4c676238e Mark Pearson      2021-01-11  10581  	mutex_lock(&dytc_mutex);
42504af775361ca Mark Pearson      2022-06-03  10582  	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
7a47f86bba748b3 Mark Pearson      2021-04-06  10583  		if (dytc_mmc_get_available)
7a47f86bba748b3 Mark Pearson      2021-04-06  10584  			err = dytc_command(DYTC_CMD_MMC_GET, &output);
7a47f86bba748b3 Mark Pearson      2021-04-06  10585  		else
c3bfcd4c676238e Mark Pearson      2021-01-11  10586  			err = dytc_cql_command(DYTC_CMD_GET, &output);
1bc5d819f0b9784 Mark Pearson      2023-01-24  10587  		funcmode = DYTC_FUNCTION_MMC;
1bc5d819f0b9784 Mark Pearson      2023-01-24  10588  	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
e1c21608e3cfc4b Mark Pearson      2022-02-25  10589  		err = dytc_command(DYTC_CMD_GET, &output);
1bc5d819f0b9784 Mark Pearson      2023-01-24  10590  		/* Check if we are PSC mode, or have AMT enabled */
1bc5d819f0b9784 Mark Pearson      2023-01-24  10591  		funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
f999e23ce66c155 Mark Pearson      2023-06-06  10592  	} else { /* Unknown profile mode */
f999e23ce66c155 Mark Pearson      2023-06-06  10593  		err = -ENODEV;
1bc5d819f0b9784 Mark Pearson      2023-01-24  10594  	}
c3bfcd4c676238e Mark Pearson      2021-01-11  10595  	mutex_unlock(&dytc_mutex);
c3bfcd4c676238e Mark Pearson      2021-01-11  10596  	if (err)
c3bfcd4c676238e Mark Pearson      2021-01-11  10597  		return;
c3bfcd4c676238e Mark Pearson      2021-01-11  10598  
c3bfcd4c676238e Mark Pearson      2021-01-11  10599  	perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
427c70dec738318 Mario Limonciello 2024-02-16  10600  	err = convert_dytc_to_profile(funcmode, perfmode, &profile);
427c70dec738318 Mario Limonciello 2024-02-16  10601  	if (!err && profile != dytc_current_profile) {
c3bfcd4c676238e Mark Pearson      2021-01-11  10602  		dytc_current_profile = profile;
c3bfcd4c676238e Mark Pearson      2021-01-11 @10603  		platform_profile_notify();
c3bfcd4c676238e Mark Pearson      2021-01-11  10604  	}
c3bfcd4c676238e Mark Pearson      2021-01-11  10605  }
c3bfcd4c676238e Mark Pearson      2021-01-11  10606  

:::::: The code at line 10603 was first introduced by commit
:::::: c3bfcd4c676238e198d5a798b50e5d424bf05497 platform/x86: thinkpad_acpi: Add platform profile support

:::::: TO: Mark Pearson <markpearson@lenovo.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
