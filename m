Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B37237164
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Jul 2025 19:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753470756; cv=none; b=lOoKNdhgqFK/gd2vMzjdgAUnwDAogKlRxWD3nQI+Bgt8id6YpU0J0C20Sz/dFZlNGGW/VY9BVyVlSTQ70UOZ4dgf6+z3NsDnGBedb3bf6F6NlqCsuFD80UPZIbQiB0NUnm6mdQ3UJF5kSgnHStoxbdIzBJkfeDPld/77/YPMSjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753470756; c=relaxed/simple;
	bh=W7qK9B83lq7FYe55jQ9ximS8dJ+fQSE/PAEaV5j+Bfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K3HDR9eZoFc7uCbH/V7c6c12qI2dJXVEOiwQaa/0d2c+3mU+mGgIvLoUo2mFgYB9oL73Nh7x1IjKlfdBfhME/YxGGwxZdtFSQ8oNngXz9NIpk6ocp8301xu48H0MKWbr3F7p0WFjXyYz7n+jkCI1pW6piRknODMA63Ql5m8XDJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRWMAeBg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRWMAeBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753470755; x=1785006755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W7qK9B83lq7FYe55jQ9ximS8dJ+fQSE/PAEaV5j+Bfc=;
  b=IRWMAeBgcRgA6jKGWf9SIuazWWJdntDwUURidaclPCDOv6cQx5vfDRBd
   tLoSXmSVCFtw+cxMFkSrFCZqQYq4xEHf1SplZaNXNTav0yuJklW9HxG+V
   afvBwnLP9ZqmfDT0rmuLLqvAJyhj3UB2VyF/6gnr4XeaGouWllsfnFI/4
   hcx8ccqxTjCdlHfEnGDz9hr471jodkp8SeUgHFJei/PtXn8HkG6EYxnhH
   FNCuudGhE5S7LPCHeQGeY2xOPguqi2P4EqqE8ph/WymCNW7OrHX9rQzd0
   bIeHyjNXwkLDDR16o3P1G0QAeBQFKLirm+PpEFW97/YlK0DvRgzlPPVf3
   A==;
X-CSE-ConnectionGUID: QbZYnoboTEq+CDXy78anfA==
X-CSE-MsgGUID: 88X0UkfGTi6e6SUyYyRROQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="59634727"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="59634727"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 12:12:35 -0700
X-CSE-ConnectionGUID: 8ku4fYq+TI+JePPfNKdbwg==
X-CSE-MsgGUID: R8yEoabYRBiPWSj7lBmoXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166567445"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 25 Jul 2025 12:12:33 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufNqJ-0000Ap-1E;
	Fri, 25 Jul 2025 19:12:31 +0000
Date: Fri, 25 Jul 2025 21:12:24 +0200
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>
Subject: [boqun:rust-atomic-impl 4/11] warning: unused import:
 `core::cell::UnsafeCell`
Message-ID: <202507252109.xTypSife-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-atomic-impl
head:   9908e69eba39eeef235e409a753621914c6e8926
commit: 1c3238898188d153f6a0c21cf85f8259ef0ab8a4 [4/11] rust: sync: atomic: Add generic atomics
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250725/202507252109.xTypSife-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507252109.xTypSife-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507252109.xTypSife-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `core::cell::UnsafeCell`
   --> rust/kernel/sync/atomic/generic.rs:8:5
   |
   8 | use core::cell::UnsafeCell;
   |     ^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
