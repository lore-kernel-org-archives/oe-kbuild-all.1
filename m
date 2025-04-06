Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8827B1E502
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Apr 2025 12:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743942740; cv=none; b=CxXqKvpwhrE1AOQQ9PVZaU00+RBSj1ItEHLJjPk8HxTn8vTm6P1heJdgUz+KtmbVVmeAuhvE6XUTNEaoH4SBS/Pm2bXE3TuQ2tjDEODGWBD8UVPgwklWiehVGwaUgrLMV0OKoQcunC6IChPgMsRah6d6AcApluSLMAJkqPf4I+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743942740; c=relaxed/simple;
	bh=6vxDDxQWZgwqS5gsY4zTEcG+2MjYYRSZcFaC5ZErpo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ketz60svz1mbVa1vOl4IJoPL68RtSXBlfFNDydiufJEmkn/kyd+mfjpUnndSHMXnodLM6uqkyhva7rfALo90uyGnMr/aolaNZweye7y5plqCVpTgrL9pcHmiRrYcRlieG3bu4ligqBMnMxEPD58ulnMsnSi4Z5FY/tAuL3I5Ttc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7mP3uMk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7mP3uMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743942739; x=1775478739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6vxDDxQWZgwqS5gsY4zTEcG+2MjYYRSZcFaC5ZErpo8=;
  b=X7mP3uMkme6n7QqMANEpZlO8m4srE07FhoQLP8EewlXgfNknm1F940xP
   jmJ32kGr1BoG101F4SNen/dsyDqjtCXpyhj0QrVDNLLcIksj2oJv0/fbl
   yBkZdlpSURtwsYsQp+7qOtqvSXKOomTkG1IAvHCxKPvza36fZ3BbUsvi9
   7r5/lgCiCprnhQZp7w5dMltvLTL8c7GpYf8azOKrZdyxV+YPw3eUdb0Cs
   GQhYaqNyzF6+U8d6BftoPY3bkavfZau42mkf1u6HP+3yONUoUjLjAjeeE
   rSPF579OySB4NuQ959DGhcJrqDgK0bU4jFdVAflEbE+fagCW9w7f4x41P
   g==;
X-CSE-ConnectionGUID: EJLhYed3R3G1P0kZsoulew==
X-CSE-MsgGUID: XVfSqyFGSsOhlR9KHMRE1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="62730087"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="62730087"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 05:32:11 -0700
X-CSE-ConnectionGUID: 1pDOLMtmSnqRBHOSavKmrQ==
X-CSE-MsgGUID: g5VEhLesTk6mcMUJLFDg/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="158683562"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Apr 2025 05:32:07 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1PAT-0002al-0p;
	Sun, 06 Apr 2025 12:32:05 +0000
Date: Sun, 6 Apr 2025 20:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:dma-split-wip 23/25] drivers/nvme/host/pci.c:901
 nvme_pci_setup_meta_sgls() warn: inconsistent indenting
Message-ID: <202504062030.Ydkvsgxh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-wip
head:   39bd337e840fee4fec27a2472f99c74308e9fd95
commit: 71e72f9e14306c8f1b95e2371f3607dbd16f1873 [23/25] nvme-pci: convert to blk_rq_dma_map
config: i386-randconfig-141-20250406 (https://download.01.org/0day-ci/archive/20250406/202504062030.Ydkvsgxh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504062030.Ydkvsgxh-lkp@intel.com/

smatch warnings:
drivers/nvme/host/pci.c:901 nvme_pci_setup_meta_sgls() warn: inconsistent indenting

vim +901 drivers/nvme/host/pci.c

   859	
   860	static blk_status_t nvme_pci_setup_meta_sgls(struct nvme_dev *dev,
   861						     struct request *req)
   862	{
   863		unsigned int entries = req->nr_integrity_segments;
   864		struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
   865		struct nvme_rw_command *cmd = &iod->cmd.rw;
   866		struct nvme_sgl_desc *sg_list;
   867		struct blk_dma_iter iter;
   868		unsigned int mapped = 0;
   869		dma_addr_t sgl_dma;
   870	
   871		cmd->flags = NVME_CMD_SGL_METASEG;
   872	
   873		if (!blk_rq_dma_map_iter_start(req, dev->dev, &iod->dma_meta_state,
   874					       &iter))
   875			return iter.status;
   876	
   877		sg_list = dma_pool_alloc(dev->prp_small_pool, GFP_ATOMIC, &sgl_dma);
   878		if (!sg_list)
   879			return BLK_STS_RESOURCE;
   880	
   881		iod->meta_list = sg_list;
   882		iod->meta_dma = sgl_dma;
   883		cmd->metadata = cpu_to_le64(sgl_dma);
   884	
   885		if (entries == 1 || blk_rq_dma_map_coalesce(&iod->dma_meta_state)) {
   886			nvme_pci_sgl_set_data(sg_list, &iter);
   887			iod->total_meta_len += iter.len;
   888			return BLK_STS_OK;
   889		}
   890	
   891		do {
   892			if (WARN_ON_ONCE(mapped == entries)) {
   893				iter.status = BLK_STS_IOERR;
   894				break;
   895			}
   896			nvme_pci_sgl_set_data(&sg_list[mapped++], &iter);
   897			iod->total_len += iter.len;
   898		} while (blk_rq_dma_map_iter_next(req, dev->dev, &iod->dma_meta_state,
   899					 &iter));
   900	
 > 901			nvme_pci_sgl_set_seg(sg_list, sgl_dma, mapped);
   902		if (unlikely(iter.status))
   903			nvme_unmap_metadata(dev, req);
   904		return iter.status;
   905	}
   906	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
