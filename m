Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D213AA9CA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 23:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328372; cv=none; b=ayFSH1ruYhhZZzN1wuELT5XMpQh0KDN1nr0bIB6FhlFX2ChgnmomMzMfdPNn6OcXEX78xR8G8+QDEpfLyvCHric4316s1T+a0H5LE3OWSXHHI7KUgCyLf63S4Zetq+1zqTjTmdsVQ9GQ2PFKBqNbltA9E+OZnyeY1Ci5skiAXlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328372; c=relaxed/simple;
	bh=3E8Ti/b+OhkgJnV7UFXSlbTSlAyBOWtDhLMCCAWYdHY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Khe9/iFTq/SD0DQPs0VPzdX9ebTzWDSTlk63YSXLP2biiGe43xYOvib9cyfM2f11GdQsiS2qQmT5/S/oDris7jjiu3kSN31fr0g9AJRBkk0/SN06K6N0I4rJrjRslUNdk+sDvUViBjcKKl/3ngIKVlEVUY+9/Z9zZrYpROxaHEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvRh8cQy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvRh8cQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791328370; x=1822864370;
  h=date:from:to:cc:subject:message-id;
  bh=3E8Ti/b+OhkgJnV7UFXSlbTSlAyBOWtDhLMCCAWYdHY=;
  b=hvRh8cQyWq1u9PLay0QvoyeowFsg2mthIAFN5wG+s7BMbmUdY7qyartA
   /Fh0hmOArj10wli59ZAlCMpZ4l+O1woLdji4UyZZsD5HkkOzgl25zvbeE
   26ZkHfXeV8jgtEVi1BmVaX529HNahoPgQ9Nv7Wu8TdNsCIG/ZAZUCG58x
   oa7E82H60JPI9BsbVGLRiOSTS4JOvbUqDrmDgYXPzvdiPWyAaSvKN4Lny
   j7ceng4AzKEXoMeJYIvWQa9CY8loeYEDqgwE1Sk3c/idJwbnTl5BXLBfD
   w1SOAVzGaDTsLRKx7UkBkuocGGAbPF882sNBEbGoHmBxzQcsVsIaqWN2M
   A==;
X-CSE-ConnectionGUID: /qbeRv7ZQoCjXkWyFSmacQ==
X-CSE-MsgGUID: 6YdOoSX1RjqnKctdvDvsMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="89236"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="89236"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 16:12:49 -0700
X-CSE-ConnectionGUID: b2AJ5+aBQxix4VGpIlLjOg==
X-CSE-MsgGUID: JBNNVv0eR+SrNJ105Cm4Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="275932464"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 06 Oct 2026 16:12:48 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEEKz-0000000021P-2O36;
	Tue, 06 Oct 2026 23:12:45 +0000
Date: Wed, 07 Oct 2026 01:11:45 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 15/15] warning: this
 expression creates a reference which is immediately dereferenced by the
 compiler
Message-ID: <202610070141.PS8euvq3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   efe665b77332621017fded6de1496bfff20ae5c6
commit: 2699f85e5e689ad1c6462d6081dd4b1a9ab2d195 [15/15] BACKPORT: rust: module: update the module macro with module parameter support
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261007/202610070141.PS8euvq3-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070141.PS8euvq3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070141.PS8euvq3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: this expression creates a reference which is immediately dereferenced by the compiler
   --> rust/macros/module.rs:337:36
   |
   337 |             modinfo.emit("author", &author);
   |                                    ^^^^^^^ help: change this to: `author`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#needless_borrow
   = note: `-W clippy::needless-borrow` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::needless_borrow)]`
--
>> warning: this expression creates a reference which is immediately dereferenced by the compiler
   --> rust/macros/module.rs:341:37
   |
   341 |         modinfo.emit("description", &description);
   |                                     ^^^^^^^^^^^^ help: change this to: `description`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#needless_borrow
--
>> warning: this expression creates a reference which is immediately dereferenced by the compiler
   --> rust/macros/module.rs:346:35
   |
   346 |             modinfo.emit("alias", &alias);
   |                                   ^^^^^^ help: change this to: `alias`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#needless_borrow
--
>> warning: this expression creates a reference which is immediately dereferenced by the compiler
   --> rust/macros/module.rs:351:38
   |
   351 |             modinfo.emit("firmware", &fw);
   |                                      ^^^ help: change this to: `fw`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#needless_borrow
--
>> warning: this expression creates a reference which is immediately dereferenced by the compiler
   --> rust/macros/module.rs:356:39
   |
   356 |             modinfo.emit("import_ns", &ns);
   |                                       ^^^ help: change this to: `ns`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#needless_borrow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
