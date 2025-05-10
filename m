Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0751428E7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 03:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746847112; cv=none; b=ob/FJFgCHj3EKDnVKykblI1ck1I38wMQ3iWJIK5i7tjznie3TYWd7a7ORUqsqnNuoeSbwGnuS+y1QCoq5NeBKYNK+RHnVFddwySOfBX17JWq23cHSInAD2y+ysvAVrqR/m5hAhoDq1e703s1/PQC5B7PBY8+fj+0/qRfWdU3SEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746847112; c=relaxed/simple;
	bh=fOA+vkboTXQjQW0Uu89BcVU02xXPzRCouEXio0Kuxfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NPVrArz1dnqA2NZ90p40ViCPblxZoZSO1LCbkXR1JqSR85SZeVjNPpp/E/PYl2CibA3JBO7TLBku1YJ7Far+1vwCKRoztSNSE+kdU6M5xlLnbLTX18kLOVQmLVmjjbnReRhIejIjuKNpdj1+0mzoN1AG0v7OYhwJzqg3A94mS0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cODBwGQK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cODBwGQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746847109; x=1778383109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fOA+vkboTXQjQW0Uu89BcVU02xXPzRCouEXio0Kuxfw=;
  b=cODBwGQKZuhjb81v58KE4jj0dQBdum4UtgOgm1AvlR4ZTwRvc+ugi2k4
   R53KafUXL6ju/xMfu6I4d2hrXQKzfeM9TwJNHV7AA5URuAoQluSQMwYK0
   YktuJEmO1Tx6YD7H1R1T1+IZIIrbfhemUdjH838liyifQJQbM+hH2Bku8
   u9SDaaSzED1QD2oTHDjy6SvMsL1IV0By9YUXyUCBaYtbVbgz3X1X+3fWl
   rnJxwkL19s3Kiu5hJ1Ue5WzJBXNY1Zvh3TaLooXOrKaLanFIwT10ifib9
   Fr3YNvLcXlSfjnFoBDI+4wkSOWP/KGFDAMnn/diXjmOE8xJDza2Bo3vii
   Q==;
X-CSE-ConnectionGUID: NiTA8wcMTuePHwFUhl670g==
X-CSE-MsgGUID: hb0QuOrcRv+LhMHNdmIEPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48610538"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="48610538"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 20:18:29 -0700
X-CSE-ConnectionGUID: uO4aMAN2RPidRHOmXtzl3Q==
X-CSE-MsgGUID: a/bW8V4VTOGbntpzVkqirg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="137777280"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 May 2025 20:18:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDajK-000Ck3-0j;
	Sat, 10 May 2025 03:18:26 +0000
Date: Sat, 10 May 2025 11:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6488/10031] warning: fields `em` and `of` are
 never read
Message-ID: <202505101133.UjnqICiS-lkp@intel.com>
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
commit: 8eba2987ce5910725c9d22b92dd82c519e1bee19 [6488/10031] rust: opp: Add abstractions for the OPP table
config: x86_64-randconfig-102-20250509 (https://download.01.org/0day-ci/archive/20250510/202505101133.UjnqICiS-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101133.UjnqICiS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101133.UjnqICiS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 20.1.2
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
   rust/core.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/core.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
   rust/compiler_builtins.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/compiler_builtins.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
>> warning: fields `em` and `of` are never read
   --> rust/kernel/opp.rs:248:5
   |
   245 | pub struct Table {
   |            ----- fields in this struct
   ...
   248 |     em: bool,
   |     ^^
   249 |     of: bool,
   |     ^^
   |
   = note: `#[warn(dead_code)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
