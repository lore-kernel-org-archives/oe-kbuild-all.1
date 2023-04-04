Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A987E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 09:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680601758; x=1712137758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zG+p9kmq2G/b06BQK3zO6+xgQx7ajx9KhWLY5tlTpWA=;
  b=I0Xh6Hvrw0QOgQpbTdbCamEjaO6DeSf+j5XwE1H27XwzHoXXqY34lCmc
   d4KxHKQ4NGTCy2uz7g+G/Fgy+BUm6TGhxq6b2rkjNmp8zSRbHSefnmQPf
   GjlyhJr8aTO662jAaLVnhOl9VylKDKMbeBR/ZYT8iw6OXgMbnPs715emV
   b+5qzsbXG3NgkVwU+tv3/J99ciRuFJ9LN/VM/jHslQ3F7fvfO4GevrYtH
   UX7B8NtTCiKwZyH/++wh802UMdjSVOWyDK1puLcbt719YKcYQtyEooBlP
   jki6G12ZllG3QDOZzfTdbnU+uXHjwXmYKS9eKRGvdIf1EPRQFKX45k4zP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="428423541"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="428423541"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 02:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="1016063036"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="1016063036"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Apr 2023 02:49:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjdHq-000PVW-2n;
	Tue, 04 Apr 2023 09:49:10 +0000
Date: Tue, 4 Apr 2023 17:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <seanga2@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Simon Horman <simon.horman@corigine.com>
Subject: [linux-next:master 6282/9010] arch/m68k/include/asm/irq.h:78:11:
 error: expected ';' before 'void'
Message-ID: <202304041748.0sQc4K4l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a53bda3aaf3de5edeea27d0b1d8781d067640b6
commit: 1ff4f42aef609757c334947f60612b4691b95c8a [6282/9010] net: sunhme: Alphabetize includes
config: m68k-randconfig-s041-20230403 (https://download.01.org/0day-ci/archive/20230404/202304041748.0sQc4K4l-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=1ff4f42aef609757c334947f60612b4691b95c8a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1ff4f42aef609757c334947f60612b4691b95c8a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash drivers/net/ethernet/sun/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041748.0sQc4K4l-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/sun/sunhme.c:19:
>> arch/m68k/include/asm/irq.h:78:11: error: expected ';' before 'void'
      78 | asmlinkage void do_IRQ(int irq, struct pt_regs *regs);
         |           ^~~~~
         |           ;
>> arch/m68k/include/asm/irq.h:78:40: warning: 'struct pt_regs' declared inside parameter list will not be visible outside of this definition or declaration
      78 | asmlinkage void do_IRQ(int irq, struct pt_regs *regs);
         |                                        ^~~~~~~


vim +78 arch/m68k/include/asm/irq.h

3ddc7e261a990d0 Greg Ungerer       2009-06-26  77  
739735d5fea3c39 Geert Uytterhoeven 2011-07-03 @78  asmlinkage void do_IRQ(int irq, struct pt_regs *regs);
4936f63cb790e26 Geert Uytterhoeven 2011-04-21  79  extern atomic_t irq_err_count;
739735d5fea3c39 Geert Uytterhoeven 2011-07-03  80  

:::::: The code at line 78 was first introduced by commit
:::::: 739735d5fea3c3997b2a659068a618b07bc9a73a m68knommu: Move forward declaration of do_IRQ() from machdep.h to irq.h

:::::: TO: Geert Uytterhoeven <geert@linux-m68k.org>
:::::: CC: Greg Ungerer <gerg@uclinux.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
