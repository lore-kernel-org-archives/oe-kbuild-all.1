Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8B54B1E5E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 03:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746673701; cv=none; b=aEmarkm6ZeSuxx03mnOKICu0TdZ/AFNCReJtYIOB84ea3ElL7V7HVcaIpZ5vkv7RIrW4bfXW74CGsuUjEDuqzAKBPozdHD+NDYsrUJEIR/2VZi3mBHjk6VKiCDJ4LnID7sMqNcaRvWeWfff83PSUGdg5CAA2zt91F0ozkGAKLns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746673701; c=relaxed/simple;
	bh=yML5g/MS9ClmkpXANu7PskC40tiAUW9Hf7znLkoiYKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a2FSlBlM7GUOW8NzptxQ8y5SYOFv7UD7gIDWaQmiuP2fkYPdQa+nkHIpJDacYH3uvWZIayM2O3kTd0sKxX4ZrWCWpNRdrnDq3y73T8PS/2PwrjgrbILFJmSNVcelvtNtNsmIIll425TWpueUwCcslG42B/z5HvDl0qVHLvwzqfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8djX3Ne; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8djX3Ne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746673699; x=1778209699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yML5g/MS9ClmkpXANu7PskC40tiAUW9Hf7znLkoiYKY=;
  b=M8djX3NejT7QRsNEst9gl7eYVACXHK9PVUBSkX8c8vcLp17eB42Vv4s8
   JafGsfZ6RSx/82rwt2CPhqnI4fmuWmZhvT36VgXTO6jL1W4aBuN8mnOcj
   v5DW9ZMXLABEDszh8aRZVSe9FFhNFmo1maRgxk87NuihoVYbGSJqKISOn
   2O4UGoKHKTtbJ7Ben2XdZwFFZO5LAStVCguEyTForpa8EnQHVYfW8SsYT
   PhwJDfvN8ARukpb1KC7/UbQ5UwG6wNeDg537fmLLVG6FmzziA5JgeZh7E
   ewePSkTsy6c3aH96GGX07e7+Bj56rRLCQ/vNJZumCyikri8cLooROdn7u
   Q==;
X-CSE-ConnectionGUID: YkhhVS3LSYKWbuU+7IaH5Q==
X-CSE-MsgGUID: eWSGH/OsTIqmNkxDoASl3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="36065904"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="36065904"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 20:08:17 -0700
X-CSE-ConnectionGUID: 3QuXDR0USdC09K5jk4ewEA==
X-CSE-MsgGUID: Q1kS3p+SSnufKHsSlmbNyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="141110929"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 May 2025 20:08:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCrcM-0009dC-0D;
	Thu, 08 May 2025 03:08:14 +0000
Date: Thu, 8 May 2025 11:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 35/38] weak.c:30:12: error: redefinition of
 'cmd_klp'
Message-ID: <202505081013.lfCq9z0R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   c7cf40de61ae56a6194b17089d0920c690f27a5d
commit: 1584ec1b1a2df9307ce52e215aa044ac6a5c9f64 [35/38] objtool, livepatch: Livepatch module generation
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20250508/202505081013.lfCq9z0R-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081013.lfCq9z0R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081013.lfCq9z0R-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> weak.c:30:12: error: redefinition of 'cmd_klp'
      30 | int __weak cmd_klp(int argc, const char **argv)
         |            ^~~~~~~
   In file included from weak.c:12:
   tools/objtool/include/objtool/builtin.h:55:12: note: previous definition of 'cmd_klp' with type 'int(int,  const char **)'
      55 | static int cmd_klp(int argc, const char **argv)
         |            ^~~~~~~
>> tools/objtool/include/objtool/builtin.h:55:12: warning: 'cmd_klp' defined but not used [-Wunused-function]
   In file included from arch/powerpc/special.c:5:
>> tools/objtool/include/objtool/builtin.h:55:12: warning: 'cmd_klp' defined but not used [-Wunused-function]
      55 | static int cmd_klp(int argc, const char **argv)
         |            ^~~~~~~
   make[5]: *** [tools/build/Makefile.build:86: tools/objtool/weak.o] Error 1
   In file included from tools/objtool/include/objtool/warn.h:15,
                    from arch/powerpc/decode.c:8:
>> tools/objtool/include/objtool/builtin.h:55:12: warning: 'cmd_klp' defined but not used [-Wunused-function]
      55 | static int cmd_klp(int argc, const char **argv)
         |            ^~~~~~~
   In file included from special.c:15:
>> tools/objtool/include/objtool/builtin.h:55:12: warning: 'cmd_klp' defined but not used [-Wunused-function]
      55 | static int cmd_klp(int argc, const char **argv)
         |            ^~~~~~~
   In file included from builtin-check.c:14:
>> tools/objtool/include/objtool/builtin.h:55:12: warning: 'cmd_klp' defined but not used [-Wunused-function]
      55 | static int cmd_klp(int argc, const char **argv)
         |            ^~~~~~~
   In file included from elf.c:22:
>> tools/objtool/include/objtool/builtin.h:55:12: warning: 'cmd_klp' defined but not used [-Wunused-function]
      55 | static int cmd_klp(int argc, const char **argv)
         |            ^~~~~~~
   In file included from check.c:12:
>> tools/objtool/include/objtool/builtin.h:55:12: warning: 'cmd_klp' defined but not used [-Wunused-function]
      55 | static int cmd_klp(int argc, const char **argv)
         |            ^~~~~~~
   In function 'is_first_func_insn',
       inlined from 'add_jump_destinations' at check.c:1675:7:
   check.c:1528:17: warning: 'dest_insn' may be used uninitialized [-Wmaybe-uninitialized]
    1528 |         if (insn->offset == func->offset)
         |             ~~~~^~~~~~~~
   check.c: In function 'add_jump_destinations':
   check.c:1554:37: note: 'dest_insn' was declared here
    1554 |                 struct instruction *dest_insn;
         |                                     ^~~~~~~~~
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:81: tools/objtool/objtool-in.o] Error 2
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:72: objtool] Error 2
   make[2]: *** [Makefile:1454: tools/objtool] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
