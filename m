Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3581A3029
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732106271; cv=none; b=VTjzaG67VJj7sysGaxhoiimyEYwHWUZ9cVmqTLqIqS6zuzsj0uWrw0lkZVm7IledR6mjix6Fe/9Hy4JzHrFHCSix2na/1ow5IGJfgSXxHACWeabxcNBqyaUPenyrBwKnpjehPWmDGpCNgxGdfN8mkAQ1UQBVJzrRmkvNBfM4gQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732106271; c=relaxed/simple;
	bh=uTk/gTpOG1Ug6Mh8oSUwrd534yoJICTaK//EGDq7wQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CfborG7XXiWkKrHUbJkzKqhl0Zi8tXgt5gyajPAOQ6n8W4g8QU/+t2g4MWBbbKw8rmlQRm17vWrBqS5f8zvzhmLByjd6+SQFGHsNm3TDlXStygblLyusfp+a1G3+YcG0NzP9q9T1B1QGz3IppPVcjTrxheOFkuZBLVgUf+I8NE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6KydG0P; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6KydG0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732106270; x=1763642270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uTk/gTpOG1Ug6Mh8oSUwrd534yoJICTaK//EGDq7wQU=;
  b=P6KydG0PdDeI2pugT43gogLEoiAUDmpqnni+jPFQALzmldY4bUfXDeS/
   14ENGMAlgH7lwJQWZB+WmsUcNwOv8SVN9M6xgVCfklKnHvAy6YoZ/PR0V
   Oqg5i1dAD22r/ZuhdOze3/qkOs4AK8x/iygyUzqVprJypbNv4LczK0DVD
   1SqS1SNPOLMMNervhZsko1wRSwrfEkD/d0G3d3CJGa7GWlZDYXpxEvGTg
   D7N8zN/Q47YbKmB7MsTKqFg1MxzKGQ6G4Zx4B/jCH3BBEjY6bxm1O44jR
   qwoz4hk8uYfPYWyeMA1CxDtbJGJqzxl66Y9UH6JbKlvcoAK7xYKUn/ME/
   A==;
X-CSE-ConnectionGUID: 18AA1wCESQicPSPISx6r3g==
X-CSE-MsgGUID: w3dtuXtWQt6FSVwc5gYvEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="42782441"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="42782441"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 04:37:46 -0800
X-CSE-ConnectionGUID: eX1AcHTmRAm3010o31u0gQ==
X-CSE-MsgGUID: Fz93695FROOf+9bXFIaFOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="94362309"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Nov 2024 04:37:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDjxn-0000rB-0H;
	Wed, 20 Nov 2024 12:37:43 +0000
Date: Wed, 20 Nov 2024 20:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?unknown-8bit?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-9s-ontip 1849/1922]
 drivers/gpu/drm/panthor/panthor_fw.c:1136:40: error: 'glb_iface' undeclared
Message-ID: <202411202024.0FnkxWzm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-9s-ontip
head:   8809c6711dd21b917f92fff60cd5bef894262533
commit: 498893bd596e6aedd9796a10e2828311f8135a02 [1849/1922] drm/panthor: Simplify FW fast reset path
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241120/202411202024.0FnkxWzm-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411202024.0FnkxWzm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411202024.0FnkxWzm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/panthor/panthor_fw.c:20:
   drivers/gpu/drm/panthor/panthor_fw.c: In function 'panthor_fw_post_reset':
>> drivers/gpu/drm/panthor/panthor_fw.c:1136:40: error: 'glb_iface' undeclared (first use in this function)
    1136 |                 panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
         |                                        ^~~~~~~~~
   drivers/gpu/drm/panthor/panthor_fw.h:453:29: note: in definition of macro 'panthor_fw_update_reqs'
     453 |                 spin_lock(&(__iface)->lock); \
         |                             ^~~~~~~
   drivers/gpu/drm/panthor/panthor_fw.c:1136:40: note: each undeclared identifier is reported only once for each function it appears in
    1136 |                 panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
         |                                        ^~~~~~~~~
   drivers/gpu/drm/panthor/panthor_fw.h:453:29: note: in definition of macro 'panthor_fw_update_reqs'
     453 |                 spin_lock(&(__iface)->lock); \
         |                             ^~~~~~~


vim +/glb_iface +1136 drivers/gpu/drm/panthor/panthor_fw.c

  1110	
  1111	/**
  1112	 * panthor_fw_post_reset() - Call after a reset.
  1113	 * @ptdev: Device.
  1114	 *
  1115	 * Start the FW. If this is not a fast reset, all FW sections are reloaded to
  1116	 * make sure we can recover from a memory corruption.
  1117	 */
  1118	int panthor_fw_post_reset(struct panthor_device *ptdev)
  1119	{
  1120		int ret;
  1121	
  1122		/* Make the MCU VM active. */
  1123		ret = panthor_vm_active(ptdev->fw->vm);
  1124		if (ret)
  1125			return ret;
  1126	
  1127		/* If this is a fast reset, try to start the MCU without reloading
  1128		 * the FW sections. If it fails, go for a full reset.
  1129		 */
  1130		if (ptdev->fw->fast_reset) {
  1131			/* The FW detects 0 -> 1 transitions. Make sure we reset
  1132			 * the HALT bit before the FW is rebooted.
  1133			 * This is not needed on a slow reset because FW sections are
  1134			 * re-initialized.
  1135			 */
> 1136			panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
  1137	
  1138			ret = panthor_fw_start(ptdev);
  1139			if (!ret)
  1140				goto out;
  1141	
  1142			/* Forcibly reset the MCU and force a slow reset, so we get a
  1143			 * fresh boot on the next panthor_fw_start() call.
  1144			 */
  1145			panthor_fw_stop(ptdev);
  1146			ptdev->fw->fast_reset = false;
  1147			drm_err(&ptdev->base, "FW fast reset failed, trying a slow reset");
  1148	
  1149			ret = panthor_vm_flush_all(ptdev->fw->vm);
  1150			if (ret) {
  1151				drm_err(&ptdev->base, "FW slow reset failed (couldn't flush FW's AS l2cache)");
  1152				return ret;
  1153			}
  1154		}
  1155	
  1156		/* Reload all sections, including RO ones. We're not supposed
  1157		 * to end up here anyway, let's just assume the overhead of
  1158		 * reloading everything is acceptable.
  1159		 */
  1160		panthor_reload_fw_sections(ptdev, true);
  1161	
  1162		ret = panthor_fw_start(ptdev);
  1163		if (ret) {
  1164			drm_err(&ptdev->base, "FW slow reset failed (couldn't start the FW )");
  1165			return ret;
  1166		}
  1167	
  1168	out:
  1169		/* We must re-initialize the global interface even on fast-reset. */
  1170		panthor_fw_init_global_iface(ptdev);
  1171		return 0;
  1172	}
  1173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
