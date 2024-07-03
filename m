Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6B74409
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720018150; cv=none; b=sT9ZJf9N6rRs8mOF8mSApIkZYMaxV+KvD5j6ZIBlGRuq5WWNqL2aNItOa3+s/I+3JnHs3xSaxcdY1uteA7XmKoU0/3OZjlOO9VvmkX1df8jn3pmEjY+8pN4+3+gejTKznwrb3hgLBowofugc0RQC0KsbOy/Jty7vqz2/rtpzMy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720018150; c=relaxed/simple;
	bh=5m97/A8siXIK5t2s+1k9wIzDDXG29EINGlfj+WIgM50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UjN4nPaikup1Xhivr7t/nTii7F56Ln02dSABb7M73wIvQbatcbJrLOEcCw+WGnCQhYafwob5MW9anE9kKOnVdHcoOFUcRCbDGbtywhe0dlD8qHpN7llakJ3NiTtv/RYfiyp0mQauYQwj10IdR0/NFYLDUxQ3/53OCNxSaqVd6Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=auG4uTju; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auG4uTju"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720018150; x=1751554150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5m97/A8siXIK5t2s+1k9wIzDDXG29EINGlfj+WIgM50=;
  b=auG4uTjuaS0MAF2PBIYHMqxtZ136Q+iGPS5batuD9tJS58kIzP5mAW5P
   9bODFxcvbmmLUGAIsH4TyOoZIaEJ2uIEXeBm9QyeeaYgVyU4cIXIc7a5F
   vb40MQE1zGoJoeaFcl5lEa5NSM8JgaQg1o9Izo04Cq6ChvgUHkkDHTclY
   oyDNk9lyJempTh0hufEqN1gxJmO1v1T0ZFwwHU9kLat/dlrACHpkGjM9g
   VwHXOyqSN/+gnFQSuPPfUtqA1jDo+jYWut9MN3pH73rPMZ0sgeCE9CGyQ
   q7u3PrecVFYrwSJB9IjAVgjWgZ8JtSp7JqGWwsDel0WmXJwxKoloGubRE
   Q==;
X-CSE-ConnectionGUID: EeRyv9bgQGabltBtod8T2A==
X-CSE-MsgGUID: M0kUjMCnR6yonuJ82o1ySw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="21063347"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="21063347"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 07:49:08 -0700
X-CSE-ConnectionGUID: X6KZsNZMTAKy7pDRPQusnA==
X-CSE-MsgGUID: TLuSU5nFT+Gc0nTxo7QV2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="46709076"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Jul 2024 07:49:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sP1I8-000PrX-1m;
	Wed, 03 Jul 2024 14:49:04 +0000
Date: Wed, 3 Jul 2024 22:48:16 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Gary Guo <gary@garyguo.net>
Subject: [nbdd0121:vtable-wip 9/12] warning: field `0` is never read
Message-ID: <202407032239.rzq7idXs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbdd0121/linux vtable-wip
head:   4ba0d31988d203e6238a9ae7170f01978f12534a
commit: 8d994e776994c16396a9bd5ac05891909371457c [9/12] rust: Kbuild: enable `proc-macro2`, `quote` and `syn`
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240703/202407032239.rzq7idXs-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407032239.rzq7idXs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407032239.rzq7idXs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: field `0` is never read
   --> rust/proc-macro2/marker.rs:17:39
   |
   17 | pub(crate) struct ProcMacroAutoTraits(Rc<()>);
   |                   ------------------- ^^^^^^
   |                   |
   |                   field in this struct
   |
   = note: `#[warn(dead_code)]` on by default
   help: consider changing the field to be of unit type to suppress this warning while preserving the field numbering, or remove the field
   |
   17 | pub(crate) struct ProcMacroAutoTraits(());
   |                                       ~~
--
>> warning: struct `SourceFile` is never constructed
   --> rust/proc-macro2/fallback.rs:312:19
   |
   312 | pub(crate) struct SourceFile {
   |                   ^^^^^^^^^^
--
>> warning: methods `path` and `is_real` are never used
   --> rust/proc-macro2/fallback.rs:318:12
   |
   316 | impl SourceFile {
   | --------------- methods in this implementation
   317 |     /// Get the path to this source file as a string.
   318 |     pub fn path(&self) -> PathBuf {
   |            ^^^^
   ...
   322 |     pub fn is_real(&self) -> bool {
   |            ^^^^^^^
--
>> warning: struct `LineColumn` is never constructed
   --> rust/proc-macro2/fallback.rs:338:19
   |
   338 | pub(crate) struct LineColumn {
   |                   ^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
