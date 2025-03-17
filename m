Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46600E567
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 09:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742202157; cv=none; b=EOcNyyHjyprX4IMljKKvOk9Tb6pd0ScuZmSIFHuqM7kMZfs7K8bdajrxoyo5OjjLB7dgLpokesEfeSNajmVBg9PlmkuroxdKPS91jBwwSSB74kE72sBv03YNR+XLfqGs25R2dQZGIr5rtYmUCVQ//JTDPfBjKRNaRHISQFmvXho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742202157; c=relaxed/simple;
	bh=s/yH+Ey1nGH8/7qNskt14WOTg/3vkMQ5DsKaEN9PA+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jwro1vCTpvKJfAnAldCN6P0RORVOKDhh0ooEEf0G8HTyQd/oNERaM8QMhArY9BLwExtnDBry267nnyS6RutkwzWeAyY5vwGmdpiX8gBz8K1WHs7T/phjbhnm9/++COzJr+2azhbjIHuACigDccdCG12+yKCt+Sbg+c80Moa2hGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0uePP/7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0uePP/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742202155; x=1773738155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s/yH+Ey1nGH8/7qNskt14WOTg/3vkMQ5DsKaEN9PA+0=;
  b=G0uePP/7NGwX7Tl7i+BDkQJtZa1aWE6wm18Q58OVgXwcZY8kJi9/CMjg
   /54Y+GGKXMLPMDuJJ6pghRzO1qaWaZbEigww6vDInMLe3BDlcJopeITcG
   UuCbU8aZjP3sAxS+VoFd0COsLxO1ksnd1jwHmn/WIZfGRg5YlOFZ6PQPs
   qdv6Hsw3zr5BDb+R+KXKwwBwesvyABKqMSLm2Lf7HdtjYagl9msOSgq+8
   qn7Bsq8ompI6bKDawxN3Gqd76EkN0iQ2UTvsn+ukjdo1tLoUqZsBQZJOa
   vRAfADcbVcvQgCmPPLljIclfogJLXW+cKi5SSVnnaHgB8S66WWswic/lY
   Q==;
X-CSE-ConnectionGUID: 2xFfF0WXRyu0VxmWE/KxSg==
X-CSE-MsgGUID: IqQv0mABT/2FIdYNOawnYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="47063677"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="47063677"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 02:02:31 -0700
X-CSE-ConnectionGUID: HvOq8xi2TfSGTakAQe4qhw==
X-CSE-MsgGUID: uJdiJ1sQSuyFUhAusWP1JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="152854590"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Mar 2025 02:02:29 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu6MT-000CcR-0T;
	Mon, 17 Mar 2025 09:02:23 +0000
Date: Mon, 17 Mar 2025 17:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-atomic-v3 15/17] Diff in rust/kernel/sync/rcu.rs at line
 61:
Message-ID: <202503171615.3mcIfRhV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-atomic-v3
head:   9b0ff2cf7026f93d299434f0484d283c61418661
commit: a7041fb8a402caf92dc52c515af53867c75dcb80 [15/17] WIP: rust: sync: rcu: Make Rcu Projectable
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250317/202503171615.3mcIfRhV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171615.3mcIfRhV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503171615.3mcIfRhV-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/sync/rcu.rs at line 61:
    
    // SAFETY: `Rcu` is safe to have multiple immutable references co-existing with one pinned mutable
    // reference.
   -unsafe impl<P: ForeignOwnable> crate::sync::Projectable for Rcu<P> { }
   +unsafe impl<P: ForeignOwnable> crate::sync::Projectable for Rcu<P> {}
    
    /// A pointer that has been unpublished, but hasn't waited for a grace period yet.
    ///
>> Diff in rust/kernel/sync/rcu.rs at line 61:
    
    // SAFETY: `Rcu` is safe to have multiple immutable references co-existing with one pinned mutable
    // reference.
   -unsafe impl<P: ForeignOwnable> crate::sync::Projectable for Rcu<P> { }
   +unsafe impl<P: ForeignOwnable> crate::sync::Projectable for Rcu<P> {}
    
    /// A pointer that has been unpublished, but hasn't waited for a grace period yet.
    ///
   Diff in rust/kernel/sync.rs at line 77:
    ///
    /// The implement type must allow multiple immutable references and one pinned mutable references
    /// co-exist as the same time.
   -pub unsafe trait Projectable { }
   +pub unsafe trait Projectable {}
    
>> Diff in rust/kernel/sync/rcu.rs at line 61:
    
    // SAFETY: `Rcu` is safe to have multiple immutable references co-existing with one pinned mutable
    // reference.
   -unsafe impl<P: ForeignOwnable> crate::sync::Projectable for Rcu<P> { }
   +unsafe impl<P: ForeignOwnable> crate::sync::Projectable for Rcu<P> {}
    
    /// A pointer that has been unpublished, but hasn't waited for a grace period yet.
    ///
   Diff in rust/kernel/sync.rs at line 77:
    ///
    /// The implement type must allow multiple immutable references and one pinned mutable references
    /// co-exist as the same time.
   -pub unsafe trait Projectable { }
   +pub unsafe trait Projectable {}
    
   make[2]: *** [Makefile:1811: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
