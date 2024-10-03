Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DC51BFDFC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 21:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727992497; cv=none; b=H8mvILtWxDuouSmvE+zIPeOZBiSIDKHAtRoHVSlmNIQCcMzQKmA+CjBYmzQOzaJ2axpnoezYcCIawFmHokbSkVwUT4JuUcYIvR63m42I6a5Ltggii4wW7I2Wnt7gaVhVJ0o11cTZINk6/istQkT4vfoINmzbVbbsm7ry+qgWwBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727992497; c=relaxed/simple;
	bh=fHdwZA9vFhDIEH/af8fASpZKWIHaEts6lFLLT+dbpG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CqEtuEgv8E2Zm7tmxLnQjrT8oNIxwMsf7IhEzWWYuqRlxxRTsNVD/Bo9W1av0A8Zf1f7JCLmvaWI9FxrS2/yduPmojnnKGaANc6/4umvRdDfuoFZKhXcn63m9q5W3wCMZ5RXS9dS7/r58c/W8TLQLQNWu2TSzxp0MA/P+yxLEDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9sOO5l8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9sOO5l8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727992495; x=1759528495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fHdwZA9vFhDIEH/af8fASpZKWIHaEts6lFLLT+dbpG4=;
  b=O9sOO5l8JMPUdjJxEXRKHnzYc+Xr2KEFzVkwsFPzP34X6Av7Vqf6UfQt
   9UhssGarzIsl3EHN1zamT/erFOxJTbw1x+x0zIy9aLPm+Oe8TEGV8qChu
   zD91r5DFb0Yyaz7Z9iyEAcpBc54XlUpJIXwrFTCNPxKt6sRl5r+bsFMDq
   nMcJ9mSuXqvcaAwrViS553XnlKEAsB/iWF+3oJkvjZRb/CulSsLGlNcCB
   pUkRGxjxueDsCkCWlk4d9RDS5uydKCJtKXixHXL4wKb73HSSH5KLX/XIf
   AuiuOppNQUQt82iDuKsTN3ci4sJBIhcIB1OYs7GXNXz4Z8QP6TMBd9XNt
   w==;
X-CSE-ConnectionGUID: 7bGu0qBQRymt1PwBrOQ25w==
X-CSE-MsgGUID: qvH/RwbMQOiEj6nS0Ml5VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27087236"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="27087236"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 14:54:55 -0700
X-CSE-ConnectionGUID: H0cDR0vgRb6a7Vo62rncGg==
X-CSE-MsgGUID: MBhl44vkR2OnjE3k+a4t7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="79056082"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Oct 2024 14:54:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swTmd-0000wQ-0I;
	Thu, 03 Oct 2024 21:54:51 +0000
Date: Fri, 4 Oct 2024 05:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1571/23811]
 drivers/scsi/hisi_sas/hisi_sas_main.c:2864:45: sparse: sparse: cast to
 restricted __le64
Message-ID: <202410040525.qH3EJS90-lkp@intel.com>
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
commit: 5674e8c212d6087835d2a77b9bb7c26f03413d84 [1571/23811] scsi: hisi_sas: Add DFX Feature: IOST create file and add file operations
config: arm64-randconfig-r111-20241003 (https://download.01.org/0day-ci/archive/20241004/202410040525.qH3EJS90-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241004/202410040525.qH3EJS90-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040525.qH3EJS90-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/hisi_sas/hisi_sas_main.c:1603:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed @@     got restricted __le16 [usertype] @@
   drivers/scsi/hisi_sas/hisi_sas_main.c:1603:52: sparse:     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed
   drivers/scsi/hisi_sas/hisi_sas_main.c:1603:52: sparse:     got restricted __le16 [usertype]
   drivers/scsi/hisi_sas/hisi_sas_main.c:1857:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed @@     got restricted __le16 [usertype] @@
   drivers/scsi/hisi_sas/hisi_sas_main.c:1857:52: sparse:     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed
   drivers/scsi/hisi_sas/hisi_sas_main.c:1857:52: sparse:     got restricted __le16 [usertype]
   drivers/scsi/hisi_sas/hisi_sas_main.c:2664:12: sparse: sparse: symbol 'hisi_sas_reg_name' was not declared. Should it be static?
   drivers/scsi/hisi_sas/hisi_sas_main.c:2692:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2692:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2692:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2692:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2692:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2692:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2697:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2697:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2697:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2697:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2697:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2697:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2762:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2762:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2762:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2762:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2762:42: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2762:42: sparse: sparse: cast to restricted __le32
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2864:45: sparse: sparse: cast to restricted __le64
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2864:45: sparse: sparse: cast to restricted __le64
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2864:45: sparse: sparse: cast to restricted __le64
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2864:45: sparse: sparse: cast to restricted __le64
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2864:45: sparse: sparse: cast to restricted __le64
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2864:45: sparse: sparse: cast to restricted __le64
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2864:45: sparse: sparse: cast to restricted __le64
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2864:45: sparse: sparse: cast to restricted __le64
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2864:45: sparse: sparse: cast to restricted __le64
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2864:45: sparse: sparse: cast to restricted __le64
   drivers/scsi/hisi_sas/hisi_sas_main.c:2664:13: warning: no previous prototype for 'hisi_sas_reg_name' [-Wmissing-prototypes]
    2664 | const char *hisi_sas_reg_name(int off,
         |             ^~~~~~~~~~~~~~~~~
   In file included from include/scsi/libsas.h:36,
                    from include/scsi/sas_ata.h:29,
                    from drivers/scsi/hisi_sas/hisi_sas.h:28,
                    from drivers/scsi/hisi_sas/hisi_sas_main.c:12:
   In function 'scsi_prot_sglist',
       inlined from 'hisi_sas_dif_dma_map' at drivers/scsi/hisi_sas/hisi_sas_main.c:442:2:
   include/scsi/scsi_cmnd.h:327:19: warning: 'scsi_cmnd' may be used uninitialized [-Wmaybe-uninitialized]
     327 |         return cmd->prot_sdb ? cmd->prot_sdb->table.sgl : NULL;
         |                ~~~^~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas_main.c: In function 'hisi_sas_dif_dma_map':
   drivers/scsi/hisi_sas/hisi_sas_main.c:412:27: note: 'scsi_cmnd' was declared here
     412 |         struct scsi_cmnd *scsi_cmnd;
         |                           ^~~~~~~~~

vim +2864 drivers/scsi/hisi_sas/hisi_sas_main.c

  2853	
  2854	static int hisi_sas_show_row_64(struct seq_file *s,
  2855					int index,
  2856					int sz,
  2857					u64 *ptr)
  2858	{
  2859		int i;
  2860	
  2861		/* completion header size not fixed per HW version */
  2862		seq_printf(s, "index %04d:\n\t", index);
  2863		for (i = 1; i <= sz / 8; i++, ptr++) {
> 2864			seq_printf(s, " 0x%016llx", le64_to_cpu(*ptr));
  2865			/* when print 4 character , new a line */
  2866			if (!(i % 4))
  2867				seq_puts(s, "\n\t");
  2868		}
  2869	
  2870		seq_puts(s, "\n");
  2871	
  2872		return 0;
  2873	}
  2874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
