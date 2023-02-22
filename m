Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF0F1FB5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 07:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677049622; x=1708585622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gI5J9ZInbuiDXPPnPmqy3+yar/z374migS6SgEqe5pg=;
  b=C7KrvXVnHKRLX1slpdDjHKeflXhBy6etAeT8ma+O+xxs8H+lMXIsunQ0
   FsFMqBkLIOrfITFUV9k5a+aS/2YJfwUHTkYtuBgYWTNgfHovg7d2Tf8vD
   dex9SnZngwguqd+6rQxMrKnflbuLUAmFobwed7e7YsY9FjeaKryAocJWV
   tD4ZBVzLXaJmruz71E2yL+Cq+GddRGHns0wJOC1J0b2wPLoxu8iuLl2Gt
   LvifRfJnkKZjN8QM83ogsmh2VnU+IM5+CHiZPGkdmVoinTbZaM/Yz/+Ns
   BHlNlUR/G4z7XZagePHzQWAkCSo1QrfIqAAejous8xIL+vRxzcPbIbAsH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="395335471"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="395335471"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 23:07:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814816851"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="814816851"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2023 23:07:00 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUjDQ-000061-0l;
	Wed, 22 Feb 2023 07:07:00 +0000
Date: Wed, 22 Feb 2023 15:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, nanli2x <nanx.li@intel.com>
Subject: [intel-lts:5.10/preempt-rt 19483/30000]
 arch/x86/crypto/aesni-intel_asm.S:177: warning: "GF128MUL_MASK" redefined
Message-ID: <202302221402.cltn5naY-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git 5.10/preempt-rt
head:   4278ee2bf6ce967d4eb3ff89f1371d4aa9b86558
commit: f4b77824c8b73ee61f4cc883fa6ab5e450dd45b0 [19483/30000] crypto: x86/aes-kl - Support AES algorithm using Key Locker instructions
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230222/202302221402.cltn5naY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/f4b77824c8b73ee61f4cc883fa6ab5e450dd45b0
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/preempt-rt
        git checkout f4b77824c8b73ee61f4cc883fa6ab5e450dd45b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/crypto/ arch/x86/events/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302221402.cltn5naY-lkp@intel.com/

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
