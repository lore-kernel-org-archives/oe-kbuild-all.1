Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDC4285C91
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 22:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765579523; cv=none; b=tpB1gok5pVXE+8s6F4vVXiZLdQnUjKtuOIHO+QPai7KwACQ8kNRvW0oEEJ3sblZqkwg25izO1sHAKUdQc5APG9uJTC/YiBYOfJVtuyKci5vJX44dTqIhw3315Mi04z4CYfYEouxe7PpIC0k3EV190u48k5uDWEfshgVHxUiOhto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765579523; c=relaxed/simple;
	bh=IkK8EbPs45k0510SC6fguqpyX0F3eAw0SctIv7V6S2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cfet7ZYPzrZiVkaANHa3lnSAUx+6f/kWeGlqfSxhasdWMZ3zGSjAM2RX0wCKqdl42WCVaKwE5T0b/sa/erpc+PrYplVcRk9qmmc8m6E1natVFs9CXngoruUAcm4DpvQtCVfrLIGHX9q5ykOH11X6ZdrqOz8eY/4hAT6dW7Qfovg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNN0X4X+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNN0X4X+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765579522; x=1797115522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IkK8EbPs45k0510SC6fguqpyX0F3eAw0SctIv7V6S2M=;
  b=CNN0X4X+bhdmzNLuCva9aa+IHqjAOMW0Oz3gHmUmS71Sv2pISAsWTIb1
   LDsA4ROwjJHpS+8sz7BiaBWFj0E+j8LMhOSSqo78sKbHYC9swwPoHtzL5
   XuAjyYsdAqVhzcFwzkP2NOg6+uLkgrMDNX/LSgFwcVC2eJR1btJdDUia0
   Uc8pZl69ITFXeFYP7Pt2wuZj+MIsaNpqVEuHqoMfONtQJev1NVODrGHFA
   YbU3OywBvSLnsXhwlMDeIqmcSsBdfXEwz247qpWE4wp7StvBUYYPlf8HC
   Hc8Krdgp3QqAviR4Ykiuy1rDdVZlcledg+TxuNv6C8KIhZ9IVcBJ6o8Vd
   Q==;
X-CSE-ConnectionGUID: rqVU/4yvRFSmdBAJtlbqvQ==
X-CSE-MsgGUID: XZba8ZbhRlGxKoNJ1clDuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67338672"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67338672"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 14:45:21 -0800
X-CSE-ConnectionGUID: 5wP25bDCRE6yrUo3lQuxQQ==
X-CSE-MsgGUID: h0Z/WOG9SFGvLCDAw4aJ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196954912"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 12 Dec 2025 14:45:20 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUBt0-000000001r6-0l5W;
	Fri, 12 Dec 2025 22:45:18 +0000
Date: Fri, 12 Dec 2025 23:45:15 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 40/40] proc-empty-vm.c:154:18:
 error: invalid output size for constraint '+a'
Message-ID: <202512122348.Wqum4SGI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   dd79c421671d7417fa9ad8465ca823298cd5fa14
commit: 4d2ee43ac2a906833636db6d456370a567fa409c [40/40] selftests: fix LLVM build for i386 and x86_64
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512122348.Wqum4SGI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512122348.Wqum4SGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512122348.Wqum4SGI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> proc-empty-vm.c:154:18: error: invalid output size for constraint '+a'
     154 |                         : [rax] "+a" (rax)
         |                                       ^
   proc-empty-vm.c:350:2: error: "implement 'unmap everything'"
     350 | #error "implement 'unmap everything'"
         |  ^
   2 errors generated.
--
   error: register allocation failed: maximum depth for recoloring reached. Use -fexhaustive-register-search to skip cutoffs
   In file included from param_test.c:269:
   In file included from ./rseq.h:85:
>> ./rseq-x86.h:1256:3: error: inline assembly requires more registers than available
    1256 |                 RSEQ_ASM_DEFINE_TABLE(3, 1f, 2f, 4f) /* start, commit, abort */
         |                 ^
   ./rseq-x86.h:681:2: note: expanded from macro 'RSEQ_ASM_DEFINE_TABLE'
     681 |         __RSEQ_ASM_DEFINE_TABLE(label, 0x0, 0x0, start_ip,              \
         |         ^
   ./rseq-x86.h:670:3: note: expanded from macro '__RSEQ_ASM_DEFINE_TABLE'
     670 |                 ".pushsection __rseq_cs, \"aw\"\n\t"                    \
         |                 ^
   error: register allocation failed: maximum depth for recoloring reached. Use -fexhaustive-register-search to skip cutoffs
   error: register allocation failed: maximum depth for recoloring reached. Use -fexhaustive-register-search to skip cutoffs
   error: register allocation failed: maximum depth for recoloring reached. Use -fexhaustive-register-search to skip cutoffs
   error: register allocation failed: maximum depth for recoloring reached. Use -fexhaustive-register-search to skip cutoffs
   ./rseq-x86.h:1139:3: error: inline assembly requires more registers than available
    1139 |                 RSEQ_ASM_DEFINE_TABLE(3, 1f, 2f, 4f) /* start, commit, abort */
         |                 ^
   ./rseq-x86.h:681:2: note: expanded from macro 'RSEQ_ASM_DEFINE_TABLE'
     681 |         __RSEQ_ASM_DEFINE_TABLE(label, 0x0, 0x0, start_ip,              \
         |         ^
   ./rseq-x86.h:670:3: note: expanded from macro '__RSEQ_ASM_DEFINE_TABLE'
     670 |                 ".pushsection __rseq_cs, \"aw\"\n\t"                    \
         |                 ^
   error: register allocation failed: maximum depth for recoloring reached. Use -fexhaustive-register-search to skip cutoffs
   8 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
