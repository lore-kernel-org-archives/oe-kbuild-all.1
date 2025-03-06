Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C7F2E3369
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 08:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251034; cv=none; b=Hdk8MMNljwV33sdtu2skY2FA2yGU3XwaijPt55Zopc67ktNh0XkUEGjTpNYyhknJy5P2eFiBfVFLLUjyuEHRqtiqeOk+acld1Aj/p2Ivdmm+8N6jQmXXOJTUUwNUHP3RkNQUJobaeXNFcyEliXHctswXDJd/fblerVsALXVGT7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251034; c=relaxed/simple;
	bh=2mz8jupS4YGXkTkdUGQjzNqiTJPXMIwXeYaIuI/05pA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GMkjMylfJF13aqUqi0eFGGwR4oOUAC9JSWkdKhaHVjsEBWH9NzNhv4rR7e1MQEKcxx1GU3FzL/RBnl38pmO/i6IHhtaMhenYDxgNpJgx32Ul9ijPeZhWsL0L5FZITQ29tI1DLJEzeCtafgRlJ6daaxS5Pe0teMFyJyWMongsYgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3rTZ3Cv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3rTZ3Cv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741251033; x=1772787033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2mz8jupS4YGXkTkdUGQjzNqiTJPXMIwXeYaIuI/05pA=;
  b=B3rTZ3CvbrWaQ1ySIu5NHSVkCnJaP0jELOoP4+4+ahG9hR//bPH1SjlW
   4jbEIl2IkBJ5TrqfNqQ9kDq3AbYcUOI4M1HmK+HpOEw2ebiuzjir/cR4k
   4zVKSBL9C7QKbWCrBXIiWVRvduzy7RmU/Aij9AWgU2POVTMsBreR7BM5X
   xZbiAzAPf4BDtsXes3nKMqAsRu9bnVCGIU7WFGwkfxZZs/6QRM+i/8Srg
   8EYPV7GWqocrtPViz08yaRKgm7Nn+exe4Ig5BoIym+J9NL6N5REk34ois
   e1w3y2ffICGWYVWbUo9Z7yRNCO4s4Agg+Wo2FvfvVUGJi2d0awfNMrDvA
   A==;
X-CSE-ConnectionGUID: GAjFyJYCQuyRXtAjNuLy+w==
X-CSE-MsgGUID: AJEBHgHWTN6A41DqnncUAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45055662"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="45055662"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 00:50:32 -0800
X-CSE-ConnectionGUID: va/0FHfmQACvnQ4Pb/m1kg==
X-CSE-MsgGUID: 4n+XJN5oRcK1p/ROm1rebw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="123905089"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2025 00:50:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq6vx-000Mmk-2b;
	Thu, 06 Mar 2025 08:50:26 +0000
Date: Thu, 6 Mar 2025 16:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1] kismet: WARNING: unmet direct
 dependencies detected for SND_COMPRESS_ACCEL when selected by
 GKI_HIDDEN_SND_CONFIGS
Message-ID: <202503061641.hKrTj2L2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   55670275a4b2f66710da9f3c902f4af3e3474943
commit: 55670275a4b2f66710da9f3c902f4af3e3474943 [1/1] ANDROID: GKI: Enable SND_COMPRESS_ACCEL
config: x86_64-kismet-CONFIG_SND_COMPRESS_ACCEL-CONFIG_GKI_HIDDEN_SND_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250306/202503061641.hKrTj2L2-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250306/202503061641.hKrTj2L2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061641.hKrTj2L2-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL when selected by GKI_HIDDEN_SND_CONFIGS
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_VMASTER
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
     Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
