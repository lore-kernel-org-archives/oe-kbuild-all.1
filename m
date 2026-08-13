Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374CF340DB8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 02:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786589802; cv=none; b=ANQVIu1tX3VZPxyBHCglIxqsQqwoU67s4LpifTLyLJGcu/Rnr4mDME6d0eAoabTnBHegEXeXzUDRwPhyLMPbIoSbkzm8wr+MeDft9pmniqmgh+aM40d2TTOaNr9Sl4thRlYeLh05TXCCV7ikc+ZcEulmLAr/b/HNoeOTcPNMEz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786589802; c=relaxed/simple;
	bh=JkYF/XeiBhXzA7EAfJH7l+wYPs6Mcb7/ZTGbKBa80Co=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hXSOEHpDHiROAxsAZ9FI+Gx5hlSXkPtGe1ofXuFfQnGBU/S289q5zOrTUMHydjyKqPoDrxchPN/mr0NortXR4sGiEed3A5F7tdk6oZti/2ucMnQSb92S3qpOAP1YcH31gSabnl0N4psRVmmOV6dANXEvG/3Z14DdqJSLyqNtdHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wklw2x6p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wklw2x6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786589800; x=1818125800;
  h=date:from:to:cc:subject:message-id;
  bh=JkYF/XeiBhXzA7EAfJH7l+wYPs6Mcb7/ZTGbKBa80Co=;
  b=Wklw2x6pH3DM4TsmTvpG9NlDp6ahNlVMLO+Nu7eAwNS3rqPbujvOrVrm
   jEhhA9/4bfALSt2ZGY4O81vs4VITS+nmJwMOj+zlNpNoyDieB1IJJDQll
   P0c5AEY2lat8ThMEbb4ELC2ilng5CSk2Nv4f0xF9tqbv+zO2XCZopGPTI
   cIJxPzbPPpvL+Q5HMVDcQKyfMfIEwbvkHYT2FDBZI8g6ekzUVgmX9xxZQ
   SCzo/4px4lFCs/QlOJF96K6guLRhf4aqUwXC5XXETDd3Br/UFyWzsnn6W
   Q3AV7xLxADhvdjmUnaL8Mh+Zl/BxY65J/u1xtRt4UiwCH07su6CcTN2AO
   Q==;
X-CSE-ConnectionGUID: 2fSBL1iOQT6qEQ2h4x897g==
X-CSE-MsgGUID: fhPt+1MgRMKE9Ex39GQsDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97822099"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97822099"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 19:56:38 -0700
X-CSE-ConnectionGUID: 5Hw+WQ0VSZG4riK6GHmeNw==
X-CSE-MsgGUID: Ruh1x6EATmW6FuQ39KPHeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="288603192"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Aug 2026 19:56:34 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuLcN-00000000SbU-3gai;
	Thu, 13 Aug 2026 02:56:31 +0000
Date: Thu, 13 Aug 2026 10:56:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/platform/surface/surface_platform_profile.c:229:9: error: too few
 arguments to function 'platform_profile_remove'
Message-ID: <202608131001.zoE6POlw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: 8842a242e72a30f923d927e0a9bbcc13e40240bc [1/1] BACKPORT: UPSTREAM: ACPI: platform_profile: Add platform handler argument to platform_profile_remove()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608131001.zoE6POlw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131001.zoE6POlw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131001.zoE6POlw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/surface/surface_platform_profile.c: In function 'surface_platform_profile_remove':
>> drivers/platform/surface/surface_platform_profile.c:229:9: error: too few arguments to function 'platform_profile_remove'
     229 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/surface/surface_platform_profile.c:12:
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/acer-wmi.c: In function 'acer_platform_probe':
>> drivers/platform/x86/acer-wmi.c:2598:17: error: too few arguments to function 'platform_profile_remove'
    2598 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/acer-wmi.c:22:
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/acer-wmi.c: In function 'acer_platform_remove':
   drivers/platform/x86/acer-wmi.c:2621:17: error: too few arguments to function 'platform_profile_remove'
    2621 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/asus-wmi.c: In function 'asus_wmi_add':
>> drivers/platform/x86/asus-wmi.c:4871:17: error: too few arguments to function 'platform_profile_remove'
    4871 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/asus-wmi.c:34:
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c: In function 'asus_wmi_remove':
   drivers/platform/x86/asus-wmi.c:4898:17: error: too few arguments to function 'platform_profile_remove'
    4898 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/ideapad-laptop.c: In function 'ideapad_dytc_profile_exit':
>> drivers/platform/x86/ideapad-laptop.c:1152:9: error: too few arguments to function 'platform_profile_remove'
    1152 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/ideapad-laptop.c:30:
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/thinkpad_acpi.c: In function 'dytc_profile_exit':
>> drivers/platform/x86/thinkpad_acpi.c:10701:9: error: too few arguments to function 'platform_profile_remove'
   10701 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/thinkpad_acpi.c:60:
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/inspur_platform_profile.c: In function 'inspur_wmi_remove':
>> drivers/platform/x86/inspur_platform_profile.c:192:9: error: too few arguments to function 'platform_profile_remove'
     192 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/inspur_platform_profile.c:11:
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/dell/dell-pc.c: In function 'thermal_cleanup':
>> drivers/platform/x86/dell/dell-pc.c:275:17: error: too few arguments to function 'platform_profile_remove'
     275 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/dell/dell-pc.c:20:
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/hp/hp-wmi.c: In function 'hp_wmi_bios_remove':
>> drivers/platform/x86/hp/hp-wmi.c:1694:17: error: too few arguments to function 'platform_profile_remove'
    1694 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/hp/hp-wmi.c:24:
   include/linux/platform_profile.h:40:5: note: declared here
      40 | int platform_profile_remove(struct platform_profile_handler *pprof);
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/platform_profile_remove +229 drivers/platform/surface/surface_platform_profile.c

b78b4982d7637ed Maximilian Luz 2021-02-11  226  
b78b4982d7637ed Maximilian Luz 2021-02-11  227  static void surface_platform_profile_remove(struct ssam_device *sdev)
b78b4982d7637ed Maximilian Luz 2021-02-11  228  {
b78b4982d7637ed Maximilian Luz 2021-02-11 @229  	platform_profile_remove();
b78b4982d7637ed Maximilian Luz 2021-02-11  230  }
b78b4982d7637ed Maximilian Luz 2021-02-11  231  

:::::: The code at line 229 was first introduced by commit
:::::: b78b4982d7637ededbc40b5f4aa59394acee8a60 platform/surface: Add platform profile driver

:::::: TO: Maximilian Luz <luzmaximilian@gmail.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
