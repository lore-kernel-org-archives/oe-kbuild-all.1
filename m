Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70F2367
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 22:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690065629; x=1721601629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oGRBUzEC53X3H/zkuW0kTo3RIWPnWpUTSP5hh4OYMSg=;
  b=KexNVYhc4xXtETz+ZI5L4obmzaTYOFgwVlUyKdNlwBxenHNrUHQxUEQh
   46UC6LE2qWP8vK0/CEqDgrYsXChsT37DUe785PvaxHctXbKlupTlF1sSr
   RWp25+C+bHCld0Yua+dBkjc87uMrhDHWbKnTG2gaLgBEf1rcliRV64fMn
   pn9SL7lEEkEKIr7B6kyEX0pw1akW11GbiKEw+ypA3W1JdpXBbcG/PDAlT
   N10VeQenQ00C93j0J29mt9SA4qGbz2w8rtRcYkYhWErgOPejSVYW3vjJ3
   nCG+ILtefrxquOTySFjpe9Qhsjb/+o4iN5m5tdWqcPGmFtUWUHuSHb3BB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="398130502"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="398130502"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 15:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="849200161"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="849200161"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Jul 2023 15:40:27 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNLH0-0008ej-2t;
	Sat, 22 Jul 2023 22:40:26 +0000
Date: Sun, 23 Jul 2023 06:39:45 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 4/42]
 riscv64-linux-ld: warning: orphan section `.init.alternative' from
 `./drivers/firmware/efi/libstub/efi-stub-entry.stub.o' being placed in
 section `.init.alternative'
Message-ID: <202307230605.JK5dBcV3-lkp@intel.com>
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
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230723/202307230605.JK5dBcV3-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230605.JK5dBcV3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230605.JK5dBcV3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> riscv64-linux-ld: warning: orphan section `.init.alternative' from `./drivers/firmware/efi/libstub/efi-stub-entry.stub.o' being placed in section `.init.alternative'
>> riscv64-linux-ld: warning: orphan section `.init.alternative' from `./drivers/firmware/efi/libstub/efi-stub.stub.o' being placed in section `.init.alternative'
>> riscv64-linux-ld: warning: orphan section `.init.alternative' from `./drivers/firmware/efi/libstub/efi-stub-entry.stub.o' being placed in section `.init.alternative'
>> riscv64-linux-ld: warning: orphan section `.init.alternative' from `./drivers/firmware/efi/libstub/efi-stub.stub.o' being placed in section `.init.alternative'
>> riscv64-linux-ld: warning: orphan section `.init.alternative' from `./drivers/firmware/efi/libstub/efi-stub-entry.stub.o' being placed in section `.init.alternative'
>> riscv64-linux-ld: warning: orphan section `.init.alternative' from `./drivers/firmware/efi/libstub/efi-stub.stub.o' being placed in section `.init.alternative'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
