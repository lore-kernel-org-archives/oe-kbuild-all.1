Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910D72582
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 21:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680902349; x=1712438349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FdIw7BOKsAFqhvkAR/laTcmM9g+qgDHYW9oZNi2xqqg=;
  b=AIHVdd2eJQLdyvJgffgusmnJpMWrm39kHutn8IMGwC+f6PQRvohx1VYR
   LoF4ZjD6YpO3L7Dj5/12YnVwYTF7+tom5MkCHfR/cPIZx0lKrLJIxZ78B
   A4A5IWiVnn4624QQviXocz1TPHNXx9bu8zfxm8K7gtJSjyXlQ0b01UEDf
   FZyggOdqGIiinqgK+pmDJKP2DBtQcIIZHCAmUHpt4rEV29BVrS1zTcKoF
   vyn3otfEP85WgDzEmBPSepz3nDoRkE8B4VvFGgolkGLxuGYB36qQy2uaj
   eVSxVi8+cLINcMPLewv1fnoWqXD4Wsoyu+z9yFvWtG1eQLfNpjcmaRest
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="370905862"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="370905862"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 14:19:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="811516496"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="811516496"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Apr 2023 14:19:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pktU9-000Stm-2z;
	Fri, 07 Apr 2023 21:19:05 +0000
Date: Sat, 8 Apr 2023 05:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@suse.de>, Josh Poimboeuf <jpoimboe@kernel.org>
Subject: vmlinux.o: warning: objtool: xen_hypercall_iret+0x0: RET before
 UNTRAIN
Message-ID: <202304080538.j5G6h1AB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2afccfefe7be1f7346564fe619277110d341f9b
commit: a09a6e2399ba0595c3042b3164f3ca68a3cff33e objtool: Add entry UNRET validation
date:   10 months ago
config: x86_64-randconfig-a012-20221205 (https://download.01.org/0day-ci/archive/20230408/202304080538.j5G6h1AB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a09a6e2399ba0595c3042b3164f3ca68a3cff33e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a09a6e2399ba0595c3042b3164f3ca68a3cff33e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080538.j5G6h1AB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   vmlinux.o: warning: objtool: cdce925_regmap_i2c_write+0xdb: stack state mismatch: cfa1=4+120 cfa2=5+40
>> vmlinux.o: warning: objtool: xen_hypercall_iret+0x0: RET before UNTRAIN


objdump-func vmlinux.o xen_hypercall_iret:
0000 00000000000002e0 <xen_hypercall_iret>:
0000      2e0:	c3                   	ret
0001      2e1:	cc                   	int3
0002      2e2:	cc                   	int3
0003      2e3:	cc                   	int3
0004      2e4:	cc                   	int3
0005      2e5:	cc                   	int3
0006      2e6:	cc                   	int3
0007      2e7:	cc                   	int3
0008      2e8:	cc                   	int3
0009      2e9:	cc                   	int3
000a      2ea:	cc                   	int3
000b      2eb:	cc                   	int3
000c      2ec:	cc                   	int3
000d      2ed:	cc                   	int3
000e      2ee:	cc                   	int3
000f      2ef:	cc                   	int3
0010      2f0:	cc                   	int3
0011      2f1:	cc                   	int3
0012      2f2:	cc                   	int3
0013      2f3:	cc                   	int3
0014      2f4:	cc                   	int3
0015      2f5:	cc                   	int3
0016      2f6:	cc                   	int3
0017      2f7:	cc                   	int3
0018      2f8:	cc                   	int3
0019      2f9:	cc                   	int3
001a      2fa:	cc                   	int3
001b      2fb:	cc                   	int3
001c      2fc:	cc                   	int3
001d      2fd:	cc                   	int3
001e      2fe:	cc                   	int3
001f      2ff:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
