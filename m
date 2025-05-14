Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9DA22758F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 23:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747265854; cv=none; b=eD+Swq1qhucrnU8w4Pzg4d1socUShKa2pwd+7qMFHmVriUPCvHkCR4/BoGCOgxPaWOsr94EQ9gbfRQ72hMJ/+oFRNqJkmNISqg10UWTfgspp4b/cRct1vyXX3cG2/IGjO/wNulNAuiZliImE53uJUcjfiBYA8Bl23/3pVHn95Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747265854; c=relaxed/simple;
	bh=fQwZmeSr+eTRqvzdKdZDylVoAUlnnkjPV4IW4C+exU0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nq1p8dNw9wabzUj9YR3pawPKsB2Yxl5yOlaraOJeZVjOrtphBs1K/XgFX/UEyUIFkHWiCaTnqShD65QtJos/0lo8GbRR70kn2HsFU3Hk+YhTGlLuRCrNjUmzf20EpUJjtwHWiqmEijXboZlkHU95RHbzgvrmBTrtUgPLke4dtQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khzE5ADB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khzE5ADB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747265852; x=1778801852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fQwZmeSr+eTRqvzdKdZDylVoAUlnnkjPV4IW4C+exU0=;
  b=khzE5ADBc3ZHhiBSHE3s680NA65TmK/EFpbLgVtiSLWBflxD858SCBhl
   fqL5TcGm1sHTX0HKhS6IjQzGRynnfL8QcAYha7fW8RsgzFKAEVMSWq+16
   1pcaq2IJnmpsmsdgQVLkSLPVTO93cK5I1H7XNc2KoLw/vxaGlQrQCSFPI
   Jkh4gJbzMzI962zmAT6dpm633XrZjbfTDgO8E4ftQQwKURXkXFkNRgfV1
   bbuDk5v73CiYdlq5aLv9ooblYo26fWmcPFTchUJNkJlVsBt7uAAb31buq
   /DmMNMHK03KTR/OWGbiItJsQlKg1ieqF7dQNoFjndnwf9fe1tE/lbBCwY
   w==;
X-CSE-ConnectionGUID: RwsdhJYhSLuyulVMYioATA==
X-CSE-MsgGUID: 6gdxNEUoT7KDSAxFW4qhfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52990408"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="52990408"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 16:37:29 -0700
X-CSE-ConnectionGUID: AjiQy1T3TbuiNoedgycmjw==
X-CSE-MsgGUID: o4YPE++TRcq25oSYyJYCBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="175318365"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 May 2025 16:37:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFLfC-000Hgr-0A;
	Wed, 14 May 2025 23:37:26 +0000
Date: Thu, 15 May 2025 07:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yihang Li <liyihang9@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [linux-next:master 4284/11093]
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4554:25: sparse: sparse: incorrect
 type in argument 4 (different base types)
Message-ID: <202505150705.k9ZzMxf1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bdd609656ff5573db9ba1d26496a528bdd297cf2
commit: 4ca7fe99fc8485fcd04b367f37dc7a48f1355419 [4284/11093] scsi: hisi_sas: Use macro instead of magic number
config: loongarch-randconfig-r123-20250515 (https://download.01.org/0day-ci/archive/20250515/202505150705.k9ZzMxf1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250515/202505150705.k9ZzMxf1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150705.k9ZzMxf1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4554:25: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __le32 [usertype] *[assigned] ptr @@     got unsigned int * @@
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4554:25: sparse:     expected restricted __le32 [usertype] *[assigned] ptr
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4554:25: sparse:     got unsigned int *

vim +4554 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c

  4545	
  4546	static int debugfs_fifo_data_v3_hw_show(struct seq_file *s, void *p)
  4547	{
  4548		struct hisi_sas_phy *phy = s->private;
  4549	
  4550		debugfs_read_fifo_data_v3_hw(phy);
  4551	
  4552		debugfs_show_row_32_v3_hw(s, 0,
  4553				HISI_SAS_FIFO_DATA_DW_SIZE * HISI_SAS_REG_MEM_SIZE,
> 4554				phy->fifo.rd_data);
  4555	
  4556		return 0;
  4557	}
  4558	DEFINE_SHOW_ATTRIBUTE(debugfs_fifo_data_v3_hw);
  4559	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
