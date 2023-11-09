Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8941E522
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPoHwBRQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699537809; x=1731073809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nuJjY0/syYw/NVfs1KJPfb3Oo1id3vhwKRrDSGCOSmE=;
  b=hPoHwBRQDlthaxXkA/2RFeZPcNNklxbOSMPvAldOd9wWH4XC3b2ZSF5r
   fgmrKuoUNMmsp3f29TdpWdYl3ta3hPTpqmw0+Nrx+yYzsBPRjQ+8kVAHr
   42Pg476J2t0IJDff0Jmv6/t+TYodbABWReJix4+E27Ie347s/aGTluBWF
   jVMCdsoQS7crzgFRSYgQsU2/w+lRxk0A/BmvNVGdHt6ctMFDLAXMMbIb9
   Khuch6pU6YuDV3SV6G+ZpzpTtWRNAzFJimrq0tIgoPIx1gD2HCwIZjihd
   ItxYHQkz3fXS0r+DD1z+xDS8XLsRjWDnHLYrqO6xPs5Ux5Bml4qZSN2lp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="389787456"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="389787456"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 05:50:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="739849590"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="739849590"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Nov 2023 05:50:07 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r15Q5-0008lU-0R;
	Thu, 09 Nov 2023 13:50:05 +0000
Date: Thu, 9 Nov 2023 21:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 123/15770]
 sound/soc/fsl/fsl_asrc_m2m.c:353:5: sparse: sparse: symbol
 'fsl_asrc_process_buffer_pre' was not declared. Should it be static?
Message-ID: <202311092106.GU2et9g1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   742924a05c8a6349d6d1fe67010a3c5ed54df884
commit: 2103da1663c78848201107a827b058150d25df26 [123/15770] MLK-11398: ASoC: fsl_asrc: Add Memory to Memory support
config: i386-randconfig-063-20231024 (https://download.01.org/0day-ci/archive/20231109/202311092106.GU2et9g1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092106.GU2et9g1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092106.GU2et9g1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/fsl/fsl_asrc.c: note: in included file:
>> sound/soc/fsl/fsl_asrc_m2m.c:353:5: sparse: sparse: symbol 'fsl_asrc_process_buffer_pre' was not declared. Should it be static?
>> sound/soc/fsl/fsl_asrc_m2m.c:375:5: sparse: sparse: symbol 'fsl_asrc_process_buffer' was not declared. Should it be static?

vim +/fsl_asrc_process_buffer_pre +353 sound/soc/fsl/fsl_asrc_m2m.c

   352	
 > 353	int fsl_asrc_process_buffer_pre(struct completion *complete,
   354					enum asrc_pair_index index, bool dir)
   355	{
   356		if (!wait_for_completion_interruptible_timeout(complete, 10 * HZ)) {
   357			pr_err("%sput DMA task timeout\n", DIR_STR(dir));
   358			return -ETIME;
   359		} else if (signal_pending(current)) {
   360			pr_err("%sput task forcibly aborted\n", DIR_STR(dir));
   361			return -ERESTARTSYS;
   362		}
   363	
   364		return 0;
   365	}
   366	
   367	#define mxc_asrc_dma_umap(dev, m2m) \
   368		do { \
   369			dma_unmap_sg(dev, m2m->sg[IN], m2m->sg_nodes[IN], \
   370				     DMA_TO_DEVICE); \
   371			dma_unmap_sg(dev, m2m->sg[OUT], m2m->sg_nodes[OUT], \
   372				     DMA_FROM_DEVICE); \
   373		} while (0)
   374	
 > 375	int fsl_asrc_process_buffer(struct fsl_asrc_pair *pair,
   376				    struct asrc_convert_buffer *pbuf)
   377	{
   378		struct fsl_asrc *asrc = pair->asrc;
   379		struct fsl_asrc_m2m *m2m = pair->private_m2m;
   380		enum asrc_pair_index index = pair->index;
   381		unsigned long lock_flags;
   382		int ret;
   383	
   384		/* Check input task first */
   385		ret = fsl_asrc_process_buffer_pre(&m2m->complete[IN], index, IN);
   386		if (ret) {
   387			mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
   388			return ret;
   389		}
   390	
   391		/* ...then output task*/
   392		ret = fsl_asrc_process_buffer_pre(&m2m->complete[OUT], index, OUT);
   393		if (ret) {
   394			mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
   395			return ret;
   396		}
   397	
   398		mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
   399	
   400		/* Fetch the remaining data */
   401		spin_lock_irqsave(&m2m->lock, lock_flags);
   402		if (!m2m->pair_hold) {
   403			spin_unlock_irqrestore(&m2m->lock, lock_flags);
   404			return -EFAULT;
   405		}
   406		spin_unlock_irqrestore(&m2m->lock, lock_flags);
   407	
   408		fsl_asrc_read_last_FIFO(pair);
   409	
   410		/* Update final lengths after getting last FIFO */
   411		pbuf->input_buffer_length = m2m->dma_block[IN].length;
   412		pbuf->output_buffer_length = m2m->dma_block[OUT].length;
   413	
   414		if (copy_to_user((void __user *)pbuf->output_buffer_vaddr,
   415				 m2m->dma_block[OUT].dma_vaddr,
   416				 m2m->dma_block[OUT].length))
   417			return -EFAULT;
   418	
   419		return 0;
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
