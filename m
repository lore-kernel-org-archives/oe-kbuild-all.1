Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B333002A5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 21:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764106222; cv=none; b=q8TEpLhZeoN1XpGV2ZGictq4ZBeYpEquyyHgZ2BRK4oN0E4wqKmHV8ynUw63d0A7weQEwOHphRKJ25UMQtXq8CC4cTAkKORObC7gIzuJZMsl6mQRsEB9QuY1NXOOi00V7HnSC/medYIInZh8VTbNO2yKfZ97RFlJox3/KxP34vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764106222; c=relaxed/simple;
	bh=SW4o2kqH5TrgXnEXeOVv9pUkXD3M3pfjVioDuwcvHJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hHRPGpUcWNmbQ4UHLsQZq0ADQJSD/XByMWpkfoOta2kI7tf4ujDxAAeRwQEngJvTGhYb9JIArqW3EF9IpGOlb6NfJTCmZ2pNgDwRCFPPSN++S6bx593RspycuZSYyChNG+9j272KN1rELw+JNgfWKnIG2R9xwaVtnnANkEHDWFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSIaTunP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSIaTunP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764106221; x=1795642221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SW4o2kqH5TrgXnEXeOVv9pUkXD3M3pfjVioDuwcvHJc=;
  b=RSIaTunPkwwIsLC0kkTt47GoHligGQFAYuWnvY9sWSDgY7hF+Z1Td61H
   yugOVj7FHSfZf3s7O7Vhhr5WG0tYthjIcW871Av1esuiglp9uGZ0unYfS
   98I/3ZEV5oqJzSBgnSUx9A5dSMovNql6GGSi0hLumiH8DkHiA/z8ozZAM
   VdSn0Mbd2at+VuaqcN2j2udDxyKjfpd4mMf2uvt72TNld2pRMM9B3K63s
   VrP1jEcQTozhyVgj63vU9ciaA7OO23e/Oz5CpxtIekDuNJccUIT70ITKt
   4e+sgEnEi6OC/EK7bd4k/h3BJSXZ1q/qtEJJeemoqkTLAYoALBVLgDSvC
   A==;
X-CSE-ConnectionGUID: yPBholqLQT+mhtb22Unxkg==
X-CSE-MsgGUID: qLCAj/whSJygAFk2IGHFSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65138119"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="65138119"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 13:30:18 -0800
X-CSE-ConnectionGUID: bzVhdDS9SIikaLdBdiHc4w==
X-CSE-MsgGUID: JTyxLnArQBKNlboQ7mtDdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="192655085"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Nov 2025 13:30:17 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO0c2-000000002Hu-3WDO;
	Tue, 25 Nov 2025 21:30:14 +0000
Date: Wed, 26 Nov 2025 05:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: lsig <ls4121@columbia.edu>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1208 10/17] warning: unused import: `PinnedDrop`
Message-ID: <202511260548.1W995qGc-lkp@intel.com>
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
config: loongarch-randconfig-r061-20251125 (https://download.01.org/0day-ci/archive/20251126/202511260548.1W995qGc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260548.1W995qGc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260548.1W995qGc-lkp@intel.com/

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
