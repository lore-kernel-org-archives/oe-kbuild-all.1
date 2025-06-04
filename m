Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5241828CF53
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749031057; cv=none; b=u3wl58f8WlLuAKiw7Rig7/8sghR/A4ODhv2lrWiMV+1VcdprKB6PHVmGbPaLfPXZnOOqIh9LDlpe6VJLrHy3HFfPxTQririeN/vTZrpPiuNR7ONQqBPBB97qRbAKJZRdT0l0VqrXTbwZ866nS3YbDUJt1/R/fioH40yCkPO9eHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749031057; c=relaxed/simple;
	bh=8kLpa+0ADVAG/4pmTANpNYc8Bd4f460GoI2PqBiMO0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kh1igdhwK2U0bRG/XuFTAcjaZ2fnn3EkQU5kZgwfmClOjO7mKTFxfgSGNMDqIL7JpcULccRZcKNjFub8AmVMH7cQqk907l5VcOZa8CbJVnTLh4OX/pLFL7T9Ph3TGbA7/YKCQmOacGCRBYNWtcUato+W50vKCLYG198n/CuNEUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXa7pwXC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXa7pwXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749031056; x=1780567056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8kLpa+0ADVAG/4pmTANpNYc8Bd4f460GoI2PqBiMO0k=;
  b=EXa7pwXCGlXUpdup/5jcN89L4gj1jt6qmbfFTjet1VF9cjJ7ry+ukuP3
   bWpbOt57Zql2uwDBJh6Y/BW9bPUdJ7tOP2prlNyAVD82KkI+En21VqXD/
   AstDlcI+wG2pisTE4WcRv5Osd/acMNqdfAkcB3+Rn9HgdBppdNEEhHAgk
   8xYdXMVmgMITDJR4ll4DoDUFS5UYzTlUnF+d+yjUp7vwbD4p5O8WXhbGt
   PAn2z7Ab8RpZMJx+T5/tNzIngRMjpJI/+d5c9z+cBBvuX17VVMdIW2qEY
   1uvVRF8WgSPsK/7P1+zkxqcfqQEpKsYNzEGafJ15mLFDCSe3hTtivRUj7
   A==;
X-CSE-ConnectionGUID: X1socEfxSVu925IOvZspag==
X-CSE-MsgGUID: so4qUzz5Sd2oyZ/OWZ8OHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68540955"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="68540955"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 02:57:36 -0700
X-CSE-ConnectionGUID: 3fH1vrDNRouKsQHy/omXpA==
X-CSE-MsgGUID: q3v5mEiFR2COElg0DCu7tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="146089955"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jun 2025 02:57:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMksG-000325-0A;
	Wed, 04 Jun 2025 09:57:32 +0000
Date: Wed, 4 Jun 2025 17:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-crc 8/18] cc1: warning: lib/crc/nios2: No such file or
 directory
Message-ID: <202506041750.zPzoQeWx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-crc
head:   79a990c201e59b2d1e74b994ec4f782a420b6b19
commit: 7814014d8c1a59ac008f79285cabb34035f6f309 [8/18] lib/crc: prepare for arch-optimized code in subdirs of lib/crc/
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20250604/202506041750.zPzoQeWx-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506041750.zPzoQeWx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506041750.zPzoQeWx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: lib/crc/nios2: No such file or directory [-Wmissing-include-dirs]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
