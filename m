Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795A21FCC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 07:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693468080; x=1725004080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aabJS5Z3/rsHdMGRwipDRUNcek7oSqVj/YVX6QbL3JM=;
  b=HL2dptL4uz5PHN6u94LwGkxfXBCn7Pp6MteQDyTiu/vJRNt/PUAEY1VG
   jF6MTGJwyWw8EgMQt57UjtIbJ+VbSKcCU7T+MM7ojbv0UeSjNUWny6eOu
   CVB6RtBEQ1NnP5TzW881VEfGKkSsmQY6tBtAL9PdyhZUOZUjTb1KsDtsl
   CN9omoZ6dT9tOTE54bjALojN7dHQ794NQYu/CQSRsULhkyEzItQSF86uS
   e/ZWmyn2iqIm7R5Sp1jtnwY9jcq/oW+sOCOmFHph8MTVdFtHfwYhuxng5
   BmLaPHa6heFJ85eXoEeHlyO9DizIsu7j+naa7UaX43uhStmSDd9M52n5p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360837434"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="360837434"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 00:47:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="829552929"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="829552929"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Aug 2023 00:47:57 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbcPD-000B51-35;
	Thu, 31 Aug 2023 07:47:55 +0000
Date: Thu, 31 Aug 2023 15:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 125/24603]
 sound/soc/fsl/fsl_asrc_m2m.c:350:5: warning: no previous prototype for
 'fsl_asrc_process_buffer_pre'
Message-ID: <202308311544.iKpPOmBL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shengjiu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 94e5356aea65959c2f670b94b36472658a40000f [125/24603] MLK-11398: ASoC: fsl_asrc: Add Memory to Memory support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308311544.iKpPOmBL-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311544.iKpPOmBL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311544.iKpPOmBL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/fsl/fsl_asrc.c:11:
   sound/soc/fsl/fsl_asrc_m2m.c: In function 'fsl_asrc_dmaconfig':
   sound/soc/fsl/fsl_asrc_m2m.c:244:69: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     244 |         ret = dma_map_sg(&asrc->pdev->dev, sg, sg_nent, slave_config.direction);
         |                                                         ~~~~~~~~~~~~^~~~~~~~~~
   include/linux/dma-mapping.h:408:58: note: in definition of macro 'dma_map_sg'
     408 | #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
         |                                                          ^
   In file included from sound/soc/fsl/fsl_asrc.c:918:
   sound/soc/fsl/fsl_asrc_m2m.c: At top level:
>> sound/soc/fsl/fsl_asrc_m2m.c:350:5: warning: no previous prototype for 'fsl_asrc_process_buffer_pre' [-Wmissing-prototypes]
     350 | int fsl_asrc_process_buffer_pre(struct completion *complete,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/fsl/fsl_asrc_m2m.c:372:5: warning: no previous prototype for 'fsl_asrc_process_buffer' [-Wmissing-prototypes]
     372 | int fsl_asrc_process_buffer(struct fsl_asrc_pair *pair,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c: In function 'fsl_asrc_process_buffer':
   sound/soc/fsl/fsl_asrc_m2m.c:367:30: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     367 |                              DMA_MEM_TO_DEV); \
         |                              ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_asrc_m2m.c:384:17: note: in expansion of macro 'mxc_asrc_dma_umap'
     384 |                 mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
         |                 ^~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:369:30: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     369 |                              DMA_DEV_TO_MEM); \
         |                              ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_asrc_m2m.c:384:17: note: in expansion of macro 'mxc_asrc_dma_umap'
     384 |                 mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
         |                 ^~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:367:30: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     367 |                              DMA_MEM_TO_DEV); \
         |                              ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_asrc_m2m.c:391:17: note: in expansion of macro 'mxc_asrc_dma_umap'
     391 |                 mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
         |                 ^~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:369:30: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     369 |                              DMA_DEV_TO_MEM); \
         |                              ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_asrc_m2m.c:391:17: note: in expansion of macro 'mxc_asrc_dma_umap'
     391 |                 mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
         |                 ^~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:367:30: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     367 |                              DMA_MEM_TO_DEV); \
         |                              ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_asrc_m2m.c:395:9: note: in expansion of macro 'mxc_asrc_dma_umap'
     395 |         mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
         |         ^~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c:369:30: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     369 |                              DMA_DEV_TO_MEM); \
         |                              ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:409:62: note: in definition of macro 'dma_unmap_sg'
     409 | #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
         |                                                              ^
   sound/soc/fsl/fsl_asrc_m2m.c:395:9: note: in expansion of macro 'mxc_asrc_dma_umap'
     395 |         mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
         |         ^~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c: In function 'fsl_asrc_calc_last_period_size':
>> sound/soc/fsl/fsl_asrc_m2m.c:670:22: warning: variable 'out_length' set but not used [-Wunused-but-set-variable]
     670 |         unsigned int out_length;
         |                      ^~~~~~~~~~
   sound/soc/fsl/fsl_asrc_m2m.c: In function 'fsl_asrc_m2m_resume':
>> sound/soc/fsl/fsl_asrc_m2m.c:1037:30: warning: variable 'm2m' set but not used [-Wunused-but-set-variable]
    1037 |         struct fsl_asrc_m2m *m2m;
         |                              ^~~


vim +/fsl_asrc_process_buffer_pre +350 sound/soc/fsl/fsl_asrc_m2m.c

   162	
   163	static int fsl_asrc_dmaconfig(struct fsl_asrc_pair *pair, struct dma_chan *chan,
   164				      u32 dma_addr, void *buf_addr, u32 buf_len,
   165				      bool dir, snd_pcm_format_t word_format)
   166	{
   167		struct dma_async_tx_descriptor *desc = pair->desc[dir];
   168		struct fsl_asrc *asrc = pair->asrc;
   169		struct fsl_asrc_priv *asrc_priv = asrc->private;
   170		struct fsl_asrc_m2m *m2m = pair->private_m2m;
   171		unsigned int sg_nent = m2m->sg_nodes[dir];
   172		enum asrc_pair_index index = pair->index;
   173		struct scatterlist *sg = m2m->sg[dir];
   174		struct dma_slave_config slave_config;
   175		enum dma_slave_buswidth buswidth;
   176		int ret, i;
   177	
   178		switch (snd_pcm_format_physical_width(word_format)) {
   179		case 8:
   180			buswidth = DMA_SLAVE_BUSWIDTH_1_BYTE;
   181			break;
   182		case 16:
   183			buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
   184			break;
   185		case 24:
   186			buswidth = DMA_SLAVE_BUSWIDTH_3_BYTES;
   187			break;
   188		case 32:
   189			buswidth = DMA_SLAVE_BUSWIDTH_4_BYTES;
   190			break;
   191		default:
   192			pair_err("invalid word width\n");
   193			return -EINVAL;
   194		}
   195	
   196		memset(&slave_config, 0, sizeof(slave_config));
   197		if (dir == IN) {
   198			slave_config.direction = DMA_MEM_TO_DEV;
   199			slave_config.dst_addr = dma_addr;
   200			slave_config.dst_addr_width = buswidth;
   201			if (!asrc_priv->soc->use_edma)
   202				slave_config.dst_maxburst =
   203					m2m->watermark[IN] * pair->channels;
   204			else
   205				slave_config.dst_maxburst = 1;
   206		} else {
   207			slave_config.direction = DMA_DEV_TO_MEM;
   208			slave_config.src_addr = dma_addr;
   209			slave_config.src_addr_width = buswidth;
   210			if (!asrc_priv->soc->use_edma)
   211				slave_config.src_maxburst =
   212					m2m->watermark[OUT] * pair->channels;
   213			else
   214				slave_config.src_maxburst = 1;
   215		}
   216	
   217		ret = dmaengine_slave_config(chan, &slave_config);
   218		if (ret) {
   219			pair_err("failed to config dmaengine for %sput task: %d\n",
   220					DIR_STR(dir), ret);
   221			return -EINVAL;
   222		}
   223	
   224		sg_init_table(sg, sg_nent);
   225		switch (sg_nent) {
   226		case 1:
   227			sg_init_one(sg, buf_addr, buf_len);
   228			break;
   229		case 2:
   230		case 3:
   231		case 4:
   232			for (i = 0; i < (sg_nent - 1); i++)
   233				sg_set_buf(&sg[i], buf_addr + i * ASRC_MAX_BUFFER_SIZE,
   234						ASRC_MAX_BUFFER_SIZE);
   235	
   236			sg_set_buf(&sg[i], buf_addr + i * ASRC_MAX_BUFFER_SIZE,
   237					buf_len - ASRC_MAX_BUFFER_SIZE * i);
   238			break;
   239		default:
   240			pair_err("invalid input DMA nodes number: %d\n", sg_nent);
   241			return -EINVAL;
   242		}
   243	
 > 244		ret = dma_map_sg(&asrc->pdev->dev, sg, sg_nent, slave_config.direction);
   245		if (ret != sg_nent) {
   246			pair_err("failed to map DMA sg for %sput task\n", DIR_STR(dir));
   247			return -EINVAL;
   248		}
   249	
   250		desc = dmaengine_prep_slave_sg(chan, sg, sg_nent,
   251				slave_config.direction, DMA_PREP_INTERRUPT);
   252		if (!desc) {
   253			pair_err("failed to prepare dmaengine for %sput task\n",
   254					DIR_STR(dir));
   255			return -EINVAL;
   256		}
   257	
   258		pair->desc[dir] = desc;
   259		pair->desc[dir]->callback = ASRC_xPUT_DMA_CALLBACK(dir);
   260	
   261		desc->callback = ASRC_xPUT_DMA_CALLBACK(dir);
   262		desc->callback_param = pair;
   263	
   264		return 0;
   265	}
   266	
   267	static int fsl_asrc_prepare_io_buffer(struct fsl_asrc_pair *pair,
   268					      struct asrc_convert_buffer *pbuf, bool dir)
   269	{
   270		struct fsl_asrc_m2m *m2m = pair->private_m2m;
   271		struct fsl_asrc *asrc = pair->asrc;
   272		struct fsl_asrc_priv *asrc_priv = asrc->private;
   273		unsigned int *dma_len = &m2m->dma_block[dir].length;
   274		void *dma_vaddr = m2m->dma_block[dir].dma_vaddr;
   275		struct dma_chan *dma_chan = pair->dma_chan[dir];
   276		unsigned int buf_len, wm = m2m->watermark[dir];
   277		unsigned int *sg_nodes = &m2m->sg_nodes[dir];
   278		unsigned int last_period_size = m2m->last_period_size;
   279		enum asrc_pair_index index = pair->index;
   280		u32 word_size, fifo_addr;
   281		void __user *buf_vaddr;
   282	
   283		/* Clean the DMA buffer */
   284		memset(dma_vaddr, 0, ASRC_DMA_BUFFER_SIZE);
   285	
   286		if (dir == IN) {
   287			buf_vaddr = (void __user *)pbuf->input_buffer_vaddr;
   288			buf_len = pbuf->input_buffer_length;
   289		} else {
   290			buf_vaddr = (void __user *)pbuf->output_buffer_vaddr;
   291			buf_len = pbuf->output_buffer_length;
   292		}
   293	
   294		word_size = snd_pcm_format_physical_width(m2m->word_format[dir]) / 8;
   295	
   296		if (buf_len < word_size * pair->channels * wm ||
   297		    buf_len > ASRC_DMA_BUFFER_SIZE ||
   298		    (dir == OUT && buf_len < word_size * pair->channels * last_period_size)) {
   299			pair_err("%sput buffer size is error: [%d]\n",
   300					DIR_STR(dir), buf_len);
   301			return -EINVAL;
   302		}
   303	
   304		/* Copy origin data into input buffer */
   305		if (dir == IN && copy_from_user(dma_vaddr, buf_vaddr, buf_len))
   306			return -EFAULT;
   307	
   308		*dma_len = buf_len;
   309		if (dir == OUT) {
   310			*dma_len -= last_period_size * word_size * pair->channels;
   311			*dma_len = *dma_len / (word_size * pair->channels) *
   312					(word_size * pair->channels);
   313			if (asrc_priv->soc->use_edma)
   314				*dma_len = *dma_len / (word_size * pair->channels * m2m->watermark[OUT])
   315						* (word_size * pair->channels * m2m->watermark[OUT]);
   316		}
   317	
   318		*sg_nodes = *dma_len / ASRC_MAX_BUFFER_SIZE;
   319		if (*dma_len % ASRC_MAX_BUFFER_SIZE)
   320			*sg_nodes += 1;
   321	
   322		fifo_addr = asrc->paddr + REG_ASRDx(dir, index);
   323	
   324		return fsl_asrc_dmaconfig(pair, dma_chan, fifo_addr, dma_vaddr,
   325					  *dma_len, dir, m2m->word_format[dir]);
   326	}
   327	
   328	static int fsl_asrc_prepare_buffer(struct fsl_asrc_pair *pair,
   329					   struct asrc_convert_buffer *pbuf)
   330	{
   331		struct fsl_asrc *asrc = pair->asrc;
   332		enum asrc_pair_index index = pair->index;
   333		int ret;
   334	
   335		ret = fsl_asrc_prepare_io_buffer(pair, pbuf, IN);
   336		if (ret) {
   337			pair_err("failed to prepare input buffer: %d\n", ret);
   338			return ret;
   339		}
   340	
   341		ret = fsl_asrc_prepare_io_buffer(pair, pbuf, OUT);
   342		if (ret) {
   343			pair_err("failed to prepare output buffer: %d\n", ret);
   344			return ret;
   345		}
   346	
   347		return 0;
   348	}
   349	
 > 350	int fsl_asrc_process_buffer_pre(struct completion *complete,
   351					enum asrc_pair_index index, bool dir)
   352	{
   353		if (!wait_for_completion_interruptible_timeout(complete, 10 * HZ)) {
   354			pr_err("%sput DMA task timeout\n", DIR_STR(dir));
   355			return -ETIME;
   356		} else if (signal_pending(current)) {
   357			pr_err("%sput task forcibly aborted\n", DIR_STR(dir));
   358			return -ERESTARTSYS;
   359		}
   360	
   361		return 0;
   362	}
   363	
   364	#define mxc_asrc_dma_umap(dev, m2m) \
   365		do { \
   366			dma_unmap_sg(dev, m2m->sg[IN], m2m->sg_nodes[IN], \
   367				     DMA_MEM_TO_DEV); \
   368			dma_unmap_sg(dev, m2m->sg[OUT], m2m->sg_nodes[OUT], \
   369				     DMA_DEV_TO_MEM); \
   370		} while (0)
   371	
 > 372	int fsl_asrc_process_buffer(struct fsl_asrc_pair *pair,
   373				    struct asrc_convert_buffer *pbuf)
   374	{
   375		struct fsl_asrc *asrc = pair->asrc;
   376		struct fsl_asrc_m2m *m2m = pair->private_m2m;
   377		enum asrc_pair_index index = pair->index;
   378		unsigned long lock_flags;
   379		int ret;
   380	
   381		/* Check input task first */
   382		ret = fsl_asrc_process_buffer_pre(&m2m->complete[IN], index, IN);
   383		if (ret) {
   384			mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
   385			return ret;
   386		}
   387	
   388		/* ...then output task*/
   389		ret = fsl_asrc_process_buffer_pre(&m2m->complete[OUT], index, OUT);
   390		if (ret) {
   391			mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
   392			return ret;
   393		}
   394	
 > 395		mxc_asrc_dma_umap(&asrc->pdev->dev, m2m);
   396	
   397		/* Fetch the remaining data */
   398		spin_lock_irqsave(&m2m->lock, lock_flags);
   399		if (!m2m->pair_hold) {
   400			spin_unlock_irqrestore(&m2m->lock, lock_flags);
   401			return -EFAULT;
   402		}
   403		spin_unlock_irqrestore(&m2m->lock, lock_flags);
   404	
   405		fsl_asrc_read_last_FIFO(pair);
   406	
   407		/* Update final lengths after getting last FIFO */
   408		pbuf->input_buffer_length = m2m->dma_block[IN].length;
   409		pbuf->output_buffer_length = m2m->dma_block[OUT].length;
   410	
   411		if (copy_to_user((void __user *)pbuf->output_buffer_vaddr,
   412				 m2m->dma_block[OUT].dma_vaddr,
   413				 m2m->dma_block[OUT].length))
   414			return -EFAULT;
   415	
   416		return 0;
   417	}
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
