Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638AFC2DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 03:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyyVBnwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696995082; x=1728531082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kBwiaiPsDguJwZltzqa92m1j1Ka5YcMt/Ys1NLP/o/U=;
  b=VyyVBnwyBWK0xNo5KhEk+iJGmc37d0FtrWP1fD41goyCpiWeYJiucq2q
   don6klIVDmtiM+fvxq+RQ1epRKDYNEk5FSolV4R0qohEQFct09NEqWbv6
   SIx89li1/kJzAY4debQYyQwwG7DL9G67BOzNoId2WPy2Y/ezSYjk1tSh8
   GZKHeQ8Kv4fsBysnqe5EYqqAqiDeTBSLum6sap1MBClOAE8qmcOOkspUT
   iQrRJNS8BuTsDGUOGbuAOJQAUW7clf4ubCp+QxzoOGq0G/wyxpSrJeZN9
   LvPuicCYG+Bbd7CqNHN+aeAvz5IErBkoUQxIz8a2exgsILMN6Pglkyo4y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374911821"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="374911821"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 20:31:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="844400135"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="844400135"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Oct 2023 20:31:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqPwL-0001e7-1a;
	Wed, 11 Oct 2023 03:31:17 +0000
Date: Wed, 11 Oct 2023 11:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Levinsky <ben.levinsky@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.10 71/1981]
 drivers/firmware/xilinx/zynqmp.c:915:5: warning: conflicting types for
 'zynqmp_pm_set_rpu_mode' due to enum/integer mismatch; have 'int(u32,  enum
 rpu_oper_mode)' {aka 'int(unsigned int,  enum rpu_oper_mode)'}
Message-ID: <202310111102.1nzasEFI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.10
head:   87ec9a2d98a7a7dfc98b57348a0ec310fd170e4b
commit: 4ecc84f78dacee2e1bcc1dc868b67ad5ba5b3bd2 [71/1981] firmware: xilinx: Add RPU configuration APIs
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231011/202310111102.1nzasEFI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310111102.1nzasEFI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310111102.1nzasEFI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/xilinx/zynqmp.c:915:5: warning: conflicting types for 'zynqmp_pm_set_rpu_mode' due to enum/integer mismatch; have 'int(u32,  enum rpu_oper_mode)' {aka 'int(unsigned int,  enum rpu_oper_mode)'} [-Wenum-int-mismatch]
     915 | int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/firmware/xilinx/zynqmp.c:25:
   include/linux/firmware/xlnx-zynqmp.h:389:5: note: previous declaration of 'zynqmp_pm_set_rpu_mode' with type 'int(u32,  u32)' {aka 'int(unsigned int,  unsigned int)'}
     389 | int zynqmp_pm_set_rpu_mode(u32 node_id, u32 arg1);
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/xilinx/zynqmp.c:932:5: warning: conflicting types for 'zynqmp_pm_set_tcm_config' due to enum/integer mismatch; have 'int(u32,  enum rpu_tcm_comb)' {aka 'int(unsigned int,  enum rpu_tcm_comb)'} [-Wenum-int-mismatch]
     932 | int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/firmware/xlnx-zynqmp.h:390:5: note: previous declaration of 'zynqmp_pm_set_tcm_config' with type 'int(u32,  u32)' {aka 'int(unsigned int,  unsigned int)'}
     390 | int zynqmp_pm_set_tcm_config(u32 node_id, u32 arg1);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +915 drivers/firmware/xilinx/zynqmp.c

   904	
   905	/**
   906	 * zynqmp_pm_set_rpu_mode() - Set RPU mode
   907	 * @node_id:	Node ID of the device
   908	 * @rpu_mode:	Argument 1 to requested IOCTL call. either split or lockstep
   909	 *
   910	 *		This function is used to set RPU mode to split or
   911	 *		lockstep
   912	 *
   913	 * Return:	Returns status, either success or error+reason
   914	 */
 > 915	int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode)
   916	{
   917		return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
   918					   IOCTL_SET_RPU_OPER_MODE, (u32)rpu_mode,
   919					   0, NULL);
   920	}
   921	EXPORT_SYMBOL_GPL(zynqmp_pm_set_rpu_mode);
   922	
   923	/**
   924	 * zynqmp_pm_set_tcm_config - configure TCM
   925	 * @tcm_mode:	Argument 1 to requested IOCTL call
   926	 *              either PM_RPU_TCM_COMB or PM_RPU_TCM_SPLIT
   927	 *
   928	 * This function is used to set RPU mode to split or combined
   929	 *
   930	 * Return: status: 0 for success, else failure
   931	 */
 > 932	int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode)
   933	{
   934		return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
   935					   IOCTL_TCM_COMB_CONFIG, (u32)tcm_mode, 0,
   936					   NULL);
   937	}
   938	EXPORT_SYMBOL_GPL(zynqmp_pm_set_tcm_config);
   939	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
