Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0375A22154F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 14:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455612; cv=none; b=UI73ecZ58QLo8lA2rnLJ0XsZ7RykLY5QyrNplVV+euzOHaE8tOu+uKKVfgOCf5Oz4QcjtV7HQje4aXqJqEzahucU/9W9yfenXQhkUp2F/zR/6F7/G6uSHS+gasAiQ2VKn6pGJArU/drGbpdVRIouGgbUORhMP966SMCLNABYyUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455612; c=relaxed/simple;
	bh=iY3VGy+AlPmB2ScfPOfRgm0T+MUQqLbcF2DGM9GpFUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V9AFgxqw+nSgHlcO6EnWlA/52kNOwzWpybCCc8ht0sNkttz2Lr5iSI14IuiTR/VQNnC/Tg0yIfkBXjd7uxFfKsj7Nfo/61F6oA595GscknFU/MSd1+xsHRZ+wMB+cytT0ZpdEibgvf507OkAy0jpG3iqfEZfp9HBP61saGvZYEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2nEQ0yU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2nEQ0yU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455610; x=1770991610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iY3VGy+AlPmB2ScfPOfRgm0T+MUQqLbcF2DGM9GpFUQ=;
  b=a2nEQ0yUQSsQ1CWTSrjSXPS/ZHZ5UxBxvXdsd+RB1mJE6DrJo7UkyyMG
   ChmSW2sGvKHLBBFOZpNuibi4dfPswNjmsKJrpmnVPHdcGl3podlgXL5v2
   OBPDRkkdSfhlXTzWDsPVG4jOJdnnuY4K6DgNqA5+wkHnoDYpefsSZeeEM
   KcDxpXMUqGYo39eqe0AGbBdbEmMB6IU2OnjSReKkraPMPdwNQ9f4U4PIN
   nx5QOwq0flAD/xhYc/PyfopYSqkGCysMRtQ+xv4bZTuqsJ+5zGH29jD9/
   d8w+3rDMTC6viUDlWhtvWYr0K+c1IJPf4me3LzfQ9g37/8tXOX4SjVDjw
   A==;
X-CSE-ConnectionGUID: nn8O2wzgQ9WM8DtnM5IHjQ==
X-CSE-MsgGUID: xN1Vzs+9QcmohCl19U21fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50804223"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="50804223"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:06:40 -0800
X-CSE-ConnectionGUID: 6n6jaqFURxadHbEC4SrVTA==
X-CSE-MsgGUID: IwBKBKSEQmG7+eNKcTJhWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150320521"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2025 06:06:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiZrQ-00177r-1F;
	Thu, 13 Feb 2025 14:06:36 +0000
Date: Thu, 13 Feb 2025 22:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 1858/3437] sound/soc/amd/ps/pci-ps.c:68
 check_and_handle_sdw_dma_irq() warn: inconsistent indenting
Message-ID: <202502132134.BlkNw1Iq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7b7a883c7f4de1ee5040bd1c32aabaafde54d209
commit: 0b6914a0121b4c9fc8f575b60a5dd43b74612908 [1858/3437] ASoC: amd: ps: add soundwire dma interrupts handling for ACP7.0 platform
config: i386-randconfig-141-20250213 (https://download.01.org/0day-ci/archive/20250213/202502132134.BlkNw1Iq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502132134.BlkNw1Iq-lkp@intel.com/

smatch warnings:
sound/soc/amd/ps/pci-ps.c:68 check_and_handle_sdw_dma_irq() warn: inconsistent indenting

vim +68 sound/soc/amd/ps/pci-ps.c

95e43a170bb1e9 Syed Saba Kareem 2022-08-27   23  
4516be370ced14 Vijendar Mukunda 2025-02-07   24  static short int check_and_handle_sdw_dma_irq(struct acp63_dev_data *adata, u32 ext_intr_stat,
4516be370ced14 Vijendar Mukunda 2025-02-07   25  					      u32 ext_intr_stat1)
4516be370ced14 Vijendar Mukunda 2025-02-07   26  {
4516be370ced14 Vijendar Mukunda 2025-02-07   27  	u32 stream_id = 0;
4516be370ced14 Vijendar Mukunda 2025-02-07   28  	u16 sdw_dma_irq_flag = 0;
4516be370ced14 Vijendar Mukunda 2025-02-07   29  	u16 index;
4516be370ced14 Vijendar Mukunda 2025-02-07   30  
4516be370ced14 Vijendar Mukunda 2025-02-07   31  	if (ext_intr_stat & ACP63_SDW_DMA_IRQ_MASK) {
4516be370ced14 Vijendar Mukunda 2025-02-07   32  		for (index = ACP_AUDIO2_RX_THRESHOLD; index <= ACP_AUDIO0_TX_THRESHOLD; index++) {
4516be370ced14 Vijendar Mukunda 2025-02-07   33  			if (ext_intr_stat & BIT(index)) {
4516be370ced14 Vijendar Mukunda 2025-02-07   34  				writel(BIT(index), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
4516be370ced14 Vijendar Mukunda 2025-02-07   35  				switch (index) {
4516be370ced14 Vijendar Mukunda 2025-02-07   36  				case ACP_AUDIO0_TX_THRESHOLD:
4516be370ced14 Vijendar Mukunda 2025-02-07   37  					stream_id = ACP63_SDW0_AUDIO0_TX;
4516be370ced14 Vijendar Mukunda 2025-02-07   38  					break;
4516be370ced14 Vijendar Mukunda 2025-02-07   39  				case ACP_AUDIO1_TX_THRESHOLD:
4516be370ced14 Vijendar Mukunda 2025-02-07   40  					stream_id = ACP63_SDW0_AUDIO1_TX;
4516be370ced14 Vijendar Mukunda 2025-02-07   41  					break;
4516be370ced14 Vijendar Mukunda 2025-02-07   42  				case ACP_AUDIO2_TX_THRESHOLD:
4516be370ced14 Vijendar Mukunda 2025-02-07   43  					stream_id = ACP63_SDW0_AUDIO2_TX;
4516be370ced14 Vijendar Mukunda 2025-02-07   44  					break;
4516be370ced14 Vijendar Mukunda 2025-02-07   45  				case ACP_AUDIO0_RX_THRESHOLD:
4516be370ced14 Vijendar Mukunda 2025-02-07   46  					stream_id = ACP63_SDW0_AUDIO0_RX;
4516be370ced14 Vijendar Mukunda 2025-02-07   47  					break;
4516be370ced14 Vijendar Mukunda 2025-02-07   48  				case ACP_AUDIO1_RX_THRESHOLD:
4516be370ced14 Vijendar Mukunda 2025-02-07   49  					stream_id = ACP63_SDW0_AUDIO1_RX;
4516be370ced14 Vijendar Mukunda 2025-02-07   50  					break;
4516be370ced14 Vijendar Mukunda 2025-02-07   51  				case ACP_AUDIO2_RX_THRESHOLD:
4516be370ced14 Vijendar Mukunda 2025-02-07   52  					stream_id = ACP63_SDW0_AUDIO2_RX;
4516be370ced14 Vijendar Mukunda 2025-02-07   53  					break;
4516be370ced14 Vijendar Mukunda 2025-02-07   54  				}
0b6914a0121b4c Vijendar Mukunda 2025-02-07   55  				if (adata->acp_rev >= ACP70_PCI_REV)
0b6914a0121b4c Vijendar Mukunda 2025-02-07   56  					adata->acp70_sdw0_dma_intr_stat[stream_id] = 1;
0b6914a0121b4c Vijendar Mukunda 2025-02-07   57  				else
4516be370ced14 Vijendar Mukunda 2025-02-07   58  					adata->acp63_sdw0_dma_intr_stat[stream_id] = 1;
0b6914a0121b4c Vijendar Mukunda 2025-02-07   59  
4516be370ced14 Vijendar Mukunda 2025-02-07   60  				sdw_dma_irq_flag = 1;
4516be370ced14 Vijendar Mukunda 2025-02-07   61  			}
4516be370ced14 Vijendar Mukunda 2025-02-07   62  		}
4516be370ced14 Vijendar Mukunda 2025-02-07   63  	}
0b6914a0121b4c Vijendar Mukunda 2025-02-07   64  	if (adata->acp_rev == ACP63_PCI_REV) {
4516be370ced14 Vijendar Mukunda 2025-02-07   65  		if (ext_intr_stat1 & ACP63_P1_AUDIO1_RX_THRESHOLD) {
0b6914a0121b4c Vijendar Mukunda 2025-02-07   66  			writel(ACP63_P1_AUDIO1_RX_THRESHOLD,
0b6914a0121b4c Vijendar Mukunda 2025-02-07   67  			       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
4516be370ced14 Vijendar Mukunda 2025-02-07  @68  		       adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_RX] = 1;
4516be370ced14 Vijendar Mukunda 2025-02-07   69  			sdw_dma_irq_flag = 1;
4516be370ced14 Vijendar Mukunda 2025-02-07   70  		}
4516be370ced14 Vijendar Mukunda 2025-02-07   71  		if (ext_intr_stat1 & ACP63_P1_AUDIO1_TX_THRESHOLD) {
0b6914a0121b4c Vijendar Mukunda 2025-02-07   72  			writel(ACP63_P1_AUDIO1_TX_THRESHOLD,
0b6914a0121b4c Vijendar Mukunda 2025-02-07   73  			       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
4516be370ced14 Vijendar Mukunda 2025-02-07   74  			adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_TX] = 1;
4516be370ced14 Vijendar Mukunda 2025-02-07   75  			sdw_dma_irq_flag = 1;
4516be370ced14 Vijendar Mukunda 2025-02-07   76  		}
0b6914a0121b4c Vijendar Mukunda 2025-02-07   77  	} else  {
0b6914a0121b4c Vijendar Mukunda 2025-02-07   78  		if (ext_intr_stat1 & ACP70_P1_SDW_DMA_IRQ_MASK) {
0b6914a0121b4c Vijendar Mukunda 2025-02-07   79  			for (index = ACP70_P1_AUDIO2_RX_THRESHOLD;
0b6914a0121b4c Vijendar Mukunda 2025-02-07   80  			     index <= ACP70_P1_AUDIO0_TX_THRESHOLD; index++) {
0b6914a0121b4c Vijendar Mukunda 2025-02-07   81  				if (ext_intr_stat1 & BIT(index)) {
0b6914a0121b4c Vijendar Mukunda 2025-02-07   82  					writel(BIT(index),
0b6914a0121b4c Vijendar Mukunda 2025-02-07   83  					       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
0b6914a0121b4c Vijendar Mukunda 2025-02-07   84  					switch (index) {
0b6914a0121b4c Vijendar Mukunda 2025-02-07   85  					case ACP70_P1_AUDIO0_TX_THRESHOLD:
0b6914a0121b4c Vijendar Mukunda 2025-02-07   86  						stream_id = ACP70_SDW_AUDIO0_TX;
0b6914a0121b4c Vijendar Mukunda 2025-02-07   87  						break;
0b6914a0121b4c Vijendar Mukunda 2025-02-07   88  					case ACP70_P1_AUDIO1_TX_THRESHOLD:
0b6914a0121b4c Vijendar Mukunda 2025-02-07   89  						stream_id = ACP70_SDW_AUDIO1_TX;
0b6914a0121b4c Vijendar Mukunda 2025-02-07   90  						break;
0b6914a0121b4c Vijendar Mukunda 2025-02-07   91  					case ACP70_P1_AUDIO2_TX_THRESHOLD:
0b6914a0121b4c Vijendar Mukunda 2025-02-07   92  						stream_id = ACP70_SDW_AUDIO2_TX;
0b6914a0121b4c Vijendar Mukunda 2025-02-07   93  						break;
0b6914a0121b4c Vijendar Mukunda 2025-02-07   94  					case ACP70_P1_AUDIO0_RX_THRESHOLD:
0b6914a0121b4c Vijendar Mukunda 2025-02-07   95  						stream_id = ACP70_SDW_AUDIO0_RX;
0b6914a0121b4c Vijendar Mukunda 2025-02-07   96  						break;
0b6914a0121b4c Vijendar Mukunda 2025-02-07   97  					case ACP70_P1_AUDIO1_RX_THRESHOLD:
0b6914a0121b4c Vijendar Mukunda 2025-02-07   98  						 stream_id = ACP70_SDW_AUDIO1_RX;
0b6914a0121b4c Vijendar Mukunda 2025-02-07   99  						break;
0b6914a0121b4c Vijendar Mukunda 2025-02-07  100  					case ACP70_P1_AUDIO2_RX_THRESHOLD:
0b6914a0121b4c Vijendar Mukunda 2025-02-07  101  						stream_id = ACP70_SDW_AUDIO2_RX;
0b6914a0121b4c Vijendar Mukunda 2025-02-07  102  						break;
0b6914a0121b4c Vijendar Mukunda 2025-02-07  103  					}
0b6914a0121b4c Vijendar Mukunda 2025-02-07  104  
0b6914a0121b4c Vijendar Mukunda 2025-02-07  105  					adata->acp70_sdw1_dma_intr_stat[stream_id] = 1;
0b6914a0121b4c Vijendar Mukunda 2025-02-07  106  					sdw_dma_irq_flag = 1;
0b6914a0121b4c Vijendar Mukunda 2025-02-07  107  				}
0b6914a0121b4c Vijendar Mukunda 2025-02-07  108  			}
0b6914a0121b4c Vijendar Mukunda 2025-02-07  109  		}
0b6914a0121b4c Vijendar Mukunda 2025-02-07  110  	}
4516be370ced14 Vijendar Mukunda 2025-02-07  111  	return sdw_dma_irq_flag;
4516be370ced14 Vijendar Mukunda 2025-02-07  112  }
4516be370ced14 Vijendar Mukunda 2025-02-07  113  

:::::: The code at line 68 was first introduced by commit
:::::: 4516be370ced14c4fb454fd6cc016e47bffe109e ASoC: amd: ps: refactor soundwire dma interrupt handling

:::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
