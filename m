Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3085679F5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 21:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675113382; x=1706649382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=liO6542wYCjUgSQPlwja6cdvAhgCPO4bQG+qXd+80p4=;
  b=DtcTMQGCXqvDzbHXLAgnXTji05OfIB73xojQk5X3s4G2+SuA7KNg2fhl
   bb1dcGCxiAV/SDgtJEGJmtoZzRuQNND/tAL9jlH6OX99gOFedfBftfMg5
   9jSkeb1jb5vdk0mOAQrwq1kqnNDDdcd1/oRHXSixFwoV0xf3YSfccK612
   qeTiUFu8BoKpSbxMH3UXzTuGpqxZtD7x8/eQVtp0bfXVGV1ibzyzTluJa
   n6tUPC8bLYx0DNIOngh0NKNss3Jvkiqsu24Vdlh0wSkUCKqq3byfTPsIN
   S8x6VtBbn44iYPPqNbzIP/6VNmT0HCsdYZW35PQGmMab8Hy06E6saoR/8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="329788099"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="329788099"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 13:16:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="732843710"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="732843710"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Jan 2023 13:16:20 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMbVk-0003uW-0C;
	Mon, 30 Jan 2023 21:16:20 +0000
Date: Tue, 31 Jan 2023 05:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/wip 2/2] arch/powerpc/decode.c:17:15: error:
 conflicting types for 'arch_dest_reloc_offset'; have 'long unsigned
 int(int)'
Message-ID: <202301310527.8t1b2cln-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/wip
head:   aa1012f36a9c62c863908005e828b5a40a7e5c7a
commit: aa1012f36a9c62c863908005e828b5a40a7e5c7a [2/2] objtool: Rework arch_dest_reloc_offset()
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230131/202301310527.8t1b2cln-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=aa1012f36a9c62c863908005e828b5a40a7e5c7a
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue objtool/wip
        git checkout aa1012f36a9c62c863908005e828b5a40a7e5c7a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/decode.c:17:15: error: conflicting types for 'arch_dest_reloc_offset'; have 'long unsigned int(int)'
      17 | unsigned long arch_dest_reloc_offset(int addend)
         |               ^~~~~~~~~~~~~~~~~~~~~~
   In file included from tools/objtool/include/objtool/check.h:11,
                    from arch/powerpc/decode.c:5:
   tools/objtool/include/objtool/arch.h:86:15: note: previous declaration of 'arch_dest_reloc_offset' with type 'long unsigned int(struct reloc *)'
      86 | unsigned long arch_dest_reloc_offset(struct reloc *reloc);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   make[5]: *** [tools/build/Makefile.build:97: tools/objtool/arch/powerpc/decode.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [tools/build/Makefile.build:139: arch/powerpc] Error 2
   make[4]: *** Waiting for unfinished jobs....
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   make[3]: *** [Makefile:54: tools/objtool/objtool-in.o] Error 2
   make[2]: *** [Makefile:73: objtool] Error 2
   make[1]: *** [Makefile:1451: tools/objtool] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
