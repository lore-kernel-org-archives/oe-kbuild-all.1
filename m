Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECE2525E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 14:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675693804; x=1707229804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B3y+BswOY7u9dkSUl8ZL2IDWzOUc1EzNsknXxE0JTbM=;
  b=YrTOpv1v+GDBDQvJKPJgnNpBFgcdIwXz4QhGLXU5SSNisu59dtPNrztm
   0ib8/fdyAcgtbi1+nStpQNxdy9aAaS7k+8A4SeTHEwwyPcWQBVZMZ7UIC
   FJKn3QXDqiSKD+kv6BiI3xt7dqKNvFUReU/gUnnHyuG1Yh/fIUizOwJKh
   RuEhxRoKPjIOqZj+bYanZMqkg8R5aZLMSap+yWGx6IkRy6KrqGFkEnL8t
   M2XpbsFhvlyQHm6bE4WDbHhfGrKDyajykL1SfmI/bbCkjln8/WmD/95mL
   2oGwqjS/XhQvpM2KXLt7wKM9Qrmuf0tVBYzLs25+4LMcZe3T4qA9COwEa
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="312871073"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="312871073"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 06:30:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="775183931"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="775183931"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2023 06:30:01 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP2VL-0002b0-3A;
	Mon, 06 Feb 2023 14:29:59 +0000
Date: Mon, 6 Feb 2023 22:29:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, nanli2x <nanx.li@intel.com>
Subject: [intel-lts:5.10/yocto 19767/29177]
 arch/x86/crypto/aesni-intel_asm.S:177:9: warning: 'GF128MUL_MASK' macro
 redefined
Message-ID: <202302062200.fot0rpLc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chang,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   a28867696061a1be54960089016434aee399da9d
commit: f4b77824c8b73ee61f4cc883fa6ab5e450dd45b0 [19767/29177] crypto: x86/aes-kl - Support AES algorithm using Key Locker instructions
config: i386-randconfig-a002-20230206 (https://download.01.org/0day-ci/archive/20230206/202302062200.fot0rpLc-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/f4b77824c8b73ee61f4cc883fa6ab5e450dd45b0
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout f4b77824c8b73ee61f4cc883fa6ab5e450dd45b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/crypto/ arch/x86/events/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/crypto/aesni-intel_asm.S:177:9: warning: 'GF128MUL_MASK' macro redefined [-Wmacro-redefined]
   #define GF128MUL_MASK   %xmm7
           ^
   arch/x86/crypto/aesni-intel_asm.S:149:9: note: previous definition is here
   #define GF128MUL_MASK %xmm10
           ^
   1 warning generated.


vim +/GF128MUL_MASK +177 arch/x86/crypto/aesni-intel_asm.S

   176	
 > 177	#define GF128MUL_MASK	%xmm7
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
