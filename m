Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8291014F9E9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727527038; cv=none; b=GQ96flqhX+QAjOke8QJ/VNCDAoTTzzVS0CZvs5JqxQOb5IwRte9Wp/NM2JW1wJ55rsAKVIxtSJpJXZaQqEzrqKjrrIfLYTdhRUFfUFxtSscYgVXzST5rw11yaSo3U59Xg4b4Vyh5be0baL3/cq3J7Ergo0nlU3aan4WSJemV8s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727527038; c=relaxed/simple;
	bh=QK7YHQgL93wP9R2P7W8NL3IXOK/79i28GuNiBjAKgqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pHB8f4xO2/7uatbYXjiqFN8ppnkcU+DGY6esmf65yK9+Z6OCUutFSNLDfeX3A0Hlx+qZraPDhiZXWbArohYdtTeaBR4pyFtwTy4IiNoJ5hf6AmnTSrTq2zL2Wl3Of9bnjbpDqExLnVQ3uWh8ljC87XNfb9PSk/Yj2r92MghZRA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byuvBk6L; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byuvBk6L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727527036; x=1759063036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QK7YHQgL93wP9R2P7W8NL3IXOK/79i28GuNiBjAKgqQ=;
  b=byuvBk6LWYy745IG5kyXYSFE1HVlx4DHVi++DamjdRnFTFFIrAmhs1hO
   5V/8cnpf2WK7wF48JZDNNwkR9qb1v4mw5nv8eoFft2hfEsDiA8eSL4EeE
   jx+5bwr7QcN93rBBg5YMkQ4yf7QMubpl1Z97W130mGln4khgF6ziZwkCv
   CD5oEhO2sdqCd1x/rSpAyMQxMh4BGlw6ByAL1JF9ZDpBY4Y6oeRIwwBWT
   JYhauVnX+kEVnXdAx+RAYiPhB1OZePMl5h6LFzTXZramG2SUiQgMn5TKv
   ypJxKXfMfVYYyoYa271XSxaOxGyfhZsjUt7VmaUUGLAZyTPtrOy4CRppp
   w==;
X-CSE-ConnectionGUID: gD6Y/7uXS2C3eGrpPwWJug==
X-CSE-MsgGUID: ZZO8xm6FSoqovc5dHJKE0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26174638"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26174638"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 05:37:16 -0700
X-CSE-ConnectionGUID: hKE4dgh5Ttu116LpVbh94g==
X-CSE-MsgGUID: Z216pUkUSHCJZ+TTTmq4cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72678789"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2024 05:37:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suWhE-000NGF-2B;
	Sat, 28 Sep 2024 12:37:12 +0000
Date: Sat, 28 Sep 2024 20:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 156/16788]
 sound/soc/fsl/fsl_asrc_m2m.c:353:5: warning: no previous prototype for
 function 'fsl_asrc_process_buffer_pre'
Message-ID: <202409282041.O4ezFVPB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: b88e99c737817b3a29441a12515a0b568094044f [156/16788] MLK-11398: ASoC: fsl_asrc: Add Memory to Memory support
config: i386-buildonly-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240928/202409282041.O4ezFVPB-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282041.O4ezFVPB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282041.O4ezFVPB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/fsl/fsl_asrc.c:973:
>> sound/soc/fsl/fsl_asrc_m2m.c:353:5: warning: no previous prototype for function 'fsl_asrc_process_buffer_pre' [-Wmissing-prototypes]
     353 | int fsl_asrc_process_buffer_pre(struct completion *complete,
         |     ^
   sound/soc/fsl/fsl_asrc_m2m.c:353:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     353 | int fsl_asrc_process_buffer_pre(struct completion *complete,
         | ^
         | static 
>> sound/soc/fsl/fsl_asrc_m2m.c:375:5: warning: no previous prototype for function 'fsl_asrc_process_buffer' [-Wmissing-prototypes]
     375 | int fsl_asrc_process_buffer(struct fsl_asrc_pair *pair,
         |     ^
   sound/soc/fsl/fsl_asrc_m2m.c:375:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     375 | int fsl_asrc_process_buffer(struct fsl_asrc_pair *pair,
         | ^
         | static 
>> sound/soc/fsl/fsl_asrc_m2m.c:673:15: warning: variable 'out_length' set but not used [-Wunused-but-set-variable]
     673 |         unsigned int out_length;
         |                      ^
>> sound/soc/fsl/fsl_asrc_m2m.c:1040:23: warning: variable 'm2m' set but not used [-Wunused-but-set-variable]
    1040 |         struct fsl_asrc_m2m *m2m;
         |                              ^
   4 warnings generated.


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
