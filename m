Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E8B3D8C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 12:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675687079; x=1707223079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yG7gucLEwUI1l9TGVTW03YPJOUtmvRwcVtxuLwuiAOM=;
  b=bRUp/9FD8czWEGskckueDS0GHd+76zJRq8EbGYja2XqOXWBz8v5hrwAL
   RlsI3oM1hg31bWmRPYRg40qxJbQOF1jJ+5OzE6VPuDL8JB/g3iKannYUr
   V1mS+r1bICemVQ0tO5kYwjAv98c9OpDSaJaJ+G/cvGwk7Rz6LmVXeduYA
   53SPlOLGat8peW6uybpVQjObrBpQsXQmRuyQhB6FyYnh6Yo+4d++nn+Oc
   xMPHbQI/phIDUvhtd8Zsb2VhuFcXQl0dkIM8PPDUnKJGsPLODIjBQB6+Z
   r4+jTzfxD9DFKsOkWXlQH47c8bnwdf2ZNFZEnsro4OuVR5K52z5iBtx6s
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="330488908"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="330488908"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 04:37:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="659838982"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="659838982"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Feb 2023 04:37:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP0ku-0002Xi-0B;
	Mon, 06 Feb 2023 12:37:56 +0000
Date: Mon, 6 Feb 2023 20:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, nanli2x <nanx.li@intel.com>
Subject: [intel-lts:5.10/yocto 19767/29177]
 arch/x86/crypto/aesni-intel_asm.S:177: warning: "GF128MUL_MASK" redefined
Message-ID: <202302062013.kU6Ojak1-lkp@intel.com>
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
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230206/202302062013.kU6Ojak1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/f4b77824c8b73ee61f4cc883fa6ab5e450dd45b0
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout f4b77824c8b73ee61f4cc883fa6ab5e450dd45b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/crypto/ arch/x86/events/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/crypto/aesni-intel_asm.S:177: warning: "GF128MUL_MASK" redefined
     177 | #define GF128MUL_MASK   %xmm7
         | 
   arch/x86/crypto/aesni-intel_asm.S:149: note: this is the location of the previous definition
     149 | #define GF128MUL_MASK %xmm10
         | 


vim +/GF128MUL_MASK +177 arch/x86/crypto/aesni-intel_asm.S

   176	
 > 177	#define GF128MUL_MASK	%xmm7
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
