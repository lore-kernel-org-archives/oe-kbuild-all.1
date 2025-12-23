Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09832C181
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 03:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766460214; cv=none; b=OHrDNnpq0fzeqHxBobKNnUhiT9QJWHXGmCmASvE/VT5f3zHcxPYyBSdoSHGw3ETaHSj3oMEZWciM81HCNe1cwl3E2F2ePC+TWrryxK95AoTE6a4xQaDyKNV7b1I+DHMFXBbNiMv15wklrCQb0QHmuNsNsks8kzXPWztnmreCYxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766460214; c=relaxed/simple;
	bh=0RtFsEOwLJEBHFb9NxxnNrHd6UpGKu87p+8rzcPppBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XNETWfaZYEVjSob6CKE2u7lk1PoNCuisO/IkaVZWDDSPVTNWrPJjnndpv4vXDCHO3MMRrjyWPexqIU8IbP0x4TTJqjHrC0YoF7wG0NjgL7F6QxuCIHh2d/a83WSADDPw2cGdlX+JUsZC9p6YEN9XurLWXMx8i0fMAvjwU9ZEcQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goixHeza; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goixHeza"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766460212; x=1797996212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0RtFsEOwLJEBHFb9NxxnNrHd6UpGKu87p+8rzcPppBM=;
  b=goixHezahOgTg2HNY8eQWL7Bq3dj9WmhXd1csV5hFVwqJCG6IwegOS4j
   KLTFxg0Q83MVLSXIA67bUgv0G8CTiwD/JzJUdUDk5L+ElQ7FAvftENbXY
   5XyUb0G3DUKi7/byA2gHIqlV+PvWYnYZn0aW0VLBnra6wcaf42Pyo8jwJ
   /LvN4pkFV7o+m8VRBcBd+Thz0gXEik/2aSKwlg5iuTUftcOSCZQFWhwb2
   5uowws9FZ7y1pzoEhhvNn58/ljtYisHUorTPAIMP/5MdxHdpIX9itPjwk
   d2UpGD7dCCxgR+zeToERQnRwv1ar3MXtqZlWjgzxoIxRK+F5g1eMC4WQN
   w==;
X-CSE-ConnectionGUID: EGV9KJbzS8epNm3QjhUMyw==
X-CSE-MsgGUID: 1K3F1FtSSWahU59QF7ZLaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="55883024"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="55883024"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 19:23:32 -0800
X-CSE-ConnectionGUID: /VCu7GiaRGahdoh8rPyUxA==
X-CSE-MsgGUID: lwlQkm9+QkK7FDoYnCS1WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="204628633"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 22 Dec 2025 19:23:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXszh-000000005ku-21uU;
	Tue, 23 Dec 2025 03:23:29 +0000
Date: Tue, 23 Dec 2025 04:23:16 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 15/15] kismet: WARNING: unmet
 direct dependencies detected for INTEL_MEI_ME when selected by
 INTEL_MEI_HDCP
Message-ID: <202512230439.RLzgrea7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   4e640d57b9513962095028e1186dddf47814e50f
commit: d31eda960d587e7797f948cb91d5cc9cf951e9b2 [15/15] Merge 4cece7649650 ("Linux 6.9-rc1") into android-mainline
config: arm64-kismet-CONFIG_INTEL_MEI_ME-CONFIG_INTEL_MEI_HDCP-0-0 (https://download.01.org/0day-ci/archive/20251223/202512230439.RLzgrea7-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512230439.RLzgrea7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230439.RLzgrea7-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_HDCP
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
     Depends on [n]: X86 && PCI [=y]
     Selected by [y]:
     - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
