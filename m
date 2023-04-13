Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FC8AD28
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 16:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681402278; x=1712938278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GHa28sFl62H0sirTQG1H0CKnNbe47Akpix1f4VHKa5A=;
  b=Jtlmda6JHfG99DyfGnNOJ0wtdlehdjTIiITYeHHB2r+FKpT2LCVXy1wi
   zkq/nTWoGe3R9j54hIPZGr6oa8GkxdQgAXXpUPr6iWMzruaLfH2FS5+jQ
   TGp3tTgIgFRMsorDc7PkqDog+s92T95frSAI1ncVpqyR6P8mWepfQs/z+
   z0YbemS2JjzvUOfYYStu5yTA05wRj84T0op46HjgpceradsZrxDpPjxdX
   Ueq+I9KWEx7mlXgAjy9eNFGripMc3LtW7cbK9ScxnQ5unxA25HeZBMPOF
   a93N4os9T49pBEzzuR/XflrIfzCq2p+umittJTG6iAAGQGSYgCOZEM05W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="342975894"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="342975894"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 09:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="689407898"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="689407898"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Apr 2023 09:09:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmzWE-000Ynl-0W;
	Thu, 13 Apr 2023 16:09:54 +0000
Date: Fri, 14 Apr 2023 00:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Borislav Petkov <bp@suse.de>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.4.y 4730/8053] arch/x86/kernel/cpu/mce/core.o:
 warning: objtool: ex_handler_rdmsr_fault()+0xf: unreachable instruction
Message-ID: <202304140009.FCTdOYcH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   32bea3bac5ca484c6f7e302c8c96fc686f62e7b4
commit: 0a0fbbd6cb654f748d87c0db10c31741101f2ab2 [4730/8053] x86/mce: Deduplicate exception handling
config: x86_64-rhel-8.3-ltp (https://download.01.org/0day-ci/archive/20230414/202304140009.FCTdOYcH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=0a0fbbd6cb654f748d87c0db10c31741101f2ab2
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 0a0fbbd6cb654f748d87c0db10c31741101f2ab2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash M=arch/x86

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140009.FCTdOYcH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/mce/core.o: warning: objtool: ex_handler_rdmsr_fault()+0xf: unreachable instruction


objdump-func vmlinux.o ex_handler_rdmsr_fault:
0000 000000000008c7e0 <ex_handler_rdmsr_fault>:
0000    8c7e0:	e8 00 00 00 00       	call   8c7e5 <ex_handler_rdmsr_fault+0x5>	8c7e1: R_X86_64_PLT32	__fentry__-0x4
0005    8c7e5:	48 89 f7             	mov    %rsi,%rdi
0008    8c7e8:	31 f6                	xor    %esi,%esi
000a    8c7ea:	e8 31 a8 ff ff       	call   87020 <ex_handler_msr_mce>
000f    8c7ef:	b8 01 00 00 00       	mov    $0x1,%eax
0014    8c7f4:	c3                   	ret
0015    8c7f5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
