Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365E976410
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736862658; cv=none; b=gaaLoER9VF1vQ7jlblTYHYHIreTg25bzXrxD9kZ11hx3q4X2vWAgE8iRpS+9YLwYKeNhoFUCPzz1QfkwtrvEQOb8VGe8zz0ATQSewbN0Wilxd48bTU4x+KkUF2xFCxI7mXTsVUSP+VvAdCkTltjdKZj+ucB+EKN6I05q74Fsrjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736862658; c=relaxed/simple;
	bh=Qr58pC+VqaIk1oEXQ+uy18qJnqKZMzuwaYemsH+VZ64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A6yI+IL8Q6oBuk90KDxaqziJJ64H7T/56pq77rKRChixT2Wkm1ka0WyA+N3jBn1aXhze6HYnvxKPNDs+BpcfFwT24m90fUoreGwYwMiuO9JDCP/n831N3Jf2+nI6jijdtmP/s9oTko8U9WcXdjjZmgBsm3sCt4x/tZrIFN2IBeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIw567tk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIw567tk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736862658; x=1768398658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qr58pC+VqaIk1oEXQ+uy18qJnqKZMzuwaYemsH+VZ64=;
  b=jIw567tkQgLhz3OjsFopQ6g2Y1PRr2OOPd67GSv8zXGnPpZj031ztUh+
   Adx722+8rir77vz/N6xMQm+x0FCpbFCNNA8GBz6xC4jJjUDlbmrI9dm1R
   LdS7Yy7Y9H8/3JmSR2JeStZFd6fpYy+WEb7r4++jfy6yCGQWi4oVYnfss
   3Ck3ThBNaqnjh6PU4doMAgJk/SYjDebbPkW9j0fVUqU1fFAaXZBVoldm5
   N2VGWLOBBVDqjCrwtBGK1BrCjxNqcDtsW0hv2uzL5Fm7ZajOsMaq7Mvoq
   +imSRF9NC0XslzeJhXjpth/KGl2g5isQMLFje7WRJ1bAmOexNw9Lg1Aps
   Q==;
X-CSE-ConnectionGUID: Y9f6f7bmTzaCd0DgBAm8YQ==
X-CSE-MsgGUID: HNB9R3jFTr+wCpL8RAdfTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="40836232"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="40836232"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 05:50:57 -0800
X-CSE-ConnectionGUID: 5zQrL5Z0Qom+qEC8YER9dA==
X-CSE-MsgGUID: OlrJ9RrCR5yT84d7O+n97A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108872240"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jan 2025 05:50:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXhJk-000Obe-23;
	Tue, 14 Jan 2025 13:50:52 +0000
Date: Tue, 14 Jan 2025 21:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: Guixin Liu <kanie@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Keith Busch <kbusch@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Subject: [linux-next:master 5900/8513]
 drivers/nvme/target/io-cmd-bdev.c:275:25: sparse: sparse: restricted __le16
 degrades to integer
Message-ID: <202501142128.WexgyMTv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dab2734f8e9ecba609d66d1dd087a392a7774c04
commit: 3ec5c62cfcf060e9ea533cd3901f5d03b26ddc24 [5900/8513] nvmet: handle rw's limited retry flag
config: openrisc-randconfig-r111-20250114 (https://download.01.org/0day-ci/archive/20250114/202501142128.WexgyMTv-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250114/202501142128.WexgyMTv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501142128.WexgyMTv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/io-cmd-bdev.c:275:25: sparse: sparse: restricted __le16 degrades to integer

vim +275 drivers/nvme/target/io-cmd-bdev.c

   243	
   244	static void nvmet_bdev_execute_rw(struct nvmet_req *req)
   245	{
   246		unsigned int sg_cnt = req->sg_cnt;
   247		struct bio *bio;
   248		struct scatterlist *sg;
   249		struct blk_plug plug;
   250		sector_t sector;
   251		blk_opf_t opf;
   252		int i, rc;
   253		struct sg_mapping_iter prot_miter;
   254		unsigned int iter_flags;
   255		unsigned int total_len = nvmet_rw_data_len(req) + req->metadata_len;
   256	
   257		if (!nvmet_check_transfer_len(req, total_len))
   258			return;
   259	
   260		if (!req->sg_cnt) {
   261			nvmet_req_complete(req, 0);
   262			return;
   263		}
   264	
   265		if (req->cmd->rw.opcode == nvme_cmd_write) {
   266			opf = REQ_OP_WRITE | REQ_SYNC | REQ_IDLE;
   267			if (req->cmd->rw.control & cpu_to_le16(NVME_RW_FUA))
   268				opf |= REQ_FUA;
   269			iter_flags = SG_MITER_TO_SG;
   270		} else {
   271			opf = REQ_OP_READ;
   272			iter_flags = SG_MITER_FROM_SG;
   273		}
   274	
 > 275		if (req->cmd->rw.control & NVME_RW_LR)
   276			opf |= REQ_FAILFAST_DEV;
   277	
   278		if (is_pci_p2pdma_page(sg_page(req->sg)))
   279			opf |= REQ_NOMERGE;
   280	
   281		sector = nvmet_lba_to_sect(req->ns, req->cmd->rw.slba);
   282	
   283		if (nvmet_use_inline_bvec(req)) {
   284			bio = &req->b.inline_bio;
   285			bio_init(bio, req->ns->bdev, req->inline_bvec,
   286				 ARRAY_SIZE(req->inline_bvec), opf);
   287		} else {
   288			bio = bio_alloc(req->ns->bdev, bio_max_segs(sg_cnt), opf,
   289					GFP_KERNEL);
   290		}
   291		bio->bi_iter.bi_sector = sector;
   292		bio->bi_private = req;
   293		bio->bi_end_io = nvmet_bio_done;
   294	
   295		blk_start_plug(&plug);
   296		if (req->metadata_len)
   297			sg_miter_start(&prot_miter, req->metadata_sg,
   298				       req->metadata_sg_cnt, iter_flags);
   299	
   300		for_each_sg(req->sg, sg, req->sg_cnt, i) {
   301			while (bio_add_page(bio, sg_page(sg), sg->length, sg->offset)
   302					!= sg->length) {
   303				struct bio *prev = bio;
   304	
   305				if (req->metadata_len) {
   306					rc = nvmet_bdev_alloc_bip(req, bio,
   307								  &prot_miter);
   308					if (unlikely(rc)) {
   309						bio_io_error(bio);
   310						return;
   311					}
   312				}
   313	
   314				bio = bio_alloc(req->ns->bdev, bio_max_segs(sg_cnt),
   315						opf, GFP_KERNEL);
   316				bio->bi_iter.bi_sector = sector;
   317	
   318				bio_chain(bio, prev);
   319				submit_bio(prev);
   320			}
   321	
   322			sector += sg->length >> 9;
   323			sg_cnt--;
   324		}
   325	
   326		if (req->metadata_len) {
   327			rc = nvmet_bdev_alloc_bip(req, bio, &prot_miter);
   328			if (unlikely(rc)) {
   329				bio_io_error(bio);
   330				return;
   331			}
   332		}
   333	
   334		submit_bio(bio);
   335		blk_finish_plug(&plug);
   336	}
   337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
