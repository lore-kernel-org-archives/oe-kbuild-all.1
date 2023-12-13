Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777FD5C084
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 21:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fS4z6w6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702504099; x=1734040099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s40glp2rRXDWH5AP2wureSuh+oQ/mKhq8pAfdNWH0PM=;
  b=fS4z6w6batSczOqXSA/Rk0EeETKIhzYKp1hYZHMFJncPJS3ye+9k5hQi
   iIVeJE++b5yKrR5FprRDehJxSOoopB5CYyvAHLkBFbAVwVrHdB4QAoRxS
   R4AyNebJmlMiir/CU5K0LzNJpb6FyA7yPSn0rXxd0OppjVr2zxq5fv/Cs
   PCzEesaGIQgZ9SbPHemvPdp6xsjr4i2zwVbdZDIkOM+vbe6Nl59Rdf063
   P37gd8c96mv87vxFUp6GUqsFSulPGCtL3qB3Hnlp9DbpWcl0YdyBk1WWf
   6hqObQLz0eBqEFeKLA3o1RilT3/pd+NmkKna96IrP9d5NwiLhKX30CWbD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="16581697"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="16581697"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 13:48:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="774094163"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="774094163"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Dec 2023 13:48:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDX5Q-000LA6-2k;
	Wed, 13 Dec 2023 21:48:12 +0000
Date: Thu, 14 Dec 2023 05:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: Shivasharan S <shivasharan.srikanteshwara@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Kashyap Desai <kashyap.desai@broadcom.com>
Subject: drivers/scsi/megaraid/megaraid_sas_base.c:243:31: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202312140556.wRhgqm6K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
commit: 107a60dd71b5f536a68437514f7c15a5dd3a4a9d scsi: megaraid_sas: Add support for 64bit consistent DMA
date:   6 years ago
config: sparc-randconfig-r121-20231110 (https://download.01.org/0day-ci/archive/20231214/202312140556.wRhgqm6K-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312140556.wRhgqm6K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140556.wRhgqm6K-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/megaraid/megaraid_sas_base.c:97:5: sparse: sparse: symbol 'rdpq_enable' was not declared. Should it be static?
   drivers/scsi/megaraid/megaraid_sas_base.c:105:14: sparse: sparse: symbol 'scmd_timeout' was not declared. Should it be static?
   drivers/scsi/megaraid/megaraid_sas_base.c:4277:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] flags @@     got int @@
   drivers/scsi/megaraid/megaraid_sas_base.c:4277:21: sparse:     expected restricted __le16 [usertype] flags
   drivers/scsi/megaraid/megaraid_sas_base.c:4277:21: sparse:     got int
   drivers/scsi/megaraid/megaraid_sas_base.c:4512:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] flags @@     got int @@
   drivers/scsi/megaraid/megaraid_sas_base.c:4512:21: sparse:     expected restricted __le16 [usertype] flags
   drivers/scsi/megaraid/megaraid_sas_base.c:4512:21: sparse:     got int
   drivers/scsi/megaraid/megaraid_sas_base.c:5747:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] flags @@     got int @@
   drivers/scsi/megaraid/megaraid_sas_base.c:5747:21: sparse:     expected restricted __le16 [usertype] flags
   drivers/scsi/megaraid/megaraid_sas_base.c:5747:21: sparse:     got int
   drivers/scsi/megaraid/megaraid_sas_base.c:4184:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] flags @@     got int @@
   drivers/scsi/megaraid/megaraid_sas_base.c:4184:21: sparse:     expected restricted __le16 [usertype] flags
   drivers/scsi/megaraid/megaraid_sas_base.c:4184:21: sparse:     got int
   drivers/scsi/megaraid/megaraid_sas_base.c:5824:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] flags @@     got int @@
   drivers/scsi/megaraid/megaraid_sas_base.c:5824:21: sparse:     expected restricted __le16 [usertype] flags
   drivers/scsi/megaraid/megaraid_sas_base.c:5824:21: sparse:     got int
   drivers/scsi/megaraid/megaraid_sas_base.c:175:26: sparse: sparse: symbol 'megasas_mgmt_info' was not declared. Should it be static?
   drivers/scsi/megaraid/megaraid_sas_base.c:237:31: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/megaraid/megaraid_sas_base.c:237:31: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/megaraid/megaraid_sas_base.c:237:31: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/megaraid/megaraid_sas_base.c:237:31: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/megaraid/megaraid_sas_base.c:243:31: sparse: sparse: cast from restricted __le16
>> drivers/scsi/megaraid/megaraid_sas_base.c:243:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] flags @@
   drivers/scsi/megaraid/megaraid_sas_base.c:243:31: sparse:     expected unsigned short [usertype] val
   drivers/scsi/megaraid/megaraid_sas_base.c:243:31: sparse:     got restricted __le16 [usertype] flags
   drivers/scsi/megaraid/megaraid_sas_base.c:243:31: sparse: sparse: cast from restricted __le16
   drivers/scsi/megaraid/megaraid_sas_base.c:243:31: sparse: sparse: cast from restricted __le16
   drivers/scsi/megaraid/megaraid_sas_base.c:248:1: sparse: sparse: symbol 'megasas_issue_dcmd' was not declared. Should it be static?
   drivers/scsi/megaraid/megaraid_sas_base.c:369:29: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:369:29: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:369:29: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:369:29: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:369:29: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:369:29: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:1918:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:1918:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:1918:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:1918:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:1918:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:1918:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:1926:34: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:1926:34: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:1926:34: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:1926:34: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:1926:34: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:1926:34: sparse: sparse: cast to restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:2180:6: sparse: sparse: symbol 'megasas_do_ocr' was not declared. Should it be static?
   drivers/scsi/megaraid/megaraid_sas_base.c:3139:25: sparse: sparse: symbol 'megaraid_host_attrs' was not declared. Should it be static?
   drivers/scsi/megaraid/megaraid_sas_base.c:4400:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] flags @@     got int @@
   drivers/scsi/megaraid/megaraid_sas_base.c:4400:21: sparse:     expected restricted __le16 [usertype] flags
   drivers/scsi/megaraid/megaraid_sas_base.c:4400:21: sparse:     got int
   drivers/scsi/megaraid/megaraid_sas_base.c:4674:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] flags @@     got int @@
   drivers/scsi/megaraid/megaraid_sas_base.c:4674:21: sparse:     expected restricted __le16 [usertype] flags
   drivers/scsi/megaraid/megaraid_sas_base.c:4674:21: sparse:     got int
   drivers/scsi/megaraid/megaraid_sas_base.c:5312:42: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/scsi/megaraid/megaraid_sas_base.c:5311:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] [usertype] <asn:2> * @@     got unsigned int [usertype] * @@
   drivers/scsi/megaraid/megaraid_sas_base.c:5311:57: sparse:     expected unsigned int [noderef] [usertype] <asn:2> *
   drivers/scsi/megaraid/megaraid_sas_base.c:5311:57: sparse:     got unsigned int [usertype] *
   drivers/scsi/megaraid/megaraid_sas_base.c:5316:34: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/scsi/megaraid/megaraid_sas_base.c:5315:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] [usertype] <asn:2> * @@     got unsigned int [usertype] * @@
   drivers/scsi/megaraid/megaraid_sas_base.c:5315:57: sparse:     expected unsigned int [noderef] [usertype] <asn:2> *
   drivers/scsi/megaraid/megaraid_sas_base.c:5315:57: sparse:     got unsigned int [usertype] *
   drivers/scsi/megaraid/megaraid_sas_base.c:5615:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] flags @@     got int @@
   drivers/scsi/megaraid/megaraid_sas_base.c:5615:21: sparse:     expected restricted __le16 [usertype] flags
   drivers/scsi/megaraid/megaraid_sas_base.c:5615:21: sparse:     got int
   drivers/scsi/megaraid/megaraid_sas_base.c:7046:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected int crash_support @@     got restricted __le32 @@
   drivers/scsi/megaraid/megaraid_sas_base.c:7046:23: sparse:     expected int crash_support
   drivers/scsi/megaraid/megaraid_sas_base.c:7046:23: sparse:     got restricted __le32
   drivers/scsi/megaraid/megaraid_sas_base.c:7124:31: sparse: sparse: invalid assignment: &=
   drivers/scsi/megaraid/megaraid_sas_base.c:7124:31: sparse:    left side has type restricted __le16
   drivers/scsi/megaraid/megaraid_sas_base.c:7124:31: sparse:    right side has type int
   drivers/scsi/megaraid/megaraid_sas_base.c:7215:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le64 [usertype] @@
   drivers/scsi/megaraid/megaraid_sas_base.c:7215:36: sparse:     expected unsigned long
   drivers/scsi/megaraid/megaraid_sas_base.c:7215:36: sparse:     got restricted __le64 [usertype]
   drivers/scsi/megaraid/megaraid_sas_base.c:7217:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long @@     got restricted __le32 [usertype] @@
   drivers/scsi/megaraid/megaraid_sas_base.c:7217:36: sparse:     expected unsigned long
   drivers/scsi/megaraid/megaraid_sas_base.c:7217:36: sparse:     got restricted __le32 [usertype]
   drivers/scsi/megaraid/megaraid_sas_base.c:7513:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int [usertype] *sense_cioc_ptr @@
   drivers/scsi/megaraid/megaraid_sas_base.c:7513:21: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/scsi/megaraid/megaraid_sas_base.c:7513:21: sparse:     got unsigned int [usertype] *sense_cioc_ptr
   drivers/scsi/megaraid/megaraid_sas_base.c:7514:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got void [noderef] <asn:1> **sense_ioc_ptr @@
   drivers/scsi/megaraid/megaraid_sas_base.c:7514:21: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/scsi/megaraid/megaraid_sas_base.c:7514:21: sparse:     got void [noderef] <asn:1> **sense_ioc_ptr
   drivers/scsi/megaraid/megaraid_sas_base.c:248:1: warning: no previous prototype for 'megasas_issue_dcmd' [-Wmissing-prototypes]
     248 | megasas_issue_dcmd(struct megasas_instance *instance, struct megasas_cmd *cmd)
         | ^~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:261:21: warning: no previous prototype for 'megasas_get_cmd' [-Wmissing-prototypes]
     261 | struct megasas_cmd *megasas_get_cmd(struct megasas_instance
         |                     ^~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:287:1: warning: no previous prototype for 'megasas_return_cmd' [-Wmissing-prototypes]
     287 | megasas_return_cmd(struct megasas_instance *instance, struct megasas_cmd *cmd)
         | ^~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c: In function 'megasas_adp_reset_gen2':
   drivers/scsi/megaraid/megaraid_sas_base.c:937:35: warning: taking address of packed member of 'struct megasas_register_set' may result in an unaligned pointer value [-Waddress-of-packed-member]
     937 |         u32 __iomem *seq_offset = &reg_set->seq_offset;
         |                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:938:40: warning: taking address of packed member of 'struct megasas_register_set' may result in an unaligned pointer value [-Waddress-of-packed-member]
     938 |         u32 __iomem *hostdiag_offset = &reg_set->host_diag;
         |                                        ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:941:30: warning: taking address of packed member of 'struct megasas_register_set' may result in an unaligned pointer value [-Waddress-of-packed-member]
     941 |                 seq_offset = &reg_set->fusion_seq_offset;
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:942:35: warning: taking address of packed member of 'struct megasas_register_set' may result in an unaligned pointer value [-Waddress-of-packed-member]
     942 |                 hostdiag_offset = &reg_set->fusion_host_diag;
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c: At top level:
   drivers/scsi/megaraid/megaraid_sas_base.c:1035:1: warning: no previous prototype for 'megasas_issue_polled' [-Wmissing-prototypes]
    1035 | megasas_issue_polled(struct megasas_instance *instance, struct megasas_cmd *cmd)
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c: In function 'megasas_set_static_target_properties':
   drivers/scsi/megaraid/megaraid_sas_base.c:1886:17: warning: variable 'target_index' set but not used [-Wunused-but-set-variable]
    1886 |         u16     target_index = 0;
         |                 ^~~~~~~~~~~~

vim +243 drivers/scsi/megaraid/megaraid_sas_base.c

   221	
   222	/**
   223	 * megasas_set_dma_settings -	Populate DMA address, length and flags for DCMDs
   224	 * @instance:			Adapter soft state
   225	 * @dcmd:			DCMD frame inside MFI command
   226	 * @dma_addr:			DMA address of buffer to be passed to FW
   227	 * @dma_len:			Length of DMA buffer to be passed to FW
   228	 * @return:			void
   229	 */
   230	void megasas_set_dma_settings(struct megasas_instance *instance,
   231				      struct megasas_dcmd_frame *dcmd,
   232				      dma_addr_t dma_addr, u32 dma_len)
   233	{
   234		if (instance->consistent_mask_64bit) {
   235			dcmd->sgl.sge64[0].phys_addr = cpu_to_le64(dma_addr);
   236			dcmd->sgl.sge64[0].length = cpu_to_le32(dma_len);
   237			dcmd->flags = cpu_to_le16(dcmd->flags | MFI_FRAME_SGL64);
   238	
   239		} else {
   240			dcmd->sgl.sge32[0].phys_addr =
   241					cpu_to_le32(lower_32_bits(dma_addr));
   242			dcmd->sgl.sge32[0].length = cpu_to_le32(dma_len);
 > 243			dcmd->flags = cpu_to_le16(dcmd->flags);
   244		}
   245	}
   246	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
