Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC0638F91
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGUybkUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701272621; x=1732808621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y9tsmU7ogEklBkMdjJr8QxsQZCNfar7+o5AACJhQ1K8=;
  b=DGUybkUAiLEYLGuPtd5s/BHCIUMQTOpp8Bv0KRL9OGhVshb+300WSoTD
   5xCVvELYixJ7oE+Xe4iRFlLkS+LwnB6FHQ8rHf1ECLFqoYn3drfPJJDsl
   00PxXUOYyYzgSIZPOtigNyGeX3JDFvHjdUUOnoZcXGKDPX0XOBblbOcgt
   HV9snw5exQRPxcK59vcyRmo4bO/J1Ezot0udvffyNDK+QLmWbM7XTmKNj
   23roVVBx7cngwi8De1DkjTxDbc5KZ4DHCSaVGhY0j4olOD27/deT4LW37
   v4U41VyZLhPhCwjx+BVNkisix0qWygNRGO178V9afTZj0u+RjtfeXboOS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392925485"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392925485"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 07:43:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="772724584"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="772724584"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Nov 2023 07:43:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Mit-0000Oy-15;
	Wed, 29 Nov 2023 15:43:35 +0000
Date: Wed, 29 Nov 2023 23:42:02 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: arch/riscv/kernel/tests/module_test/test_uleb128.S:9: Error:
 unrecognized opcode `ld a0,second'
Message-ID: <202311292253.s5OGiu3s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18d46e76d7c2eedd8577fae67e3f1d4db25018b0
commit: af71bc194916b10f9b394f9b14419d99700a5e67 riscv: Add tests for riscv module loading
date:   3 weeks ago
config: riscv-randconfig-r001-20230116 (https://download.01.org/0day-ci/archive/20231129/202311292253.s5OGiu3s-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311292253.s5OGiu3s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311292253.s5OGiu3s-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/tests/module_test/test_uleb128.S: Assembler messages:
>> arch/riscv/kernel/tests/module_test/test_uleb128.S:9: Error: unrecognized opcode `ld a0,second'
>> arch/riscv/kernel/tests/module_test/test_uleb128.S:15: Error: unrecognized opcode `ld a0,fourth'


vim +9 arch/riscv/kernel/tests/module_test/test_uleb128.S

   > 9		ld	a0, second
    10		addi	a0, a0, -127
    11		ret
    12	
    13	.global test_uleb_large
    14	test_uleb_large:
  > 15		ld	a0, fourth
    16		addi	a0, a0, -0x07e8
    17		ret
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
