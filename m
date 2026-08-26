Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95C034EF04
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 20:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787776652; cv=none; b=KyiiTDGvaKLhE1W0+IiuGLdeC3sgGW7LOHik6lAq5ftnz35BtJlpIDwudAinvfrsj23egUiy9VbysN0HJWfMM4wjpFzsex52TNmwZY+4LQSgKnU8fW/aea1QW6gesHBg5/tS67PbzNqTcXc3jq0RN8PGS8eLxQFnMVd6zaB7+lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787776652; c=relaxed/simple;
	bh=Js3HAo/msih6C87TjgsSmzucS6u90kmQWcM/9O4iAjk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iXrIifDBfdnZSGBCkuJgHinT4bU9KpAyw71q1otcnAlu2nM3X7ZFNORfDx/y8xL4d3rHMqFHOczrNyCQdIZLzEmEEmPb0+qQe9dxLAsB1WxdNa6TyJfxZlISv4MoSJMIQrHLS7Oqte+KY47+ECRJH9MWjKpgtAtBUjoz+wdmlTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjhE7WHV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjhE7WHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787776650; x=1819312650;
  h=date:from:to:cc:subject:message-id;
  bh=Js3HAo/msih6C87TjgsSmzucS6u90kmQWcM/9O4iAjk=;
  b=TjhE7WHV5unupsezXV4iPDDT2HP0Ce4Hzo9fRxv0gz5F9zCKTjkNOwBB
   FtN4j7ShnUH6xHVtnS41mMRD9lFtfP7lwL6h0FNgagi4N3ml2KLCSI+8i
   LChJge3eb39W5axXv+xlC2dEoTRy/OBNwEOmQUHFO9DBxlE3O3gdZ3IvK
   SZW0XB12hkTGKuQhWMzfgSsE6noq7cA2aKN26eyPuxq1c/+nambN4gOec
   UCr5Cks8Ef+uCAGckTyn8gkS1sy30Y7AshhtgpxO6eWe7mXgpqK66FmGe
   SrXGowXQLSuEqOUh8zrvdmV+v8AB8QiURKniJExvFqtSwBfYZGZKENJtk
   w==;
X-CSE-ConnectionGUID: RzlZ7kSETCa/NmSyiA7GhA==
X-CSE-MsgGUID: og2cj73OQiugPfiSJ1dvWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99787608"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="99787608"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 13:37:29 -0700
X-CSE-ConnectionGUID: Ma28AqX8TIeMhdMOOEq2Ag==
X-CSE-MsgGUID: 5QOeX/8pTd2c4DyzDdXU1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="291198921"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Aug 2026 13:37:28 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzKNB-000000000Zl-3hXN;
	Wed, 26 Aug 2026 20:37:25 +0000
Date: Wed, 26 Aug 2026 22:36:43 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for DIMLIB when selected by
 GKI_HIDDEN_VIRTUAL_CONFIGS
Message-ID: <202608262241.uR09LWE5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   484a44b9b6f8ca15a56568c5f7e1d0694b8515fa
commit: 1dfbe413d21f18f714cca818435299947bf5649a [6/6] Merge 6706415bf9f3 ("Merge tag 'gfs2-v6.10-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2") into android-mainline
config: x86_64-kismet-CONFIG_DIMLIB-CONFIG_GKI_HIDDEN_VIRTUAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260826/202608262241.uR09LWE5-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608262241.uR09LWE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608262241.uR09LWE5-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DIMLIB when selected by GKI_HIDDEN_VIRTUAL_CONFIGS
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for IPU_BRIDGE
     Depends on [n]: MEDIA_SUPPORT [=y] && PCI [=y] && MEDIA_PCI_SUPPORT [=y] && (ACPI [=y] || COMPILE_TEST [=y]) && I2C [=n]
     Selected by [y]:
     - VIDEO_INTEL_IPU6 [=y] && MEDIA_SUPPORT [=y] && PCI [=y] && MEDIA_PCI_SUPPORT [=y] && (ACPI [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && X86 [=y] && X86_64 [=y] && HAS_DMA [=y]
   
   WARNING: unmet direct dependencies detected for DIMLIB
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for HVC_DRIVER
     Depends on [n]: TTY [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
