Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0337E28EB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642135; cv=none; b=Bw3c2GbHTLe4toEkNCk0e/P7XlS106lMMOkn+iJ/i58M4ScarC6pO3e8fm4cq8sZmChB/00uvx5pkvQhEnY4TYzzmZ5BgQ3l7k/Gp5aMF0NLh5SjUNbnqwYPf25/1bwDgdC0tw81yfl0GKhs3ZTeLR5pMIjWpjpOZEtmODq97Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642135; c=relaxed/simple;
	bh=Unbs/JRqPtmPH7/AnFv3nN7WPHsaQRnsetb1UEz+DBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lDBZHvZIDDJEJy+omPCPLzTZvGeXdB5xvTsddmUKTtdCfMtmQiD1Ip0Rir/6VR4RKSEe7kTP8fQE1VB9nbTNOP9ICeshwFB+er5JG5iwSZcePGCG1a2LmQS5zzTmHvykBgjaXQ+0m7cCPYaQEFuhc0TLmzAxifb+sii/czQTq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GF9Kg4TC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GF9Kg4TC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728642133; x=1760178133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Unbs/JRqPtmPH7/AnFv3nN7WPHsaQRnsetb1UEz+DBY=;
  b=GF9Kg4TCiezk3Vnbk2+Knn2QmiihkC3GNlbbFCA+6mH0j4an/FKHcal6
   g8VwW1ChVinl38SvQ+oWmNCAf/xzlyAmHYnrnUsWiwR+kuNAf2HFPxFY4
   CryTfUWCZXpfj67fVbspDqPQ5HaUVx/SiaqF7ZLwfbsnwklgtONLyfgxq
   EEiqZM/0dLD8GB9wPSdvI893HbKt99FSopPGZzKUR81zhKR4JbRf8CE2E
   QaWWMdk5myyUyAENecgEhrS690iRvhXvO01kzjk3WAtBGHEmgd82xn1ma
   dsJhLDJ3eJijC2Ka8QCUPSM+kB/A8Kn6bkN92HSamSi9IBBv8RRJXsFfc
   Q==;
X-CSE-ConnectionGUID: nKTHT8hRQjqADEu+hT7f/Q==
X-CSE-MsgGUID: y8UHXe7CRQCnOxu+us/R5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27907585"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="27907585"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 03:22:12 -0700
X-CSE-ConnectionGUID: HnsxMKxJTu2sVKdmUoBA2Q==
X-CSE-MsgGUID: 7/6o6DHDS1WHhuQF9bZ9lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="76492125"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Oct 2024 03:22:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szCme-000CA5-1M;
	Fri, 11 Oct 2024 10:22:08 +0000
Date: Fri, 11 Oct 2024 18:22:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-dma 9/9] drivers/nvme/host/pci.c:681:8: warning:
 variable 'prp2_dma' is used uninitialized whenever 'if' condition is false
Message-ID: <202410111840.OKCM5Siy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git block-dma
head:   d76f41fc7d0f68b85c90d0beb90a09f54b6aa219
commit: d76f41fc7d0f68b85c90d0beb90a09f54b6aa219 [9/9] nvme-pci: convert to blk_rq_dma_map
config: i386-buildonly-randconfig-005-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111840.OKCM5Siy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111840.OKCM5Siy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111840.OKCM5Siy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/host/pci.c:552:15: warning: variable 'nprps' set but not used [-Wunused-but-set-variable]
     552 |         int prp_len, nprps, i, desc;
         |                      ^
>> drivers/nvme/host/pci.c:681:8: warning: variable 'prp2_dma' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     681 |                         if (WARN_ON_ONCE(!status))
         |                             ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:33: note: expanded from macro 'WARN_ON_ONCE'
     110 | #define WARN_ON_ONCE(condition) ({                              \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     111 |         int __ret_warn_on = !!(condition);                      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     112 |         if (unlikely(__ret_warn_on))                            \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     114 |                              BUGFLAG_TAINT(TAINT_WARN));        \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     115 |         unlikely(__ret_warn_on);                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     116 | })
         | ~~
   drivers/nvme/host/pci.c:762:32: note: uninitialized use occurs here
     762 |         cmnd->dptr.prp2 = cpu_to_le64(prp2_dma);
         |                                       ^~~~~~~~
   include/linux/byteorder/generic.h:86:21: note: expanded from macro 'cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^
   include/uapi/linux/byteorder/little_endian.h:32:51: note: expanded from macro '__cpu_to_le64'
      32 | #define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
         |                                                   ^
   drivers/nvme/host/pci.c:681:4: note: remove the 'if' if its condition is always true
     681 |                         if (WARN_ON_ONCE(!status))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
     682 |                                 goto bad_sgl;
   drivers/nvme/host/pci.c:650:31: note: initialize the variable 'prp2_dma' to silence this warning
     650 |         dma_addr_t prp1_dma, prp2_dma;
         |                                      ^
         |                                       = 0
   2 warnings generated.


vim +681 drivers/nvme/host/pci.c

   545	
   546	static void nvme_free_prps(struct nvme_dev *dev, struct request *req)
   547	{
   548		struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
   549		enum dma_data_direction dir = rq_dma_dir(req);
   550		int length = iod->total_len;
   551		dma_addr_t dma_addr;
 > 552		int prp_len, nprps, i, desc;
   553		__le64 *prp_list;
   554		dma_addr_t dma_start;
   555		u32 dma_len;
   556	
   557		dma_addr = le64_to_cpu(iod->cmd.common.dptr.prp1);
   558		prp_len = NVME_CTRL_PAGE_SIZE - (dma_addr & (NVME_CTRL_PAGE_SIZE - 1));
   559		prp_len = min(length, prp_len);
   560		length -= prp_len;
   561		if (!length) {
   562			dma_unmap_page(dev->dev, dma_addr, prp_len, dir);
   563			return;
   564		}
   565	
   566		dma_start = dma_addr;
   567		dma_len = prp_len;
   568	
   569		dma_addr = le64_to_cpu(iod->cmd.common.dptr.prp2);
   570		if (length <= NVME_CTRL_PAGE_SIZE) {
   571			if (dma_addr != dma_start + dma_len) {
   572				dma_unmap_page(dev->dev, dma_start, dma_len, dir);
   573				dma_start = dma_addr;
   574				dma_len = 0;
   575			}
   576			dma_len += length;
   577			goto done;
   578		}
   579	
   580		nprps = DIV_ROUND_UP(length, NVME_CTRL_PAGE_SIZE);
   581		i = 0;
   582		desc = 0;
   583		prp_list = iod->descriptors[desc];
   584		do {
   585			if (i == NVME_CTRL_PAGE_SIZE >> 3) {
   586				prp_list = iod->descriptors[++desc];
   587				i = 0;
   588			}
   589	
   590			dma_addr = le64_to_cpu(prp_list[i++]);
   591			if (dma_addr != dma_start + dma_len) {
   592				dma_unmap_page(dev->dev, dma_start, dma_len, dir);
   593				dma_start = dma_addr;
   594				dma_len = 0;
   595			}
   596			prp_len = min(length, NVME_CTRL_PAGE_SIZE);
   597			dma_len += prp_len;
   598			length -= prp_len;
   599		} while (length);
   600	done:
   601		dma_unmap_page(dev->dev, dma_start, dma_len, dir);
   602	}
   603	
   604	static void nvme_free_sgls(struct nvme_dev *dev, struct request *req)
   605	{
   606		struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
   607		dma_addr_t sqe_dma_addr = le64_to_cpu(iod->cmd.common.dptr.sgl.addr);
   608		unsigned int sqe_dma_len = le32_to_cpu(iod->cmd.common.dptr.sgl.length);
   609		struct nvme_sgl_desc *sg_list = iod->descriptors[0];
   610		enum dma_data_direction dir = rq_dma_dir(req);
   611	
   612		if (iod->nr_descriptors) {
   613			unsigned int nr_entries = sqe_dma_len / sizeof(*sg_list), i;
   614	
   615			for (i = 0; i < nr_entries; i++)
   616				dma_unmap_page(dev->dev, le64_to_cpu(sg_list[i].addr),
   617					le32_to_cpu(sg_list[i].length), dir);
   618		} else {
   619			dma_unmap_page(dev->dev, sqe_dma_addr, sqe_dma_len, dir);
   620		}
   621	}
   622	
   623	static void nvme_unmap_data(struct nvme_dev *dev, struct request *req)
   624	{
   625		struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
   626	
   627		if (dma_can_use_iova(&iod->dma_state)) {
   628			/* SGL.ADDR is in the same place as PRP1 */
   629			dma_destroy_iova(&iod->dma_state,
   630					le64_to_cpu(iod->cmd.common.dptr.prp1),
   631					iod->total_len);
   632		} else if (dma_need_unmap(dev->dev)) {
   633			if (iod->cmd.common.flags & NVME_CMD_SGL_METABUF)
   634				nvme_free_sgls(dev, req);
   635			else
   636				nvme_free_prps(dev, req);
   637		}
   638	
   639		if (iod->nr_descriptors)
   640			nvme_free_descriptors(dev, req);
   641	}
   642	
   643	static blk_status_t nvme_pci_setup_prps(struct nvme_dev *dev,
   644			struct request *req, struct nvme_rw_command *cmnd)
   645	{
   646		struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
   647		unsigned int length = blk_rq_payload_bytes(req);
   648		struct req_iterator iter;
   649		struct blk_dma_vec map;
   650		dma_addr_t prp1_dma, prp2_dma;
   651		unsigned int prp_len, i;
   652		__le64 *prp_list;
   653		blk_status_t status;
   654	
   655		status = blk_rq_dma_map_iter_start(req, dev->dev, &iter,
   656				&iod->dma_state, &map);
   657		if (status)
   658			return status;
   659	
   660		/*
   661		 * PRP1 always points to to start the start of the DMA transfers.
   662		 *
   663		 * This is the only PRP (except for the list entries) that could be
   664		 * non-aligned.
   665		 */
   666		prp1_dma = map.addr;
   667		prp_len = min(length, NVME_CTRL_PAGE_SIZE -
   668				(map.addr & (NVME_CTRL_PAGE_SIZE - 1)));
   669		iod->total_len += prp_len;
   670		map.addr += prp_len;
   671		map.len -= prp_len;
   672		length -= prp_len;
   673		if (!length) {
   674			prp2_dma = 0;
   675			goto done;
   676		}
   677	
   678		if (!map.len) {
   679			if (!blk_rq_dma_map_iter_next(req, dev->dev, &iter,
   680					&iod->dma_state, &map, &status)) {
 > 681				if (WARN_ON_ONCE(!status))
   682					goto bad_sgl;
   683				goto done;
   684			}
   685		}
   686	
   687		/*
   688		 * PRP2 is usually a list, but can point to data if all data to be
   689		 * transferred fits into PRP1 + PRP2:
   690		 */
   691		if (length <= NVME_CTRL_PAGE_SIZE) {
   692			prp2_dma = map.addr;
   693			iod->total_len += length;
   694			goto done;
   695		}
   696	
   697		if (DIV_ROUND_UP(length, NVME_CTRL_PAGE_SIZE) >
   698		    NVME_SMALL_DESCRIPTOR_SIZE / sizeof(__le64))
   699			iod->large_descriptors = true;
   700	
   701		prp_list = dma_pool_alloc(nvme_dma_pool(dev, iod), GFP_ATOMIC,
   702				&prp2_dma);
   703		if (!prp_list) {
   704			status = BLK_STS_RESOURCE;
   705			goto done;
   706		}
   707		iod->descriptors[iod->nr_descriptors++] = prp_list;
   708	
   709		i = 0;
   710		for (;;) {
   711			prp_list[i++] = cpu_to_le64(map.addr);
   712			prp_len = min(length, NVME_CTRL_PAGE_SIZE);
   713			if (WARN_ON_ONCE(map.len < prp_len))
   714				goto bad_sgl;
   715	
   716			iod->total_len += prp_len;
   717			map.addr += prp_len;
   718			map.len -= prp_len;
   719			length -= prp_len;
   720			if (!length)
   721				break;
   722	
   723			if (map.len == 0) {
   724				if (!blk_rq_dma_map_iter_next(req, dev->dev, &iter,
   725						&iod->dma_state, &map, &status)) {
   726					if (WARN_ON_ONCE(!status))
   727						goto bad_sgl;
   728					goto done;
   729				}
   730			}
   731	
   732			/*
   733			 * If we've filled the entire descriptor, allocate a new that is
   734			 * pointed to be the last entry in the previous PRP list.  To
   735			 * accomodate for that move the last actual entry to the new
   736			 * descriptor.
   737			 */
   738			if (i == NVME_CTRL_PAGE_SIZE >> 3) {
   739				__le64 *old_prp_list = prp_list;
   740				dma_addr_t prp_list_dma;
   741	
   742				prp_list = dma_pool_alloc(dev->prp_page_pool,
   743						GFP_ATOMIC, &prp_list_dma);
   744				if (!prp_list) {
   745					status = BLK_STS_RESOURCE;
   746					goto done;
   747				}
   748				iod->descriptors[iod->nr_descriptors++] = prp_list;
   749	
   750				prp_list[0] = old_prp_list[i - 1];
   751				old_prp_list[i - 1] = cpu_to_le64(prp_list_dma);
   752				i = 1;
   753			}
   754		}
   755	
   756	done:
   757		/*
   758		 * nvme_unmap_data uses the DPT field in the SQE to tear down the
   759		 * mapping, so initialize it even for failures.
   760		 */
   761		cmnd->dptr.prp1 = cpu_to_le64(prp1_dma);
   762		cmnd->dptr.prp2 = cpu_to_le64(prp2_dma);
   763		if (unlikely(status))
   764			nvme_unmap_data(dev, req);
   765		return status;
   766	
   767	bad_sgl:
   768		dev_err_once(dev->dev,
   769			"Incorrectly formed request for payload:%d nents:%d\n",
   770			blk_rq_payload_bytes(req), blk_rq_nr_phys_segments(req));
   771		return BLK_STS_IOERR;
   772	}
   773	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
