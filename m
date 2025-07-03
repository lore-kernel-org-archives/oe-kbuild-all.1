Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9762BD593
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 20:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575296; cv=none; b=Lt6dOyIMA0XodohK39kiZHxgBg6bWeHMv+UJ7ZWTLC2bsu3eP0bc2wFXr44q9MDP0q5QSwee4SGqeKogJQjgWu3ZQ+A52hUfPXVKEk/RXj4yFYEH2RE4NUvVHHvrnL9EUCv8yaOyonb0Q5myg09PxL5MDOefwI4xXNLJprHen6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575296; c=relaxed/simple;
	bh=X7nriOdsfcxXoPYj0hTcdP5ETIDAz+ssPx3YcJozHHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jfrmJJ4+pfTarZTpHT9cxEVYdIJwSlPEAO2yAu/KKNKaA4vIABQzsmY4N0zuTSxyuYA+o7KCApSHtufwVTkcLmj398xk9aRAuJqfgYapOMeIK6XUZBiojiqc0mdovYT4F2wgZL9t+IaTvWF0FfF6tGDGCMlSgPq7XYFabPsikB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtN2DERh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtN2DERh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751575295; x=1783111295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X7nriOdsfcxXoPYj0hTcdP5ETIDAz+ssPx3YcJozHHk=;
  b=MtN2DERhr/97IYXRFYtIsibSx46A77kUi7wI2F7e3DMZCktE78zUQGd6
   DfU32WHLlF78vOAKz9n247e5WGEdMlTrBadhPnk8hDSlBRUrR3AOrjNWA
   hKPHc2YhyVG6c6F8npiyyGaZvThQ9c2nXjPtNNO+YVRvsLhsjJYaYZ9mt
   jvkiDg35VKKbsuMS4sC77R71F+oRkkXUlVjLlNZeVWrWxBfx2Ix71BNOY
   q0ix2A7L/FZvDd3PWLx+8Wo2qHttYFjJ3ihDEqU0kiAZZrkwHMKON5XRD
   LYdhruK/FtYj8arf+H/n2bSOpmIMh7onxGrfbManoo3LkFwojUbCNHmNx
   g==;
X-CSE-ConnectionGUID: q7mLg0bPTcyTcsdyIGfk2w==
X-CSE-MsgGUID: 0x/9b39zTBeqN6ImxjglPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53137826"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="53137826"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 13:41:34 -0700
X-CSE-ConnectionGUID: GKHA6zKxRG6twm0hjC179g==
X-CSE-MsgGUID: syjWJxnQSOCpjXVl6fI1Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="155032020"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jul 2025 13:41:34 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXQkN-0002zT-0t;
	Thu, 03 Jul 2025 20:41:31 +0000
Date: Fri, 4 Jul 2025 04:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 4/4] kismet: WARNING: unmet
 direct dependencies detected for P2SB when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202507040425.2UnRfZ3Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   7b423b7f82f1447ab090e96318cc6ecb6121b23a
commit: ddaaf24f47eb2f4ca3f4a431b9482baad3bbfef9 [4/4] ANDROID: GKI: x86: Enable P2SB device as x86 hidden
config: x86_64-kismet-CONFIG_P2SB-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250704/202507040425.2UnRfZ3Q-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250704/202507040425.2UnRfZ3Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040425.2UnRfZ3Q-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for P2SB when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_SCU
     Depends on [n]: X86_PLATFORM_DEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for P2SB
     Depends on [n]: PCI [=n] && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
