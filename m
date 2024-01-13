Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17483CA62
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 03:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZI321Cae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705116432; x=1736652432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6YfXYjeIauw6CBJcU6vtjsdg6zUvDod3RduRGu2aYTo=;
  b=ZI321CaeG6GwIST/VrYYNmiS5ZEAUIjs5GAburReuFf5HC1leSqPrGje
   O+1SM307bSCj1ojMx3Mwz2WYhk2pjXiy7C7cizLbCN+baPYfHLhIVSBn9
   wp2u8ZHaIXjkD5UOZdxY1lSL/4cyxvpG8QsRzkp8LcEAzu0u3WzXrcWuw
   HO8zeJjnterCuplLoNic6wXTixjCZN3CcAa4VhpAcYzoPg7OuVfqKiEjf
   dM5vKSgFumxiNHRQc4VZ25CQoAyThMPu21yppFhuC9NrpBGDvvtu+YxYK
   mjnkV+1bzPWdQ0JmX92uFcROi3sikfXndTVeW3E3HF2bSYODvkt51+csn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6700505"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="6700505"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 19:27:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="926589701"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="926589701"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2024 19:27:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOUfq-000A2b-2s;
	Sat, 13 Jan 2024 03:27:07 +0000
Date: Sat, 13 Jan 2024 11:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 1611/17888]
 drivers/dma/fsl-dpaa2-qdma/dpdmai.c:102: warning: Function parameter or
 member 'dpdmai_id' not described in 'dpdmai_create'
Message-ID: <202401131143.xfSigC4Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: 9bb44c4b4291762bdb33515450bdae8deb7bc494 [1611/17888] dmaengine: fsl-dpaa2-qdma: Update DPDMAI interfaces
config: arm64-randconfig-004-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131143.xfSigC4Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131143.xfSigC4Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131143.xfSigC4Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/fsl-dpaa2-qdma/dpdmai.c:102: warning: Function parameter or member 'dpdmai_id' not described in 'dpdmai_create'
>> drivers/dma/fsl-dpaa2-qdma/dpdmai.c:144: warning: Function parameter or member 'dpdmai_id' not described in 'dpdmai_destroy'
>> drivers/dma/fsl-dpaa2-qdma/dpdmai.c:144: warning: Excess function parameter 'object_id' description in 'dpdmai_destroy'
>> drivers/dma/fsl-dpaa2-qdma/dpdmai.c:305: warning: Function parameter or member 'queue_idx' not described in 'dpdmai_set_rx_queue'
>> drivers/dma/fsl-dpaa2-qdma/dpdmai.c:343: warning: Function parameter or member 'queue_idx' not described in 'dpdmai_get_rx_queue'
>> drivers/dma/fsl-dpaa2-qdma/dpdmai.c:389: warning: Function parameter or member 'queue_idx' not described in 'dpdmai_get_tx_queue'
>> drivers/dma/fsl-dpaa2-qdma/dpdmai.c:389: warning: Function parameter or member 'attr' not described in 'dpdmai_get_tx_queue'
>> drivers/dma/fsl-dpaa2-qdma/dpdmai.c:389: warning: Excess function parameter 'fqid' description in 'dpdmai_get_tx_queue'


vim +102 drivers/dma/fsl-dpaa2-qdma/dpdmai.c

f2835adf8afb2c Peng Ma     2019-09-30   76  
f2835adf8afb2c Peng Ma     2019-09-30   77  /**
f2835adf8afb2c Peng Ma     2019-09-30   78   * dpdmai_create() - Create the DPDMAI object
f2835adf8afb2c Peng Ma     2019-09-30   79   * @mc_io:	Pointer to MC portal's I/O object
f2835adf8afb2c Peng Ma     2019-09-30   80   * @cmd_flags:	Command flags; one or more of 'MC_CMD_FLAG_'
f2835adf8afb2c Peng Ma     2019-09-30   81   * @cfg:	Configuration structure
f2835adf8afb2c Peng Ma     2019-09-30   82   * @token:	Returned token; use in subsequent API calls
f2835adf8afb2c Peng Ma     2019-09-30   83   *
f2835adf8afb2c Peng Ma     2019-09-30   84   * Create the DPDMAI object, allocate required resources and
f2835adf8afb2c Peng Ma     2019-09-30   85   * perform required initialization.
f2835adf8afb2c Peng Ma     2019-09-30   86   *
f2835adf8afb2c Peng Ma     2019-09-30   87   * The object can be created either by declaring it in the
f2835adf8afb2c Peng Ma     2019-09-30   88   * DPL file, or by calling this function.
f2835adf8afb2c Peng Ma     2019-09-30   89   *
f2835adf8afb2c Peng Ma     2019-09-30   90   * This function returns a unique authentication token,
f2835adf8afb2c Peng Ma     2019-09-30   91   * associated with the specific object ID and the specific MC
f2835adf8afb2c Peng Ma     2019-09-30   92   * portal; this token must be used in all subsequent calls to
f2835adf8afb2c Peng Ma     2019-09-30   93   * this specific object. For objects that are created using the
f2835adf8afb2c Peng Ma     2019-09-30   94   * DPL file, call dpdmai_open() function to get an authentication
f2835adf8afb2c Peng Ma     2019-09-30   95   * token first.
f2835adf8afb2c Peng Ma     2019-09-30   96   *
f2835adf8afb2c Peng Ma     2019-09-30   97   * Return:	'0' on Success; Error code otherwise.
f2835adf8afb2c Peng Ma     2019-09-30   98   */
f2835adf8afb2c Peng Ma     2019-09-30   99  int dpdmai_create(struct fsl_mc_io *mc_io, u32 cmd_flags,
9bb44c4b429176 Guanhua Gao 2020-12-10  100  		  const struct dpdmai_cfg *cfg, u16 token,
9bb44c4b429176 Guanhua Gao 2020-12-10  101  		  u32 *dpdmai_id)
f2835adf8afb2c Peng Ma     2019-09-30 @102  {
9bb44c4b429176 Guanhua Gao 2020-12-10  103  	struct dpdmai_cmd_create *cmd_params;
f2835adf8afb2c Peng Ma     2019-09-30  104  	struct fsl_mc_command cmd = { 0 };
f2835adf8afb2c Peng Ma     2019-09-30  105  	int err;
f2835adf8afb2c Peng Ma     2019-09-30  106  
f2835adf8afb2c Peng Ma     2019-09-30  107  	/* prepare command */
f2835adf8afb2c Peng Ma     2019-09-30  108  	cmd.header = mc_encode_cmd_header(DPDMAI_CMDID_CREATE,
9bb44c4b429176 Guanhua Gao 2020-12-10  109  					  cmd_flags, token);
9bb44c4b429176 Guanhua Gao 2020-12-10  110  	cmd_params = (struct dpdmai_cmd_create *)cmd.params;
9bb44c4b429176 Guanhua Gao 2020-12-10  111  	cmd_params->num_queues = cfg->num_queues;
9bb44c4b429176 Guanhua Gao 2020-12-10  112  	cmd_params->priorities[0] = cfg->priorities[0];
9bb44c4b429176 Guanhua Gao 2020-12-10  113  	cmd_params->priorities[1] = cfg->priorities[1];
f2835adf8afb2c Peng Ma     2019-09-30  114  
f2835adf8afb2c Peng Ma     2019-09-30  115  	/* send command to mc*/
f2835adf8afb2c Peng Ma     2019-09-30  116  	err = mc_send_command(mc_io, &cmd);
f2835adf8afb2c Peng Ma     2019-09-30  117  	if (err)
f2835adf8afb2c Peng Ma     2019-09-30  118  		return err;
f2835adf8afb2c Peng Ma     2019-09-30  119  
f2835adf8afb2c Peng Ma     2019-09-30  120  	/* retrieve response parameters */
9bb44c4b429176 Guanhua Gao 2020-12-10  121  	*dpdmai_id = mc_cmd_read_object_id(&cmd);
f2835adf8afb2c Peng Ma     2019-09-30  122  
f2835adf8afb2c Peng Ma     2019-09-30  123  	return 0;
f2835adf8afb2c Peng Ma     2019-09-30  124  }
9bb44c4b429176 Guanhua Gao 2020-12-10  125  EXPORT_SYMBOL_GPL(dpdmai_create);
f2835adf8afb2c Peng Ma     2019-09-30  126  
3e0ca3c38dc2ff Peng Ma     2020-02-27  127  /**
3e0ca3c38dc2ff Peng Ma     2020-02-27  128   * dpdmai_destroy() - Destroy the DPDMAI object and release all its resources.
3e0ca3c38dc2ff Peng Ma     2020-02-27  129   * @mc_io:	Pointer to MC portal's I/O object
9bb44c4b429176 Guanhua Gao 2020-12-10  130   * @token:	Parent container token; '0' for default container
3e0ca3c38dc2ff Peng Ma     2020-02-27  131   * @cmd_flags:	Command flags; one or more of 'MC_CMD_FLAG_'
9bb44c4b429176 Guanhua Gao 2020-12-10  132   * @object_id:	The object id; it must be a valid id within the container that
9bb44c4b429176 Guanhua Gao 2020-12-10  133   *		created this object;
9bb44c4b429176 Guanhua Gao 2020-12-10  134   *
9bb44c4b429176 Guanhua Gao 2020-12-10  135   * The function accepts the authentication token of the parent container that
9bb44c4b429176 Guanhua Gao 2020-12-10  136   * created the object (not the one that currently owns the object). The object
9bb44c4b429176 Guanhua Gao 2020-12-10  137   * is searched within parent using the provided 'object_id'.
9bb44c4b429176 Guanhua Gao 2020-12-10  138   * All tokens to the object must be closed before calling destroy.
3e0ca3c38dc2ff Peng Ma     2020-02-27  139   *
3e0ca3c38dc2ff Peng Ma     2020-02-27  140   * Return:	'0' on Success; error code otherwise.
3e0ca3c38dc2ff Peng Ma     2020-02-27  141   */
9bb44c4b429176 Guanhua Gao 2020-12-10  142  int dpdmai_destroy(struct fsl_mc_io *mc_io, u32 cmd_flags,
9bb44c4b429176 Guanhua Gao 2020-12-10  143  		   u32 dpdmai_id, u16 token)
3e0ca3c38dc2ff Peng Ma     2020-02-27 @144  {
9bb44c4b429176 Guanhua Gao 2020-12-10  145  	struct dpdmai_cmd_destroy *cmd_params;
3e0ca3c38dc2ff Peng Ma     2020-02-27  146  	struct fsl_mc_command cmd = { 0 };
3e0ca3c38dc2ff Peng Ma     2020-02-27  147  
3e0ca3c38dc2ff Peng Ma     2020-02-27  148  	/* prepare command */
3e0ca3c38dc2ff Peng Ma     2020-02-27  149  	cmd.header = mc_encode_cmd_header(DPDMAI_CMDID_DESTROY,
3e0ca3c38dc2ff Peng Ma     2020-02-27  150  					  cmd_flags, token);
9bb44c4b429176 Guanhua Gao 2020-12-10  151  	cmd_params = (struct dpdmai_cmd_destroy *)cmd.params;
9bb44c4b429176 Guanhua Gao 2020-12-10  152  	cmd_params->dpdmai_id = cpu_to_le32(dpdmai_id);
3e0ca3c38dc2ff Peng Ma     2020-02-27  153  
3e0ca3c38dc2ff Peng Ma     2020-02-27  154  	/* send command to mc*/
3e0ca3c38dc2ff Peng Ma     2020-02-27  155  	return mc_send_command(mc_io, &cmd);
3e0ca3c38dc2ff Peng Ma     2020-02-27  156  }
3e0ca3c38dc2ff Peng Ma     2020-02-27  157  EXPORT_SYMBOL_GPL(dpdmai_destroy);
3e0ca3c38dc2ff Peng Ma     2020-02-27  158  

:::::: The code at line 102 was first introduced by commit
:::::: f2835adf8afb2cea248dd10d6eb0444c34b3b51b dmaengine: fsl-dpaa2-qdma: Add the DPDMAI(Data Path DMA Interface) support

:::::: TO: Peng Ma <peng.ma@nxp.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
