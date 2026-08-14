Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BC13CFF65
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786725108; cv=none; b=m6tZhyBOBH+BdMX5CILyDN/4P913faEVvVZ/X729Bxhv1SwQdgPIPmgpeDx8O5K/FxNmLr2/tp64tifjfzLJVdSn3AbqBCULz3QVhgymeXgDwMyl7/IsD1PV4L2S6ouezbDE68xhPaR4PEkpCaUU+rtYxdh9QRiFRS3zRRAaClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786725108; c=relaxed/simple;
	bh=zYlAdvJmaXzihKcrQ5lyvLMwOjrygSp2SebWpy3iXcY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ngxG6Ia38eKht9JsSxh4YZ4Iz3PrzPOwSaNIgf+balosP+IqIFCMbVH0KJ2TZPMPwBV4PYBzvvmE1qeG3+eL99RFNNbhOniN8P73OKap1LkMZAD/FSmt3S7zVyP4LQ3MxUL/CEKCfs+8kdXC2P0p/yqoQ1vapCOpiX35zEInBhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZrH3lxmo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZrH3lxmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786725106; x=1818261106;
  h=date:from:to:cc:subject:message-id;
  bh=zYlAdvJmaXzihKcrQ5lyvLMwOjrygSp2SebWpy3iXcY=;
  b=ZrH3lxmoi/0aU6c9han4nxMFyLXz9qc7qjKOhKCXI3b4u2XxrZs0LwIM
   illeDNxT6X/woxsltCt4jNlhmPuH31Xh2MoDoOzVuukkTGMoRjS2t+VNV
   CsdvWokyRa+QHIwpNjqGuSuiE84lsgGlfgOtU8Swz+Wxsjr3vJ3EZOKwp
   rqcqhGcFhrtWBcEVrNpXCnJO7NR9XAmbo0j/FVtcPlWTHTuFg6k7TPpQP
   wAa+NPs4BkLVHMwUkVdm3Sv3vvuFwTUH2jQgdicV7pIB7bQEG16Bx8QJ1
   4FfKcq79fPat5dbjHZap++NbGuoWDQOXgsXnfHJaSYI8rU8i/YsH+CYaU
   g==;
X-CSE-ConnectionGUID: lPsVJ63mS6mB/pVUk4BMXQ==
X-CSE-MsgGUID: S5rfpOGeQ4u8KYoEwQpaXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87434951"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87434951"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 09:31:45 -0700
X-CSE-ConnectionGUID: 7Cu0vbNXRVG1NcBdkaOxDQ==
X-CSE-MsgGUID: qBTeQhgkSIe6+H9aMy/gCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="263835018"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2026 09:31:44 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuuon-000000006IL-3sA6;
	Fri, 14 Aug 2026 16:31:41 +0000
Date: Fri, 14 Aug 2026 18:31:33 +0200
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: drivers/gpu/drm/vkms/vkms_configfs.c:119 struct
 member 'parent_group' not described in 'vkms_configfs_connector'
Message-ID: <202608141857.j6xP88T0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-drm_mode_config-Add-helper-to-get-plane-type-name/20260807-092508
head:   c4c09a7274b7bb12e10957fc5da78e52e5bbf54d
commit: c4c09a7274b7bb12e10957fc5da78e52e5bbf54d drm/vkms: Add ConfigFS interface for connector parent and port_id
date:   8 days ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260814/202608141857.j6xP88T0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141857.j6xP88T0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141857.j6xP88T0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/vkms/vkms_configfs.c:119 struct member 'parent_group' not described in 'vkms_configfs_connector'
>> Warning: drivers/gpu/drm/vkms/vkms_configfs.c:119 struct member 'parent_group' not described in 'vkms_configfs_connector'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
