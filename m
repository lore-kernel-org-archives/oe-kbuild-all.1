Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822C462F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 03:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676692189; x=1708228189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ANDVx12Dv3YxWNX2mTnBvoZMCJt+fTARZAaWovlC2PU=;
  b=Kq5pljwLsHXhM3dK0TH1zhD7xeXl0YtL5Hd0TzoKNGl0EsPx4LLHoZVT
   /RlsaG29iFA9D+q807yDlKShMFhRUPZHA5C0mgsKPYQw4XYGsvFN5BKgm
   sf/KUfP+pUdj1oEvk0PTcpXlMDFTihhzZzJmSFZ19gE15R+iNbOiHVGof
   ySEFcCZAIXqlwfhsCXEU9SAvg99Hs/3UX9+xKL3BHl+DjCV1xBsem4y30
   VX9Fu/Vc+HrPedQ1VT0p49dqUSmTfRuPSmqzBCtIM3cOb9u3QeFU6VnU8
   7rcIhFqOjj0Hun90TcFfPMFIY5UHQcIPCcli2S+l0YPLoHyu+BzoUN6DW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="312506143"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="312506143"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 19:49:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="648281666"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="648281666"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Feb 2023 19:49:47 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTEEM-000C61-0f;
	Sat, 18 Feb 2023 03:49:46 +0000
Date: Sat, 18 Feb 2023 11:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/mm/nohash/e500.c:314:21: warning: no previous prototype
 for 'relocate_init'
Message-ID: <202302181136.wgyCKUcs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   38f8ccde04a3fa317b51b05e63c3cb57e1641931
commit: 3e7318584dfec11992f3ac45658c4bc1210b3778 powerpc: Remove CONFIG_PPC_FSL_BOOK3E
date:   5 months ago
config: powerpc-randconfig-r034-20230218 (https://download.01.org/0day-ci/archive/20230218/202302181136.wgyCKUcs-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3e7318584dfec11992f3ac45658c4bc1210b3778
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3e7318584dfec11992f3ac45658c4bc1210b3778
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/mm/nohash/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302181136.wgyCKUcs-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/powerpc/mm/nohash/e500.c:314:21: warning: no previous prototype for 'relocate_init' [-Wmissing-prototypes]
     314 | notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)
         |                     ^~~~~~~~~~~~~


vim +/relocate_init +314 arch/powerpc/mm/nohash/e500.c

dd189692d40948 arch/powerpc/mm/fsl_booke_mmu.c Kevin Hao 2013-12-24  311  
dd189692d40948 arch/powerpc/mm/fsl_booke_mmu.c Kevin Hao 2013-12-24  312  #ifdef CONFIG_RELOCATABLE
7d2471f9fa8508 arch/powerpc/mm/fsl_booke_mmu.c Kevin Hao 2013-12-24  313  int __initdata is_second_reloc;
7d2471f9fa8508 arch/powerpc/mm/fsl_booke_mmu.c Kevin Hao 2013-12-24 @314  notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)

:::::: The code at line 314 was first introduced by commit
:::::: 7d2471f9fa85089beb1cb9436ffc28f9e11e518d powerpc/fsl_booke: make sure PAGE_OFFSET map to memstart_addr for relocatable kernel

:::::: TO: Kevin Hao <haokexin@gmail.com>
:::::: CC: Scott Wood <scottwood@freescale.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
