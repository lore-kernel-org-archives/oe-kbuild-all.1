Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3112FD684
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764057403; cv=none; b=HmYqzlV0iZJpm9TTcMILD8FI1Gm1UFE199S1TeNcZbi+chfvP5xkFwniRKC3ngA/kD12uDYtOYW3IAaw5RsPC0uTGdIN8uVp4sMpDsfd8IoBrmAYPrUZK+ghCOL75dMc5fuE1YCcf0FGVGK5xZih6HWHzpjcABCH03f15L4/jN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764057403; c=relaxed/simple;
	bh=TVCKTIDDil2nfLbZaPtMNOYJMRVdHJjXN3MlEGBQ/NM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QMVi/b9bxLOJ38+7opqMAbF63UlxKtS+VxW3KEY0i/HonofWVnOhmoCYx5WiXR6BeJj28lhseL1u+e/s39H8q+quFUrecgBsfDYh4HJvRxCqDwujXvwKtEdgdm4ztU36WLRGK9UP1PafHl22hP445ddPxsioXf5I7FW8Gd51n38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VArHfrI9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VArHfrI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764057402; x=1795593402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TVCKTIDDil2nfLbZaPtMNOYJMRVdHJjXN3MlEGBQ/NM=;
  b=VArHfrI9931ltyekyV4xZxrsSiAP0QHpGes/8MzzDUnW0aTBda4SJr2M
   5lyY1lM6UqFgEgVbBYnxQF5m5b090aM5Ux081WC/NmGOax22Qo2uvhrio
   89strqw/fiMepit2T13D+PjWEmaz8SiBqjN7nh6zQ+kOr9O6s5IhYiaon
   TGgfgZLmKkxm0vr7rEHqLdj3wZ5jt2mIW9q7MgvtQEv2MIXIUvyrtpSKJ
   cAbkuB6fsgVuODVvHaD77SGSYGG9juaws+8MksczRwhv6g4vBx0ExIx7S
   fJFNQETILzxoWfDPi5QJgyWF0sOvaEVstJIgD29O3JiiZZ4QB0nfFXcaT
   g==;
X-CSE-ConnectionGUID: IIcM2C/QTMSEsriv/XjXuw==
X-CSE-MsgGUID: bWlbS5anQN6X+dYStMcG7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69931324"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="69931324"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 23:56:41 -0800
X-CSE-ConnectionGUID: qFvwkytfToq0WUGyMgYHoQ==
X-CSE-MsgGUID: kFQVPLooT6epNEvAZ5Cydw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="197040829"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 24 Nov 2025 23:56:41 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNnuf-000000000Sf-2jhB;
	Tue, 25 Nov 2025 07:56:37 +0000
Date: Tue, 25 Nov 2025 08:55:58 +0100
From: kernel test robot <lkp@intel.com>
To: lsig <ls4121@columbia.edu>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1208 10/17] warning: unused import: `PinnedDrop`
Message-ID: <202511250828.shxgcLvQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1208
head:   9bba107357a10d7bc2b6d669bfecb41e498bbb5d
commit: 3f9937fffad84e0f416703344b7b939dba9513a5 [10/17] [ezFS] register + unregister nop FS v2
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251125/202511250828.shxgcLvQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250828.shxgcLvQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511250828.shxgcLvQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `PinnedDrop`
   --> rust/kernel/fs.rs:7:48
   |
   7 | use pin_init::{pin_data, pinned_drop, PinInit, PinnedDrop};
   |                                                ^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
