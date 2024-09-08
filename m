Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0D4FC11
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 01:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725760004; cv=none; b=Y2Daacd3F0OZ+K4U41jAmDBTii84TwJarYbOnj7PlOHVY6Txk4JeJLfUYc2vyXyjZyALmeCAghX0Bu9m1Q9pcSx6Ip5zlvlRU32ziwjtiOmQDElprno/RmXkUyD7GGZumnul0FNxpm69rJ1a5Y+ZzKEEdsfEnIGRhtqdbjSgbdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725760004; c=relaxed/simple;
	bh=1UAVRr7QlKFxHTXOMD/p/FaW4G5InitOGxKPv8523lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fdEdA93TKGQGP1BYL3U6l8N+PC5+v7CiR1WbjahjgUYk5mAuepp2Ldiby2c7aP2mbUQ36YXnHSVWxbybX2BiF5XZ4pTtQbhCmBEqeHdaBDxXqh19yUM79uO/19jbHW0KatXT8DltZbxqr9dN9/iozIDqDXkNJZ6UcFl5dOhfzPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Puhe6cWF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Puhe6cWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725760003; x=1757296003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1UAVRr7QlKFxHTXOMD/p/FaW4G5InitOGxKPv8523lQ=;
  b=Puhe6cWFKSQyPD2E2ajecWf29th7GIaGTQ39gvlJ20o9QMeuTEyXHvu3
   HCuCP3dVAdweqkD0OBpKsbh8dcVWJ/NqPk7J3NG870dMb0xC4Ez5XOFe3
   QcoLD8b8W83ESXXkqMfFx8cDTC41zA28iB6QMxp8m3s6clgeu17yZAOld
   ELmbWyj46tnIozdmvNIvelpd67TzEcGgLrfrj+LwC1RyGaAKM1mld4p7m
   tW52/2e3OuwK9agA2CoJNfG635aOpc0zU5K7KWZpvxk5jIWrG+yawygJi
   L13Tx+51ZWx7Lh1SVF/cFceKlaTO/ccldN2DsMe7Zl1H9CXo4rrEXaxd6
   w==;
X-CSE-ConnectionGUID: 2lJuKt59RHOIqNdXjUHFdg==
X-CSE-MsgGUID: tj/owqWTQVOaeYZX2GTVFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="27404116"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="27404116"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 18:46:42 -0700
X-CSE-ConnectionGUID: kHww0j3QQMaDwRcaw1thmg==
X-CSE-MsgGUID: xur7V6miQe6xtv6aSoAneA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="89587060"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Sep 2024 18:46:41 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn70h-000DCB-0Z;
	Sun, 08 Sep 2024 01:46:39 +0000
Date: Sun, 8 Sep 2024 09:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2] ERROR: modpost: "dvb_dmx_init"
 [drivers/media/pci/mantis/mantis_core.ko] undefined!
Message-ID: <202409080909.mGe1cDau-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   ded870b6a9b0a865726f4fa855fe03d1adac60a6
commit: a46280457e55aa3405f8327459f27cce648c921e [2/2] FROMLIST: media: Kconfig: Make DVB_CORE=m possible when MEDIA_SUPPORT=y
config: x86_64-randconfig-073-20240908 (https://download.01.org/0day-ci/archive/20240908/202409080909.mGe1cDau-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080909.mGe1cDau-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080909.mGe1cDau-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dvb_dmx_init" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_unregister_adapter" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_register_frontend" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_ca_en50221_camchange_irq" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_unregister_frontend" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_ca_en50221_camready_irq" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_frontend_detach" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_dmxdev_release" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_dmx_swfilter" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_ca_en50221_release" [drivers/media/pci/mantis/mantis_core.ko] undefined!
WARNING: modpost: suppressed 5 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
