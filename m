Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A4E154B2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 04:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvON/ANu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701316991; x=1732852991;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oFlFRFcz1tIpMQrq1K23LeCcdSO+FCr7dL8+F/01Zyk=;
  b=JvON/ANu57xexxdhqWRK8V9SuU2KP4l5FFfEmS7PjukJpmvP61T3HuIc
   shhx2ey8/WaPyD1QlnQ3+3rGtTklB4kdqY8029Yoi9+hyFKKvxNIE4ybN
   a1eK1NVmJUgvPsBVMfQXDMQZ3fg6mlI2mdyBj5qcwPdYEPB+e/kqht+LN
   uf/82+FmBgNhAZCQHG6I/wSzXNr58AY67Yr8rYmaPcSf+EX3BmeJOoyYv
   MuuJVJqjsqSclBXyGRTCL/2/4imTGvKOkY4Ss9AaB+zQScgPMUzWwzx/7
   jfMryaPJIvfP90Mo8/3vjlyKsXa5K1eYvfSUUmZiPVTy0znmthQpowfVl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="393009074"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="393009074"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 20:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="913063272"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="913063272"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 29 Nov 2023 20:03:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8YGW-0001K5-1P;
	Thu, 30 Nov 2023 04:03:04 +0000
Date: Thu, 30 Nov 2023 12:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Eric DeVolder <eric_devolder@yahoo.com>
Subject: [akpm-mm:mm-unstable 25/192] loongarch64-linux-ld:
 kexec_core.c:undefined reference to `machine_kexec'
Message-ID: <202311300946.kHE9Iu71-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unst=
able
head:   cb1d236cb1038fa1bbae9913803f1c655b86d931
commit: f8ff23429c625c2b2a134d87f490a89a98c544ce [25/192] kernel/Kconfig.ke=
xec: drop select of KEXEC for CRASH_DUMP
config: loongarch-randconfig-r122-20231130 (https://download.01.org/0day-ci=
/archive/20231130/202311300946.kHE9Iu71-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311300946.k=
HE9Iu71-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311300946.kHE9Iu71-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: kernel/kexec_core.o: in function `.L209':
>> kexec_core.c:(.text+0x1660): undefined reference to `machine_kexec_clean=
up'
   loongarch64-linux-ld: kernel/kexec_core.o: in function `.L287':
>> kexec_core.c:(.text+0x1c5c): undefined reference to `machine_crash_shutd=
own'
>> loongarch64-linux-ld: kexec_core.c:(.text+0x1c64): undefined reference t=
o `machine_kexec'
   loongarch64-linux-ld: kernel/kexec_core.o: in function `.L2=025':
>> kexec_core.c:(.text+0x2090): undefined reference to `machine_shutdown'
   loongarch64-linux-ld: kexec_core.c:(.text+0x20a0): undefined reference t=
o `machine_kexec'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
