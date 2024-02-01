Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7601A29F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 02:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706753826; cv=none; b=Qk5nKSNVFgo4XIvscQDsFot7gLosFdBOUHdFW6lP7JaPx9lAJcsIRzgzNs8ne3b9v3HGW+4ocMESszLDtHCt8zVlxxEcLe70u+N0Dj0qPvM6KL3N0EXhvzbCfE2suJRueZ/HEx4wzhPhlv4xmDh2/yym6fLmVfnhUJ50Moy8grE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706753826; c=relaxed/simple;
	bh=pA7AXORy7PAL/Dfud8StHSHYIfzupkNQw7mhdoCNGg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sNOv0ojenBZ6m4uF1r0Klv/pkSXKSYlaLMnIExnzUiiYji2yEXbx5xPGsDYjWHMTXbmv8256Hus+c8mAvRhVvnY10eSeqjUyCXGfrc49Ih7wHuUTdZ2rXPQRpVVaduutRydI5HxxorwiBcq4wbOcaw1aLwEFtIwBGYXbJOBbHkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwrLDOn1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwrLDOn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706753824; x=1738289824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pA7AXORy7PAL/Dfud8StHSHYIfzupkNQw7mhdoCNGg4=;
  b=fwrLDOn1jI2fB+lO3gi3CxP4B/InGgmnFeD4QOYutMUNtZh5vDSeDcCs
   H/2aEhdwF7beS3i/wZKAduawaKg/Q2BaU8hbS/U0UNUcZSQXSEudcGeVh
   1Uo6TUhrJaIgA1dYiGLUpm9tNjDmNxWcwmI4+cOTvVpVOCcTeFQRWaFet
   tODAYlHD4FeRAnVuZxp4bzjnCrPMqHX5Xl2FfR1/M0vvcgiZO0udX19RD
   LLDddo35epJpqQOewzpjAsePIS38YktKkxjTRmw/XXBmtnumDTBeUtihs
   yv7xglEVkn/57b4RIAZ5/5JREx7JKxDavOldbpHs3hEmaAsYwjqto2Iew
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11164530"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="11164530"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 18:17:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="30441919"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 31 Jan 2024 18:17:02 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVMdM-0002HW-18;
	Thu, 01 Feb 2024 02:16:57 +0000
Date: Thu, 1 Feb 2024 10:16:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14777/21599]
 drivers/scsi/huawei/hifc/unf_disc.c:389:51: warning: storing the address of
 local variable 'rport_pool_completion' in '((struct unf_rport_pool_s
 *)((char *)v_lport + 8))[59].rport_pool_completion'
Message-ID: <202402011019.bVRSpF8m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0ec2c5ee4e0f8c1bdd76fa1b5f9eb0cf68d4d62d
commit: 7fc993d55d1b54ae40e29dfac825a18d04d644c6 [14777/21599] scsi/hifc: add hifc driver FC service module
config: arm64-randconfig-002-20240130 (https://download.01.org/0day-ci/archive/20240201/202402011019.bVRSpF8m-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402011019.bVRSpF8m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402011019.bVRSpF8m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/huawei/hifc/unf_disc.c:446:28: warning: no previous prototype for 'unf_get_free_rscn_node' [-Wmissing-prototypes]
     446 | struct unf_port_id_page_s *unf_get_free_rscn_node(void *v_rscn_mg)
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/unf_disc.c:1195:23: warning: no previous prototype for 'unf_disc_stat_start' [-Wmissing-prototypes]
    1195 | enum unf_disc_state_e unf_disc_stat_start(enum unf_disc_state_e v_old_state,
         |                       ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/unf_disc.c:1208:23: warning: no previous prototype for 'unf_disc_stat_gid_pt_wait' [-Wmissing-prototypes]
    1208 | enum unf_disc_state_e unf_disc_stat_gid_pt_wait(
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/unf_disc.c:1239:23: warning: no previous prototype for 'unf_disc_stat_gid_ft_wait' [-Wmissing-prototypes]
    1239 | enum unf_disc_state_e unf_disc_stat_gid_ft_wait(
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/unf_disc.c:1270:23: warning: no previous prototype for 'unf_disc_stat_end' [-Wmissing-prototypes]
    1270 | enum unf_disc_state_e unf_disc_stat_end(enum unf_disc_state_e v_old_state,
         |                       ^~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/unf_disc.c: In function 'unf_free_rport_pool':
>> drivers/scsi/huawei/hifc/unf_disc.c:389:51: warning: storing the address of local variable 'rport_pool_completion' in '((struct unf_rport_pool_s *)((char *)v_lport + 8))[59].rport_pool_completion' [-Wdangling-pointer=]
     389 |                 rport_pool->rport_pool_completion = &rport_pool_completion;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/unf_disc.c:378:27: note: 'rport_pool_completion' declared here
     378 |         struct completion rport_pool_completion =
         |                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/unf_disc.c:367:53: note: 'v_lport' declared here
     367 | static void unf_free_rport_pool(struct unf_lport_s *v_lport)
         |                                 ~~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/scsi/huawei/hifc/unf_disc.c: In function 'unf_wait_disc_complete':
>> drivers/scsi/huawei/hifc/unf_disc.c:1072:39: warning: storing the address of local variable 'disc_completion' in '((struct unf_disc_s *)((char *)v_lport + 432))[5].disc_completion' [-Wdangling-pointer=]
    1072 |                 disc->disc_completion = &disc_completion;
         |                 ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/unf_disc.c:1060:27: note: 'disc_completion' declared here
    1060 |         struct completion disc_completion =
         |                           ^~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/unf_disc.c:1052:56: note: 'v_lport' declared here
    1052 | static void unf_wait_disc_complete(struct unf_lport_s *v_lport)
         |                                    ~~~~~~~~~~~~~~~~~~~~^~~~~~~


vim +389 drivers/scsi/huawei/hifc/unf_disc.c

   366	
   367	static void unf_free_rport_pool(struct unf_lport_s *v_lport)
   368	{
   369		struct unf_rport_pool_s *rport_pool = NULL;
   370		int wait = UNF_FALSE;
   371		unsigned long flag = 0;
   372		unsigned int remain = 0;
   373		unsigned long long time_out = 0;
   374		unsigned int max_login = 0;
   375		unsigned int i;
   376		struct unf_rport_s *rport;
   377	
 > 378		struct completion rport_pool_completion =
   379			COMPLETION_INITIALIZER(rport_pool_completion);
   380	
   381		UNF_CHECK_VALID(0x671, UNF_TRUE, v_lport, return);
   382		UNF_REFERNCE_VAR(remain);
   383	
   384		rport_pool = &v_lport->rport_pool;
   385		max_login = v_lport->low_level_func.lport_cfg_items.max_login;
   386	
   387		spin_lock_irqsave(&rport_pool->rport_free_pool_lock, flag);
   388		if (max_login != rport_pool->rport_pool_count) {
 > 389			rport_pool->rport_pool_completion = &rport_pool_completion;
   390			remain = max_login - rport_pool->rport_pool_count;
   391			wait = UNF_TRUE;
   392		}
   393		spin_unlock_irqrestore(&rport_pool->rport_free_pool_lock, flag);
   394	
   395		if (wait == UNF_TRUE) {
   396			UNF_TRACE(UNF_EVTLOG_DRIVER_INFO, UNF_LOG_REG_ATT, UNF_MAJOR,
   397				  "[info]Port(0x%x) begin to wait for RPort pool completion(%ld), remain(0x%x)",
   398				  v_lport->port_id, jiffies, remain);
   399	
   400			time_out = wait_for_completion_timeout(
   401				rport_pool->rport_pool_completion,
   402				msecs_to_jiffies(UNF_OS_REMOVE_CARD_TIMEOUT));
   403			if (time_out == 0)
   404				unf_cmmark_dirty_mem(
   405					v_lport,
   406					UNF_LPORT_DIRTY_FLAG_RPORT_POOL_DIRTY);
   407	
   408			UNF_TRACE(UNF_EVTLOG_DRIVER_INFO, UNF_LOG_REG_ATT, UNF_MAJOR,
   409				  "[info]Port(0x%x) wait for RPort pool completion end(%ld)",
   410				  v_lport->port_id, jiffies);
   411	
   412			spin_lock_irqsave(&rport_pool->rport_free_pool_lock, flag);
   413			rport_pool->rport_pool_completion = NULL;
   414			spin_unlock_irqrestore(&rport_pool->rport_free_pool_lock, flag);
   415		}
   416	
   417		rport = (struct unf_rport_s *)(rport_pool->rport_pool_add);
   418		for (i = 0; i < rport_pool->rport_pool_count; i++) {
   419			if (!rport)
   420				break;
   421			rport++;
   422		}
   423	
   424		if ((v_lport->dirty_flag &
   425		     UNF_LPORT_DIRTY_FLAG_RPORT_POOL_DIRTY) == 0) {
   426			vfree(rport_pool->rport_pool_add);
   427			rport_pool->rport_pool_add = NULL;	  /* R_Port pool */
   428			vfree(rport_pool->pul_rpi_bitmap);  /* R_Port bitmap */
   429			rport_pool->pul_rpi_bitmap = NULL;
   430		}
   431		UNF_REFERNCE_VAR(remain);
   432	}
   433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
