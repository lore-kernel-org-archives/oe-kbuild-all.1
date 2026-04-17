Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADB839478F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 12:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429836; cv=none; b=KIPcFEbi7E3abYqbr/eRGX1Y6M1g/hcIYTRIpjU/x0W2V3qmHRBuW7AzofogleLg//kO4xhtgwQvm7RZ4YHYtNK0Fsy55+gEgku4OtRH1r8Jbcw3yeoWIOMS7VNuuXl2oQ4TjlOylBhbcDNDlUdClIgzM5RZA6bemh0WGZ41fSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429836; c=relaxed/simple;
	bh=fgHxlM0yfRnlaN+BZiJ1CyYbxmczVFkSz0zesjmyPck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DynyOPpnyY0envFoO4KVytSoHnQs6iZbpIPV+/6Csi/snpxoiGad3Ux4JtnmsarnEb6QyQh89XFtI7qNOrtspsTgYj9hdQJ8omGgWcqdRG0B2kb4hGpAA5j+iPsfgIeMdALF3ZYUcH7p2SQEKDQktO6agGigJgSnI9MjrHJKKI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gihcOuZX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gihcOuZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776429834; x=1807965834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fgHxlM0yfRnlaN+BZiJ1CyYbxmczVFkSz0zesjmyPck=;
  b=gihcOuZXRhlG3fm6NPw+P4JyoahbEpMJ+n16/IEz7ntaUn9mN9j6n+6L
   ZuFp7M2TBsPWsTVO+4pRLBx8Gew2LVNqNN6ez5gqy6m/MIcFzfs3MBZci
   73YLde+K/kbv80tOI3oenjNfORuh0cqzxg/ZKFnjgK/RLOM5PKMuZKaYv
   9GdmxPprTXbkjirZz9xe3WyRMI7y+CU0t/PZVsSwCe43sHK0wwxPaAEHu
   PD4J4Z+mfjzP3QQDK8GK9+RT+VGI7f012UiVgWohH/QakhBaVhOfxrBh6
   3+kopNXPzKDhDZqf9NzLVfNW2IQfRgLqWm3ZXhc2Du2+L8NvvduA/u/Dk
   A==;
X-CSE-ConnectionGUID: sKerCbCTSyeVmnPQ3lEvWw==
X-CSE-MsgGUID: jxGiIcnIQJa3TESqQ+nm7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77313354"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77313354"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 05:43:53 -0700
X-CSE-ConnectionGUID: 6Mb6EuUVQR6vFG248w1HYw==
X-CSE-MsgGUID: g65tMn8HRGqCMPkksNJBaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="235404238"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 17 Apr 2026 05:43:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDiY2-000000001JJ-03Wc;
	Fri, 17 Apr 2026 12:43:50 +0000
Date: Fri, 17 Apr 2026 14:43:32 +0200
From: kernel test robot <lkp@intel.com>
To: Wenzhao Liao <wenzhaoliao@ruc.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] block: rnull: support BLK_MQ_F_BLOCKING via
 configfs
Message-ID: <202604171406.R782cnZM-lkp@intel.com>
References: <20260410090829.1409430-3-wenzhaoliao@ruc.edu.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410090829.1409430-3-wenzhaoliao@ruc.edu.cn>

Hi Wenzhao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 3418d862679ac6da0b6bd681b18b3189c4fad20d]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenzhao-Liao/rust-block-mq-safely-expose-TagSet-flags/20260417-073541
base:   3418d862679ac6da0b6bd681b18b3189c4fad20d
patch link:    https://lore.kernel.org/r/20260410090829.1409430-3-wenzhaoliao%40ruc.edu.cn
patch subject: [RFC PATCH 2/2] block: rnull: support BLK_MQ_F_BLOCKING via configfs
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260417/202604171406.R782cnZM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604171406.R782cnZM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604171406.R782cnZM-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/block/mq/tag_set.rs:41:
        pub const TAG_RR: Self = Self::new(bindings::BLK_MQ_F_TAG_RR as u32);
    
        /// Disable the I/O scheduler by default.
   -    pub const NO_SCHED_BY_DEFAULT: Self =
   -        Self::new(bindings::BLK_MQ_F_NO_SCHED_BY_DEFAULT as u32);
   +    pub const NO_SCHED_BY_DEFAULT: Self = Self::new(bindings::BLK_MQ_F_NO_SCHED_BY_DEFAULT as u32);
    
        /// Check whether `flags` is contained in `self`.
        pub fn contains(self, flags: Self) -> bool {
>> Diff in rust/kernel/block/mq/tag_set.rs:41:
        pub const TAG_RR: Self = Self::new(bindings::BLK_MQ_F_TAG_RR as u32);
    
        /// Disable the I/O scheduler by default.
   -    pub const NO_SCHED_BY_DEFAULT: Self =
   -        Self::new(bindings::BLK_MQ_F_NO_SCHED_BY_DEFAULT as u32);
   +    pub const NO_SCHED_BY_DEFAULT: Self = Self::new(bindings::BLK_MQ_F_NO_SCHED_BY_DEFAULT as u32);
    
        /// Check whether `flags` is contained in `self`.
        pub fn contains(self, flags: Self) -> bool {
>> Diff in rust/kernel/block/mq/tag_set.rs:41:
        pub const TAG_RR: Self = Self::new(bindings::BLK_MQ_F_TAG_RR as u32);
    
        /// Disable the I/O scheduler by default.
   -    pub const NO_SCHED_BY_DEFAULT: Self =
   -        Self::new(bindings::BLK_MQ_F_NO_SCHED_BY_DEFAULT as u32);
   +    pub const NO_SCHED_BY_DEFAULT: Self = Self::new(bindings::BLK_MQ_F_NO_SCHED_BY_DEFAULT as u32);
    
        /// Check whether `flags` is contained in `self`.
        pub fn contains(self, flags: Self) -> bool {
>> Diff in rust/kernel/block/mq/tag_set.rs:41:
        pub const TAG_RR: Self = Self::new(bindings::BLK_MQ_F_TAG_RR as u32);
    
        /// Disable the I/O scheduler by default.
   -    pub const NO_SCHED_BY_DEFAULT: Self =
   -        Self::new(bindings::BLK_MQ_F_NO_SCHED_BY_DEFAULT as u32);
   +    pub const NO_SCHED_BY_DEFAULT: Self = Self::new(bindings::BLK_MQ_F_NO_SCHED_BY_DEFAULT as u32);
    
        /// Check whether `flags` is contained in `self`.
        pub fn contains(self, flags: Self) -> bool {
   make[2]: *** [Makefile:1913: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
