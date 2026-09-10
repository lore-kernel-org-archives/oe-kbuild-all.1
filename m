Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89794AB1DD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054780; cv=none; b=s/btc2VTdr1MhBbNhfcj0d4/UkuST/W724smnxWl71duidTGd9qqP8IGvTlE/A2UAFUslP+6B6kGli+DDTfICQF3zXQU4PCMs1ZM4fzRp2hKXu+nRQkfN3dPo30MJwsJDyIosJ8Kd7N5wCxOi8BWvR+q0KxfWz+gjsQ3iR2Fl9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054780; c=relaxed/simple;
	bh=OcOvMlBwBzBvc2SGfhHXhoSDE2V3f7ty2FWM79JEMjk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KUdcSrHWsY1QyVpw5RlMb5tsIbvuodSZRN0B9OAX/i00WoURjbxnObqliTE7rQsTBiftKtU2lmeggadq6eiW4iq13P1+s9qE5nNTbAMqDWOn3ahzqYD37fh/ANZ6kzG+6rGY7J4Tnr7aEzEFFaw1lPEWp+bywPlGYMEyZdymr80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXAMsdQL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXAMsdQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054778; x=1820590778;
  h=date:from:to:cc:subject:message-id;
  bh=OcOvMlBwBzBvc2SGfhHXhoSDE2V3f7ty2FWM79JEMjk=;
  b=PXAMsdQLa8fgzfoBzekdo/tB+cELmGMpw6qU8+M5bNZx/OZM02nuVvS+
   5lJAJrXdaOf4pBHESaoHhP44Lg+vQHLqKNpgoepmL5KSGdH4c9n+pDoFw
   NGShNKboUoleUL4QCLILQlox87pZdipsdIrK0N8XX45Y819BsioGCATjQ
   fQwQgp4GxK0hjVXtDDEHWqJ5JXU+yEMRmq8O0p57uojGziVsRAHhzWlky
   WjZwszIBBnG+1+gpeQUxwjk4d9txtNvXyuMnTAXJQ+o7YZ9qwCS2T+v7v
   eTRSJgOTTzSPFvLn8iU3bxEsY3kdBdJSHP4o91ciNHWahuBBaSE3+cDhF
   A==;
X-CSE-ConnectionGUID: rjUeHUcoT9iMgbIVSE+nFw==
X-CSE-MsgGUID: PUNvlugjSO2D6Ki6K8+nbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89271593"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89271593"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:39:32 -0700
X-CSE-ConnectionGUID: 6yun0E0tRqus2lp4Ab2d8g==
X-CSE-MsgGUID: EZuMgbRKSgqQG44z2tRETw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="267395195"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2026 08:39:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gs4-000000000Px-3XOz;
	Thu, 10 Sep 2026 15:39:28 +0000
Date: Thu, 10 Sep 2026 17:39:18 +0200
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [da-gomez:rxarray-wip 58/132] warning: unresolved link to
 `Segemnt`
Message-ID: <202609092139.HyMTlycE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/da.gomez/linux.git rxarray-wip
head:   e9093bf6ee3dc1f9a4e2b08695a8d492d96f4ffb
commit: 366f35da2daf6243954c084c489a0ac8313c08c4 [58/132] block: rust: introduce `kernel::block::bio` module
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260909/202609092139.HyMTlycE-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609092139.HyMTlycE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609092139.HyMTlycE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `Segemnt`
   --> rust/kernel/block/bio/vec.rs:41:9
   |
   41 | /// A [`Segemnt`] is a wrapper around a `strutct bio_vec`.
   |         ^^^^^^^ no item named `Segemnt` in scope
   |
   = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
--
>> warning: unresolved link to `Page`
   --> rust/kernel/block/bio.rs:31:7
   |
   31 | /// [`Page`] descriptors internally.
   |       ^^^^ no item named `Page` in scope
   |
   = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`
--
>> warning: unresolved link to `SegmentIterator`
   --> rust/kernel/block/bio.rs:33:65
   |
   33 | /// The vector of [`Segment`]s can be iterated by obtaining a [`SegmentIterator`].
   |                                                                 ^^^^^^^^^^^^^^^ no item named `SegmentIterator` in scope
   |
   = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
