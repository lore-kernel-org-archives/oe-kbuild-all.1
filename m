Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321C339D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 02:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677464298; x=1709000298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VKy6JhMSoV1WpoKRtmQOJ1afjs8UWPeWSShzveq838w=;
  b=ivsNQ56kytRe97YI9cS15JEOK0u+DzAMLGB6adX3eNpdNf8dEBMxkglS
   mwxAcmtA+HLIGjQwO4Qmgg9YsI6hihp5xwYTLZ7X58D/pLYpXEeKEAHr4
   xJ7fxp9TT3ZZaUiw/2hZ5XhZs0mcrhYqtvpuSvXvaUAZ07DNgXjOJAlQg
   BsYwqIzhTIXiaTuw7Ft9VzoZLGiiNdjhjCMjUfe9Yo6DHWfGnhn9X3ch0
   uzkLiHJ8m/BL2RNtM051L6so3A5ZSrAIoBzcU+JsrM3x6aJqDc3ZFtxyh
   LFnsq5GaYqv052xRmPe2e/4gpHnlWuO1tcvZC+LX6iCUzjp9xkjEB901M
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="332489229"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="332489229"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 18:18:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="673573889"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="673573889"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 Feb 2023 18:18:15 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWT5j-00040p-11;
	Mon, 27 Feb 2023 02:18:15 +0000
Date: Mon, 27 Feb 2023 10:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: arch/riscv/net/bpf_jit_comp64.c:691:23: error: implicit declaration
 of function 'patch_text'; did you mean 'path_get'?
Message-ID: <202302271000.Aj4nMXbZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f3a2439f20d918930cc4ae8f76fe1c1afd26958f
commit: 596f2e6f9cf41436a5512a3f278c86da5c5598fb riscv, bpf: Add bpf_arch_text_poke support for RV64
date:   9 days ago
config: riscv-buildonly-randconfig-r002-20230227 (https://download.01.org/0day-ci/archive/20230227/202302271000.Aj4nMXbZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=596f2e6f9cf41436a5512a3f278c86da5c5598fb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 596f2e6f9cf41436a5512a3f278c86da5c5598fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302271000.Aj4nMXbZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/net/bpf_jit_comp64.c: In function 'bpf_arch_text_poke':
>> arch/riscv/net/bpf_jit_comp64.c:691:23: error: implicit declaration of function 'patch_text'; did you mean 'path_get'? [-Werror=implicit-function-declaration]
     691 |                 ret = patch_text(ip, new_insns, ninsns);
         |                       ^~~~~~~~~~
         |                       path_get
   cc1: some warnings being treated as errors


vim +691 arch/riscv/net/bpf_jit_comp64.c

   662	
   663	int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
   664			       void *old_addr, void *new_addr)
   665	{
   666		u32 old_insns[4], new_insns[4];
   667		bool is_call = poke_type == BPF_MOD_CALL;
   668		int (*gen_insns)(void *target, void *ip, u32 *insns);
   669		int ninsns = is_call ? 4 : 2;
   670		int ret;
   671	
   672		if (!is_bpf_text_address((unsigned long)ip))
   673			return -ENOTSUPP;
   674	
   675		gen_insns = is_call ? gen_call_or_nops : gen_jump_or_nops;
   676	
   677		ret = gen_insns(old_addr, ip, old_insns);
   678		if (ret)
   679			return ret;
   680	
   681		if (memcmp(ip, old_insns, ninsns * 4))
   682			return -EFAULT;
   683	
   684		ret = gen_insns(new_addr, ip, new_insns);
   685		if (ret)
   686			return ret;
   687	
   688		cpus_read_lock();
   689		mutex_lock(&text_mutex);
   690		if (memcmp(ip, new_insns, ninsns * 4))
 > 691			ret = patch_text(ip, new_insns, ninsns);
   692		mutex_unlock(&text_mutex);
   693		cpus_read_unlock();
   694	
   695		return ret;
   696	}
   697	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
