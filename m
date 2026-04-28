Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885423909B3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 02:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343004; cv=none; b=IJb8Vc9Am4Fth3NqLO3Fhd9qEkLYxzH3RdtuprIB/qw9cUZLoXw6mdmanjuhUVKRSHa8F6E0JSzCcOfgaH1ZGBAwyNh8x2cDU6T1VV7jqE7OcRJvVige8GTgDsHtmE0DR+Xo61JkLkjRsUUejFGmRzQ5fgZN85kgDKWQV4QOcAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343004; c=relaxed/simple;
	bh=sqYo40LPh8cXZMlUHko2XBKS3bUvyyfty2Z4nxBmtXA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=slGhWVZD1XyS6kA0a7Qwm4rMQffolxEnHJRVgpMTcThawGpvpwb7KSlbMnDS0EzVL+1RaDvqvG3LtkOrIRoZ/DNfOi4eI5B5TJko8p0hzoRKBV2qmu6x7870W2ws+6VTsC4WDsYKyd2MKKOTc717mmv2BoyHAv64iOXNgr+5OHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=muP8N0cQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="muP8N0cQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777343003; x=1808879003;
  h=date:from:to:cc:subject:message-id;
  bh=sqYo40LPh8cXZMlUHko2XBKS3bUvyyfty2Z4nxBmtXA=;
  b=muP8N0cQ2NspJpPM7q5pngJOCDj/1ZbP52pf8a6BYWZ05WzpUQWL9IeI
   Uu7uvmY9HyMppECxLgbVYq0Y+jzdvzMGo5Wz81Rt0tvBHtB6jKnYGmPa0
   FMhWrQvJD8A5imYVx/01cWuBm7bGkxh0SXPMMTJEFBLzHVE/G+IC95suY
   WgFXfqklffDEFZCf359GcEGlhw0Ns/xTbt/YTPX8A38zqU3N/a018lVZe
   mDobKzG88g18cbEhRyVPnJ0rqSu6qPOSY30dSEizHco7yvEsHPS+1H0Mh
   ae98r6wzjOAdV+QsBu/VS4fUhWGkCtYQlpp47pbyAZPplzgiteGXk9qEv
   g==;
X-CSE-ConnectionGUID: D7gyX3xGQW+KRyJQdP3Ang==
X-CSE-MsgGUID: th2RIzaNSGOxOwlw5tSnaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="95811516"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="95811516"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 19:23:22 -0700
X-CSE-ConnectionGUID: Cstaa2TASa2gRXQIaNJuJQ==
X-CSE-MsgGUID: MvbvbtKPSNaAkCyYfFsSsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="238143026"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Apr 2026 19:23:21 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHY6Y-000000009Q8-05rZ;
	Tue, 28 Apr 2026 02:23:18 +0000
Date: Tue, 28 Apr 2026 10:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] Warning:
 fs/kernfs/dir.c:491 function parameter 'drop_supers' not described in
 'kernfs_drain'
Message-ID: <202604281057.wy435z9B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   46d25d57d7dab0fd17092a27bec33d4c46479d1a
commit: d05d941c20c9dbdbf19c7935bed9b00eb5b44eaa [1/1] UPSTREAM: kernfs: Send IN_DELETE_SELF and IN_IGNORED
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260428/202604281057.wy435z9B-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604281057.wy435z9B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604281057.wy435z9B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/kernfs/dir.c:491 function parameter 'drop_supers' not described in 'kernfs_drain'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
