Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB4663A4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 07:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689751397; x=1721287397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H7Iz9HEBdmuiuIPnjnAJxDM3n7gYdeJELB7aH8htutQ=;
  b=FwSOOsuxHAvjOJakBFh89SrIA7cabZ8NCuzb/QAbvb4F+omHIDibyd9b
   FsbROEaIGo2ZfCqQWH9EeREuTHECK0gQEFVjR58BVR1/VBmN5MYaAXtsk
   4sCv11LuaiSRQPAyA7kY2sO8f+T9K/G1a9Xn4vN3oCt9XOloamGbpvrO2
   28JTuI55JdBeVAl9DvxmUPihvgk+2pGfDNE7B9cqz1hpkII99Kxoic7/G
   Qqqx9N1pkh7eMyFzsfq9Xp4X8psMLDE4io3NPTyrBJc8qCbrDWzLeU+wr
   o5e0J6AWE0Fyk9Hwt0lKxBkgOJTxTKmFT8o3Syk6aeytghTPjX0/ayagQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="363850463"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="363850463"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 00:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="723902116"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="723902116"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 19 Jul 2023 00:22:49 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM1WK-0004G1-0r;
	Wed, 19 Jul 2023 07:22:48 +0000
Date: Wed, 19 Jul 2023 15:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/637 123/12466]
 sound/soc/fsl/fsl_asrc_m2m.c:353:5: warning: no previous prototype for
 function 'fsl_asrc_process_buffer_pre'
Message-ID: <202307191550.paifbDuT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/637
head:   ec33c7fc43bef23fa0b69db996fee0ba601875e9
commit: 2103da1663c78848201107a827b058150d25df26 [123/12466] MLK-11398: ASoC: fsl_asrc: Add Memory to Memory support
config: x86_64-randconfig-r015-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191550.paifbDuT-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191550.paifbDuT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191550.paifbDuT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/fsl/fsl_asrc.c:973:
>> sound/soc/fsl/fsl_asrc_m2m.c:353:5: warning: no previous prototype for function 'fsl_asrc_process_buffer_pre' [-Wmissing-prototypes]
   int fsl_asrc_process_buffer_pre(struct completion *complete,
       ^
   sound/soc/fsl/fsl_asrc_m2m.c:353:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fsl_asrc_process_buffer_pre(struct completion *complete,
   ^
   static 
>> sound/soc/fsl/fsl_asrc_m2m.c:375:5: warning: no previous prototype for function 'fsl_asrc_process_buffer' [-Wmissing-prototypes]
   int fsl_asrc_process_buffer(struct fsl_asrc_pair *pair,
       ^
   sound/soc/fsl/fsl_asrc_m2m.c:375:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fsl_asrc_process_buffer(struct fsl_asrc_pair *pair,
   ^
   static 
>> sound/soc/fsl/fsl_asrc_m2m.c:673:15: warning: variable 'out_length' set but not used [-Wunused-but-set-variable]
           unsigned int out_length;
                        ^
>> sound/soc/fsl/fsl_asrc_m2m.c:1040:23: warning: variable 'm2m' set but not used [-Wunused-but-set-variable]
           struct fsl_asrc_m2m *m2m;
                                ^
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
