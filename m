Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005342F25E4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 21:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767733869; cv=none; b=kkVZwTEyzGe8eYNFrdzULnZ2eo5ib7vDgDFIzk/GZ2lIH2rkkw4kI2T7eWCzmqBZ+xCmp2gnyxUja0A1T4H4yttuifBa6MIo/0jIIZLI34s0qZ3a791XK6Z9cdNw7It+WXxnswJfpZcs7orBxmO17LYkUGDm1X43ZstWK8lw69A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767733869; c=relaxed/simple;
	bh=CYYccm1tiSQ/bFrh6Jc3gGf7LFn1W3IfLoa/IHKYsIY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=smFLcEDCDvijkh7cKkfhPYcRMwX9utse5pFtVNwCYJJS30zq4BCkgzSqK1TqrD9swGAZg6n5qIkzo0vabJYwY3fmgVfZjkWxAmqlqnSG62CRrz6Zrm+8HjOXLEaCgt03AHwWOFqvrgwt7HL38dMqdetr37YWxkeXd6Jjo5OzEnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VEz0AztN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEz0AztN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767733867; x=1799269867;
  h=date:from:to:cc:subject:message-id;
  bh=CYYccm1tiSQ/bFrh6Jc3gGf7LFn1W3IfLoa/IHKYsIY=;
  b=VEz0AztN/iBwBOztIj2Y7yW4v2wrfix7h5h4VO1ANbWYhW8IkDQkZfLN
   KC71xOFeIrsY81g3U35dcf7466Lwd00SoCcY/2bGfg8+bPG9xv/W/c2vH
   HOYhDOeBgntm/nxyL6pAdFCT334muWxO0OjCICy+6aFDoy5tLF7+vxPwY
   enbtGcfOS/ncibmcUFP/SEE8lt36PWRXsY4JzLylCRVhPz7JbMc6XQubP
   IxnsthbUyU1eACy9vly9gZkW9UbgHaP0qQ/ytWNfmknT7jjujWOlsc5A/
   NFPyvAM0d+z5lurfZkkoidHRIm1dsy/F+EE1cbuzYpICtkw7uNU92Pst+
   A==;
X-CSE-ConnectionGUID: paW0joLUS6mG+J1fLT1yrQ==
X-CSE-MsgGUID: JwLF/hKzTai8ckcTBMxs2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69151330"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69151330"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 13:11:02 -0800
X-CSE-ConnectionGUID: 2ZzkAjCMQIK16hbMYBmvZg==
X-CSE-MsgGUID: Qk4qamOxRli75dbWCndnlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="206898990"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Jan 2026 13:11:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdEKR-000000003EJ-13wx;
	Tue, 06 Jan 2026 21:10:59 +0000
Date: Wed, 07 Jan 2026 05:10:48 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_mon_kunit 28/29] ld.lld: error: undefined
 symbol: kunit_add_action_or_reset
Message-ID: <202601070559.jsioInIm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_mon_kunit
head:   aa87c6b5e8020a853fbc2444ded06a93a7fc1493
commit: a3b580a4d59f349042745e54cb77765dffbdabf3 [28/29] rv: Add KUnit tests for some LTL monitors
config: i386-randconfig-006-20260106 (https://download.01.org/0day-ci/archive/20260107/202601070559.jsioInIm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601070559.jsioInIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601070559.jsioInIm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kunit_add_action_or_reset
   >>> referenced by ltl_monitor.h:202 (include/rv/ltl_monitor.h:202)
   >>>               kernel/trace/rv/monitors/pagefault/pagefault.o:(rv_test_pagefault) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
