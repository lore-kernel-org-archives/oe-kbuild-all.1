Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6263E179
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 00:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695254871; x=1726790871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/8CkGtWDAPmDEoPfFhtezEmRTM+PbPHBfJZt/mLt0Ho=;
  b=MwhGh/8Ibq/VRUFCcAFmjutIfGB7Jc7qZu2F+ehwFw7BIz8NRcXOc3Ue
   RdUZuDLYgisVLu9tr9pPze0YiaKIO5WRZkE9PYXwaaM7oe4sSiK1owt73
   cYC0KmMdJDTnRn97N6tlXuVzTgh/+qYdzxT+WWHnNm5awokzZTvHm4kmt
   J910ecgZfuTItNMJFOPwv8wFXGBK1+J+3HqkzmxzN13pavoEMNK6gAyYc
   6Pn0YxSyoPuU0jm3KgRrFAFXILQXBvrp7+5DZRXVJ0nHnhIl4L01PzqrR
   4KnaFovn4Ay10QWeXtLlEqz+fMRKaGGKZEG28a3mbEjN+EhH1GXB+xANd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="384214593"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="384214593"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 17:07:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="812385022"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="812385022"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 20 Sep 2023 17:07:31 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj7E8-0009Ii-2X;
	Thu, 21 Sep 2023 00:07:28 +0000
Date: Thu, 21 Sep 2023 08:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Levinsky <ben.levinsky@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Rajan Vaja <rajan.vaja@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 22/1365]
 drivers/firmware/xilinx/zynqmp.c:1205:5: warning: conflicting types for
 'zynqmp_pm_set_rpu_mode' due to enum/integer mismatch; have 'int(u32,  enum
 rpu_oper_mode)' {aka 'int(unsigned int,  enum rpu_oper_mode)'}
Message-ID: <202309210859.xTBOnrcK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   008e6788f5aa09862307822bfc396c926dc0dbac
commit: 4accfe91fd4bad667fa84023c90f008d33c0466e [22/1365] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230921/202309210859.xTBOnrcK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210859.xTBOnrcK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210859.xTBOnrcK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/xilinx/zynqmp.c:1205:5: warning: conflicting types for 'zynqmp_pm_set_rpu_mode' due to enum/integer mismatch; have 'int(u32,  enum rpu_oper_mode)' {aka 'int(unsigned int,  enum rpu_oper_mode)'} [-Wenum-int-mismatch]
    1205 | int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/firmware/xilinx/zynqmp.c:25:
   include/linux/firmware/xlnx-zynqmp.h:536:5: note: previous declaration of 'zynqmp_pm_set_rpu_mode' with type 'int(u32,  u32)' {aka 'int(unsigned int,  unsigned int)'}
     536 | int zynqmp_pm_set_rpu_mode(u32 node_id, u32 arg1);
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/xilinx/zynqmp.c:1223:5: warning: conflicting types for 'zynqmp_pm_set_tcm_config' due to enum/integer mismatch; have 'int(u32,  enum rpu_tcm_comb)' {aka 'int(unsigned int,  enum rpu_tcm_comb)'} [-Wenum-int-mismatch]
    1223 | int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/firmware/xlnx-zynqmp.h:537:5: note: previous declaration of 'zynqmp_pm_set_tcm_config' with type 'int(u32,  u32)' {aka 'int(unsigned int,  unsigned int)'}
     537 | int zynqmp_pm_set_tcm_config(u32 node_id, u32 arg1);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +1205 drivers/firmware/xilinx/zynqmp.c

  1194	
  1195	/**
  1196	 * zynqmp_pm_set_rpu_mode() - Set RPU mode
  1197	 * @node_id:	Node ID of the device
  1198	 * @rpu_mode:	Argument 1 to requested IOCTL call. either split or lockstep
  1199	 *
  1200	 *		This function is used to set RPU mode to split or
  1201	 *		lockstep
  1202	 *
  1203	 * Return:	Returns status, either success or error+reason
  1204	 */
> 1205	int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode)
  1206	{
  1207		return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
  1208					   IOCTL_SET_RPU_OPER_MODE, (u32)rpu_mode,
  1209					   0, NULL);
  1210	}
  1211	EXPORT_SYMBOL_GPL(zynqmp_pm_set_rpu_mode);
  1212	
  1213	/**
  1214	 * zynqmp_pm_set_tcm_config - configure TCM
  1215	 * @node_id:	Node ID of the device
  1216	 * @tcm_mode:	Argument 1 to requested IOCTL call
  1217	 *              either PM_RPU_TCM_COMB or PM_RPU_TCM_SPLIT
  1218	 *
  1219	 * This function is used to set RPU mode to split or combined
  1220	 *
  1221	 * Return: status: 0 for success, else failure
  1222	 */
> 1223	int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode)
  1224	{
  1225		return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
  1226					   IOCTL_TCM_COMB_CONFIG, (u32)tcm_mode, 0,
  1227					   NULL);
  1228	}
  1229	EXPORT_SYMBOL_GPL(zynqmp_pm_set_tcm_config);
  1230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
