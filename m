Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEEF1DB363
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 22:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737757542; cv=none; b=nTv9aC72rKTd9zkPAv6VhFCJLY4q6vKFR8U5X9z8rPWpwM4brkW7v3qoaQUduw2wz1fREDUK0VqRgVpXlEvdhA/t6nCQXWxYUH2Cew5Nbv+bBmeyqa4o+7iQD1OX2RyJzv6qd++bVrgHigxRQkSwKK78u79KX/lgkQEZg7ECkxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737757542; c=relaxed/simple;
	bh=OnpTULEMxf0crPiR+JdeloPC58dzGDWpNh4vDl0eLOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xh0qhduZsP4dzvaaw4C5OV1AY+kGL0U0WKOTwvB4/9ktF+oPLztqV3fJQR5baUz9tui+GqQFHTNO2C3ciDSgFDxbk18CFXEwKIvvzIPdkG5+H4m3nUCKyXEgqtPzsjiOZy1IvOXrzWuXCLPH7G80jS5nwxmU5zHlZlfWa6I3A2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnntP6x3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnntP6x3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737757540; x=1769293540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OnpTULEMxf0crPiR+JdeloPC58dzGDWpNh4vDl0eLOk=;
  b=SnntP6x3Om+Hu4napv+Majlx3jgS97SB4MEzgjcGwlkJcRhYPBrEGkNF
   o+TFi8zKw/8ddra94vnGHd3V+dtN1Re7f3jn+aefFpAZFsCzCIcxfQXrU
   1PuaKo3Xnl7KGE8yOLz9VNzEZK8s5t9u6tbooJuAOc7nGJPMlYAV2SW3F
   Gm9cG3flNGve0l8OlcP9X5h4O6OcyGsThXEHhISnmAGIRzKiA1Hjc71e2
   em3bmWBLxwLDHP9NhjcNS7C13l8wNN5gK4XDBh7HGFlTuM+oYwxcepxqQ
   DgQJZ0+XtLofhXnJ7vclfI3IstvYS+RFUi55M5ij6Ptvh2LnuQi1JAq0M
   w==;
X-CSE-ConnectionGUID: Dd+vi6BLT+ecTLvYgwiJKA==
X-CSE-MsgGUID: g33W15fESzCHLoYgWDBjPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="41143974"
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="41143974"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 14:25:39 -0800
X-CSE-ConnectionGUID: 65zFEWGhTciCSs6Ib2GlJw==
X-CSE-MsgGUID: NmxibzpzQcaWzqZjQn18LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="107788432"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jan 2025 14:25:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbS7M-000dCL-0U;
	Fri, 24 Jan 2025 22:25:36 +0000
Date: Sat, 25 Jan 2025 06:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1414/1414]
 include/scsi/scsi_cmnd.h:327:19: warning: 'scsi_cmnd' may be used
 uninitialized
Message-ID: <202501250607.mBS8g6wb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi chenxiang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   da51139d17e9d53d61a9877d9042e43b85d71ee1
commit: b4adbc622b73d2bc61e6d712e0a916e568f0ce3f [1414/1414] scsi: hisi_sas: add support for DIF/DIX feature of v3 hw
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250125/202501250607.mBS8g6wb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501250607.mBS8g6wb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501250607.mBS8g6wb-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/scsi/libsas.h:36,
                    from include/scsi/sas_ata.h:29,
                    from drivers/scsi/hisi_sas/hisi_sas.h:27,
                    from drivers/scsi/hisi_sas/hisi_sas_main.c:12:
   In function 'scsi_prot_sglist',
       inlined from 'hisi_sas_dif_dma_map' at drivers/scsi/hisi_sas/hisi_sas_main.c:442:2:
>> include/scsi/scsi_cmnd.h:327:19: warning: 'scsi_cmnd' may be used uninitialized [-Wmaybe-uninitialized]
     327 |         return cmd->prot_sdb ? cmd->prot_sdb->table.sgl : NULL;
         |                ~~~^~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas_main.c: In function 'hisi_sas_dif_dma_map':
   drivers/scsi/hisi_sas/hisi_sas_main.c:412:27: note: 'scsi_cmnd' was declared here
     412 |         struct scsi_cmnd *scsi_cmnd;
         |                           ^~~~~~~~~


vim +/scsi_cmnd +327 include/scsi/scsi_cmnd.h

7027ad72a689797 Martin K. Petersen 2008-07-17  324  
7027ad72a689797 Martin K. Petersen 2008-07-17  325  static inline struct scatterlist *scsi_prot_sglist(struct scsi_cmnd *cmd)
7027ad72a689797 Martin K. Petersen 2008-07-17  326  {
7027ad72a689797 Martin K. Petersen 2008-07-17 @327  	return cmd->prot_sdb ? cmd->prot_sdb->table.sgl : NULL;
7027ad72a689797 Martin K. Petersen 2008-07-17  328  }
7027ad72a689797 Martin K. Petersen 2008-07-17  329  

:::::: The code at line 327 was first introduced by commit
:::::: 7027ad72a689797475973c6feb5f0b673382f779 [SCSI] Support devices with protection information

:::::: TO: Martin K. Petersen <martin.petersen@oracle.com>
:::::: CC: James Bottomley <James.Bottomley@HansenPartnership.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
