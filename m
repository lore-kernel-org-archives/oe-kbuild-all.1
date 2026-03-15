Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A078361652
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Mar 2026 13:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773582272; cv=none; b=FKcEkAQQtfYl42+V0NnkbyfhyEilBOdzkj5kycmAW+YwUhXQh36pMcBRM9PJN6XUpgzHSiH5eeh0drFw9yiTdVxktwgqoeVos/gfa4tOOdFh48OYgBgYPSBWR6ypR1KKe063tBNbTXIAyt+WCxzpMU3zZInBt1RV+kTnWbpmFjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773582272; c=relaxed/simple;
	bh=HgZpGKGKQYIrTxS/7lFeth0Xhao6lqm1TOAkOmx8RfM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TXz3v9WQ68FGjoEuhRlUFE17teBQMVSDt7pYJAiJLQqphmw9yWHW60egd54ez6b2leXTmN7PMqrIG4SOCX6B2uz3W6CsJQcRQoCpZLilyipH5zbEnT2b5dHyUcnEyGOdKSwX9poMgA5RhHVKvCALMm/OlMc1X3axK5zTa78+Er8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Njb7019r; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Njb7019r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773582270; x=1805118270;
  h=date:from:to:cc:subject:message-id;
  bh=HgZpGKGKQYIrTxS/7lFeth0Xhao6lqm1TOAkOmx8RfM=;
  b=Njb7019rb/tZ7x2u4XYY2HcUCbny+9mZVryNo5fyn0nQvJRGDDKDJTxz
   e92B5hp5DUi8MI04A5HpNPM4IoztgkUU67dAMRsPig0+73yAaN6XXhS7S
   l0Z8wVY0jgJMcalJuGi056qdoFG4Yu4uE2YRgv+A7gYtebpVaOAD8rKzw
   YfgFHmGfldGVKBUFs49GXJ6XXQR/JOBhWrlZyDyxv69bcGq6B69UVOQ9F
   iFz7ACncJHfwz+hp0h3PyMdhxSBWQp4B0xYRvMtKavIA0WJHrZFoFRe5b
   w3nDXWV51v6b3VGtciqSZUMWIiFcHLCy3EvHGbNAU9qr24j4FmyNYoU4/
   w==;
X-CSE-ConnectionGUID: ZO2pLI2OSfmIPffWLHIQ1Q==
X-CSE-MsgGUID: bub95vFDTruYxx381Lm5iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="77226150"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="77226150"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 06:44:30 -0700
X-CSE-ConnectionGUID: i4T71wuBSr6VVgF/3Bo1eA==
X-CSE-MsgGUID: lbzgwPWwT+2Trrl19vMLtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="252162693"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Mar 2026 06:44:24 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1llX-000000006ab-1WpB;
	Sun, 15 Mar 2026 13:44:23 +0000
Date: Sun, 15 Mar 2026 21:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: James Smart <jsmart2021@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Hannes Reinecke <hare@suse.de>, Daniel Wagner <dwagner@suse.de>,
 Ram Vegesna <ram.vegesna@broadcom.com>
Subject: drivers/scsi/elx/efct/efct_hw.c:227:1: warning: the frame
 size of 1136 bytes is larger than 1024 bytes
Message-ID: <202603152145.Pbl9q8SW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi James,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   80234b5ab240f52fa45d201e899e207b9265ef91
commit: ebc076b3eddc807729bd81f7bc48e798a3ddc477 scsi: elx: efct: Tie into kernel Kconfig and build process
date:   4 years, 9 months ago
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260315/202603152145.Pbl9q8SW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260315/202603152145.Pbl9q8SW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603152145.Pbl9q8SW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/elx/efct/efct_hw.c: In function 'efct_hw_cb_link':
>> drivers/scsi/elx/efct/efct_hw.c:227:1: warning: the frame size of 1136 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     227 | }
         | ^


vim +227 drivers/scsi/elx/efct/efct_hw.c

4df84e8466242d James Smart 2021-06-01  162  
4df84e8466242d James Smart 2021-06-01  163  static int
4df84e8466242d James Smart 2021-06-01  164  efct_hw_cb_link(void *ctx, void *e)
4df84e8466242d James Smart 2021-06-01  165  {
4df84e8466242d James Smart 2021-06-01  166  	struct efct_hw *hw = ctx;
4df84e8466242d James Smart 2021-06-01  167  	struct sli4_link_event *event = e;
4df84e8466242d James Smart 2021-06-01  168  	struct efc_domain *d = NULL;
4df84e8466242d James Smart 2021-06-01  169  	int rc = 0;
4df84e8466242d James Smart 2021-06-01  170  	struct efct *efct = hw->os;
4df84e8466242d James Smart 2021-06-01  171  
4df84e8466242d James Smart 2021-06-01  172  	efct_hw_link_event_init(hw);
4df84e8466242d James Smart 2021-06-01  173  
4df84e8466242d James Smart 2021-06-01  174  	switch (event->status) {
4df84e8466242d James Smart 2021-06-01  175  	case SLI4_LINK_STATUS_UP:
4df84e8466242d James Smart 2021-06-01  176  
4df84e8466242d James Smart 2021-06-01  177  		hw->link = *event;
4df84e8466242d James Smart 2021-06-01  178  		efct->efcport->link_status = EFC_LINK_STATUS_UP;
4df84e8466242d James Smart 2021-06-01  179  
4df84e8466242d James Smart 2021-06-01  180  		if (event->topology == SLI4_LINK_TOPO_NON_FC_AL) {
4df84e8466242d James Smart 2021-06-01  181  			struct efc_domain_record drec = {0};
4df84e8466242d James Smart 2021-06-01  182  
4df84e8466242d James Smart 2021-06-01  183  			efc_log_info(hw->os, "Link Up, NPORT, speed is %d\n",
4df84e8466242d James Smart 2021-06-01  184  				     event->speed);
4df84e8466242d James Smart 2021-06-01  185  			drec.speed = event->speed;
4df84e8466242d James Smart 2021-06-01  186  			drec.fc_id = event->fc_id;
4df84e8466242d James Smart 2021-06-01  187  			drec.is_nport = true;
4df84e8466242d James Smart 2021-06-01  188  			efc_domain_cb(efct->efcport, EFC_HW_DOMAIN_FOUND,
4df84e8466242d James Smart 2021-06-01  189  				      &drec);
4df84e8466242d James Smart 2021-06-01  190  		} else if (event->topology == SLI4_LINK_TOPO_FC_AL) {
4df84e8466242d James Smart 2021-06-01  191  			u8 buf[SLI4_BMBX_SIZE];
4df84e8466242d James Smart 2021-06-01  192  
4df84e8466242d James Smart 2021-06-01  193  			efc_log_info(hw->os, "Link Up, LOOP, speed is %d\n",
4df84e8466242d James Smart 2021-06-01  194  				     event->speed);
4df84e8466242d James Smart 2021-06-01  195  
4df84e8466242d James Smart 2021-06-01  196  			if (!sli_cmd_read_topology(&hw->sli, buf,
4df84e8466242d James Smart 2021-06-01  197  						   &hw->loop_map)) {
4df84e8466242d James Smart 2021-06-01  198  				rc = efct_hw_command(hw, buf, EFCT_CMD_NOWAIT,
4df84e8466242d James Smart 2021-06-01  199  						__efct_read_topology_cb, NULL);
4df84e8466242d James Smart 2021-06-01  200  			}
4df84e8466242d James Smart 2021-06-01  201  
4df84e8466242d James Smart 2021-06-01  202  			if (rc)
4df84e8466242d James Smart 2021-06-01  203  				efc_log_debug(hw->os, "READ_TOPOLOGY failed\n");
4df84e8466242d James Smart 2021-06-01  204  		} else {
4df84e8466242d James Smart 2021-06-01  205  			efc_log_info(hw->os, "%s(%#x), speed is %d\n",
4df84e8466242d James Smart 2021-06-01  206  				     "Link Up, unsupported topology ",
4df84e8466242d James Smart 2021-06-01  207  				     event->topology, event->speed);
4df84e8466242d James Smart 2021-06-01  208  		}
4df84e8466242d James Smart 2021-06-01  209  		break;
4df84e8466242d James Smart 2021-06-01  210  	case SLI4_LINK_STATUS_DOWN:
4df84e8466242d James Smart 2021-06-01  211  		efc_log_info(hw->os, "Link down\n");
4df84e8466242d James Smart 2021-06-01  212  
4df84e8466242d James Smart 2021-06-01  213  		hw->link.status = event->status;
4df84e8466242d James Smart 2021-06-01  214  		efct->efcport->link_status = EFC_LINK_STATUS_DOWN;
4df84e8466242d James Smart 2021-06-01  215  
4df84e8466242d James Smart 2021-06-01  216  		d = efct->efcport->domain;
4df84e8466242d James Smart 2021-06-01  217  		if (d)
4df84e8466242d James Smart 2021-06-01  218  			efc_domain_cb(efct->efcport, EFC_HW_DOMAIN_LOST, d);
4df84e8466242d James Smart 2021-06-01  219  		break;
4df84e8466242d James Smart 2021-06-01  220  	default:
4df84e8466242d James Smart 2021-06-01  221  		efc_log_debug(hw->os, "unhandled link status %#x\n",
4df84e8466242d James Smart 2021-06-01  222  			      event->status);
4df84e8466242d James Smart 2021-06-01  223  		break;
4df84e8466242d James Smart 2021-06-01  224  	}
4df84e8466242d James Smart 2021-06-01  225  
4df84e8466242d James Smart 2021-06-01  226  	return 0;
4df84e8466242d James Smart 2021-06-01 @227  }
4df84e8466242d James Smart 2021-06-01  228  

:::::: The code at line 227 was first introduced by commit
:::::: 4df84e8466242de835416a4ec0c856c0e2ed26eb scsi: elx: efct: Driver initialization routines

:::::: TO: James Smart <jsmart2021@gmail.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
