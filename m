Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CDC372B5E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 18:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435642; cv=none; b=Syi8IwByRPTH+4SzIQDmt2zyaNC/cLIFEmTeWj2pwDKJy3dl01u2tsmG537v/3UDim+MRXwX0NL3dGJAeefz2aNdl1h2ZoATTRZ82UcCLBQUIQLF4LbkGkmeyCJ7YjhhQ5m2uplVmV+br8avV2Pyyr6Vx9rbFSULmBiFaTMNEt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435642; c=relaxed/simple;
	bh=j+i79nSwI6E3BbzEAMkSLtGkLsn6Y1Jc0A+AVR6BQz0=;
	h=Date:From:Cc:Subject:Message-ID; b=FqOrwwkPQjOt7W8XBZatmRsPq2G97RzVJddKHQ+qqfEjuIorEfXHiCmya4uC2jfhG+tulld55s6492mk3P2fNu3E37Wh1u1/QvwyVm5iXdGyLCIx5DnLyQlsrGvKxbpXTv/ARQZGeHHd9yKpn0plywdUjYPCX0czXBtorrN0xPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwqWKdZa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwqWKdZa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785435641; x=1816971641;
  h=date:from:cc:subject:message-id;
  bh=j+i79nSwI6E3BbzEAMkSLtGkLsn6Y1Jc0A+AVR6BQz0=;
  b=GwqWKdZaA6AadIAwlHKrpEb5nkTHJE3LMkUVACuvUOSlzIlEjmScXFr3
   FbQGL5JRGUqmwoATyCJsaoMI7j/pVNb4orIySge6vv2+pjclnKJfX+91o
   X/SpSbgnaFyGZdDaJZPLkByig8F/r3Eh22Z70MBEYzQKD+/dBxzirUp6O
   EsZk3WsQkaqE6bpT0N8X7FCEUdAUFNvAKJonYKjgMqVZo7g5fWjX1/hE+
   XJ2n1kAfsabOy1+Z4UFmNLSLDja/2qJs/DX4vd1iYM+jA3YduzhU1eNCa
   gnvVMd3zmrh//BjGRhrAUqf4Zy/JOpTDrJFXIX4dQM0Oj05RKyPshG+uf
   A==;
X-CSE-ConnectionGUID: X6ugs2/PTpGWylfxRO5Rng==
X-CSE-MsgGUID: hBteo9e4THmXdYQD/r8txQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97577225"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="97577225"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 11:20:40 -0700
X-CSE-ConnectionGUID: 5DhW0B9oRliJFF4TX5pM8w==
X-CSE-MsgGUID: b141JXIkQXCiAcuchMGbJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="262313870"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jul 2026 11:20:39 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpVMz-000000002QQ-08FH;
	Thu, 30 Jul 2026 18:20:37 +0000
Date: Thu, 30 Jul 2026 20:19:59 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/android_t 1/1] kismet: WARNING: unmet direct
 dependencies detected for DRM_TTM when selected by GKI_HIDDEN_DRM_CONFIGS
Message-ID: <202607302017.iypSsG8D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t
head:   cae1f18703f8b6ecf8a9d232c494bdd5130e6992
commit: 51c9ed876ce194f1f3c6bd778b7bb46a8deb1dd9 [1/1] ANDROID: GKI: Add DRM_TTM config to GKI
config: sh-kismet-CONFIG_DRM_TTM-CONFIG_GKI_HIDDEN_DRM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260730/202607302017.iypSsG8D-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260730/202607302017.iypSsG8D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607302017.iypSsG8D-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_TTM when selected by GKI_HIDDEN_DRM_CONFIGS
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
