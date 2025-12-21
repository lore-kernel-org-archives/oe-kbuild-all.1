Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF99F302CAB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 17:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766339109; cv=none; b=iDkufE6ugEzynoo3ILJg0wJTk5MNF4YJ53dCW/mWeuRM2AcQlDtAk19KtfVJ752ZZMX1sbBObjIEvfH8kOOGJn9g1iEEDGEj9qJvF/rTz8ucGe7LX7e+ueVvWYigv0d7/NiFqTebs+xqFiK9kek8lwxkCtl2EnRdIKg882jvxQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766339109; c=relaxed/simple;
	bh=CkqWsoviIL741QA+GTcwXS25L+zOTH2aKGco61nLGSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N2sITvQXoOr5/QVVAymbvjlyagZARzh2eV8XM+cDOY9deFf1T2dJoUfvUxfPVINEhTVks5JgWZeqHp4aSgRq1t87ys5Pyeik0+7+UQuo+njtWOCNGbSjOEMeIdE0OMgOW+V4OertsHlsArtgrNasd7DmXU5u0va1gldE9BEBKkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BD+Seafi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BD+Seafi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766339107; x=1797875107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CkqWsoviIL741QA+GTcwXS25L+zOTH2aKGco61nLGSY=;
  b=BD+SeafiJq0L1W4PvmpDRzcIkgVFO1KJGHCJGPYihkwJNlQf+WmE28bP
   X1zOMKDoNBAE3gnHghbLHfIvvWvpNu9eR+ggcZUbl+DVKsDXFGaRMNVd8
   DJOWGi5NeWjmQ3MgqbMlFu1PT2ZJ1s24XsGrtPmJxPqpYNqbOK+Y7ipqr
   aMEe83LyMDW01skizWFze8/Kc08DtLXbONBswT2a5YqxP4ZUqjSQBNhU9
   9ZxGOVSRrYRu4Hzi5DuMnSc1TmuB7YAAvslMtkUM+H6VzQ2uQQZILVROr
   PiDjaBai9RZ22iGi/t9eOFLMQlqp7HcNnyajgbGVj6zzJ5EVt37PRFQlD
   g==;
X-CSE-ConnectionGUID: lNwka0R6R3uLKMDjCwo6tA==
X-CSE-MsgGUID: v0A10WsVQFeA5xD/oHYjXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79580177"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="79580177"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 09:45:06 -0800
X-CSE-ConnectionGUID: um8/MbgiTWGl+hNruBMStg==
X-CSE-MsgGUID: HW1gEtDoTRqBXzUVmEN1tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199242931"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2025 09:45:05 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXNUN-000000005Bc-1RRh;
	Sun, 21 Dec 2025 17:45:03 +0000
Date: Sun, 21 Dec 2025 18:44:30 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for BALLOON_COMPACTION when selected by
 GKI_HIDDEN_MM_CONFIGS
Message-ID: <202512211854.ZbB2dLsC-lkp@intel.com>
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
commit: 0041f84975dcf2f25a9b508fe299a017fe0f4da2 [12/12] ANDROID: Add GKI_HIDDEN_MM_CONFIGS to support ballooning.
config: x86_64-kismet-CONFIG_BALLOON_COMPACTION-CONFIG_GKI_HIDDEN_MM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512211854.ZbB2dLsC-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211854.ZbB2dLsC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211854.ZbB2dLsC-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for BALLOON_COMPACTION when selected by GKI_HIDDEN_MM_CONFIGS
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
     Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
     Selected by [y]:
     - GKI_HIDDEN_MM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
