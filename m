Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A7A1377
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 02:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689473233; x=1721009233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M368+xX84a2ovUfiwVMLnsW9XRsfP8Ig/zy8/3KC234=;
  b=aQHNqnDY3SCILC1HwY2Cp7Tfmyy/i3BdaaCcG9egOCfTc/slToEQbxnO
   0vJtaK28RJO/lFkgSPSOz/2Z2asxnsxiS7ddXNdtDncRxvQrYdJAhK0uV
   puk/SlKuxqq+eBj/wg0bK4xKGKin0YH1hQxhrs5cHq+dQxnP8D0Ndh1Ea
   dG44ebwdjaMxxRYfDF9AKExK0loJvWTJ34Xe0wo/aiP9MT7GOQeoel1eu
   B4MRouaAOc+kmu+f3qD85v61r0ycM2eimLc9pfcumUKNhspGO/Cb2tpTO
   3Wiqb/vxsNST6QtxTG7zu1jl8ZC2NPfcKGEskkrNF/LfD7bRgUe4yuG/B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="345314950"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="345314950"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 19:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="788233410"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="788233410"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jul 2023 19:07:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKrAD-0008T9-0S;
	Sun, 16 Jul 2023 02:07:09 +0000
Date: Sun, 16 Jul 2023 10:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-gcs 37/46] arch/arm64/kernel/signal.c:1295:35:
 sparse: sparse: cast removes address space '__user' of expression
Message-ID: <202307161036.RjKSkZmE-lkp@intel.com>
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
head:   17fe9f3a6087c12d1b09fac9759521ab14fb663b
commit: 23c261557dcb0930b0c14722ea819d1526069021 [37/46] arm64: Add Kconfig for Guarded Control Stack (GCS)
config: arm64-randconfig-r083-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161036.RjKSkZmE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161036.RjKSkZmE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161036.RjKSkZmE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kernel/signal.c:1277:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *addr @@     got void * @@
   arch/arm64/kernel/signal.c:1277:42: sparse:     expected void const [noderef] __user *addr
   arch/arm64/kernel/signal.c:1277:42: sparse:     got void *
>> arch/arm64/kernel/signal.c:1295:35: sparse: sparse: cast removes address space '__user' of expression
   arch/arm64/kernel/signal.c:1371:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void ( [noderef] [usertype] __user *[assigned] [usertype] sigtramp )( ... ) @@     got void * @@
   arch/arm64/kernel/signal.c:1371:26: sparse:     expected void ( [noderef] [usertype] __user *[assigned] [usertype] sigtramp )( ... )
   arch/arm64/kernel/signal.c:1371:26: sparse:     got void *

vim +/__user +1295 arch/arm64/kernel/signal.c

5682442c9f730b Mark Brown 2023-06-21  1258  
5682442c9f730b Mark Brown 2023-06-21  1259  static int gcs_signal_entry(__sigrestore_t sigtramp, struct ksignal *ksig)
5682442c9f730b Mark Brown 2023-06-21  1260  {
5682442c9f730b Mark Brown 2023-06-21  1261  	u64 gcspr_el0;
5682442c9f730b Mark Brown 2023-06-21  1262  	int ret;
5682442c9f730b Mark Brown 2023-06-21  1263  
5682442c9f730b Mark Brown 2023-06-21  1264  	if (!system_supports_gcs())
5682442c9f730b Mark Brown 2023-06-21  1265  		return 0;
5682442c9f730b Mark Brown 2023-06-21  1266  
5682442c9f730b Mark Brown 2023-06-21  1267  	if (!(current->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE))
5682442c9f730b Mark Brown 2023-06-21  1268  		return 0;
5682442c9f730b Mark Brown 2023-06-21  1269  
5682442c9f730b Mark Brown 2023-06-21  1270  	/*
5682442c9f730b Mark Brown 2023-06-21  1271  	 * We are entering a signal handler, current register state is
5682442c9f730b Mark Brown 2023-06-21  1272  	 * active.
5682442c9f730b Mark Brown 2023-06-21  1273  	 */
5682442c9f730b Mark Brown 2023-06-21  1274  	gcspr_el0 = read_sysreg_s(SYS_GCSPR_EL0);
5682442c9f730b Mark Brown 2023-06-21  1275  
5682442c9f730b Mark Brown 2023-06-21  1276  	might_fault();
5682442c9f730b Mark Brown 2023-06-21 @1277  	if (!access_ok((void *)gcspr_el0 - sizeof(u64) * 2, sizeof(u64) * 2))
5682442c9f730b Mark Brown 2023-06-21  1278  		return -EFAULT;
5682442c9f730b Mark Brown 2023-06-21  1279  
5682442c9f730b Mark Brown 2023-06-21  1280  	uaccess_ttbr0_enable();
5682442c9f730b Mark Brown 2023-06-21  1281  
5682442c9f730b Mark Brown 2023-06-21  1282  	/*
5682442c9f730b Mark Brown 2023-06-21  1283  	 * Push a cap onto the GCS.
5682442c9f730b Mark Brown 2023-06-21  1284  	 */
5682442c9f730b Mark Brown 2023-06-21  1285  	gcspr_el0 -= 8;
5682442c9f730b Mark Brown 2023-06-21  1286  	ret = gcssttr(gcspr_el0, GCS_SIGNAL_CAP(gcspr_el0));
5682442c9f730b Mark Brown 2023-06-21  1287  	if (ret != 0)
5682442c9f730b Mark Brown 2023-06-21  1288  		goto err_uaccess;
5682442c9f730b Mark Brown 2023-06-21  1289  
5682442c9f730b Mark Brown 2023-06-21  1290  	/*
5682442c9f730b Mark Brown 2023-06-21  1291  	 * The signal handler will return to the trampoline so we need
5682442c9f730b Mark Brown 2023-06-21  1292  	 * to push that onto the GCS.
5682442c9f730b Mark Brown 2023-06-21  1293  	 */
5682442c9f730b Mark Brown 2023-06-21  1294  	gcspr_el0 -= 8;
5682442c9f730b Mark Brown 2023-06-21 @1295  	ret = gcssttr(gcspr_el0, (u64)sigtramp);
5682442c9f730b Mark Brown 2023-06-21  1296  	if (ret != 0)
5682442c9f730b Mark Brown 2023-06-21  1297  		goto err_uaccess;
5682442c9f730b Mark Brown 2023-06-21  1298  
5682442c9f730b Mark Brown 2023-06-21  1299  	uaccess_ttbr0_disable();
5682442c9f730b Mark Brown 2023-06-21  1300  
5682442c9f730b Mark Brown 2023-06-21  1301  	gcsb_dsync();
5682442c9f730b Mark Brown 2023-06-21  1302  
5682442c9f730b Mark Brown 2023-06-21  1303  	write_sysreg_s(gcspr_el0, SYS_GCSPR_EL0);
5682442c9f730b Mark Brown 2023-06-21  1304  
5682442c9f730b Mark Brown 2023-06-21  1305  	return 0;
5682442c9f730b Mark Brown 2023-06-21  1306  
5682442c9f730b Mark Brown 2023-06-21  1307  err_uaccess:
5682442c9f730b Mark Brown 2023-06-21  1308  	uaccess_ttbr0_disable();
5682442c9f730b Mark Brown 2023-06-21  1309  	return ret;
5682442c9f730b Mark Brown 2023-06-21  1310  }
5682442c9f730b Mark Brown 2023-06-21  1311  #else
5682442c9f730b Mark Brown 2023-06-21  1312  

:::::: The code at line 1295 was first introduced by commit
:::::: 5682442c9f730b9801edc0d564c8a1262c1ef334 arm64/signal: Set up and restore the GCS context for signal handlers

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
