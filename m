Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A09819
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 00:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728000541; cv=none; b=SMEgk5W1K+p/0nhAMNotitvjSL3fXbCeOacYOaXziObfJ9lzjUf5NKCMlvs59B2J8ve8tpNWxTLO5LGzHT3gavVWPiQgh+zQguIoeU4VM1W63JzifL+UA1WYILYf+k9ORSEasBMAZ445Jbo4m4bvA6T/tcv+MsRNJNbn/nuDFpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728000541; c=relaxed/simple;
	bh=VKDZ38KmhBMEEwpWC/JGvu1mwjhy4UEd7qt3PVvFhrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VDghbwICcltL7E2mDMvt110wkUN968p7Tg3odjVgAl1uynVwaMD67CzSg/ocjHZf30ocnnDgZnD7k1e/s48Fwhu9M5+X/ZX7u9TjpszgxZRZytTXbiAufI268lCkLoKW65FjuI05gIdGnVK5axBFauaaMMvLmAdGoRaVXbhmeIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ca0XKcFI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ca0XKcFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728000540; x=1759536540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VKDZ38KmhBMEEwpWC/JGvu1mwjhy4UEd7qt3PVvFhrE=;
  b=Ca0XKcFIu592ZPnoIE5gAx2DbQeOlDZV+lpi1n43bLW5bD6+Kf7KFVc8
   ox8UMlc57EkQCEBq5msOyp9LWgv/OZirl1Nypuv+LB06qQzlkWVy4C55Y
   d/pm3123d0DBHvKEkIvCXcpQu70aQ4KvdUZweNr78dFdlilX8YLK4Zecs
   DGNNFY/RIXlk7ObjbBm/YX7/JH9kLQAB83kFaR0YWeuvpScRsaC7cnwJD
   L3nBmjrxAdweneHmO57TmpV4c68hjWkyKNwFcU1oNSlXjSbyIlrv336IM
   ijFDXtxaw4/8AhMzVNThLp88knUBxOc59zv/3OqAgm7mJfY9ae5HYn7Vx
   g==;
X-CSE-ConnectionGUID: nNXyQ1JCQ3W7y56N0ENPHw==
X-CSE-MsgGUID: X0IRXZDGSGqulYYaLJiAMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27389546"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="27389546"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 17:08:59 -0700
X-CSE-ConnectionGUID: LiK5XsyBTNSGW7FLsaTTtA==
X-CSE-MsgGUID: GX2YcbcPRieKxnMV56sI1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="74359768"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Oct 2024 17:08:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swVsM-00012i-13;
	Fri, 04 Oct 2024 00:08:54 +0000
Date: Fri, 4 Oct 2024 08:08:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 3349/23811]
 drivers/scsi/hisi_sas/hisi_sas_main.c:2711:12: sparse: sparse: symbol
 'hisi_sas_debugfs_to_reg_name' was not declared. Should it be static?
Message-ID: <202410040809.szghfgF1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: 82153b96f94df7483e215df3057befe744915991 [3349/23811] scsi: hisi_sas: Sync upstream version of DFX feature code
config: arm64-randconfig-r111-20241003 (https://download.01.org/0day-ci/archive/20241004/202410040809.szghfgF1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241004/202410040809.szghfgF1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040809.szghfgF1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/hisi_sas/hisi_sas_main.c:1623:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed @@     got restricted __le16 [usertype] @@
   drivers/scsi/hisi_sas/hisi_sas_main.c:1623:52: sparse:     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed
   drivers/scsi/hisi_sas/hisi_sas_main.c:1623:52: sparse:     got restricted __le16 [usertype]
   drivers/scsi/hisi_sas/hisi_sas_main.c:1871:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed @@     got restricted __le16 [usertype] @@
   drivers/scsi/hisi_sas/hisi_sas_main.c:1871:52: sparse:     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed
   drivers/scsi/hisi_sas/hisi_sas_main.c:1871:52: sparse:     got restricted __le16 [usertype]
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2711:12: sparse: sparse: symbol 'hisi_sas_debugfs_to_reg_name' was not declared. Should it be static?
   drivers/scsi/hisi_sas/hisi_sas_main.c:2738:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2738:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2738:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2738:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2738:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2738:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2741:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2741:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2741:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2741:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2741:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2741:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2805:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:2805:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:2805:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:2805:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:2805:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:2805:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:2805:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:2805:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:2805:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:2805:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:2823:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2823:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2823:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2823:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2823:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2823:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2712:1: warning: no previous prototype for 'hisi_sas_debugfs_to_reg_name' [-Wmissing-prototypes]
    2712 | hisi_sas_debugfs_to_reg_name(int off, int base_off,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/scsi/libsas.h:36,
                    from include/scsi/sas_ata.h:29,
                    from drivers/scsi/hisi_sas/hisi_sas.h:28,
                    from drivers/scsi/hisi_sas/hisi_sas_main.c:12:
   In function 'scsi_prot_sglist',
       inlined from 'hisi_sas_dif_dma_map' at drivers/scsi/hisi_sas/hisi_sas_main.c:443:2:
   include/scsi/scsi_cmnd.h:327:19: warning: 'scsi_cmnd' may be used uninitialized [-Wmaybe-uninitialized]
     327 |         return cmd->prot_sdb ? cmd->prot_sdb->table.sgl : NULL;
         |                ~~~^~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas_main.c: In function 'hisi_sas_dif_dma_map':
   drivers/scsi/hisi_sas/hisi_sas_main.c:413:27: note: 'scsi_cmnd' was declared here
     413 |         struct scsi_cmnd *scsi_cmnd;
         |                           ^~~~~~~~~

vim +/hisi_sas_debugfs_to_reg_name +2711 drivers/scsi/hisi_sas/hisi_sas_main.c

  2710	
> 2711	const char *
  2712	hisi_sas_debugfs_to_reg_name(int off, int base_off,
  2713				     const struct hisi_sas_debugfs_reg_lu *lu)
  2714	{
  2715		for (; lu->name; lu++) {
  2716			if (off == lu->off - base_off)
  2717				return lu->name;
  2718		}
  2719	
  2720		return NULL;
  2721	}
  2722	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
