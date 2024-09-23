Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9E81CA84
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 19:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727120088; cv=none; b=a6VdN/TQ33gIl5mbPO1KoLWh0GdiP+tq+9i0F7ZVIA7h4y0qKsIuqGEjsDbH4F/6Uj7R1BHqsBkifdasooV+vcr1qLU3oM/lGapFtBXXyLf6eis+8rKT8f820a36vqnn+NDGbZ6NvXFdNokdlxrkaCWChnZO4/R32zr7uaGW7gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727120088; c=relaxed/simple;
	bh=tsIw9SzsuzxR3t959fc44f3JqYHltK1nTX70TnqUXUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rV/kAEQUgQe4P/os3C44WW6T3HKRpRSAceJOSFK1Qg2pnvzd9ounKmIG/sdDDgX/TxeoORD7AvIAwPf09WumhCJhO9yXQiVjGaPYhuZc/lgiVSfAG6ftWVWaYyNAedV1dGyREeoG40bZ3rzbRFUQ4uqJOvtQxOlpGlxlb3WMeI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUb59gMx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUb59gMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727120086; x=1758656086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tsIw9SzsuzxR3t959fc44f3JqYHltK1nTX70TnqUXUM=;
  b=QUb59gMxFquWcAOSCy+mlglyHrPxZwnKHYCokDjz54MrVMNa5p2dshf5
   +B60l0wlig680ekccWQqmUwT+fqYsqZ1DL7ol0aaeCwv5re0V/jTDOkPO
   tc53xlB5Hm337H3hN++nOJb2uNiSwzGa1TT67wP8rvHHO9IcMdnSmh9N0
   rJRe/Fizh44dkaO7cgkQX1EheveL9I5tNWWrUK9OvHpXGvi/zBcITUsrh
   jz1+GHdZNy6KPTu+K8UwdpNVXct4FdaGtZ9sXN82payP/9RDWX+u4873E
   QaU5Vy+jJgF78W5V32kTC/D+NF8AJpmlP7YBD0xPbqE1YSectq6kruCo/
   A==;
X-CSE-ConnectionGUID: +SxNspauT7Wt5RQM6l2ZNA==
X-CSE-MsgGUID: JKAZDfsHTEiVF9XRZjsOuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26181200"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="26181200"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 12:34:45 -0700
X-CSE-ConnectionGUID: TzOhHpobShGCQWTyXTZJwA==
X-CSE-MsgGUID: 2JobeP83QKayO3ac2HLpLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="71441434"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2024 12:34:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssopT-000HXo-2X;
	Mon, 23 Sep 2024 19:34:39 +0000
Date: Tue, 24 Sep 2024 03:33:47 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1010/2441]
 drivers/scsi/53c700.c:287:18: error: use of undeclared identifier
 'DMA_ATTR_NON_CONSISTENT'
Message-ID: <202409240307.4CfgJ53B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 0764432a5ada7a09ce36b0e980ec40340fae2a30 [1010/2441] dma-mapping: add a new dma_alloc_pages API
config: x86_64-buildonly-randconfig-003-20240923 (https://download.01.org/0day-ci/archive/20240924/202409240307.4CfgJ53B-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240307.4CfgJ53B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240307.4CfgJ53B-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/53c700.c:287:18: error: use of undeclared identifier 'DMA_ATTR_NON_CONSISTENT'
     287 |                                  GFP_KERNEL, DMA_ATTR_NON_CONSISTENT);
         |                                              ^
   drivers/scsi/53c700.c:399:29: error: use of undeclared identifier 'DMA_ATTR_NON_CONSISTENT'
     399 |                        hostdata->pScript, DMA_ATTR_NON_CONSISTENT);
         |                                           ^
   drivers/scsi/53c700.c:1488:27: warning: variable 'state' set but not used [-Wunused-but-set-variable]
    1488 |                 enum NCR_700_Host_State state;
         |                                         ^
   drivers/scsi/53c700.c:1742:26: warning: variable 'direction' set but not used [-Wunused-but-set-variable]
    1742 |         enum dma_data_direction direction;
         |                                 ^
   2 warnings and 2 errors generated.
--
   In file included from kernel/dma/mapping.c:10:
   include/linux/dma-direct.h:87:7: error: conflicting types for 'dma_direct_alloc_pages'
      87 | void *dma_direct_alloc_pages(struct device *dev, size_t size,
         |       ^
   include/linux/dma-direct.h:82:14: note: previous declaration is here
      82 | struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
         |              ^
   include/linux/dma-direct.h:89:6: error: conflicting types for 'dma_direct_free_pages'
      89 | void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
         |      ^
   include/linux/dma-direct.h:84:6: note: previous declaration is here
      84 | void dma_direct_free_pages(struct device *dev, size_t size,
         |      ^
>> kernel/dma/mapping.c:557:38: error: too many arguments provided to function-like macro invocation
     557 |                 page = ops->alloc_pages(dev, size, dma_handle, dir, gfp);
         |                                                    ^
   include/linux/gfp.h:540:9: note: macro 'alloc_pages' defined here
     540 | #define alloc_pages(gfp_mask, order) \
         |         ^
>> kernel/dma/mapping.c:557:8: error: incompatible pointer types assigning to 'struct page *' from 'struct page *(*const)(struct device *, size_t, dma_addr_t *, enum dma_data_direction, gfp_t)' (aka 'struct page *(*const)(struct device *, unsigned long, unsigned long long *, enum dma_data_direction, unsigned int)') [-Werror,-Wincompatible-pointer-types]
     557 |                 page = ops->alloc_pages(dev, size, dma_handle, dir, gfp);
         |                      ^ ~~~~~~~~~~~~~~~~
   4 errors generated.


vim +/DMA_ATTR_NON_CONSISTENT +287 drivers/scsi/53c700.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  271  
^1da177e4c3f41 Linus Torvalds    2005-04-16  272  struct Scsi_Host *
^1da177e4c3f41 Linus Torvalds    2005-04-16  273  NCR_700_detect(struct scsi_host_template *tpnt,
^1da177e4c3f41 Linus Torvalds    2005-04-16  274  	       struct NCR_700_Host_Parameters *hostdata, struct device *dev)
^1da177e4c3f41 Linus Torvalds    2005-04-16  275  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  276  	dma_addr_t pScript, pSlots;
^1da177e4c3f41 Linus Torvalds    2005-04-16  277  	__u8 *memory;
^1da177e4c3f41 Linus Torvalds    2005-04-16  278  	__u32 *script;
^1da177e4c3f41 Linus Torvalds    2005-04-16  279  	struct Scsi_Host *host;
^1da177e4c3f41 Linus Torvalds    2005-04-16  280  	static int banner = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  281  	int j;
^1da177e4c3f41 Linus Torvalds    2005-04-16  282  
^1da177e4c3f41 Linus Torvalds    2005-04-16  283  	if(tpnt->sdev_attrs == NULL)
^1da177e4c3f41 Linus Torvalds    2005-04-16  284  		tpnt->sdev_attrs = NCR_700_dev_attrs;
^1da177e4c3f41 Linus Torvalds    2005-04-16  285  
8437fcf14deed6 Dan Carpenter     2019-01-24  286  	memory = dma_alloc_attrs(dev, TOTAL_MEM_SIZE, &pScript,
106e97b92e644b Christoph Hellwig 2017-06-16 @287  				 GFP_KERNEL, DMA_ATTR_NON_CONSISTENT);
^1da177e4c3f41 Linus Torvalds    2005-04-16  288  	if(memory == NULL) {
804ff603d2fe98 Masanari Iida     2015-05-07  289  		printk(KERN_ERR "53c700: Failed to allocate memory for driver, detaching\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  290  		return NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  291  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  292  
^1da177e4c3f41 Linus Torvalds    2005-04-16  293  	script = (__u32 *)memory;
^1da177e4c3f41 Linus Torvalds    2005-04-16  294  	hostdata->msgin = memory + MSGIN_OFFSET;
^1da177e4c3f41 Linus Torvalds    2005-04-16  295  	hostdata->msgout = memory + MSGOUT_OFFSET;
^1da177e4c3f41 Linus Torvalds    2005-04-16  296  	hostdata->status = memory + STATUS_OFFSET;
^1da177e4c3f41 Linus Torvalds    2005-04-16  297  	hostdata->slots = (struct NCR_700_command_slot *)(memory + SLOTS_OFFSET);
^1da177e4c3f41 Linus Torvalds    2005-04-16  298  	hostdata->dev = dev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  299  
^1da177e4c3f41 Linus Torvalds    2005-04-16  300  	pSlots = pScript + SLOTS_OFFSET;
^1da177e4c3f41 Linus Torvalds    2005-04-16  301  
^1da177e4c3f41 Linus Torvalds    2005-04-16  302  	/* Fill in the missing routines from the host template */
^1da177e4c3f41 Linus Torvalds    2005-04-16  303  	tpnt->queuecommand = NCR_700_queuecommand;
^1da177e4c3f41 Linus Torvalds    2005-04-16  304  	tpnt->eh_abort_handler = NCR_700_abort;
^1da177e4c3f41 Linus Torvalds    2005-04-16  305  	tpnt->eh_host_reset_handler = NCR_700_host_reset;
^1da177e4c3f41 Linus Torvalds    2005-04-16  306  	tpnt->can_queue = NCR_700_COMMAND_SLOTS_PER_HOST;
^1da177e4c3f41 Linus Torvalds    2005-04-16  307  	tpnt->sg_tablesize = NCR_700_SG_SEGMENTS;
^1da177e4c3f41 Linus Torvalds    2005-04-16  308  	tpnt->cmd_per_lun = NCR_700_CMD_PER_LUN;
^1da177e4c3f41 Linus Torvalds    2005-04-16  309  	tpnt->slave_configure = NCR_700_slave_configure;
^1da177e4c3f41 Linus Torvalds    2005-04-16  310  	tpnt->slave_destroy = NCR_700_slave_destroy;
0f13fc09db68de James Bottomley   2006-06-29  311  	tpnt->slave_alloc = NCR_700_slave_alloc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  312  	tpnt->change_queue_depth = NCR_700_change_queue_depth;
^1da177e4c3f41 Linus Torvalds    2005-04-16  313  
^1da177e4c3f41 Linus Torvalds    2005-04-16  314  	if(tpnt->name == NULL)
^1da177e4c3f41 Linus Torvalds    2005-04-16  315  		tpnt->name = "53c700";
^1da177e4c3f41 Linus Torvalds    2005-04-16  316  	if(tpnt->proc_name == NULL)
^1da177e4c3f41 Linus Torvalds    2005-04-16  317  		tpnt->proc_name = "53c700";
^1da177e4c3f41 Linus Torvalds    2005-04-16  318  
^1da177e4c3f41 Linus Torvalds    2005-04-16  319  	host = scsi_host_alloc(tpnt, 4);
^1da177e4c3f41 Linus Torvalds    2005-04-16  320  	if (!host)
^1da177e4c3f41 Linus Torvalds    2005-04-16  321  		return NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  322  	memset(hostdata->slots, 0, sizeof(struct NCR_700_command_slot)
^1da177e4c3f41 Linus Torvalds    2005-04-16  323  	       * NCR_700_COMMAND_SLOTS_PER_HOST);
^1da177e4c3f41 Linus Torvalds    2005-04-16  324  	for (j = 0; j < NCR_700_COMMAND_SLOTS_PER_HOST; j++) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  325  		dma_addr_t offset = (dma_addr_t)((unsigned long)&hostdata->slots[j].SG[0]
^1da177e4c3f41 Linus Torvalds    2005-04-16  326  					  - (unsigned long)&hostdata->slots[0].SG[0]);
^1da177e4c3f41 Linus Torvalds    2005-04-16  327  		hostdata->slots[j].pSG = (struct NCR_700_SG_List *)((unsigned long)(pSlots + offset));
^1da177e4c3f41 Linus Torvalds    2005-04-16  328  		if(j == 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  329  			hostdata->free_list = &hostdata->slots[j];
^1da177e4c3f41 Linus Torvalds    2005-04-16  330  		else
^1da177e4c3f41 Linus Torvalds    2005-04-16  331  			hostdata->slots[j-1].ITL_forw = &hostdata->slots[j];
^1da177e4c3f41 Linus Torvalds    2005-04-16  332  		hostdata->slots[j].state = NCR_700_SLOT_FREE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  333  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  334  
6391a11375de5e Tobias Klauser    2006-06-08  335  	for (j = 0; j < ARRAY_SIZE(SCRIPT); j++)
^1da177e4c3f41 Linus Torvalds    2005-04-16  336  		script[j] = bS_to_host(SCRIPT[j]);
^1da177e4c3f41 Linus Torvalds    2005-04-16  337  
^1da177e4c3f41 Linus Torvalds    2005-04-16  338  	/* adjust all labels to be bus physical */
6391a11375de5e Tobias Klauser    2006-06-08  339  	for (j = 0; j < PATCHES; j++)
^1da177e4c3f41 Linus Torvalds    2005-04-16  340  		script[LABELPATCHES[j]] = bS_to_host(pScript + SCRIPT[LABELPATCHES[j]]);
^1da177e4c3f41 Linus Torvalds    2005-04-16  341  	/* now patch up fixed addresses. */
d3fa72e4556ec1 Ralf Baechle      2006-12-06  342  	script_patch_32(hostdata->dev, script, MessageLocation,
^1da177e4c3f41 Linus Torvalds    2005-04-16  343  			pScript + MSGOUT_OFFSET);
d3fa72e4556ec1 Ralf Baechle      2006-12-06  344  	script_patch_32(hostdata->dev, script, StatusAddress,
^1da177e4c3f41 Linus Torvalds    2005-04-16  345  			pScript + STATUS_OFFSET);
d3fa72e4556ec1 Ralf Baechle      2006-12-06  346  	script_patch_32(hostdata->dev, script, ReceiveMsgAddress,
^1da177e4c3f41 Linus Torvalds    2005-04-16  347  			pScript + MSGIN_OFFSET);
^1da177e4c3f41 Linus Torvalds    2005-04-16  348  
^1da177e4c3f41 Linus Torvalds    2005-04-16  349  	hostdata->script = script;
^1da177e4c3f41 Linus Torvalds    2005-04-16  350  	hostdata->pScript = pScript;
^1da177e4c3f41 Linus Torvalds    2005-04-16  351  	dma_sync_single_for_device(hostdata->dev, pScript, sizeof(SCRIPT), DMA_TO_DEVICE);
^1da177e4c3f41 Linus Torvalds    2005-04-16  352  	hostdata->state = NCR_700_HOST_FREE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  353  	hostdata->cmd = NULL;
2b89dad0c7e3b0 Hannes Reinecke   2006-05-23  354  	host->max_id = 8;
^1da177e4c3f41 Linus Torvalds    2005-04-16  355  	host->max_lun = NCR_700_MAX_LUNS;
^1da177e4c3f41 Linus Torvalds    2005-04-16  356  	BUG_ON(NCR_700_transport_template == NULL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  357  	host->transportt = NCR_700_transport_template;
56fece20086ebe                   2005-04-03  358  	host->unique_id = (unsigned long)hostdata->base;
^1da177e4c3f41 Linus Torvalds    2005-04-16  359  	hostdata->eh_complete = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  360  	host->hostdata[0] = (unsigned long)hostdata;
^1da177e4c3f41 Linus Torvalds    2005-04-16  361  	/* kick the chip */
^1da177e4c3f41 Linus Torvalds    2005-04-16  362  	NCR_700_writeb(0xff, host, CTEST9_REG);
^1da177e4c3f41 Linus Torvalds    2005-04-16  363  	if (hostdata->chip710)
^1da177e4c3f41 Linus Torvalds    2005-04-16  364  		hostdata->rev = (NCR_700_readb(host, CTEST8_REG)>>4) & 0x0f;
^1da177e4c3f41 Linus Torvalds    2005-04-16  365  	else
^1da177e4c3f41 Linus Torvalds    2005-04-16  366  		hostdata->rev = (NCR_700_readb(host, CTEST7_REG)>>4) & 0x0f;
^1da177e4c3f41 Linus Torvalds    2005-04-16  367  	hostdata->fast = (NCR_700_readb(host, CTEST9_REG) == 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  368  	if (banner == 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  369  		printk(KERN_NOTICE "53c700: Version " NCR_700_VERSION " By James.Bottomley@HansenPartnership.com\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  370  		banner = 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  371  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  372  	printk(KERN_NOTICE "scsi%d: %s rev %d %s\n", host->host_no,
^1da177e4c3f41 Linus Torvalds    2005-04-16  373  	       hostdata->chip710 ? "53c710" :
^1da177e4c3f41 Linus Torvalds    2005-04-16  374  	       (hostdata->fast ? "53c700-66" : "53c700"),
^1da177e4c3f41 Linus Torvalds    2005-04-16  375  	       hostdata->rev, hostdata->differential ?
^1da177e4c3f41 Linus Torvalds    2005-04-16  376  	       "(Differential)" : "");
^1da177e4c3f41 Linus Torvalds    2005-04-16  377  	/* reset the chip */
^1da177e4c3f41 Linus Torvalds    2005-04-16  378  	NCR_700_chip_reset(host);
^1da177e4c3f41 Linus Torvalds    2005-04-16  379  
^1da177e4c3f41 Linus Torvalds    2005-04-16  380  	if (scsi_add_host(host, dev)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  381  		dev_printk(KERN_ERR, dev, "53c700: scsi_add_host failed\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  382  		scsi_host_put(host);
^1da177e4c3f41 Linus Torvalds    2005-04-16  383  		return NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  384  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  385  
^1da177e4c3f41 Linus Torvalds    2005-04-16  386  	spi_signalling(host) = hostdata->differential ? SPI_SIGNAL_HVD :
^1da177e4c3f41 Linus Torvalds    2005-04-16  387  		SPI_SIGNAL_SE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  388  
^1da177e4c3f41 Linus Torvalds    2005-04-16  389  	return host;
^1da177e4c3f41 Linus Torvalds    2005-04-16  390  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  391  

:::::: The code at line 287 was first introduced by commit
:::::: 106e97b92e644b7f90ce84ba02998c86b4ec747f scsi: 53c700: switch to dma_alloc_attrs

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
