Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDEC280020
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 13:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623326; cv=none; b=tNCLHxQwYB7aq+bkN/JT+5ndZM+fr8zo9U+GNuorr5zG2lGlTAp94gnGaI7NK22pCOC9IU8iDr7otl6vvALR1QRHWPEMvAaf0yz+WLjs2ja/t1h9Yvkusq6QdDAv43ZYLD43f7oA6Zq8cYxdyT0ueT+qgyUtS7Gg7bml3sjIFjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623326; c=relaxed/simple;
	bh=B6Ok/JslsCZ0akodnBOFmdnDYVw20aL7wueiqz+2gKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qUuNh5g9FkF0y4mJV6cWSk1hAhaLScd+FBBe2hhcL1EG76di0I/kM5IIm3jVwngS8WVfpYMWKSF1trqVRlAQCzTgZ26+PrEGtdRMp8lMpy/f3BKZE0IqFJ8avS3GG0hZsz414GbA1MLsAECg/dI0O2Nk/GYeF+5/uaEPImj6wIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUM38g2K; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUM38g2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746623324; x=1778159324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B6Ok/JslsCZ0akodnBOFmdnDYVw20aL7wueiqz+2gKc=;
  b=eUM38g2K1H6pl0P1izDDMRwO/KJ2geBZqcavGoirylNCCeSvS52gcqS/
   +DyCJ8nz08LtvCCmarGR78326TSw9OthrZ6562Z2JVAGPtpGPl2KVrymg
   cGZ/3RedcadVvSQEp2HDKlTeRSJGLG1+NjX3p5tHNXxHUM71bCM1qDvXZ
   V1lwcgPnJvGc+VzKsrOKwv07GDWGwFWwm6Gqx3vSt4C24rgpX6/JSPzGf
   8A6HJgkfG7dACC32sJ+Tbwc/2Tk4Oxieal0IF/cu5jX7tXQOvyQJcJhiu
   j+oRdRyLuItmTzkKUUzEMus/WAKX14eW7zwcf2LM7qDJOlO4dDG0XuXsF
   g==;
X-CSE-ConnectionGUID: qpzGSMo7Q6WDnwZNR+uPCg==
X-CSE-MsgGUID: Cm/A9+z7TOOvptvQzKxEVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48464755"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48464755"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:08:39 -0700
X-CSE-ConnectionGUID: MyEAokVPR/65shwHvpWoAw==
X-CSE-MsgGUID: rSSV+j/aRHyuFG9eUft+Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140907170"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 May 2025 06:08:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCeVn-0007qF-0L;
	Wed, 07 May 2025 13:08:35 +0000
Date: Wed, 7 May 2025 21:08:18 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Gary Guo <gary@garyguo.net>
Subject: [linux-next:master 4753/5832] error[E0432]: unresolved import
 `crate::mm`
Message-ID: <202505072116.eSYC8igT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 03be7043bbae0380e3e314cde042e4bb5c63b48c [4753/5832] task: rust: rework how current is accessed
config: riscv-randconfig-r071-20250427 (https://download.01.org/0day-ci/archive/20250507/202505072116.eSYC8igT-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072116.eSYC8igT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072116.eSYC8igT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `crate::mm`
   --> rust/kernel/task.rs:10:5
   |
   10 |     mm::MmWithUser,
   |     ^^ could not find `mm` in the crate root

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
