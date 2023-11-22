Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1420F21A15
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 12:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MnYww0ce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700656972; x=1732192972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xoNT5F/PSZM2K7z4lm0TbxulDLaA68zFM55Mt/TqWdY=;
  b=MnYww0cenN/Et3KOgQLksOV4b8521ktV9SatrR9TPBegfS++HewRet5u
   tzeaHdrHGO+7xsZnCgLbJIpnIVMMwSnxVBXA6ks814IbElSipCnQiXrd/
   /mq0vmlPGQTjNLmuwW4P3EqaJo1mHesEsNdiYi+1edewanuYvCszosOf2
   ZTC9vUZTQTe+8Ww9J/1O0SmF0DHQIE86GDJwC/qhjEWsnCRDTUD62yBfF
   YEgr0g5p7DKTi0sVqp/bud1JwxgRadHG5zq6RXLrgBcV09awjOUUKKfkB
   8guHfiDIs6JXPBix19noeWOYeexdDX/p8zpMTXmt06/UoJmPscrmAW4Ez
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="391815118"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="391815118"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 04:42:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="910779570"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="910779570"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2023 04:42:48 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5mZ4-0000T8-1M;
	Wed, 22 Nov 2023 12:42:46 +0000
Date: Wed, 22 Nov 2023 20:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: arch/powerpc/include/asm/ftrace.h:28 ftrace_call_adjust() warn:
 inconsistent indenting
Message-ID: <202311221731.alUwTDIm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2d5304e6c648ebcf653bace7e51e0e6742e46c8
commit: 0f71dcfb4aef6043da6cc509e7a7f6a3ae87c12d powerpc/ftrace: Add support for -fpatchable-function-entry
date:   3 months ago
config: powerpc-randconfig-r071-20231122 (https://download.01.org/0day-ci/archive/20231122/202311221731.alUwTDIm-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311221731.alUwTDIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221731.alUwTDIm-lkp@intel.com/

smatch warnings:
arch/powerpc/include/asm/ftrace.h:28 ftrace_call_adjust() warn: inconsistent indenting

vim +28 arch/powerpc/include/asm/ftrace.h

8fd6e5a8c81e2e Steven Rostedt 2008-11-14  22  
8fd6e5a8c81e2e Steven Rostedt 2008-11-14  23  static inline unsigned long ftrace_call_adjust(unsigned long addr)
8fd6e5a8c81e2e Steven Rostedt 2008-11-14  24  {
0f71dcfb4aef60 Naveen N Rao   2023-06-19  25  	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY))
0f71dcfb4aef60 Naveen N Rao   2023-06-19  26  		addr += MCOUNT_INSN_SIZE;
0f71dcfb4aef60 Naveen N Rao   2023-06-19  27  
8fd6e5a8c81e2e Steven Rostedt 2008-11-14 @28         return addr;
8fd6e5a8c81e2e Steven Rostedt 2008-11-14  29  }
8fd6e5a8c81e2e Steven Rostedt 2008-11-14  30  

:::::: The code at line 28 was first introduced by commit
:::::: 8fd6e5a8c81e2e9b912ea33c8425a10729db469b powerpc: ftrace, convert to new dynamic ftrace arch API

:::::: TO: Steven Rostedt <srostedt@redhat.com>
:::::: CC: Steven Rostedt <srostedt@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
