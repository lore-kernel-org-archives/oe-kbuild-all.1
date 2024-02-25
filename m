Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FFB8BEC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 12:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708864053; cv=none; b=SIzsh6D5BA5zfm0xAlxE33bVTAsuy43HSYPObuHnyOgam43RLnjsmz8dRGM0zQvKeLrTRUkSAwkm3rb3e5JI9dVbWcBuuCD6plqp7/gucMovpqIaQcHXeZx7ReKuUsLBFIl98BJGMh48zLn1MREnyHUXCgoUOKuuxmArtR5hBc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708864053; c=relaxed/simple;
	bh=D9UwxQWMaqHvzvYrnzjQQObEKjSdqlxBWMQqFqvm0DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JpP0quDxSuA+5tuhpPyKACjICyC4x4PKis7ar1StaQjhxrtUmSARauE4JDoGednN2sLBvKDj3IHdCUmMTtzFLpKYJATo8egNO+MOt5EYlZH3l68Ub+qTJ+lDWG9nzcsCxSPblVu3HJiies3ETDGiDtZAVlG/T2/21cMW4+JHy6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tg/JssXt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tg/JssXt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708864050; x=1740400050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D9UwxQWMaqHvzvYrnzjQQObEKjSdqlxBWMQqFqvm0DQ=;
  b=Tg/JssXtzD1HnLsUqlkHZtPdchW59THfNbjlVch1YcMdJi1CrrQLfqFt
   Z5MCJbXwTvGtbbO/jITs2P2zd8n7gkQQ0H23mffNCUWsc3wx9xT5aaNKq
   YeSfbEE+Vp9AqTjgkhqxN2WZoONkE92CfZQ/0qN+XfcQlY8CFyD1lac8z
   vwsr5dQua3cV4HGmjL2J/i0CesS5oD8rK1uk9ScJMqaerHkMNsuwc40IW
   +Xa/66yLBHP6aUzrItdbNiWwIMkeywmxI0Qo1hAV8IySVllOuHJn3n7U4
   uMbiivNledYQeQ0ImNOFxd+v0m5LOqVYPsqiqqlz9LHkvkpDlwaSheH6+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="6098785"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="6098785"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 04:27:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="6309124"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Feb 2024 04:27:28 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reDbJ-0009W8-3A;
	Sun, 25 Feb 2024 12:27:26 +0000
Date: Sun, 25 Feb 2024 20:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13425/21632]
 drivers/net/ethernet/huawei/hinic/hinic_hwif.c:649:65: sparse: sparse:
 incorrect type in argument 4 (different base types)
Message-ID: <202402252031.ls64imy6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b97b63500af297c36f80416fd1f1193d227cf51a
commit: 90f09a01314abe26de1a722d1b51c351d84e1f5b [13425/21632] net/hinic: Add support for X86 Arch
config: x86_64-randconfig-122-20240218 (https://download.01.org/0day-ci/archive/20240225/202402252031.ls64imy6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402252031.ls64imy6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402252031.ls64imy6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:40:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse:     expected unsigned int val
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:46:16: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:575:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *cfg_regs_base @@     got void *cfg_reg_base @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:575:29: sparse:     expected unsigned char [noderef] [usertype] __iomem *cfg_regs_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:575:29: sparse:     got void *cfg_reg_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:576:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *intr_regs_base @@     got void *intr_reg_base @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:576:30: sparse:     expected unsigned char [noderef] [usertype] __iomem *intr_regs_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:576:30: sparse:     got void *intr_reg_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:579:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *db_base @@     got void *db_base @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:579:23: sparse:     expected unsigned char [noderef] [usertype] __iomem *db_base
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:579:23: sparse:     got void *db_base
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:649:65: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] flag @@     got unsigned int flag @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:649:65: sparse:     expected restricted gfp_t [usertype] flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:649:65: sparse:     got unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:664:65: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] flag @@     got unsigned int flag @@
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:664:65: sparse:     expected restricted gfp_t [usertype] flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:664:65: sparse:     got unsigned int flag
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:970:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:979:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:564: warning: Function parameter or member 'intr_reg_base' not described in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:564: warning: Function parameter or member 'db_base_phy' not described in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:564: warning: Function parameter or member 'db_base' not described in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:564: warning: Function parameter or member 'dwqe_mapping' not described in 'hinic_init_hwif'

vim +649 drivers/net/ethernet/huawei/hinic/hinic_hwif.c

746ea35981b1f7 Xue 2019-01-30  640  
746ea35981b1f7 Xue 2019-01-30  641  int hinic_dma_zalloc_coherent_align(void *dev_hdl, u64 size, u64 align,
746ea35981b1f7 Xue 2019-01-30  642  				    unsigned int flag,
746ea35981b1f7 Xue 2019-01-30  643  				    struct hinic_dma_addr_align *mem_align)
746ea35981b1f7 Xue 2019-01-30  644  {
746ea35981b1f7 Xue 2019-01-30  645  	void *vaddr, *align_vaddr;
746ea35981b1f7 Xue 2019-01-30  646  	dma_addr_t paddr, align_paddr;
746ea35981b1f7 Xue 2019-01-30  647  	u64 real_size = size;
746ea35981b1f7 Xue 2019-01-30  648  
746ea35981b1f7 Xue 2019-01-30 @649  	vaddr = dma_zalloc_coherent(dev_hdl, real_size, &paddr, flag);
746ea35981b1f7 Xue 2019-01-30  650  	if (!vaddr)
746ea35981b1f7 Xue 2019-01-30  651  		return -ENOMEM;
746ea35981b1f7 Xue 2019-01-30  652  
746ea35981b1f7 Xue 2019-01-30  653  	align_paddr = ALIGN(paddr, align);
746ea35981b1f7 Xue 2019-01-30  654  	/* align */
746ea35981b1f7 Xue 2019-01-30  655  	if (align_paddr == paddr) {
746ea35981b1f7 Xue 2019-01-30  656  		align_vaddr = vaddr;
746ea35981b1f7 Xue 2019-01-30  657  		goto out;
746ea35981b1f7 Xue 2019-01-30  658  	}
746ea35981b1f7 Xue 2019-01-30  659  
746ea35981b1f7 Xue 2019-01-30  660  	dma_free_coherent(dev_hdl, real_size, vaddr, paddr);
746ea35981b1f7 Xue 2019-01-30  661  
746ea35981b1f7 Xue 2019-01-30  662  	/* realloc memory for align */
746ea35981b1f7 Xue 2019-01-30  663  	real_size = size + align;
746ea35981b1f7 Xue 2019-01-30  664  	vaddr = dma_zalloc_coherent(dev_hdl, real_size, &paddr, flag);
746ea35981b1f7 Xue 2019-01-30  665  	if (!vaddr)
746ea35981b1f7 Xue 2019-01-30  666  		return -ENOMEM;
746ea35981b1f7 Xue 2019-01-30  667  
746ea35981b1f7 Xue 2019-01-30  668  	align_paddr = ALIGN(paddr, align);
746ea35981b1f7 Xue 2019-01-30  669  	align_vaddr = (void *)((u64)vaddr + (align_paddr - paddr));
746ea35981b1f7 Xue 2019-01-30  670  
746ea35981b1f7 Xue 2019-01-30  671  out:
746ea35981b1f7 Xue 2019-01-30  672  	mem_align->real_size = (u32)real_size;
746ea35981b1f7 Xue 2019-01-30  673  	mem_align->ori_vaddr = vaddr;
746ea35981b1f7 Xue 2019-01-30  674  	mem_align->ori_paddr = paddr;
746ea35981b1f7 Xue 2019-01-30  675  	mem_align->align_vaddr = align_vaddr;
746ea35981b1f7 Xue 2019-01-30  676  	mem_align->align_paddr = align_paddr;
746ea35981b1f7 Xue 2019-01-30  677  
746ea35981b1f7 Xue 2019-01-30  678  	return 0;
746ea35981b1f7 Xue 2019-01-30  679  }
746ea35981b1f7 Xue 2019-01-30  680  

:::::: The code at line 649 was first introduced by commit
:::::: 746ea35981b1f77e988d48642409d73f0470b3eb net: hinic: Add Hardware Abstract Layer

:::::: TO: Xue <xuechaojing@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
