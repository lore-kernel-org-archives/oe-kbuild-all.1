Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75FB481DD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 22:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766356753; cv=none; b=bJhn8mRdFSSmArHpuQFFPL2sEsv1ymM9GeA53y0mfiZzGPBL3LcZ3tt1/ATbGqEb2xz/thGowpEpQsx69AuFyYfMsFQPX+jP0Me+Q/kKPPRU7+Aamibzuv8KjT6bIx+694HnpKOBL5j/G/Fv+BMzTin0dzZLFMDJ3KWturkPL7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766356753; c=relaxed/simple;
	bh=1nwA9NiYtt/dLxfJH8k1uyOG+XoswjBr2b9jEiToDhg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PQaH8OuatSQBB5mwrZHePtvTf3Or/loCl8nTqH8h3dlZTmnQGJBXrviD5oQHl9zJtSkOOnssckAYACTYLaEiAAnLf9t09BfVZ5G2/8e4UUWXheNb+7HW4+HMnd0eT1iaBfzeQw35an9OrAkEOsUMsvX2TZsW1Pw2nCkfsp+JaJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpX4F4Rd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpX4F4Rd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766356750; x=1797892750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1nwA9NiYtt/dLxfJH8k1uyOG+XoswjBr2b9jEiToDhg=;
  b=BpX4F4Rdo3agfy7OuREaD3PPk924AZvn8cIyOtl1dbLz7fGakrtZ7m3x
   kjNGcWx2epSzR4o+QMBidB0hjTHLE2mvNJJMVFRnQSEyDc2OpTXSgCfBN
   4P71B6qfyN1Sn0Iw5MP/BC+D74GxwG6hGlgMnBckSBIHlOACczerLHatY
   gpXby3BprXrl9xwzKBoIK+NEOlUXI66R0y8ejIKBTyybh8OH4wz+J5Cxk
   nuAkMuCbP4MlphXcQJ0Fc3Yewr1D8dMcM5TSPUDxT7fSJKqKatoveMRTM
   ira95n2NTQ59iSy10Xl+LKl1XHHJwGY2kCr48qhCkrR1cc1yPppMTcvBE
   Q==;
X-CSE-ConnectionGUID: dIuPI6xbS3eAuNeQoJLe1A==
X-CSE-MsgGUID: 5tgUOfilSLqUV8n+b40f0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78858348"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78858348"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 14:39:09 -0800
X-CSE-ConnectionGUID: x3VdSz/9S5y5/44c9AiwvQ==
X-CSE-MsgGUID: wOBFs3OjQCeHXgEPl936gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="222865043"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2025 14:39:09 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXS4w-000000005G8-3Rtk;
	Sun, 21 Dec 2025 22:39:06 +0000
Date: Sun, 21 Dec 2025 23:38:16 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for DIMLIB when selected by
 GKI_HIDDEN_VIRTUAL_CONFIGS
Message-ID: <202512212340.6rkp2BQJ-lkp@intel.com>
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
commit: 1dfbe413d21f18f714cca818435299947bf5649a [12/12] Merge 6706415bf9f3 ("Merge tag 'gfs2-v6.10-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2") into android-mainline
config: x86_64-kismet-CONFIG_DIMLIB-CONFIG_GKI_HIDDEN_VIRTUAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512212340.6rkp2BQJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512212340.6rkp2BQJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212340.6rkp2BQJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DIMLIB when selected by GKI_HIDDEN_VIRTUAL_CONFIGS
   WARNING: unmet direct dependencies detected for DIMLIB
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
