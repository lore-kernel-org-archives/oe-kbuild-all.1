Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB9E39447C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 06:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786517049; cv=none; b=mywgaNKjzQ+8R+hDjcpgGuiEyInLt+vpsiyYi05GR6g11Sg4bG+aobiAEzmpjFMiAtSZKPQYJ9NM4zONM9E38622GB80oBgwgPefJ4SPso7eV+e6S1RyfZONVA8YGPScXBM/K4X77A7makmmLr9fwYuphrx8txVK109zssVFqT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786517049; c=relaxed/simple;
	bh=Dl0VhGJkzN6GzvwrddZwCbkNJjClsrtxup5BKgUiYCs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=luurCMgbVS4rjgdLhF5FG08zNXfBWWIauWbwNaKNejoxtDZzgJ9qJ2R1wAMvd110mjI3qT+dGEI4uxJai8gFvjg8GPdq9/fXVktlbPnr3xP0VxSaXtv++xPuu2Yln12thSqqDhmGzvv23mfDMdsXdTn6Z0ej1vkDFxXgptuoIFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBqtIC7l; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBqtIC7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786517047; x=1818053047;
  h=date:from:to:cc:subject:message-id;
  bh=Dl0VhGJkzN6GzvwrddZwCbkNJjClsrtxup5BKgUiYCs=;
  b=NBqtIC7ljSHqDpoaYPP6VO+KbMV0kktDPSmJdCJVKlSejH5hEZ4XxZsz
   NsfRqAxXbfzmuJO1kPFPaqlMt1H7ZZf2CMjGrfOP1T8XRRQ96NJQCgb4H
   Wd+lFZnmjeMkP2C2VwwGboi9zlWvxMvsL1rGzDnhCysn8HzWUn6Ps9Win
   JDedC2UE6QylmXBCMq2A3T4siUQR/JwDL1AZ50l0Kfo0S47wcNIq1msn9
   XeXbzlRlgKElr2lMbF+7p9S5ixKsRyN4rdqp2QGyW3hwVSLnDMiC1lb/j
   XzlJvN+PF4nFKCX9VrKlDCO8VSnHtzJdz0hvbWxSuzGgWK0SuAFGYHo7O
   g==;
X-CSE-ConnectionGUID: kWM3Sm2UR2+HdA9gVC6VCA==
X-CSE-MsgGUID: FCjU2pBOQsmk+AXhLWZ8RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86179912"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="86179912"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 23:44:06 -0700
X-CSE-ConnectionGUID: SdPzScmPS4OEwQgJS+FIXw==
X-CSE-MsgGUID: oS1b8ZwNTYqpGhYzCnnTAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="286981877"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Aug 2026 23:44:04 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu2h0-00000000PvW-06hw;
	Wed, 12 Aug 2026 06:44:02 +0000
Date: Wed, 12 Aug 2026 14:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Roman Li <Roman.Li@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>
Subject: [agd5f:drm-next-7.3 244/308]
 dml2_utm_soc_bb_dcn6.c:undefined reference to `__udivdi3'
Message-ID: <202608121403.ShIbnRGc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.3
head:   daaeec235e46b45a0dbd4facfb275cc43022028d
commit: 992694ad28584188725751f695a85661e8e3797a [244/308] drm/amd/display: Enable DCN6 sources compilation
config: i386-buildonly-randconfig-002-20260812 (https://download.01.org/0day-ci/archive/20260812/202608121403.ShIbnRGc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608121403.ShIbnRGc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608121403.ShIbnRGc-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_utm_soc_bb/dml2_utm_soc_bb_dcn6.o: in function `dchub_v2_get_sop_total_available_bandwidth_KBps':
>> dml2_utm_soc_bb_dcn6.c:(.text+0x50): undefined reference to `__udivdi3'
>> ld: dml2_utm_soc_bb_dcn6.c:(.text+0x8c): undefined reference to `__udivdi3'
   ld: dml2_utm_soc_bb_dcn6.c:(.text+0xaf): undefined reference to `__udivdi3'
   ld: dml2_utm_soc_bb_dcn6.c:(.text+0xd1): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_utm_soc_bb/dml2_utm_soc_bb_dcn6.o: in function `dchub_v2_is_qos_bandwidth_supported_by_sop':
   dml2_utm_soc_bb_dcn6.c:(.text+0xae3): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_utm_soc_bb/dml2_utm_soc_bb_dcn6.o:dml2_utm_soc_bb_dcn6.c:(.text+0xb14): more undefined references to `__udivdi3' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
