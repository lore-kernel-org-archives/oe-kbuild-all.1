Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D10F176AA9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 19:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727985054; cv=none; b=fnh0S+nk7HmdaNu+x5+HpWX9eR/MdPl9aX9saYnhWnO3FRDharrKDEcTsEJdGEk/qubdO1yZu+xj0Sm8K5Vll/9flrh7QnpDc7L4bZhvlQgCqmcmtZdgVIxqQNM98fC5hPj0goyULM1Ufyg2i5lQPXAWb8enqmsgeNw/ana4Sgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727985054; c=relaxed/simple;
	bh=Ac/IuYpAzz/0d45nwKf4TKJ0dUU8Euazzi8cFVgnJV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gCROR/lP31SVDStEGCf0wo3BRrnajzYlVA+K8g+bcvyUP3GtcLxdfKjFLw02LSLJTfoy6RCFmY7x/4NzxiJFvN1HoG/UFVzTej5v1eTuGNqvcQQGhAosBZq1INv29O460SJ/dkA0qrhKUv+KQaZyBI+OSd5gH0Zvu3sHziaSn9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MP81DuYY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MP81DuYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727985052; x=1759521052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ac/IuYpAzz/0d45nwKf4TKJ0dUU8Euazzi8cFVgnJV4=;
  b=MP81DuYY07V58MHIopVJn8y/Qc+a4swftWj8WW6Hp22ulIRL8fhZcccQ
   tFCUNSt2n3kht7qs1u0rKOw6iXBVPV+rfe6roECQ0zsweWHJBoaLkQjlZ
   2oXDnyn6imPPBIXwJGUguYHh5hucaGYN+yOvm0Bf5oYKPCvXsTP5r2STG
   9HvmQL4tGlmGLzSOlWt/Dd05vvlLBmBWrrUuprve816RLVnmtPtw52i0N
   23WD2hpUEne+PxTibnA8oovScQG/MBeH1+GnPEekXwwIYAWfA6I+IaZyR
   5yAm9A0QysNnga8WP3S32IJ9fdxru6lqXGKXXOSB0dqS+3GCipjBRfXcm
   A==;
X-CSE-ConnectionGUID: yIcb6XrrRP63mjhPTgcqvw==
X-CSE-MsgGUID: UXOKZIUGStef2yLakY6gHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="52605908"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="52605908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 12:50:51 -0700
X-CSE-ConnectionGUID: JyORtHSIT8uuRPIVp3e9XA==
X-CSE-MsgGUID: 7N1iIEW3RzSMH5FJTHvIFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="79426168"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Oct 2024 12:50:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swRqZ-0000qE-2c;
	Thu, 03 Oct 2024 19:50:47 +0000
Date: Fri, 4 Oct 2024 03:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1567/23811]
 drivers/scsi/hisi_sas/hisi_sas_main.c:2692:33: sparse: sparse: cast to
 restricted __le32
Message-ID: <202410040348.tx3GNMPZ-lkp@intel.com>
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
commit: bee9d00acd7e651a6ec989ef3e7b1309b24469af [1567/23811] scsi: hisi_sas: Add DFX Feature: Global register create file and add file operations
config: arm64-randconfig-r111-20241003 (https://download.01.org/0day-ci/archive/20241004/202410040348.tx3GNMPZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241004/202410040348.tx3GNMPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040348.tx3GNMPZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/hisi_sas/hisi_sas_main.c:1603:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed @@     got restricted __le16 [usertype] @@
   drivers/scsi/hisi_sas/hisi_sas_main.c:1603:52: sparse:     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed
   drivers/scsi/hisi_sas/hisi_sas_main.c:1603:52: sparse:     got restricted __le16 [usertype]
   drivers/scsi/hisi_sas/hisi_sas_main.c:1857:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed @@     got restricted __le16 [usertype] @@
   drivers/scsi/hisi_sas/hisi_sas_main.c:1857:52: sparse:     expected unsigned short [assigned] [usertype] tag_of_task_to_be_managed
   drivers/scsi/hisi_sas/hisi_sas_main.c:1857:52: sparse:     got restricted __le16 [usertype]
   drivers/scsi/hisi_sas/hisi_sas_main.c:2664:12: sparse: sparse: symbol 'hisi_sas_reg_name' was not declared. Should it be static?
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2692:33: sparse: sparse: cast to restricted __le32
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2692:33: sparse: sparse: cast to restricted __le32
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2692:33: sparse: sparse: cast to restricted __le32
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2692:33: sparse: sparse: cast to restricted __le32
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2692:33: sparse: sparse: cast to restricted __le32
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2692:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2697:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2697:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2697:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2697:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2697:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_main.c:2697:33: sparse: sparse: cast to restricted __le32
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

vim +2692 drivers/scsi/hisi_sas/hisi_sas_main.c

  2675	
  2676	static void hisi_sas_print_reg(u32 *regs_val,
  2677					const void *ptr,
  2678					struct seq_file *s)
  2679	{
  2680		const struct hisi_sas_debugfs_reg *reg = ptr;
  2681		int i;
  2682	
  2683		for (i = 0; i < reg->count; i++) {
  2684			int off = i * 4;
  2685			const char *name = hisi_sas_reg_name(off,
  2686							reg->base_off,
  2687							reg->lu);
  2688	
  2689			if (name)
  2690				seq_printf(s, "0x%08x 0x%08x %s\n",
  2691					off,
> 2692					le32_to_cpu(regs_val[i]),
  2693					name);
  2694			else
  2695				seq_printf(s, "0x%08x 0x%08x\n",
  2696					off,
  2697					le32_to_cpu(regs_val[i]));
  2698		}
  2699	}
  2700	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
