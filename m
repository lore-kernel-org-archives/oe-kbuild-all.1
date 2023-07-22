Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9094A7F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 22:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690066229; x=1721602229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BEmjbLOMEDODHp1JeTMK8dPruhFkNRq4j0BiZWwnQ7A=;
  b=DtEZxdkX1GXdUIj42Rg/emJAHNT7mQOnn7SP1iliV7bv8MDgl9NdFloC
   VCJaGfwjwxctTxGVR65gl73L8ct2iHkbYA3eB8T+9CKPpa7yHIy0mCjl1
   g/AiDgXLFRJpYZCj6ujG8fZXabFCgueDz8fmZq8Gnzbo+jqMqsGcDt929
   e+zhaASfTn0v4hye3bM4kAvJdJfg3dYq2WN+8EZvFvGJroEBy/oKRl+Tf
   Hk/zpW28xymYb5lMNU63jwIiRwEEWl4LDlx6CGD6WY3SEIdUZArylttuS
   urv0zAAiqVMaKgkbFVA8f4ZPlWpU+j8pWwojvha5jQM4QTjVi1jtDXlGH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="367261188"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="367261188"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 15:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="1055968591"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="1055968591"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Jul 2023 15:50:27 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNLQh-0008ex-0A;
	Sat, 22 Jul 2023 22:50:27 +0000
Date: Sun, 23 Jul 2023 06:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 4/42]
 riscv32-linux-ld: warning: orphan section `.init.alternative' from
 `./drivers/firmware/efi/libstub/efi-stub-entry.stub.o' being placed in
 section `.init.alternative'
Message-ID: <202307230603.ExnVN6lH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   7f9f76d36814ed6fcbca4c27a5d2ec3724c46add
commit: 752cdce676034dc7d1c10e53ff298b0960333e67 [4/42] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230723/202307230603.ExnVN6lH-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230603.ExnVN6lH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230603.ExnVN6lH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> riscv32-linux-ld: warning: orphan section `.init.alternative' from `./drivers/firmware/efi/libstub/efi-stub-entry.stub.o' being placed in section `.init.alternative'
>> riscv32-linux-ld: warning: orphan section `.init.alternative' from `./drivers/firmware/efi/libstub/efi-stub.stub.o' being placed in section `.init.alternative'
>> riscv32-linux-ld: warning: orphan section `.init.alternative' from `./drivers/firmware/efi/libstub/efi-stub-entry.stub.o' being placed in section `.init.alternative'
>> riscv32-linux-ld: warning: orphan section `.init.alternative' from `./drivers/firmware/efi/libstub/efi-stub.stub.o' being placed in section `.init.alternative'
>> riscv32-linux-ld: warning: orphan section `.init.alternative' from `./drivers/firmware/efi/libstub/efi-stub-entry.stub.o' being placed in section `.init.alternative'
>> riscv32-linux-ld: warning: orphan section `.init.alternative' from `./drivers/firmware/efi/libstub/efi-stub.stub.o' being placed in section `.init.alternative'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
