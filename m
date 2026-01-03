Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C98A14A8E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 10:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767434481; cv=none; b=UbCtIETVj2KFIx84unW3FFSRNwiyCmNCjtbncvjCN4+/1qg0+4xPwom7FzRW6B/O+aryIJES+dvEzxINMHNzpLgi1dm20EgrE9zxOFEWnkEauKxIbqXJLUC28/+BXUbzqadEPuLPdNRZBioG/nZNpH+xWzjVQ7neIC0fJhQOYHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767434481; c=relaxed/simple;
	bh=yvy8cppKuP5e+ge5JpLXNvc0XEd6g3kyrVdhot6DpIc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j2DvQl47JPAQD6q75M/BIYLbgujs9zrWXdjclTWuXsRgywGxMxDb7bIsOJ634AmSlmftsdLozc46saNGUiR84czZ2fRZlULo6E6InKGcEUT7f6MuTR446U0441vP91wgH+nRrVCS8ez6KWf+kQaN8PwtFMia6AFoKt3VNwZYkRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jlo+JOKM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jlo+JOKM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767434479; x=1798970479;
  h=date:from:to:cc:subject:message-id;
  bh=yvy8cppKuP5e+ge5JpLXNvc0XEd6g3kyrVdhot6DpIc=;
  b=Jlo+JOKMkS/2u6yXnzCs2O/Etnt1OuclFlumqYdBZ1Jpro+XZMq0FHVz
   +EsqdrX++BfzqmQlxTlGdITUUTydo97UPvmwQ6HQwfUlZTuJTm+Fzqhyy
   cXKliQxJHyFukP3A5rOudTIhNJRdBpD+brzwR90PDDfsxemD9SS91xCrJ
   Ovm5wLvAppE1yzRBXIWPy48dO5Rvc7QiNWef9Q3INpzlkukZdSDRGdCHc
   6qtuVRj0FhejZEx1iI2xmurE44B11CXMa/d76yfiq34QFageVIj4Q12jk
   S+d2m6fRPLEB5hFtQTukBrq6W159UKJ3Z9kQDixWZIbpfg/5XLVUPHfoR
   Q==;
X-CSE-ConnectionGUID: wjBoetMATz6JVsNqKLiivQ==
X-CSE-MsgGUID: lQb475GxTdWczAa/5Sb3sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68964323"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="68964323"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 02:01:18 -0800
X-CSE-ConnectionGUID: pOV1CwkQT8CJq5XWaCpA4g==
X-CSE-MsgGUID: 5EodV5tiRi+EPuLSUSiSAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="202231319"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jan 2026 02:01:17 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbyRf-000000000gP-0MK4;
	Sat, 03 Jan 2026 10:01:15 +0000
Date: Sat, 03 Jan 2026 11:00:41 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 100/100]
 ovpn-cli.c:1587:6: warning: variable 'ret' is used uninitialized whenever
 'if' condition is true
Message-ID: <202601031113.fxtcBiVu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Antonio,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   e1773fca7bbe71a1c47964a2938c1a021dc519ff
commit: 959bc330a4396c4c52e790e62e23141967b39ef9 [100/100] testing/selftests: add test tool and scripts for ovpn module
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260103/202601031113.fxtcBiVu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601031113.fxtcBiVu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601031113.fxtcBiVu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ovpn-cli.c:1587:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1587 |         if (!sock) {
         |             ^~~~~
   ovpn-cli.c:1635:9: note: uninitialized use occurs here
    1635 |         return ret;
         |                ^~~
   ovpn-cli.c:1587:2: note: remove the 'if' if its condition is always false
    1587 |         if (!sock) {
         |         ^~~~~~~~~~~~
    1588 |                 fprintf(stderr, "cannot allocate netlink socket\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1589 |                 goto err_free;
         |                 ~~~~~~~~~~~~~~
    1590 |         }
         |         ~
   ovpn-cli.c:1584:15: note: initialize the variable 'ret' to silence this warning
    1584 |         int mcid, ret;
         |                      ^
         |                       = 0
>> ovpn-cli.c:2100:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
    2100 |         case CMD_INVALID:
         |              ^~~~~~~~~~~
   ovpn-cli.c:2104:9: note: uninitialized use occurs here
    2104 |         return ret;
         |                ^~~
   ovpn-cli.c:1932:12: note: initialize the variable 'ret' to silence this warning
    1932 |         int n, ret;
         |                   ^
         |                    = 0
   2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
