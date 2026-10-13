Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313623CE0A4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 09:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882331; cv=none; b=s6RdO+OVgyKJhFFRs9Qvx00A30dG5/6tcFVqZ5QeA6KnTLC/qEAOJKbudGe5EfNzid4WSY7BB8d0bKwNQB8T3AX2FVps3sp3ffeKYLmF0vZ1AEHwCWieg+AiArFaPTDV8pOIseuQJx6gKFUfXutNNqbFuvHnz50CKhaJidDm+Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882331; c=relaxed/simple;
	bh=WZC7k5jrFsLGk+RdeZETkkMvrRblKugf95OwGUxnVk0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hORRE1FTYtc3rtQ8mDkx85hw47j5MwY7qyq+2RYcvu7iGc/K6PETU/tHc+n8wDzubZ921dfWvm8YJLdhRupvuLdjXdfScZ/D6uLsSFqLCot/BWPqZ3jZdswfzI+2hokCEI2A8+u1dDNNxhN+eVN4k0TMcEZJWIdc1a4hv8SBSwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBfFIgbf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBfFIgbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791882331; x=1823418331;
  h=date:from:to:cc:subject:message-id;
  bh=WZC7k5jrFsLGk+RdeZETkkMvrRblKugf95OwGUxnVk0=;
  b=QBfFIgbfd/3LF/tWc78qotCdYqqZ+6xAdp306AT6aX4jcOoqgGFbQpz7
   EGnEMK25VsNNjN+OlVCFX6EnuH9yyBh1HS8Fak/goR001DFFG5RUZYIR8
   2PbmHky3CMZweQdaEriMfiSAtuzOUP7OE4Qh0Dj1nvWjGTplcSsXtdMnI
   FF9WyDxhxAT517s+sDOQgSUf9zzdsmKhSugjZUNUmJr4O9aU0gp30Jkj1
   W3E0aFxvcdBBaPIRNyv4v5DfJ2jSVRQfV+zSABy+m46fPMFWKW+IKTLlg
   BxuKvvXLLUmvlnEUxs+dFQTjV4UGP4q7mG06KI821pmqapISZr0qhgLUC
   A==;
X-CSE-ConnectionGUID: Vwr3RJcXQJG73/yIOqiVXQ==
X-CSE-MsgGUID: 1iJ4wcamRd+K4Se/TZ1gHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="608042"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="608042"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 02:05:30 -0700
X-CSE-ConnectionGUID: rN1afYaXRVOLS2MRIMlzBQ==
X-CSE-MsgGUID: rogJs9LqS4+ujoS+521Ydw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1565899"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 13 Oct 2026 02:05:29 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGYRq-00000000ASD-1Zh8;
	Tue, 13 Oct 2026 09:05:26 +0000
Date: Tue, 13 Oct 2026 11:05:21 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rxe-rust-v1 43/88] warning: associated items
 `new` and `finish` are never used
Message-ID: <202610131026.yby0mhXI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rxe-rust-v1
head:   60ed85f4575c0314ccd82550b8ef1f5ecb59ff7a
commit: 16efa7c648b99221251fcafb973394d5002193d8 [43/88] rust: sysfs: Add bounded output buffers for sysfs attributes
config: s390-randconfig-r2302-20261013 (https://download.01.org/0day-ci/archive/20261013/202610131026.yby0mhXI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131026.yby0mhXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610131026.yby0mhXI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated items `new` and `finish` are never used
   --> rust/kernel/sysfs.rs:37:26
   |
   29 | impl<'a> Buffer<'a> {
   | ------------------- associated items in this implementation
   ...
   37 |     pub(crate) unsafe fn new(start: *mut u8, size: usize) -> Self {
   |                          ^^^
   ...
   65 |     pub(crate) fn finish(self) -> usize {
   |                   ^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
