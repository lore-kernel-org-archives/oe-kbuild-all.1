Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D4E3F23B5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 16:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790526742; cv=none; b=LhNp4Diy9JQPR1UhYaucGHdP78U+0IqDA37ezMNxrgYB4vgCfMUXeLwvGljh9eGq4/j+04tr0ktQF+yvL75WNVGoHAfOTP7PfJSRa0sa0xUwVjggauJjAZGw/1cED0ZUS0rvdIzDAQdl7WEMtGn1dLxXzCHAqhBqazUnZrsur0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790526742; c=relaxed/simple;
	bh=KEVwnAbA0jsQ3vYkWvwnMQRihoeuFTDP+wa12t7p1pA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pVtx9gtKelCKjVWRO+Kg6ZpWrjytfZZJa0AyO2J0p2Uf88x7FDnkbaMY+DvLoEW5vhTjBSbwvRjgfWx+vUO9+MSgOlbIOTQMrnH4PqoBoG8TYzGIvESd5U5w8QjPLfL1eTjD2pzXcBRoZp+YqfJfEDk5h2KEZukQMvBz0hgo6jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwfxvub+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwfxvub+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790526740; x=1822062740;
  h=date:from:to:cc:subject:message-id;
  bh=KEVwnAbA0jsQ3vYkWvwnMQRihoeuFTDP+wa12t7p1pA=;
  b=lwfxvub+M/pYocUY9OYzRyGxRvX0cpvDxyDYa8Bj3cdpe7Jf+I/5kgcq
   Q9biwLJLW4pZ+UZ1Rd7G4BVfnD8EB7dqHudMqCKakmJ72Y7nopq3GiRES
   qmJCnEY9ZC3c8M0PFvzBpUK/nVcK8HJ9wWNH0XflO1dq+gCUK4PAF1ocN
   9eeISA0W0Gf+AWrtGc4tphZztNMDXAAl8cFMes9vDl62DUgnuMjg8o/w1
   77fRHhN5MbnkxcBNRaV9wnNeScRB8jmqub2KMdEt/Gok3BikzLzS7vatP
   y/HhxEIHbtHdxJsSqyBBRo1zdfCx4U2DUQL31HVVo0gtzZCEqmO1EQC6m
   A==;
X-CSE-ConnectionGUID: wIgUzkm4Tr+2LJ3SWUEH7g==
X-CSE-MsgGUID: 60ckoawOQm+p4h4EkaGbew==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="91338894"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="91338894"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 09:32:19 -0700
X-CSE-ConnectionGUID: 7vpJYSfnTEe6MTX+5J9VXg==
X-CSE-MsgGUID: XhGPhrUeRaKwDvIqJH22RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="279570693"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 27 Sep 2026 09:32:17 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xArnS-000000000d9-3Jhx;
	Sun, 27 Sep 2026 16:32:14 +0000
Date: Sun, 27 Sep 2026 18:31:29 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] kismet: WARNING: unmet direct
 dependencies detected for HMM_MIRROR when selected by DRM_AMDGPU_USERPTR
Message-ID: <202609271810.pxMMu5ZC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-kismet-CONFIG_HMM_MIRROR-CONFIG_DRM_AMDGPU_USERPTR-0-0 (https://download.01.org/0day-ci/archive/20260927/202609271810.pxMMu5ZC-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609271810.pxMMu5ZC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271810.pxMMu5ZC-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HMM_MIRROR when selected by DRM_AMDGPU_USERPTR
   WARNING: unmet direct dependencies detected for PCI
     Depends on [n]: HAVE_PCI [=y] && MMU [=n]
     Selected by [y]:
     - FORCE_PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_TTM_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]
     - DRM_AMDGPU [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y]
   
   WARNING: unmet direct dependencies detected for HMM_MIRROR
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - DRM_AMDGPU_USERPTR [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_AMDGPU [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
