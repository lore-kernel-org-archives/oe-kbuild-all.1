Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA97AD2D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Apr 2023 20:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681764966; x=1713300966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4e0AtDA0XxpeioSv+BC2PEUjKH2yyw0GqCY6tHFI1Ns=;
  b=MsVpi0L6Wsfg+on2IgOcjZCHE1wygNLX5kT5RJgKsJDK8HdBR4pZ273E
   Q0CFm/fOcaPlygZbcxUYZqocR8APonxnqMpCReXmPfhrgFMRiD09FrPD6
   oVdMfybDhS0UcvfNqODZx/NuH/XR1+IYBfv/2HbVQInmk922uUV0BlvTL
   PcCLBUF6luYwnCUnFP7K8HiJS5FWEdBCq0EXAKr1c0fCy+bB2SRVwK4ql
   rsJiMRBUYHOJgumrhjXP5V4a+ujJUhW9AQ37xz1XCRxEFJ1fC4blWLwPx
   /vLrJAB4GP/5fTjRuj4Hz9BSz06V/SvFreZgr9kMeyeBQJTNb7KiR0vQH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="407900816"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="407900816"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 13:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="760093298"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="760093298"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Apr 2023 13:56:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poVtL-000cfb-1U;
	Mon, 17 Apr 2023 20:56:03 +0000
Date: Tue, 18 Apr 2023 04:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4777/9838]
 drivers/gpu/imx/dpu-blit/dpu-blit.c:276:5: warning: no previous prototype
 for 'dpu_be_get_fence'
Message-ID: <202304180414.bCCci28Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 20f0a59855816836adf1a3e779da5e8a704c499d [4777/9838] Merge remote-tracking branch 'origin/display/prefetch' into display/next
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230418/202304180414.bCCci28Y-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/20f0a59855816836adf1a3e779da5e8a704c499d
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 20f0a59855816836adf1a3e779da5e8a704c499d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180414.bCCci28Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/imx/dpu-blit/dpu-blit.c:106:6: warning: no previous prototype for 'dpu_be_configure_prefetch' [-Wmissing-prototypes]
     106 | void dpu_be_configure_prefetch(struct dpu_bliteng *dpu_be,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu-blit/dpu-blit.c:163:5: warning: no previous prototype for 'dpu_bliteng_get_empty_instance' [-Wmissing-prototypes]
     163 | int dpu_bliteng_get_empty_instance(struct dpu_bliteng **dpu_be,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu-blit/dpu-blit.c:177:6: warning: no previous prototype for 'dpu_bliteng_get_cmd_list' [-Wmissing-prototypes]
     177 | u32 *dpu_bliteng_get_cmd_list(struct dpu_bliteng *dpu_be)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu-blit/dpu-blit.c:183:5: warning: no previous prototype for 'dpu_bliteng_get_id' [-Wmissing-prototypes]
     183 | s32 dpu_bliteng_get_id(struct dpu_bliteng *dpu_be)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu-blit/dpu-blit.c:189:6: warning: no previous prototype for 'dpu_bliteng_set_id' [-Wmissing-prototypes]
     189 | void dpu_bliteng_set_id(struct dpu_bliteng *dpu_be, int id)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu-blit/dpu-blit.c:195:6: warning: no previous prototype for 'dpu_bliteng_set_dev' [-Wmissing-prototypes]
     195 | void dpu_bliteng_set_dev(struct dpu_bliteng *dpu_be, struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu-blit/dpu-blit.c:201:5: warning: no previous prototype for 'dpu_be_get' [-Wmissing-prototypes]
     201 | int dpu_be_get(struct dpu_bliteng *dpu_be)
         |     ^~~~~~~~~~
   drivers/gpu/imx/dpu-blit/dpu-blit.c:209:6: warning: no previous prototype for 'dpu_be_put' [-Wmissing-prototypes]
     209 | void dpu_be_put(struct dpu_bliteng *dpu_be)
         |      ^~~~~~~~~~
>> drivers/gpu/imx/dpu-blit/dpu-blit.c:276:5: warning: no previous prototype for 'dpu_be_get_fence' [-Wmissing-prototypes]
     276 | int dpu_be_get_fence(struct dpu_bliteng *dpu_be)
         |     ^~~~~~~~~~~~~~~~
>> drivers/gpu/imx/dpu-blit/dpu-blit.c:358:5: warning: no previous prototype for 'dpu_be_set_fence' [-Wmissing-prototypes]
     358 | int dpu_be_set_fence(struct dpu_bliteng *dpu_be, int fd)
         |     ^~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu-blit/dpu-blit.c:380:5: warning: no previous prototype for 'dpu_be_blit' [-Wmissing-prototypes]
     380 | int dpu_be_blit(struct dpu_bliteng *dpu_be,
         |     ^~~~~~~~~~~
   drivers/gpu/imx/dpu-blit/dpu-blit.c:508:5: warning: no previous prototype for 'dpu_bliteng_init' [-Wmissing-prototypes]
     508 | int dpu_bliteng_init(struct dpu_bliteng *dpu_bliteng)
         |     ^~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu-blit/dpu-blit.c:587:6: warning: no previous prototype for 'dpu_bliteng_fini' [-Wmissing-prototypes]
     587 | void dpu_bliteng_fini(struct dpu_bliteng *dpu_bliteng)
         |      ^~~~~~~~~~~~~~~~
   In file included from drivers/gpu/imx/dpu-blit/dpu-blit.c:28:
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:388:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     388 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:380:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     380 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:379:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     379 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:378:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     378 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:376:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     376 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:375:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     375 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:374:27: warning: 'st_ids' defined but not used [-Wunused-const-variable=]
     374 | static const unsigned int st_ids[] = {9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:373:27: warning: 'sig_ids' defined but not used [-Wunused-const-variable=]
     373 | static const unsigned int sig_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:372:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     372 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:371:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     371 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:370:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     370 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:369:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     369 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:368:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     368 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:367:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     367 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:366:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     366 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:365:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     365 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:364:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     364 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu-blit/../dpu/dpu-prv.h:363:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     363 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~


vim +/dpu_be_get_fence +276 drivers/gpu/imx/dpu-blit/dpu-blit.c

c476e4c01611ac Xianzhong 2022-08-09  275  
c476e4c01611ac Xianzhong 2022-08-09 @276  int dpu_be_get_fence(struct dpu_bliteng *dpu_be)
c476e4c01611ac Xianzhong 2022-08-09  277  {
c476e4c01611ac Xianzhong 2022-08-09  278  	int fd = -1;
c476e4c01611ac Xianzhong 2022-08-09  279  	u64 seqno = 0;
c476e4c01611ac Xianzhong 2022-08-09  280  	struct dpu_be_fence *fence = NULL;
c476e4c01611ac Xianzhong 2022-08-09  281  	struct sync_file *sync = NULL;
c476e4c01611ac Xianzhong 2022-08-09  282  
c476e4c01611ac Xianzhong 2022-08-09  283  	/* Allocate a fence pointer */
c476e4c01611ac Xianzhong 2022-08-09  284  	fence = kzalloc(sizeof(struct dpu_be_fence), GFP_KERNEL);
c476e4c01611ac Xianzhong 2022-08-09  285  	if (!fence)
c476e4c01611ac Xianzhong 2022-08-09  286  		return -1;
c476e4c01611ac Xianzhong 2022-08-09  287  
c476e4c01611ac Xianzhong 2022-08-09  288  	/* Init fence pointer */
c476e4c01611ac Xianzhong 2022-08-09  289  	fence->signaled = false;
c476e4c01611ac Xianzhong 2022-08-09  290  	spin_lock_init(&fence->lock);
c476e4c01611ac Xianzhong 2022-08-09  291  	atomic_set(&fence->refcnt, 0);
c476e4c01611ac Xianzhong 2022-08-09  292  
c476e4c01611ac Xianzhong 2022-08-09  293  	/* Init dma fence base data */
c476e4c01611ac Xianzhong 2022-08-09  294  	seqno = atomic64_inc_return(&dpu_be->seqno);
c476e4c01611ac Xianzhong 2022-08-09  295  	dma_fence_init(&fence->base, &dpu_be_fence_ops, &fence->lock, dpu_be->context, seqno);
c476e4c01611ac Xianzhong 2022-08-09  296  
c476e4c01611ac Xianzhong 2022-08-09  297  	/* Create sync file pointer */
c476e4c01611ac Xianzhong 2022-08-09  298  	sync = sync_file_create(&fence->base);
c476e4c01611ac Xianzhong 2022-08-09  299  	if (!sync) {
c476e4c01611ac Xianzhong 2022-08-09  300  		dev_err(dpu_be->dev, "failed to create fence sync file.\n");
c476e4c01611ac Xianzhong 2022-08-09  301  		goto failed;
c476e4c01611ac Xianzhong 2022-08-09  302  	}
c476e4c01611ac Xianzhong 2022-08-09  303  
c476e4c01611ac Xianzhong 2022-08-09  304  	/* Get the unused file descriptor */
c476e4c01611ac Xianzhong 2022-08-09  305  	fd = get_unused_fd_flags(O_CLOEXEC);
c476e4c01611ac Xianzhong 2022-08-09  306  	if (fd < 0) {
c476e4c01611ac Xianzhong 2022-08-09  307  		dev_err(dpu_be->dev, "failed to get unused file descriptor.\n");
c476e4c01611ac Xianzhong 2022-08-09  308  		goto failed;
c476e4c01611ac Xianzhong 2022-08-09  309  	}
c476e4c01611ac Xianzhong 2022-08-09  310  
c476e4c01611ac Xianzhong 2022-08-09  311  	/* Setup fd to fence sync */
c476e4c01611ac Xianzhong 2022-08-09  312  	fd_install(fd, sync->file);
c476e4c01611ac Xianzhong 2022-08-09  313  
c476e4c01611ac Xianzhong 2022-08-09  314  	return fd;
c476e4c01611ac Xianzhong 2022-08-09  315  
c476e4c01611ac Xianzhong 2022-08-09  316  failed:
c476e4c01611ac Xianzhong 2022-08-09  317  	if (sync)
c476e4c01611ac Xianzhong 2022-08-09  318  		fput(sync->file);
c476e4c01611ac Xianzhong 2022-08-09  319  
c476e4c01611ac Xianzhong 2022-08-09  320  	kfree(fence);
c476e4c01611ac Xianzhong 2022-08-09  321  
c476e4c01611ac Xianzhong 2022-08-09  322  	return -1;
c476e4c01611ac Xianzhong 2022-08-09  323  }
c476e4c01611ac Xianzhong 2022-08-09  324  EXPORT_SYMBOL(dpu_be_get_fence);
c476e4c01611ac Xianzhong 2022-08-09  325  
c476e4c01611ac Xianzhong 2022-08-09  326  static int dpu_be_emit_fence(struct dpu_bliteng *dpu_be, struct dpu_be_fence *fence, bool stall)
c476e4c01611ac Xianzhong 2022-08-09  327  {
c476e4c01611ac Xianzhong 2022-08-09  328  	int i = 0;
c476e4c01611ac Xianzhong 2022-08-09  329  
c476e4c01611ac Xianzhong 2022-08-09  330  	/* Get the available fence index with spin-lock */
c476e4c01611ac Xianzhong 2022-08-09  331  	spin_lock(&dpu_be->lock);
c476e4c01611ac Xianzhong 2022-08-09  332  	i = dpu_be->next_fence_idx++;
c476e4c01611ac Xianzhong 2022-08-09  333  	dpu_be->next_fence_idx &= 0x3;
c476e4c01611ac Xianzhong 2022-08-09  334  	spin_unlock(&dpu_be->lock);
c476e4c01611ac Xianzhong 2022-08-09  335  
c476e4c01611ac Xianzhong 2022-08-09  336  	/*Acquire fence semaphore released by irq handler */
c476e4c01611ac Xianzhong 2022-08-09  337  	down(&dpu_be->sema[i]);
c476e4c01611ac Xianzhong 2022-08-09  338  
c476e4c01611ac Xianzhong 2022-08-09  339  	WARN_ON(dpu_be->fence[i]);
c476e4c01611ac Xianzhong 2022-08-09  340  	dpu_be->fence[i] = fence;
c476e4c01611ac Xianzhong 2022-08-09  341  
c476e4c01611ac Xianzhong 2022-08-09  342  	dpu_cs_wait_fifo_space(dpu_be);
c476e4c01611ac Xianzhong 2022-08-09  343  
c476e4c01611ac Xianzhong 2022-08-09  344  	/* Write comctrl interrupt PRESET to command sequencer */
c476e4c01611ac Xianzhong 2022-08-09  345  	dpu_be_write(dpu_be, 0x14000001, CMDSEQ_HIF);
c476e4c01611ac Xianzhong 2022-08-09  346  	dpu_be_write(dpu_be, COMCTRL_USERINTERRUPTPRESET1, CMDSEQ_HIF);
c476e4c01611ac Xianzhong 2022-08-09  347  	dpu_be_write(dpu_be, 1 << (i + (IRQ_COMCTRL_SW0 & 0x1F)), CMDSEQ_HIF);
c476e4c01611ac Xianzhong 2022-08-09  348  
c476e4c01611ac Xianzhong 2022-08-09  349  	/*Stall until semaphore released */
c476e4c01611ac Xianzhong 2022-08-09  350  	if (stall) {
c476e4c01611ac Xianzhong 2022-08-09  351  		down(&dpu_be->sema[i]);
c476e4c01611ac Xianzhong 2022-08-09  352  		up(&dpu_be->sema[i]);
c476e4c01611ac Xianzhong 2022-08-09  353  	}
c476e4c01611ac Xianzhong 2022-08-09  354  
c476e4c01611ac Xianzhong 2022-08-09  355  	return 0;
c476e4c01611ac Xianzhong 2022-08-09  356  }
c476e4c01611ac Xianzhong 2022-08-09  357  
c476e4c01611ac Xianzhong 2022-08-09 @358  int dpu_be_set_fence(struct dpu_bliteng *dpu_be, int fd)
c476e4c01611ac Xianzhong 2022-08-09  359  {
c476e4c01611ac Xianzhong 2022-08-09  360  	struct dpu_be_fence *fence = NULL;
c476e4c01611ac Xianzhong 2022-08-09  361  
c476e4c01611ac Xianzhong 2022-08-09  362  	/* Retrieve fence pointer from sync file descriptor */
c476e4c01611ac Xianzhong 2022-08-09  363  	fence = (struct dpu_be_fence *)sync_file_get_fence(fd);
c476e4c01611ac Xianzhong 2022-08-09  364  	if (!fence) {
c476e4c01611ac Xianzhong 2022-08-09  365  		dev_err(dpu_be->dev, "failed to get fence pointer.\n");
c476e4c01611ac Xianzhong 2022-08-09  366  		return -1;
c476e4c01611ac Xianzhong 2022-08-09  367  	}
c476e4c01611ac Xianzhong 2022-08-09  368  
c476e4c01611ac Xianzhong 2022-08-09  369  	/* Setup the fence and active it asynchronously */
c476e4c01611ac Xianzhong 2022-08-09  370  	dpu_be_emit_fence(dpu_be, fence, false);
c476e4c01611ac Xianzhong 2022-08-09  371  
c476e4c01611ac Xianzhong 2022-08-09  372  	/* Increase fence and base reference */
c476e4c01611ac Xianzhong 2022-08-09  373  	atomic_inc(&fence->refcnt);
c476e4c01611ac Xianzhong 2022-08-09  374  	dma_fence_get(&fence->base);
c476e4c01611ac Xianzhong 2022-08-09  375  
c476e4c01611ac Xianzhong 2022-08-09  376  	return 0;
c476e4c01611ac Xianzhong 2022-08-09  377  }
c476e4c01611ac Xianzhong 2022-08-09  378  EXPORT_SYMBOL(dpu_be_set_fence);
c476e4c01611ac Xianzhong 2022-08-09  379  

:::::: The code at line 276 was first introduced by commit
:::::: c476e4c01611acdd7b3b458fc2dd68cca3a57688 MGS-6488-2 gpu: imx: dpu-blit: Implement DPU fence with IRQ_COMCTRL_SW

:::::: TO: Xianzhong <xianzhong.li@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
