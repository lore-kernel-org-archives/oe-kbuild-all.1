Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589F1443C3A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309971; cv=none; b=qNIIi7JhyQukYtxwn8s+4J5r5OROstPKTMVSQ7d0MHl2Q5K80YCknG+SY58ONevDodJHV68k3EpJwAI4+rInKj0rxHwLRWrMRiO4pc3G6lB5tmMkIdK6wm1lbM1J5/4JqAWZRBsQcUhJ+JmBdME15+eRIULOjWH731IxYwnBfNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309971; c=relaxed/simple;
	bh=4VZXHLiYck1jnAu2ciuFKmp7JIG/QfT7AimBGNlc2Ik=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XOU9Zz63Emesps2mZY3fP+M6DUlJk8hZyiPocNcg3fH8KI5/vXVKADtHHNrhLFXqNDf7lolSBHDssZEHOO0uJYKy65Ei+Keqd1Lren/ibx6NUFc37JphxhEFLMWSl6acnQeGwgXKuNr8Uvb0oE4mc/ESTOMZRuZlqneqJCaTfVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nc/iBDw6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nc/iBDw6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309970; x=1823845970;
  h=date:from:to:cc:subject:message-id;
  bh=4VZXHLiYck1jnAu2ciuFKmp7JIG/QfT7AimBGNlc2Ik=;
  b=Nc/iBDw6l4822T5WOJl+4eBG689KmkfZcJvESRhXA70+1AmC4dNywzx/
   PQi9zNTwzeA7Ws6om+B4MG/DqEMCRt1hnjNdGIT1D4aO+Hv2p7SAWN0Vn
   zt7CZOaej7Lt9HGt5xyEhYOKhHAEyVgbnqYRrWzza9n8HdAjHz7BT99b9
   ZLPVdxmjNdn3bSBk05UDU5IeVhVTtqVhv0xOj6jrBdrySxslU0acQkFQm
   i5YfBRF1H1/78vDuR9sW62ZV59F7ALlaxNEmLGMGv0aPFXFHH5f/bteG9
   diOu5STTt21hXuXz8cUNdDc5kDeOpHDaL4XCDgWKjJl24UUVvUTNp38HW
   w==;
X-CSE-ConnectionGUID: rsWlZS2SRhq8zzMU575wmw==
X-CSE-MsgGUID: NbLgj7V7TamaeOPPMCQeVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916703"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916703"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:40 -0700
X-CSE-ConnectionGUID: LkjF/1KETcWWa5Wdg4icgg==
X-CSE-MsgGUID: F/f3SRfkRG6gNoIcs/Y2MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340814"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh2-000000004xH-44i0;
	Sun, 18 Oct 2026 07:52:32 +0000
Date: Sun, 18 Oct 2026 09:46:12 +0200
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
Subject: [linux-next:master 16865/18293] vmlinux.o: error: objtool:
 do_jit(): unexpected end of section .text.do_jit
Message-ID: <202610171029.DfoBvNXv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
commit: 02cfd66f3d9a1aaab60b852f6bac902647db1e28 [16865/18293] bpf, x86: Divide by constants via multiplication with a magic number
config: x86_64-randconfig-r2200-20261015 (https://download.01.org/0day-ci/archive/20261017/202610171029.DfoBvNXv-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610171029.DfoBvNXv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610171029.DfoBvNXv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: do_jit(): unexpected end of section .text.do_jit
   vmlinux.o: error: objtool: __ioat_prep_pq_lock(): unexpected end of section .text.unlikely.__ioat_prep_pq_lock

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
