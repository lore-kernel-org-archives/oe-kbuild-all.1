Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92B61DA60D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 02:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777860203; cv=none; b=pyNrPiuLni2yAbAi89aImTdzDAcxQ45eXdjdOZY0kRaygrdphQ4yqPYf5LCg4D5ifF/mo8ItZ0JU2l0EaGmDHXlAVqwI7tbK9p5SOWmoizwNqFDegEOOZADzOkjQEWFVVslauOTIbFswRdNTjugk5NVYr/BRg02s2pmCdL65/JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777860203; c=relaxed/simple;
	bh=5q+aDFWWsmoEYarCtVtTA60RYntr7QsSk4tLJw0Yq8M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ArCA4Nr9780bAEJh18s8KtCQ1geo2Ze5GQTKo+3ifl9bpzsJhaRzbXk8n76XSHPRXhYO+EO5NAFoHhHdOMKHs3NaskY4Ufnh6z8XSfN4kr8UqQsUCCgJbFcK1Sqw6NFz3WUhaPBALpdPkJt0OSRqhZIZESnxvjIoiIWrmZulbf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApIRhuK2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApIRhuK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777860202; x=1809396202;
  h=date:from:to:cc:subject:message-id;
  bh=5q+aDFWWsmoEYarCtVtTA60RYntr7QsSk4tLJw0Yq8M=;
  b=ApIRhuK2TP8YGBgPp8/6QymUHTi4pPN0N+hRBVvBd9nv0qQ2aNXnG5vJ
   LFfhQ9BfSBvn8qo0RRut7O57CIMrqiWlxnoiKZOWdJVwY1g72LuT2U5Ps
   xvAoPjOtvrzfLbXe5rJbef1RFES+Bv29buEFla25N8ASS8mQQrn36fjOt
   ILDBis8zMt4tfYPJyXqVBcLDtaV1gRLDbqBBjbjfDxEPb9FF/DEsHvsJ+
   RHejBWtIG6r5sgZcNrFY6wKIsfmbYHhGprso8UBu/ywsqPnVpJj591bcP
   ikQPTj3JwP3mI1Qnm4Oci/koAWWaao9nWkpBjOZMCpxmJg6V1YhEGNd40
   Q==;
X-CSE-ConnectionGUID: BLuMto0+TlGUuimEU5cx5w==
X-CSE-MsgGUID: wx3sMSeaS5a34XN2Z4UPog==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89305605"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="89305605"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 19:03:21 -0700
X-CSE-ConnectionGUID: 6whSPdbLT9atHza4+3i0hw==
X-CSE-MsgGUID: M5mB8jZSQCmS1XZGQN2fgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="240379827"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 May 2026 19:03:20 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJieJ-000000003Mb-3Mmr;
	Mon, 04 May 2026 02:03:10 +0000
Date: Mon, 04 May 2026 10:02:03 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: <instantiation>:7:11: error: expected an immediate
Message-ID: <202605040908.kSvLCP9X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Marco,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66edb901bf874d9e0787326ba12d3548b2da8700
commit: 56651128e2fbad80f632f388d6bf1f39c928267a MIPS: Fix idle VS timer enqueue
date:   1 year ago
config: mips-randconfig-r052-20260503 (https://download.01.org/0day-ci/archive/20260504/202605040908.kSvLCP9X-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040908.kSvLCP9X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 56651128e2fb ("MIPS: Fix idle VS timer enqueue")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605040908.kSvLCP9X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:7:11: error: expected an immediate
    ori $26, r4k_wait_idle_size - 2
             ^
   <instantiation>:10:13: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
               ^
   <instantiation>:10:29: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
                               ^
>> <instantiation>:7:11: error: expected an immediate
    ori $26, r4k_wait_idle_size - 2
             ^
   <instantiation>:10:13: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
               ^
   <instantiation>:10:29: error: expected an immediate
    addiu $26, r4k_wait_exit - r4k_wait_insn + 2
                               ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
