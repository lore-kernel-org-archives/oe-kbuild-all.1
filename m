Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463E415CD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 14:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689430682; x=1720966682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7QrcnAw+soIBJSL2wIusVJOM2TkzUD1UshnqZSRXpbA=;
  b=aTWZa1Qotm6PdGuDPDnTRf/GZ+sx7gp8hTOxIYi4+Cx42ro2h/r82Jpy
   Mp1+IMLCdcO0HEuH7IRRv5LZQj/2jc18OCNyDV/OT/teei/uLbIYSqFjK
   Zj7lkZprTKh7bHStU16Mv6ea61JrGaaPRDk6w8UgeO1WML1JTccTFCFDN
   xuXCTqjeBSdxgUfjDGIM4NTorez3zKj35EkBPRcoBs2NKFHwu78Bd/6Eg
   KDla1S4AU2s63+4jwjB4CC8GpsG1BNlAm5jDjpa7c49nkfka7L7XXAOVg
   VUBYxPu6QAQtl2Fv/sXef6amcteDd48nBnHwtQuoNgz7NkUGoEA4F7jd4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="396477490"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="396477490"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 07:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="752370355"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="752370355"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Jul 2023 07:17:59 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKg5v-0008CH-0N;
	Sat, 15 Jul 2023 14:17:59 +0000
Date: Sat, 15 Jul 2023 22:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-gcs 37/48] arch/arm64/kernel/signal.c:1276:42:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202307152223.RLejKDWh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   b74369f3118f3aa07e067adae1f42db39f143397
commit: ade31d872efeac42c07295034805e2965cffd2fa [37/48] arm64: Add Kconfig for Guarded Control Stack (GCS)
config: arm64-randconfig-r073-20230713 (https://download.01.org/0day-ci/archive/20230715/202307152223.RLejKDWh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307152223.RLejKDWh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307152223.RLejKDWh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/signal.c:1276:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *addr @@     got void * @@
   arch/arm64/kernel/signal.c:1276:42: sparse:     expected void const [noderef] __user *addr
   arch/arm64/kernel/signal.c:1276:42: sparse:     got void *
   arch/arm64/kernel/signal.c:1365:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void ( [noderef] [usertype] __user *[assigned] [usertype] sigtramp )( ... ) @@     got void * @@
   arch/arm64/kernel/signal.c:1365:26: sparse:     expected void ( [noderef] [usertype] __user *[assigned] [usertype] sigtramp )( ... )
   arch/arm64/kernel/signal.c:1365:26: sparse:     got void *
   arch/arm64/kernel/signal.c:1369:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *sigtramp @@     got void ( [noderef] [usertype] __user *[assigned] [usertype] sigtramp )( ... ) @@
   arch/arm64/kernel/signal.c:1369:33: sparse:     expected void *sigtramp
   arch/arm64/kernel/signal.c:1369:33: sparse:     got void ( [noderef] [usertype] __user *[assigned] [usertype] sigtramp )( ... )

vim +1276 arch/arm64/kernel/signal.c

2c020ed8d148f7 Catalin Marinas 2012-03-05  1256  
a5fb94bf076e04 Mark Brown      2023-06-21  1257  #ifdef CONFIG_ARM64_GCS
a5fb94bf076e04 Mark Brown      2023-06-21  1258  static int gcs_signal_entry(void *sigtramp, struct ksignal *ksig)
a5fb94bf076e04 Mark Brown      2023-06-21  1259  {
a5fb94bf076e04 Mark Brown      2023-06-21  1260  	u64 gcspr_el0;
a5fb94bf076e04 Mark Brown      2023-06-21  1261  	int ret;
a5fb94bf076e04 Mark Brown      2023-06-21  1262  
a5fb94bf076e04 Mark Brown      2023-06-21  1263  	if (!system_supports_gcs())
a5fb94bf076e04 Mark Brown      2023-06-21  1264  		return 0;
a5fb94bf076e04 Mark Brown      2023-06-21  1265  
a5fb94bf076e04 Mark Brown      2023-06-21  1266  	if (!(current->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE))
a5fb94bf076e04 Mark Brown      2023-06-21  1267  		return 0;
a5fb94bf076e04 Mark Brown      2023-06-21  1268  
a5fb94bf076e04 Mark Brown      2023-06-21  1269  	/*
a5fb94bf076e04 Mark Brown      2023-06-21  1270  	 * We are entering a signal handler, current register state is
a5fb94bf076e04 Mark Brown      2023-06-21  1271  	 * active.
a5fb94bf076e04 Mark Brown      2023-06-21  1272  	 */
a5fb94bf076e04 Mark Brown      2023-06-21  1273  	gcspr_el0 = read_sysreg_s(SYS_GCSPR_EL0);
a5fb94bf076e04 Mark Brown      2023-06-21  1274  
a5fb94bf076e04 Mark Brown      2023-06-21  1275  	might_fault();
a5fb94bf076e04 Mark Brown      2023-06-21 @1276  	if (!access_ok((void *)gcspr_el0 - sizeof(u64) * 2, sizeof(u64) * 2))
a5fb94bf076e04 Mark Brown      2023-06-21  1277  		return -EFAULT;
a5fb94bf076e04 Mark Brown      2023-06-21  1278  
a5fb94bf076e04 Mark Brown      2023-06-21  1279  	uaccess_ttbr0_enable();
a5fb94bf076e04 Mark Brown      2023-06-21  1280  
a5fb94bf076e04 Mark Brown      2023-06-21  1281  	/*
a5fb94bf076e04 Mark Brown      2023-06-21  1282  	 * Push a cap onto the GCS.
a5fb94bf076e04 Mark Brown      2023-06-21  1283  	 */
a5fb94bf076e04 Mark Brown      2023-06-21  1284  	gcspr_el0 -= 8;
a5fb94bf076e04 Mark Brown      2023-06-21  1285  	ret = gcssttr(gcspr_el0, GCS_SIGNAL_CAP(gcspr_el0));
a5fb94bf076e04 Mark Brown      2023-06-21  1286  	if (ret != 0)
a5fb94bf076e04 Mark Brown      2023-06-21  1287  		goto err_uaccess;
a5fb94bf076e04 Mark Brown      2023-06-21  1288  
a5fb94bf076e04 Mark Brown      2023-06-21  1289  	/*
a5fb94bf076e04 Mark Brown      2023-06-21  1290  	 * The signal handler will return to the trampoline so we need
a5fb94bf076e04 Mark Brown      2023-06-21  1291  	 * to push that onto the GCS.
a5fb94bf076e04 Mark Brown      2023-06-21  1292  	 */
a5fb94bf076e04 Mark Brown      2023-06-21  1293  	gcspr_el0 -= 8;
a5fb94bf076e04 Mark Brown      2023-06-21  1294  	ret = gcssttr(gcspr_el0, (u64)sigtramp);
a5fb94bf076e04 Mark Brown      2023-06-21  1295  	if (ret != 0)
a5fb94bf076e04 Mark Brown      2023-06-21  1296  		goto err_uaccess;
a5fb94bf076e04 Mark Brown      2023-06-21  1297  
a5fb94bf076e04 Mark Brown      2023-06-21  1298  	uaccess_ttbr0_disable();
a5fb94bf076e04 Mark Brown      2023-06-21  1299  
a5fb94bf076e04 Mark Brown      2023-06-21  1300  	gcsb_dsync();
a5fb94bf076e04 Mark Brown      2023-06-21  1301  
a5fb94bf076e04 Mark Brown      2023-06-21  1302  	write_sysreg_s(gcspr_el0, SYS_GCSPR_EL0);
a5fb94bf076e04 Mark Brown      2023-06-21  1303  
a5fb94bf076e04 Mark Brown      2023-06-21  1304  	return 0;
a5fb94bf076e04 Mark Brown      2023-06-21  1305  
a5fb94bf076e04 Mark Brown      2023-06-21  1306  err_uaccess:
a5fb94bf076e04 Mark Brown      2023-06-21  1307  	uaccess_ttbr0_disable();
a5fb94bf076e04 Mark Brown      2023-06-21  1308  	return ret;
a5fb94bf076e04 Mark Brown      2023-06-21  1309  }
a5fb94bf076e04 Mark Brown      2023-06-21  1310  #else
a5fb94bf076e04 Mark Brown      2023-06-21  1311  static int gcs_signal_entry(void *sigtramp, struct ksignal *ksig) { return 0; }
a5fb94bf076e04 Mark Brown      2023-06-21  1312  #endif
a5fb94bf076e04 Mark Brown      2023-06-21  1313  

:::::: The code at line 1276 was first introduced by commit
:::::: a5fb94bf076e04cffb117fdaf0c7969858714867 arm64/signal: Set up and restore the GCS context for signal handlers

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
