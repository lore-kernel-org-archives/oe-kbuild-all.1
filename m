Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADD615C158
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 07:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740901178; cv=none; b=fooJuOi+anZfiZkA8O7wAyM6w23wm+3WGlhSV35GWeardoBTXj08GC0xY9coVxEDzrhoAL5oJWCaG4OwvVMy/l8vsrbIzy4c9Zu7EIXrB363GGWTUQKMWunpP3dXiV03P08AilIKg1UXwKdGG8MsL6gFo3mHUH7B8B7wRJqONKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740901178; c=relaxed/simple;
	bh=+WEedLhIjdQI9usctHWz/eeHtOKJlD6iojCVVj0sCYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fYuDIUa+Yx0egkRVvrFDCVUrl1Kh7IDw4FK70PkhhlV1lPwgb82RGhC3ISPYcXwMwA0nEIRtq6Y0HYkrvupnPcVL8RYzbAhEE3jaOKz7xVz7KJrOoGqIX047ekh0WYOL1Nkn53KrnKHKVpVrrVp//XGwHKDDSDYWLrvzLK23A5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kbnj/O1t; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kbnj/O1t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740901176; x=1772437176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+WEedLhIjdQI9usctHWz/eeHtOKJlD6iojCVVj0sCYg=;
  b=Kbnj/O1tEbJ+Pd5zg3JczHPj1eWRm7hAFkLHNCFtLZHcd1EEmLb3xlZy
   zbVhDpdZj/Y7bkM3hwFAfT8DgfGVsrhNe3chxzNt2GaomVxKjIowKjZLN
   Zq5pVgzkVGSo1NmqMuqSGA8ZwXBr6HHjy2VUo/8O19JGbLZb67Hzdd20f
   +qE6eYEuXgWUysWMydSTH+jmSolXlpPvml5hPW5B/J7PfFJHvb/62bO4Q
   hZIm/Y1bi3yDcU6UOSNHXW8hff15+eo3tEMCcDCU5tSQTSRZfEilHa7lT
   GCM2TWuBR3eomsVTTpcZ2b4TrDDnLk20aSTYMi0srKSS255jyuc8s4TCQ
   w==;
X-CSE-ConnectionGUID: 7ic6Fk2xTA2GdY3DAChnSA==
X-CSE-MsgGUID: bFro58TnRaKeKXC9xPoXRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="51995286"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="51995286"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 23:39:35 -0800
X-CSE-ConnectionGUID: w9Euhj12TpWUiYJtP1Nc3A==
X-CSE-MsgGUID: WWfEB0jeQ3io4mpqLgaj4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="140940861"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Mar 2025 23:39:34 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1todvA-000HAW-1j;
	Sun, 02 Mar 2025 07:39:32 +0000
Date: Sun, 2 Mar 2025 15:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1] error[E0425]: cannot
 find function `size_of` in this scope
Message-ID: <202503021531.9UDfUpvq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   05d6c71423601e74cd1ec7ec5a977263fc97ad23
commit: 5e60c4805013d43492c922f537a63cd3e7e743c9 [0/1] ANDROID: ashmem_rust: add toggle for ASHMEM_UNPIN
config: x86_64-randconfig-121-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021531.9UDfUpvq-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021531.9UDfUpvq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021531.9UDfUpvq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `size_of` in this scope
   --> rust/kernel/miscdevice.rs:264:19
   |
   264 |         let len = size_of::<T>();
   |                   ^^^^^^^ not found in this scope
   |
   help: consider importing this function
   |
   11  + use core::mem::size_of;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
