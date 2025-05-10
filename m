Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BC21E8320
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 11:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746878115; cv=none; b=P4kvvgtzowkOdo3iBFlyOFjKbPAZa2k2drtnkKyFKF33pLek2+NteVrOUU3hLSSGkfEgHuSrwNlccvHEJnjl104zQ6aroXZstUULsXhojxeni3hKDM/EQlYo8gPjdVPI/BoO6PhPhbVLd34+UX8VD9qlm25GG1J6Lnl9FuyxO8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746878115; c=relaxed/simple;
	bh=Vgo0pjQBqwa8NCPfWS+M2uwp0Mx4b3mm/TXIAfvXgpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qF2JPuL8KNLLbVrvWkVzyN5rB+24Z5/2aE+9vypZzYejia2ywYB2d3pA5vw0VOXZspt4fA3KBj3riaxnkX8SAGY4lrK5uKQgUJr9suXp6m0cWuk5OAR9pLW+UMl5rbl1MQ2HLbElyw8EZw/wj+Wja7g7fZtVG5mPfzWhJXUNMwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZRdsmP4a; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRdsmP4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746878112; x=1778414112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vgo0pjQBqwa8NCPfWS+M2uwp0Mx4b3mm/TXIAfvXgpc=;
  b=ZRdsmP4as7+c3gtOGKogxBkBiXHlp4O2wYqfH3gLVkI5UUYFbagYocoh
   FX94PWl5mGC6NDA3uPyigZP16J/S4gR8Wx7fWFGxGJKqbCsMJV4sKsHX4
   /jAoyHZhQXBqGHDvYdmCL5fALy6fABat7ritPS6tXTnKv/GA6QIkcgWjV
   i5EWx3A5RZIZrLNCBBJSeeC7RajiSOO5D/SB+6R+17z6ZB40JAlJCUHkz
   ARzhmqWsY1ZDd533aiNMHHp6cFh5Hv4yoCb0/y0WCMGnBCN707/RedvAU
   475ziDHpRp7u4vO4nyhF4gG2GfLzEXVI6hN6XoTUi+Z6BL9w/CBD8b3ZD
   Q==;
X-CSE-ConnectionGUID: Be6vpEbsSEGCssnH5VKXkg==
X-CSE-MsgGUID: /x0lZublTdGWXEP7R1L6Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="60112744"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="60112744"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:55:11 -0700
X-CSE-ConnectionGUID: 5FCCjsO0Qzyh95YykxkO2w==
X-CSE-MsgGUID: reQFItBESFGi2svKPEqo3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="141784685"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 May 2025 04:55:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDinL-000D3P-2w;
	Sat, 10 May 2025 11:55:07 +0000
Date: Sat, 10 May 2025 19:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10018/10031] error[E0599]: no function or
 associated item named `from_of_cpumask` found for struct
 `rust_doctest_kernel_alloc_kbox_rs_7::kernel::opp::Table` in the current
 scope
Message-ID: <202505101955.0l4u35K8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: e2994646c48885c0ff6c40fc1d51e7cff3db9d95 [10018/10031] Merge branch 'alloc-next' of https://github.com/Rust-for-Linux/linux.git
config: x86_64-randconfig-102-20250509 (https://download.01.org/0day-ci/archive/20250510/202505101955.0l4u35K8-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101955.0l4u35K8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101955.0l4u35K8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no function or associated item named `from_of_cpumask` found for struct `rust_doctest_kernel_alloc_kbox_rs_7::kernel::opp::Table` in the current scope
   --> rust/doctests_kernel_generated.rs:5016:32
   |
   5016 |     let mut opp_table = Table::from_of_cpumask(dev, mask)?;
   |                                ^^^^^^^^^^^^^^^ function or associated item not found in `Table`
   |
   note: if you're trying to build a new `rust_doctest_kernel_alloc_kbox_rs_7::kernel::opp::Table` consider using one of the following associated functions:
   rust_doctest_kernel_alloc_kbox_rs_7::kernel::opp::Table::from_raw_table
   rust_doctest_kernel_alloc_kbox_rs_7::kernel::opp::Table::from_dev
   --> rust/kernel/opp.rs:620:5

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
