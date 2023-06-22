Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87EB3AA8B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 08:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687423717; x=1718959717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bmWy+xKkAXb+rnaBiHU4mcOtkFvUlGLwrnQePFdY2+s=;
  b=hDBfhlRSRmTyU2ktNtahR0mMy1SmzY2y+LgVfYIemJUw3FK0NEv3ocOX
   HQKjzglmrnCdy1KVydbk/tsAdL6BUJtazOn5uN7kko1Bh9HntkMAjuxrG
   AtDBc5315NtvFoy0HGF3YwgrHerAMWdaRycyOZT04VMeaXOhF0+RjHVm1
   Y/+6wT+LE1qcVLV4+GL8Ow5YQ/ok7EjAQuiLuMwPcOVwG9LMuVlDPcoew
   yehWwyB8sp+GELhaASyIOP93RoPYVT1AwN4WOBAXIkoId3T+EwcJWdg2J
   kBhG/hjZeLu04qMweWOkfLBHd76gmHTI5qc1Yoh5INOn22XMfc+UpJhM7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="390108913"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="390108913"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 01:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="838950468"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="838950468"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Jun 2023 01:48:34 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCFzV-0007SN-2y;
	Thu, 22 Jun 2023 08:48:33 +0000
Date: Thu, 22 Jun 2023 16:48:03 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Christie <michael.christie@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>
Subject: [linux-next:master 211/11867]
 drivers/target/target_core_iblock.c:892:30-35: WARNING: conversion to bool
 not needed here
Message-ID: <202306221655.Kwtqi1gI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   15e71592dbae49a674429c618a10401d7f992ac3
commit: 394f811848827ad23d2b43e94e5d72a24cfbc39f [211/11867] scsi: target: Add block PR support to iblock
config: sparc-randconfig-c003-20230620 (https://download.01.org/0day-ci/archive/20230622/202306221655.Kwtqi1gI-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221655.Kwtqi1gI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306221655.Kwtqi1gI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/target/target_core_iblock.c:892:30-35: WARNING: conversion to bool not needed here

vim +892 drivers/target/target_core_iblock.c

   837	
   838	static sense_reason_t iblock_execute_pr_out(struct se_cmd *cmd, u8 sa, u64 key,
   839						    u64 sa_key, u8 type, bool aptpl)
   840	{
   841		struct se_device *dev = cmd->se_dev;
   842		struct iblock_dev *ib_dev = IBLOCK_DEV(dev);
   843		struct block_device *bdev = ib_dev->ibd_bd;
   844		const struct pr_ops *ops = bdev->bd_disk->fops->pr_ops;
   845		int ret;
   846	
   847		if (!ops) {
   848			pr_err("Block device does not support pr_ops but iblock device has been configured for PR passthrough.\n");
   849			return TCM_UNSUPPORTED_SCSI_OPCODE;
   850		}
   851	
   852		switch (sa) {
   853		case PRO_REGISTER:
   854		case PRO_REGISTER_AND_IGNORE_EXISTING_KEY:
   855			if (!ops->pr_register) {
   856				pr_err("block device does not support pr_register.\n");
   857				return TCM_UNSUPPORTED_SCSI_OPCODE;
   858			}
   859	
   860			/* The block layer pr ops always enables aptpl */
   861			if (!aptpl)
   862				pr_info("APTPL not set by initiator, but will be used.\n");
   863	
   864			ret = ops->pr_register(bdev, key, sa_key,
   865					sa == PRO_REGISTER ? 0 : PR_FL_IGNORE_KEY);
   866			break;
   867		case PRO_RESERVE:
   868			if (!ops->pr_reserve) {
   869				pr_err("block_device does not support pr_reserve.\n");
   870				return TCM_UNSUPPORTED_SCSI_OPCODE;
   871			}
   872	
   873			ret = ops->pr_reserve(bdev, key, scsi_pr_type_to_block(type), 0);
   874			break;
   875		case PRO_CLEAR:
   876			if (!ops->pr_clear) {
   877				pr_err("block_device does not support pr_clear.\n");
   878				return TCM_UNSUPPORTED_SCSI_OPCODE;
   879			}
   880	
   881			ret = ops->pr_clear(bdev, key);
   882			break;
   883		case PRO_PREEMPT:
   884		case PRO_PREEMPT_AND_ABORT:
   885			if (!ops->pr_clear) {
   886				pr_err("block_device does not support pr_preempt.\n");
   887				return TCM_UNSUPPORTED_SCSI_OPCODE;
   888			}
   889	
   890			ret = ops->pr_preempt(bdev, key, sa_key,
   891					      scsi_pr_type_to_block(type),
 > 892					      sa == PRO_PREEMPT ? false : true);
   893			break;
   894		case PRO_RELEASE:
   895			if (!ops->pr_clear) {
   896				pr_err("block_device does not support pr_pclear.\n");
   897				return TCM_UNSUPPORTED_SCSI_OPCODE;
   898			}
   899	
   900			ret = ops->pr_release(bdev, key, scsi_pr_type_to_block(type));
   901			break;
   902		default:
   903			pr_err("Unknown PERSISTENT_RESERVE_OUT SA: 0x%02x\n", sa);
   904			return TCM_UNSUPPORTED_SCSI_OPCODE;
   905		}
   906	
   907		if (!ret)
   908			return TCM_NO_SENSE;
   909		else if (ret == PR_STS_RESERVATION_CONFLICT)
   910			return TCM_RESERVATION_CONFLICT;
   911		else
   912			return TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
   913	}
   914	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
