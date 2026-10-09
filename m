Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072C041A575
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 11:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545905; cv=none; b=DQT8mzRh7NNWmaWdU/lIPDjcCnxJnp9s4nvUVH6RfRN2RZmEJyhYzZr/6p6icJKI7IT+pDVFgikvoORlSgSpRCCqCcQH/whRoSFqczu8aCHa0rupcQeyDf7VgEdNrF3p7ihT7FUX8YJhbVH364jJzMDoY/F5gjzFItM474+wnuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545905; c=relaxed/simple;
	bh=o1TBGrsX1SGjXy9D1M0xrdg7by+E0Sz37TRww8AHALs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t63UxXKvskIgbylovYISYw+8KsLhZLSlaxB7P+asZo94sEZFE8XMRFkxRKDDsKOCrgsePl54imjlZgj6v7i3WR71SjG2VHZol5x6WY86o7XRWkfNm18TmMEEVF7MugQC8ocsyY9fGnYpllHtMfwYZCdVtfeOyx7Tjb1L0+eIMY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3rRXsmy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3rRXsmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791545898; x=1823081898;
  h=date:from:to:cc:subject:message-id;
  bh=o1TBGrsX1SGjXy9D1M0xrdg7by+E0Sz37TRww8AHALs=;
  b=V3rRXsmybtR8fVTmmxBkMyJQmrDu95x5rWMCqsKC4sCO5KWy3xKtKvsf
   rlZDVdkUgy1gMSPwRKQ3KCBFhZBa9jvZBD6dtkywyBKYJeBOncmZDlRR7
   UGFIyLSNAKk/Coz+6oS24tOox9T19IoYy+7Gr8vtkspBQ4iC38riuR781
   me6whEPQrMEouVgfmyMFuFFO5Ti20Ey6QvHLPMjw7WKN7TJlJfZ3/3gRM
   ZAAJgQ3oFDWKdro1PupR8B9ft6CQDa8tU5amE9k77XOPKhliXKpVlvDbm
   2BebAKwXpiRv6p7cjlg/UIyXDfHz7cqen3cFGoMJdw4gS1nNs0BkhCLTq
   A==;
X-CSE-ConnectionGUID: GtS9EgGlTeaN77n6KPgi1A==
X-CSE-MsgGUID: 83s/AqFkSDysD33CLxG88g==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="223482"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="223482"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:38:17 -0700
X-CSE-ConnectionGUID: pWW6CnBBS5i8kStLgfwaEg==
X-CSE-MsgGUID: rQWGDgLQTm2ERS5VtdUe2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="652972"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Oct 2026 04:38:16 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF8vV-000000005hq-3NbK;
	Fri, 09 Oct 2026 11:38:13 +0000
Date: Fri, 09 Oct 2026 19:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 4/4] warning: unused import:
 `seq_file::SeqFile`
Message-ID: <202610091952.P4NaciLR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   9d29ba85d8a2c505b2d049568c3b1d29c4e0c2fd
commit: c609419b8dc12b1467e2a3f20a5d611648a05127 [4/4] ANDROID: rust: add anon_inodes related APIs
config: arm64-randconfig-1003-20261009 (https://download.01.org/0day-ci/archive/20261009/202610091952.P4NaciLR-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091952.P4NaciLR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091952.P4NaciLR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `seq_file::SeqFile`
   --> rust/kernel/anon_inodes.rs:15:5
   |
   15 |     seq_file::SeqFile,
   |     ^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` (part of `#[warn(unused)]`) on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
