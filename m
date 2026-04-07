Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90AE374E4E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533766; cv=none; b=Oa46EF9EY5Af5hKbpg2tg6Y1fjGBcLWXYNJIaRrgonm9lExsP2ikZwA50EdN6vXkzwjoIkE+gbSwFrbRQETpq7L9cARiOc7OW2OU8+HhgqZWcZbCMpwYumRBNUADxZBpIknDWCGZRCe18Vj+6H3yNKBMBAA/gyITrWUxSsZdFa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533766; c=relaxed/simple;
	bh=HImls5hh5A2OOiup7zWdIB4ze26t4pXybry/31QNPow=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W5F+xcOYsVH18vGghE42WSgaVWTrga9D7PtYUVnz+pMFt557XB1aHJHFqG80ULgbuLTnbYMS65XoF0hw52n+O9BJZIo0S1zbSO63Jdbr+UDCwpv5R2/8izsaJuz9NdYRaS6N2JUIa2VcOssmfzo/SKD+01txn2A9oTW50dMKD6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yzigvq7t; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yzigvq7t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533764; x=1807069764;
  h=date:from:to:cc:subject:message-id;
  bh=HImls5hh5A2OOiup7zWdIB4ze26t4pXybry/31QNPow=;
  b=Yzigvq7tDav9WbGyqjNrN4PqDxBCqF4oVrwS8DF5KucA2wwLQQ5/GlkA
   jJtRCEW+2TTDk/lgmZJwUnB0mdB/JrUMOk0+efUUZtUpV0uP8VjmSxzYD
   QRiptART5oA+OVofuDV5s7Cz2Y0Dn9QbFeNsvm4GSS11qlDQ+Fg4MIJUP
   hYKAhXNIFtteU9Eg1r9MPjYRpCpRnWxCtHLgpZU8xbDK1LT+Dnma4hpcU
   kl39OQGv4lsF26jIRZXT0xtwCrnRN/KWxZ0WZYtz6iqH50qITk3Iv5alD
   IbY8hlr9LxsYByrsYIa7ivilO48N6NmkYkQhxMkzvWXIvcBiZniLLq6r1
   g==;
X-CSE-ConnectionGUID: FH8dBB+TRiG3K9PbivtnHw==
X-CSE-MsgGUID: f8+lIT+GQAWC+cOJ1W7iIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76385867"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76385867"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:49:22 -0700
X-CSE-ConnectionGUID: crXcXK82R2CM81CwIVoYEg==
X-CSE-MsgGUID: Op1btychR0G5SdJJotecVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251191882"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2026 20:49:20 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xRG-0000000001J-0jT3;
	Tue, 07 Apr 2026 03:49:18 +0000
Date: Tue, 07 Apr 2026 11:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [linux-next:master 10159/11535]
 drivers/power/sequencing/pwrseq-pcie-m2.c:193:12: warning: assignment to
 'struct device_node *' from 'int' makes pointer from integer without a cast
Message-ID: <202604031945.bEYKHUme-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc13002a9f984d37906e9476f3e532a8cdd126f5
commit: 3f736aecbdc8e4faf2ed82c981812a6bfc76ea98 [10159/11535] power: sequencing: pcie-m2: Create serdev device for WCN7850 bluetooth
config: sh-randconfig-001-20260403 (https://download.01.org/0day-ci/archive/20260403/202604031945.bEYKHUme-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031945.bEYKHUme-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031945.bEYKHUme-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/power/sequencing/pwrseq-pcie-m2.c: In function 'pwrseq_m2_pcie_create_bt_node':
   drivers/power/sequencing/pwrseq-pcie-m2.c:191:9: error: implicit declaration of function 'of_changeset_init' [-Werror=implicit-function-declaration]
     191 |         of_changeset_init(ctx->ocs);
         |         ^~~~~~~~~~~~~~~~~
   drivers/power/sequencing/pwrseq-pcie-m2.c:193:14: error: implicit declaration of function 'of_changeset_create_node' [-Werror=implicit-function-declaration]
     193 |         np = of_changeset_create_node(ctx->ocs, parent, "bluetooth");
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/power/sequencing/pwrseq-pcie-m2.c:193:12: warning: assignment to 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     193 |         np = of_changeset_create_node(ctx->ocs, parent, "bluetooth");
         |            ^
   drivers/power/sequencing/pwrseq-pcie-m2.c:200:15: error: implicit declaration of function 'of_changeset_add_prop_string' [-Werror=implicit-function-declaration]
     200 |         ret = of_changeset_add_prop_string(ctx->ocs, np, "compatible", "qcom,wcn7850-bt");
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/sequencing/pwrseq-pcie-m2.c:206:15: error: implicit declaration of function 'of_changeset_apply' [-Werror=implicit-function-declaration]
     206 |         ret = of_changeset_apply(ctx->ocs);
         |               ^~~~~~~~~~~~~~~~~~
   drivers/power/sequencing/pwrseq-pcie-m2.c:221:9: error: implicit declaration of function 'of_changeset_revert' [-Werror=implicit-function-declaration]
     221 |         of_changeset_revert(ctx->ocs);
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/power/sequencing/pwrseq-pcie-m2.c:223:9: error: implicit declaration of function 'of_changeset_destroy' [-Werror=implicit-function-declaration]
     223 |         of_changeset_destroy(ctx->ocs);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/power/sequencing/pwrseq-pcie-m2.c: In function 'pwrseq_pcie_m2_register_notifier':
   drivers/power/sequencing/pwrseq-pcie-m2.c:368:54: error: 'pci_bus_type' undeclared (first use in this function); did you mean 'pci_pcie_type'?
     368 |                         ret = bus_register_notifier(&pci_bus_type, &ctx->nb);
         |                                                      ^~~~~~~~~~~~
         |                                                      pci_pcie_type
   drivers/power/sequencing/pwrseq-pcie-m2.c:368:54: note: each undeclared identifier is reported only once for each function it appears in
   drivers/power/sequencing/pwrseq-pcie-m2.c: In function 'pwrseq_pcie_m2_remove':
   drivers/power/sequencing/pwrseq-pcie-m2.c:455:34: error: 'pci_bus_type' undeclared (first use in this function); did you mean 'pci_pcie_type'?
     455 |         bus_unregister_notifier(&pci_bus_type, &ctx->nb);
         |                                  ^~~~~~~~~~~~
         |                                  pci_pcie_type
   cc1: some warnings being treated as errors


vim +193 drivers/power/sequencing/pwrseq-pcie-m2.c

   179	
   180	static int pwrseq_m2_pcie_create_bt_node(struct pwrseq_pcie_m2_ctx *ctx,
   181						struct device_node *parent)
   182	{
   183		struct device *dev = ctx->dev;
   184		struct device_node *np;
   185		int ret;
   186	
   187		ctx->ocs = kzalloc_obj(*ctx->ocs);
   188		if (!ctx->ocs)
   189			return -ENOMEM;
   190	
   191		of_changeset_init(ctx->ocs);
   192	
 > 193		np = of_changeset_create_node(ctx->ocs, parent, "bluetooth");
   194		if (!np) {
   195			dev_err(dev, "Failed to create bluetooth node\n");
   196			ret = -ENODEV;
   197			goto err_destroy_changeset;
   198		}
   199	
   200		ret = of_changeset_add_prop_string(ctx->ocs, np, "compatible", "qcom,wcn7850-bt");
   201		if (ret) {
   202			dev_err(dev, "Failed to add bluetooth compatible: %d\n", ret);
   203			goto err_destroy_changeset;
   204		}
   205	
   206		ret = of_changeset_apply(ctx->ocs);
   207		if (ret) {
   208			dev_err(dev, "Failed to apply changeset: %d\n", ret);
   209			goto err_destroy_changeset;
   210		}
   211	
   212		ret = device_add_of_node(&ctx->serdev->dev, np);
   213		if (ret) {
   214			dev_err(dev, "Failed to add OF node: %d\n", ret);
   215			goto err_revert_changeset;
   216		}
   217	
   218		return 0;
   219	
   220	err_revert_changeset:
   221		of_changeset_revert(ctx->ocs);
   222	err_destroy_changeset:
   223		of_changeset_destroy(ctx->ocs);
   224		kfree(ctx->ocs);
   225		ctx->ocs = NULL;
   226	
   227		return ret;
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
