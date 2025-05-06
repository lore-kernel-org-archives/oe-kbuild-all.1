Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B749B28001F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 05:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510573; cv=none; b=uroepgwNEMeUUcOyCgYlr5+bsX3boU1sVvga6v3v3zYS5R6DxaUV85iepPMdED1doL+lfCuSaPdOgrM1P0vXhv6LFwybzFoAxdyTZFBwBv6/PwGBygmUSU5QwX3ca3P/DNiev3ewujO6gluA5wkuklgrZ8b4iye/3drHKd53I8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510573; c=relaxed/simple;
	bh=NcW9BWTpz/PvCgKjvzzfPZMAS6gctSqkJLXaHO4TabQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I7TzhkjqTpmw+cNG3PbXK9PaSeRkhLDhop5lL/KNsUu9POipzWBU3j81Mj2uZ2vukRWx7SiO6rBp0Dei0J+Bp0mpN1nYkcdP5rJyKT5BSnLqEZz7aUU/HfhRUDR9LFDtDDqOkuZgBrToo6em6Vjfukg/P4Tq/aJGpufu1XH3S2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jm8Q4MsD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jm8Q4MsD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746510572; x=1778046572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NcW9BWTpz/PvCgKjvzzfPZMAS6gctSqkJLXaHO4TabQ=;
  b=Jm8Q4MsD46B+YMLpRy9UfhZ7VrqnnauMGdRa1vHJr9mvLY8aWEsS4zW7
   Z8bTj4ugCSgMKlMXHCgzFFn4ruyZCXm/Cu0p9mubRVPbRCrKiLLz/y3A0
   foarvrZR1oqdwpMer4KMMmBKUZl3vlpVATxi+w6LhQQvgqbKojSatvVMR
   C+vf/1JISgbqWVv2T+iHWSQk9wjQ1EgI6Gv7j6wJyBZQYFbVOEK7OeQRu
   5f1H6eeFRi8y516NLVOlvvWbn9xrCpqmo0yRNxn2vG59kGctAsaO9soGc
   N9hLune2lZDRfj/3OhEDwBB8ifA1x6bWdLA4on0aeIkRYXoSPIccEOqxR
   A==;
X-CSE-ConnectionGUID: UShhOMy8SGyEvxIDvhyHNQ==
X-CSE-MsgGUID: OEFzr+zgRBi4l6i9i9NUfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59511514"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="59511514"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 22:49:31 -0700
X-CSE-ConnectionGUID: UryobQkjRni4AjCu+dL+VQ==
X-CSE-MsgGUID: qmorLdxDSa6Zv5Ob0722EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="172705287"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 May 2025 22:49:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCBBH-0006Gp-1j;
	Tue, 06 May 2025 05:49:27 +0000
Date: Tue, 6 May 2025 13:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for BALLOON_COMPACTION when selected by
 GKI_HIDDEN_MM_CONFIGS
Message-ID: <202505061322.Yh6Z1Y8R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   e20c2e5ba70ac5fd2f1157f57a8ee53e07b671b5
commit: 0041f84975dcf2f25a9b508fe299a017fe0f4da2 [2/2] ANDROID: Add GKI_HIDDEN_MM_CONFIGS to support ballooning.
config: i386-kismet-CONFIG_BALLOON_COMPACTION-CONFIG_GKI_HIDDEN_MM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250506/202505061322.Yh6Z1Y8R-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250506/202505061322.Yh6Z1Y8R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061322.Yh6Z1Y8R-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for BALLOON_COMPACTION when selected by GKI_HIDDEN_MM_CONFIGS
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
     Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
     Selected by [y]:
     - GKI_HIDDEN_MM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
