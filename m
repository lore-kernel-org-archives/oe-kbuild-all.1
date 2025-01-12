Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90151392
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 07:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736666468; cv=none; b=a0fkxfb6iw+P2RNtsPwUJa6Yq/sioVOpKXok8SHqBNnVlaANWODPX1nIl2gUBHJUNkIIfJhHXEXHyASWvLx5btLFsDnre0uIE3avgEiGBtrP1hLPGGntlFsJiIdhbFjaFl7vxMImZBxVwnNiHYjK4GSt7VEwCnud5C0FfHOGvdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736666468; c=relaxed/simple;
	bh=fcKji8zYlLxMmlkRZ/10Hi3dvZBF2wNg3K2JtA9+Nbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nlv9MaZSH4HtSy3mQolnbDFxjRpAEK40lIJQr4Ldp2/J0nR58k3TSxUtAFGFkwAdaXisMbGWhJ525lObrYuLQLBNBXkb3Nsjv6PVk1Ht0bANukUK5I1swWr2dOVkTaJ+bhayNUnEiFxKvWdl5cJOEp1ch5nvZCRVVrC7sHo3ODY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eeW+U/FJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eeW+U/FJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736666465; x=1768202465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fcKji8zYlLxMmlkRZ/10Hi3dvZBF2wNg3K2JtA9+Nbc=;
  b=eeW+U/FJKz+DVARb7lDQ3ViIKA1cQSh0LC3n6EwtJpTq4B7fj0dIsrp5
   pg6pKFa+3yA1tyibRLf+//pPIrYsRAAyZE/QSP87TkL6UyB6gqWlegYLj
   wszLlAQs9MeWRz0YeckeY9+3z8Qua74kgRDa9BjwZ0QA78CMAML4+FcBv
   mluxSJ+YvpzVbVJFPfuhDit5o9Thxm3tInFS7WFbzDyG6uos66d9bwwQj
   LHwnztPgyxtFVAo+wUncMksb1wqAbNs4i1hH/2e+SGvrZfGtaeiz3Pgzu
   sPXR+2Rd/zp7IUjMNpA0f8mBnT6HiODgLUcZiQZ7fve11qn7RxxcDfHRb
   g==;
X-CSE-ConnectionGUID: XCrRdTQSSUKMpMRNsEvgyA==
X-CSE-MsgGUID: BbUV/kRGQSehwVuIbrp4zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="54458812"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="54458812"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 23:21:04 -0800
X-CSE-ConnectionGUID: fvOQpln1QzymSJbCBlKAtA==
X-CSE-MsgGUID: jBnCeopHSEWvZtXIFAWT3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104637358"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2025 23:21:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWsHL-000LgB-2K;
	Sun, 12 Jan 2025 07:20:59 +0000
Date: Sun, 12 Jan 2025 15:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jagadeesh Banisetti <jagadeesh.banisetti@xilinx.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:lkp_test 275/504] kismet: WARNING: unmet direct
 dependencies detected for SND_PCM_ELD when selected by DRM_XLNX
Message-ID: <202501121715.0yfqZX4p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 301ee2f50824cee264dcc06be47d915a9c8af73c [275/504] drm: xlnx: dptx: Add audio codec driver support
config: nios2-kismet-CONFIG_SND_PCM_ELD-CONFIG_DRM_XLNX-0-0 (https://download.01.org/0day-ci/archive/20250112/202501121715.0yfqZX4p-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501121715.0yfqZX4p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121715.0yfqZX4p-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_PCM_ELD when selected by DRM_XLNX
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - DRM_XLNX [=y] && HAS_IOMEM [=y] && DRM [=y] && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
