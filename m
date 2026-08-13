Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591BE3A839B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 09:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786612999; cv=none; b=IgwW8WEiRPj49pJKHnl72EjX71v5YLrSyprcXsf3uOmYcpjo9mUjFAi34Hstmx8HjmugkAhLSRacEq36YrgKCcLjWeSPfXvourNZedGzgXUlUovHqHipFJPGoy+jZV07kc8n9IhfYJ0i8EZzpYfbB6msxah91VUc1Bc02IIRSE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786612999; c=relaxed/simple;
	bh=//g50Js2CnMSBNokLi87kTwfvOfbnLnRy1XFH7DI22s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CcMzSXK4ynL8RViyhCzI/Zq29NTN8I7C4ThuF9ZDgnY2o5k9j8lF9OcWR/pi/+B6Tu0b/YpHWRvUXdEPZ07oTZA05hpUDAIr3ptLSOEBZ63RKpDq+iJGCVYsBxNJKO37pE5LiIVblvm9G0v4lZsC5JXeoFKd+DOeA1l5luaf9DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZ7tX28/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZ7tX28/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786612998; x=1818148998;
  h=date:from:to:cc:subject:message-id;
  bh=//g50Js2CnMSBNokLi87kTwfvOfbnLnRy1XFH7DI22s=;
  b=VZ7tX28/qZgl0UdSGHXO3dpHXMpU2z/Fqd7LW/ldiCckYI3McsiGYiM3
   2hUPTzH3fzKWHaR3E85dh0HMJjnUI1P5qWJfy4Awm1YNwqQs6dpFUN3yk
   q7N1r5DhkeV1sZ/SC64C6l1Au15tGR2gcgJQeOwqf8k1zVcA4WnEWw6M5
   Abpria9SV99gi1uAGNdo+0epdzWesPqb9Aw3KuHe8VEyc4SQFbQUu92Z0
   6OLp7dJ1HjjjFv3T+WAlvI+1PqBa+YuUGITtEyN5TUtW2uHH65MOk/jQz
   sJ5A9D4pRU9exdNxpE/lC7L3rKjon6L6cUq9FEFdiC+pQAkdCGr/UMdFP
   g==;
X-CSE-ConnectionGUID: BBbJ+tzGQei+h6D26SpeuQ==
X-CSE-MsgGUID: wpAtTzhBSqujX7fIuEV/nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87399076"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87399076"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 02:23:17 -0700
X-CSE-ConnectionGUID: p+xdJbSrRgGBKvn4ifYntg==
X-CSE-MsgGUID: fT29V1SPSnKCSH4GBGMOZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="288681279"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Aug 2026 02:23:15 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuRea-00000000TVy-41eb;
	Thu, 13 Aug 2026 09:23:12 +0000
Date: Thu, 13 Aug 2026 17:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/platform/surface/surface_platform_profile.c:224:16: error: too few
 arguments to function 'platform_profile_register'
Message-ID: <202608131700.R3OnH7GP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kurt,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: 15ff3def5e7516c9599f03e3139358e29dd00664 [1/1] BACKPORT: UPSTREAM: ACPI: platform_profile: Let drivers set drvdata to the class device
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608131700.R3OnH7GP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131700.R3OnH7GP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131700.R3OnH7GP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/platform/surface/surface_platform_profile.c: In function 'surface_platform_profile_probe':
>> drivers/platform/surface/surface_platform_profile.c:224:16: error: too few arguments to function 'platform_profile_register'
     224 |         return platform_profile_register(&tpd->handler);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/surface/surface_platform_profile.c:12:
   include/linux/platform_profile.h:43:5: note: declared here
      43 | int platform_profile_register(struct platform_profile_handler *pprof, void *drvdata);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/surface/surface_platform_profile.c: In function 'surface_platform_profile_remove':
   drivers/platform/surface/surface_platform_profile.c:229:9: error: too few arguments to function 'platform_profile_remove'
     229 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:44:5: note: declared here
      44 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/surface/surface_platform_profile.c: In function 'surface_platform_profile_probe':
>> drivers/platform/surface/surface_platform_profile.c:225:1: warning: control reaches end of non-void function [-Wreturn-type]
     225 | }
         | ^
--
   drivers/platform/x86/acer-wmi.c: In function 'acer_platform_profile_setup':
>> drivers/platform/x86/acer-wmi.c:1944:23: error: too few arguments to function 'platform_profile_register'
    1944 |                 err = platform_profile_register(&platform_profile_handler);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/acer-wmi.c:22:
   include/linux/platform_profile.h:43:5: note: declared here
      43 | int platform_profile_register(struct platform_profile_handler *pprof, void *drvdata);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/acer-wmi.c: In function 'acer_thermal_profile_change':
   drivers/platform/x86/acer-wmi.c:2036:17: error: too few arguments to function 'platform_profile_notify'
    2036 |                 platform_profile_notify();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:47:6: note: declared here
      47 | void platform_profile_notify(struct platform_profile_handler *pprof);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/acer-wmi.c: In function 'acer_platform_probe':
   drivers/platform/x86/acer-wmi.c:2598:17: error: too few arguments to function 'platform_profile_remove'
    2598 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:44:5: note: declared here
      44 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/acer-wmi.c: In function 'acer_platform_remove':
   drivers/platform/x86/acer-wmi.c:2621:17: error: too few arguments to function 'platform_profile_remove'
    2621 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:44:5: note: declared here
      44 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/asus-wmi.c: In function 'throttle_thermal_policy_switch_next':
   drivers/platform/x86/asus-wmi.c:3769:9: error: too few arguments to function 'platform_profile_notify'
    3769 |         platform_profile_notify();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/asus-wmi.c:34:
   include/linux/platform_profile.h:47:6: note: declared here
      47 | void platform_profile_notify(struct platform_profile_handler *pprof);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c: In function 'throttle_thermal_policy_store':
   drivers/platform/x86/asus-wmi.c:3808:9: error: too few arguments to function 'platform_profile_notify'
    3808 |         platform_profile_notify();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:47:6: note: declared here
      47 | void platform_profile_notify(struct platform_profile_handler *pprof);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c: In function 'platform_profile_setup':
>> drivers/platform/x86/asus-wmi.c:3904:15: error: too few arguments to function 'platform_profile_register'
    3904 |         err = platform_profile_register(&asus->platform_profile_handler);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:43:5: note: declared here
      43 | int platform_profile_register(struct platform_profile_handler *pprof, void *drvdata);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c: In function 'asus_wmi_add':
   drivers/platform/x86/asus-wmi.c:4871:17: error: too few arguments to function 'platform_profile_remove'
    4871 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:44:5: note: declared here
      44 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c: In function 'asus_wmi_remove':
   drivers/platform/x86/asus-wmi.c:4898:17: error: too few arguments to function 'platform_profile_remove'
    4898 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:44:5: note: declared here
      44 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/ideapad-laptop.c: In function 'dytc_profile_refresh':
   drivers/platform/x86/ideapad-laptop.c:1059:17: error: too few arguments to function 'platform_profile_notify'
    1059 |                 platform_profile_notify();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/ideapad-laptop.c:30:
   include/linux/platform_profile.h:47:6: note: declared here
      47 | void platform_profile_notify(struct platform_profile_handler *pprof);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/ideapad-laptop.c: In function 'ideapad_dytc_profile_init':
>> drivers/platform/x86/ideapad-laptop.c:1130:15: error: too few arguments to function 'platform_profile_register'
    1130 |         err = platform_profile_register(&priv->dytc->pprof);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:43:5: note: declared here
      43 | int platform_profile_register(struct platform_profile_handler *pprof, void *drvdata);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/ideapad-laptop.c: In function 'ideapad_dytc_profile_exit':
   drivers/platform/x86/ideapad-laptop.c:1152:9: error: too few arguments to function 'platform_profile_remove'
    1152 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:44:5: note: declared here
      44 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/thinkpad_acpi.c: In function 'dytc_profile_refresh':
   drivers/platform/x86/thinkpad_acpi.c:10603:17: error: too few arguments to function 'platform_profile_notify'
   10603 |                 platform_profile_notify();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/thinkpad_acpi.c:60:
   include/linux/platform_profile.h:47:6: note: declared here
      47 | void platform_profile_notify(struct platform_profile_handler *pprof);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c: In function 'tpacpi_dytc_profile_init':
>> drivers/platform/x86/thinkpad_acpi.c:10681:15: error: too few arguments to function 'platform_profile_register'
   10681 |         err = platform_profile_register(&dytc_profile);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:43:5: note: declared here
      43 | int platform_profile_register(struct platform_profile_handler *pprof, void *drvdata);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c: In function 'dytc_profile_exit':
   drivers/platform/x86/thinkpad_acpi.c:10701:9: error: too few arguments to function 'platform_profile_remove'
   10701 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:44:5: note: declared here
      44 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/inspur_platform_profile.c: In function 'inspur_wmi_probe':
>> drivers/platform/x86/inspur_platform_profile.c:187:16: error: too few arguments to function 'platform_profile_register'
     187 |         return platform_profile_register(&priv->handler);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/inspur_platform_profile.c:11:
   include/linux/platform_profile.h:43:5: note: declared here
      43 | int platform_profile_register(struct platform_profile_handler *pprof, void *drvdata);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/inspur_platform_profile.c: In function 'inspur_wmi_remove':
   drivers/platform/x86/inspur_platform_profile.c:192:9: error: too few arguments to function 'platform_profile_remove'
     192 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:44:5: note: declared here
      44 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/inspur_platform_profile.c: In function 'inspur_wmi_probe':
>> drivers/platform/x86/inspur_platform_profile.c:188:1: warning: control reaches end of non-void function [-Wreturn-type]
     188 | }
         | ^
--
   drivers/platform/x86/dell/dell-pc.c: In function 'thermal_init':
>> drivers/platform/x86/dell/dell-pc.c:263:15: error: too few arguments to function 'platform_profile_register'
     263 |         ret = platform_profile_register(thermal_handler);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/dell/dell-pc.c:20:
   include/linux/platform_profile.h:43:5: note: declared here
      43 | int platform_profile_register(struct platform_profile_handler *pprof, void *drvdata);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-pc.c: In function 'thermal_cleanup':
   drivers/platform/x86/dell/dell-pc.c:275:17: error: too few arguments to function 'platform_profile_remove'
     275 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:44:5: note: declared here
      44 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/hp/hp-wmi.c: In function 'thermal_profile_setup':
>> drivers/platform/x86/hp/hp-wmi.c:1630:15: error: too few arguments to function 'platform_profile_register'
    1630 |         err = platform_profile_register(&platform_profile_handler);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/hp/hp-wmi.c:24:
   include/linux/platform_profile.h:43:5: note: declared here
      43 | int platform_profile_register(struct platform_profile_handler *pprof, void *drvdata);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/hp/hp-wmi.c: In function 'hp_wmi_bios_remove':
   drivers/platform/x86/hp/hp-wmi.c:1694:17: error: too few arguments to function 'platform_profile_remove'
    1694 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:44:5: note: declared here
      44 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/platform_profile_register +224 drivers/platform/surface/surface_platform_profile.c

b78b4982d7637ed Maximilian Luz 2021-02-11  203  
b78b4982d7637ed Maximilian Luz 2021-02-11  204  static int surface_platform_profile_probe(struct ssam_device *sdev)
b78b4982d7637ed Maximilian Luz 2021-02-11  205  {
3427c443a6dc2f6 Ivor Wanders   2024-03-14  206  	struct ssam_platform_profile_device *tpd;
b78b4982d7637ed Maximilian Luz 2021-02-11  207  
b78b4982d7637ed Maximilian Luz 2021-02-11  208  	tpd = devm_kzalloc(&sdev->dev, sizeof(*tpd), GFP_KERNEL);
b78b4982d7637ed Maximilian Luz 2021-02-11  209  	if (!tpd)
b78b4982d7637ed Maximilian Luz 2021-02-11  210  		return -ENOMEM;
b78b4982d7637ed Maximilian Luz 2021-02-11  211  
b78b4982d7637ed Maximilian Luz 2021-02-11  212  	tpd->sdev = sdev;
b78b4982d7637ed Maximilian Luz 2021-02-11  213  
b78b4982d7637ed Maximilian Luz 2021-02-11  214  	tpd->handler.profile_get = ssam_platform_profile_get;
b78b4982d7637ed Maximilian Luz 2021-02-11  215  	tpd->handler.profile_set = ssam_platform_profile_set;
b78b4982d7637ed Maximilian Luz 2021-02-11  216  
3427c443a6dc2f6 Ivor Wanders   2024-03-14  217  	tpd->has_fan = device_property_read_bool(&sdev->dev, "has_fan");
3427c443a6dc2f6 Ivor Wanders   2024-03-14  218  
b78b4982d7637ed Maximilian Luz 2021-02-11  219  	set_bit(PLATFORM_PROFILE_LOW_POWER, tpd->handler.choices);
b78b4982d7637ed Maximilian Luz 2021-02-11  220  	set_bit(PLATFORM_PROFILE_BALANCED, tpd->handler.choices);
b78b4982d7637ed Maximilian Luz 2021-02-11  221  	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, tpd->handler.choices);
b78b4982d7637ed Maximilian Luz 2021-02-11  222  	set_bit(PLATFORM_PROFILE_PERFORMANCE, tpd->handler.choices);
b78b4982d7637ed Maximilian Luz 2021-02-11  223  
fe0e04cf66a12ff Armin Wolf     2023-10-15 @224  	return platform_profile_register(&tpd->handler);
b78b4982d7637ed Maximilian Luz 2021-02-11 @225  }
b78b4982d7637ed Maximilian Luz 2021-02-11  226  

:::::: The code at line 224 was first introduced by commit
:::::: fe0e04cf66a12ffe6d1b43725ddaabd5599d024f platform/surface: platform_profile: Propagate error if profile registration fails

:::::: TO: Armin Wolf <W_Armin@gmx.de>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
