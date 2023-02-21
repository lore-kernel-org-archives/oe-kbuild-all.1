Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF924C64
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 16:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676995724; x=1708531724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CjbBVUAYGQTCRynDs+hW0RpIMdA5nvhOrk5X1Bg88zU=;
  b=HWVPGIhyal40bmlmYT8gKYKkkqle8nvkDaICiOOjPG7ZVJ6NkaPM0/v4
   viDRdnarmW/zVwlQRv7Gy741KfnutEoKGRBHQNpZdEBTCROaTF5u5649E
   56Ij7bXV4qB1+67Qc98jMXodxuCkDlQDMheKTWJEZ6wi8m5KAbbR8Y7fQ
   KbgoBJlelsb6GTkBf8d1ctJz4Xb3Qg5WB0h6C/rwWywycB7Mk4ijll1YP
   QwbB6uwDpMc4vQ+a5M1TtX+8TRlOsp2K1FJj0lj/wHvTp1X5w0vb/8WqA
   wPP6MkBkb8Zm9vvCmlMeFHb3cDTbV3r95FCG81dNEUzKQb9iZ8tW9XuGU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="397360019"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="397360019"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 08:08:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="665023833"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="665023833"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Feb 2023 08:08:19 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUVBi-000Ewy-2q;
	Tue, 21 Feb 2023 16:08:18 +0000
Date: Wed, 22 Feb 2023 00:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>
Subject: [chenhuacai-loongson:loongarch-next 7/16]
 arch/loongarch/kernel/ptrace.c:840:6: warning: no previous prototype for
 'ptrace_triggered'
Message-ID: <202302220046.NcfYXnsY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   360d80e15dc47f8892dd09e6bff3a7f1e9aa8fb4
commit: f6c0ee528467670080d4036e2a430d2d6e75a5a1 [7/16] LoongArch: ptrace: Add hardware single step support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230222/202302220046.NcfYXnsY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/commit/?id=f6c0ee528467670080d4036e2a430d2d6e75a5a1
        git remote add chenhuacai-loongson https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git
        git fetch --no-tags chenhuacai-loongson loongarch-next
        git checkout f6c0ee528467670080d4036e2a430d2d6e75a5a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash arch/loongarch/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220046.NcfYXnsY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/kernel/ptrace.c:840:6: warning: no previous prototype for 'ptrace_triggered' [-Wmissing-prototypes]
     840 | void ptrace_triggered(struct perf_event *bp,
         |      ^~~~~~~~~~~~~~~~


vim +/ptrace_triggered +840 arch/loongarch/kernel/ptrace.c

   838	
   839	#ifdef CONFIG_HAVE_HW_BREAKPOINT
 > 840	void ptrace_triggered(struct perf_event *bp,
   841			      struct perf_sample_data *data, struct pt_regs *regs)
   842	{
   843		struct perf_event_attr attr;
   844	
   845		attr = bp->attr;
   846		attr.disabled = true;
   847		modify_user_hw_breakpoint(bp, &attr);
   848	}
   849	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
