Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6B52F2C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681289470; x=1712825470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZNSKIOsv4303HQo6iEcKD4yg+O+v+kZTlY6YIryqc1s=;
  b=WKK04hbZTPWe0oj7YltYhLW3RryP0sm5XFSz2TlzsklqUtvbs00p4X0y
   RNrtjuhxym/l+Up3gQhL+vQ3tdyJqwYytKTOWgKv7R6sA78CB6iT6EoeA
   UYQFAiiEt60JKThmGXuc5t8wdlVBtvPy7ajgrt/13X03njVXPWabQPNdy
   5XV720tggsppT+zN3nHC5QVunhMAVc3D0KT4zJYWxq5HdybMyMczTuqDf
   Wk7EkyMb8OgDeRqu8EAMR/9zVkSBLM7Zet0aXL21LKR6FhiCa8TZgfRBh
   3XvgAWE9p2BimaBxyfpw9+7Cfm8Gc6Hkyu3d93QM1sZ+SA/68K1p3KD9C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="343844529"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="343844529"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 01:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="691478203"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="691478203"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Apr 2023 01:51:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmWBy-000XXf-3A;
	Wed, 12 Apr 2023 08:51:02 +0000
Date: Wed, 12 Apr 2023 16:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 10400/10976] arch/arm/vfp/entry.S:27: undefined
 reference to `vfp_entry'
Message-ID: <202304121606.ltRFyuij-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d8214bba44c1aa6a75921a09a691945d26a8d43
commit: 62fa0c124d5ff1d1b1fab988ed4ef0e82e3ece16 [10400/10976] ARM: 9294/1: vfp: Fix broken softirq handling with instrumentation enabled
config: arm-keystone_defconfig (https://download.01.org/0day-ci/archive/20230412/202304121606.ltRFyuij-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=62fa0c124d5ff1d1b1fab988ed4ef0e82e3ece16
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 62fa0c124d5ff1d1b1fab988ed4ef0e82e3ece16
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121606.ltRFyuij-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: arch/arm/vfp/entry.o: in function `do_vfp':
>> arch/arm/vfp/entry.S:27: undefined reference to `vfp_entry'


vim +27 arch/arm/vfp/entry.S

    14	
    15	@ VFP entry point.
    16	@
    17	@  r0  = instruction opcode (32-bit ARM or two 16-bit Thumb)
    18	@  r2  = PC value to resume execution after successful emulation
    19	@  r9  = normal "successful" return address
    20	@  r10 = this threads thread_info structure
    21	@  lr  = unrecognised instruction return address
    22	@  IRQs enabled.
    23	@
    24	ENTRY(do_vfp)
    25		mov	r1, r10
    26		mov	r3, r9
  > 27		b	vfp_entry

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
