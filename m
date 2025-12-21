Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B435C126BF7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 12:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766321285; cv=none; b=DKBxwODQBKJI2f5i2bL2XP2CVWbZ6K8qOt+mbkvJFjH8nsGeyP2Inoq5IUwG+xflIGdqHhUP+mkizYtVlMwe8AY3bVbb+TUDF5r2lNsO7Te9Iu7iJXqR1rJtI5nJJNQL7Iu3ibxMW12KpBbvxvPD5Oes/nLj8ZGLyYMXT/kjPxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766321285; c=relaxed/simple;
	bh=JOUo2V1CC0HqR8FiT7ZD4Aa8mERDsFF6/FeId/qMoZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CbmFpeHSju1W21gcWhKiB7K0D/0OeWO7aqMJcFWssJaMmadFvuMPdRHPm7iKEN4srkkMh/aN/82f1l7CiSjhC81I4R2lYUFekNx48MZNv9rkoKTfX2vmNzMCCjwJRJZJFIf6VGep69DdWhua++1XxlgvtlY3R2BwSsuX4aEB4d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEdOSjL/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEdOSjL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766321283; x=1797857283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JOUo2V1CC0HqR8FiT7ZD4Aa8mERDsFF6/FeId/qMoZ0=;
  b=gEdOSjL/HOrZBWBn8luxq86oXcOO5eRRRrgcVtgL1JVBAaBJb1MPM95q
   pKVReYIEl8+hOm0iz1zDALwMVVUVBZoDDBJc7zpBbSRXVPq8OGz5GoyfL
   zhYbSIVvsUmY5xaK0UDRchb7LNsEe/KP/s8wu7nZgJMDTZoYdwa9IEfgD
   1MXpGYja/977lM2TjyJFi2T7mRK21cxTEO3NCR4OJS/u75pwaE6/Bhx2d
   dsBvoX0/cWSWr1O2Ry0UEKA/nDANA89Be5n1L/6pRanUXuIdlmCoM0XGR
   5QAikru+YXXzGLKkqVEyzBhw7GbaRw0CXvcI0mX249HCHVxvLN8brw8Bw
   g==;
X-CSE-ConnectionGUID: y08xI9xERTmGmEYCJTekfQ==
X-CSE-MsgGUID: HH99DupWSGqVaaBHDxukxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78843058"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78843058"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 04:48:01 -0800
X-CSE-ConnectionGUID: 6mQTYg2MQ8a9UM0wQPBeHQ==
X-CSE-MsgGUID: GTFfO0JeRgSdGewBBurTfA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2025 04:48:00 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXIqs-0000000053k-02fB;
	Sun, 21 Dec 2025 12:47:58 +0000
Date: Sun, 21 Dec 2025 13:47:41 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for INTEL_SCU when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202512211313.0uRZp0eZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 80646a059eb38a5cd606e549940844bef477d3da [12/12] ANDROID: GKI: x86: Enable Intel SCU IPC as x86 hidden
config: x86_64-kismet-CONFIG_INTEL_SCU-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512211313.0uRZp0eZ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211313.0uRZp0eZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211313.0uRZp0eZ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_SCU when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_SCU
     Depends on [n]: X86_PLATFORM_DEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
