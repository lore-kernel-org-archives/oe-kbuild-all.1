Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E746D748D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 07:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BzPNHCnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699688311; x=1731224311;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ClHi/lvKudm0VUzNGD0EYcz8zeB62BSoUjOEho4bs8s=;
  b=BzPNHCnt1gQwxBDy1P5DA89jlpBk+yfXUlGDNo9MFH5T7Bp4L9biCa9h
   SejN3UkBBvSsQtPOoJ0S0suZ7SlEl+6tijKQY3ntWvJ/79spBnygZAzmT
   qgY3CPlJbQcnm+pn+FCF2RYYzWK1ssGWc7YB1S9KAkz+p4sVHzdUs/2lE
   D6uspKDGoxirCLKM9qNgpYbHA4o8kfIF+aFXWpFIKZUDP8IBKMclso0yC
   DQvzucsfvTa6z3icNGtJWsNJEf33pvzoahg8Ts7uiSa5Do5ADgnWUcHY7
   owhtd6HxlTA3R6aOxSmC5cQwvtfv/uN8KAOAze0Quk2LgmeOfnYxJUVM0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="454563376"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="454563376"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 23:38:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="740318729"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="740318729"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Nov 2023 23:38:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1iZY-000AIm-1N
	for oe-kbuild-all@lists.linux.dev;
	Sat, 11 Nov 2023 07:38:28 +0000
Date: Sat, 11 Nov 2023 15:38:09 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 12057/30000] fs/f2fs/data.o: warning:
 objtool: __f2fs_submit_read_bio()+0x12f: sibling call from callable
 instruction with modified stack frame
Message-ID: <202311111522.30eT818C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   b0d2cfb03adf70bb24abac09facf2edc99111de4
commit: c7b7e54aee930bf333b83c66e9ca7d87b39206e1 [12057/30000] Merge remote-tracking branch 'aosp/upstream-f2fs-stable-linux-4.19.y' into android-4.19
config: x86_64-buildonly-randconfig-003-20231111 (https://download.01.org/0day-ci/archive/20231111/202311111522.30eT818C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111522.30eT818C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111522.30eT818C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/data.o: warning: objtool: __f2fs_submit_read_bio()+0x12f: sibling call from callable instruction with modified stack frame
   fs/f2fs/data.o: warning: objtool: missing symbol for section .init.text


objdump-func vmlinux.o __f2fs_submit_read_bio:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
