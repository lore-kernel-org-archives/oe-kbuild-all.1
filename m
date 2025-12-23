Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B2817A303
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 06:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766469940; cv=none; b=gCBZYGDuvlsqR6Pi7gDQJeJG4aC4r9T8vPQ1/WvZTbEkMC4Smd5fQzAJHDqgjQcDTuDAh6obg6+8fnRgTzxF/4pqyOyWpnfEeUpDv4el5Ouzy9BsBC9tVz/t0z8hiI9geBdjIiMPqabEUXebWWIJvX4O/NftNzS5GCuqOHn1PJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766469940; c=relaxed/simple;
	bh=k8WLQc5rPdKzUBpZNXMsir7ixtsbPbE/owZ3SCJRLs4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l9gsoaqJ/7pMK9C2YBwOwwM2bZ0wgfG4V0fek8uNw0c14TOp/8BEn7E9DPr5oVeWTrLvIDtYMhE99yM2PhZIZ4XobHB7GfyrpTSVIrLiYfbGO5BgytTIvk4VTkX9ULpBFgRw0+MPkOtOs3Jliv9mXJHtQMNX22hYqCosoXmlB4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DFPm/qv/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFPm/qv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766469938; x=1798005938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k8WLQc5rPdKzUBpZNXMsir7ixtsbPbE/owZ3SCJRLs4=;
  b=DFPm/qv/iMp5blW+rSMFNQ+YO0L6UoIHmNgsoxIqREE0G9onQCqpeEXm
   MiXiC9SNt/OcHkrDS9cgrK8OamHLujPSlpDLWeWXaPRrMOHgzN8ofWE6G
   D3UaA7iQ162cXfphdQd7YLl1URNK8X0nL3LbkE8EtlaqJdlROeDCOEsyR
   mTGCdW5gpraBQaLRaIMFtqBGoMrDdMajee8nNsXHiCx323dYPeXirkQda
   kDK120SAzarLPPX91yDnzFgxTozw5pJFJUCkTUQSppfayuA4Rb6EMFj09
   Vujz/P8dHYXe2hGCLKUJ5Z+gewsLVHVeXvC/GXSk+lj2urosEyE8VXbvi
   Q==;
X-CSE-ConnectionGUID: r/xxWuFLQouyQ9PPp1vSrA==
X-CSE-MsgGUID: j1BuaWKTSQSfHeQQahVGLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79039528"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="79039528"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 22:05:37 -0800
X-CSE-ConnectionGUID: f2JF7323T/yxS3cDt90XvA==
X-CSE-MsgGUID: uKL2DLP7SKatfssgkxJZ7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="203843142"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 22 Dec 2025 22:05:37 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXvWY-000000005rM-2mFp;
	Tue, 23 Dec 2025 06:05:34 +0000
Date: Tue, 23 Dec 2025 07:04:50 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 15/15] kismet: WARNING: unmet
 direct dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_PXP
Message-ID: <202512230711.R21lt2x8-lkp@intel.com>
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
config: arm64-kismet-CONFIG_INTEL_MEI_ME-CONFIG_INTEL_MEI_PXP-0-0 (https://download.01.org/0day-ci/archive/20251223/202512230711.R21lt2x8-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512230711.R21lt2x8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230711.R21lt2x8-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_PXP
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
     Depends on [n]: X86 && PCI [=y]
     Selected by [y]:
     - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
