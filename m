Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794649005;
	b=wsN2mkOqf9fSv6elRGUBAu5lgNz0gUYZGElamMda5SnVoKBrMWFK+oB0dJlmskmUcvi7
	 5hcOAk2DEnthT3DRsQt+bp6nSczRGMPsfiWo6dglmtb1QF99Hzo5cGSPfEi+exIJLyse1
	 22mFgc+7qeql+rQjnmuJ6/5TAKN3avbUBq8eQb8lfgPzzcQwuyFWD9z5GSNsmXVSP0IY7
	 2KRcea8CwaX2Rp3TbbcqP7LuVZ0FAV8p2uPpXDwrm/n3YWPU/DpOZ7+eT/0GDrTzMi14l
	 7BWVD2x34INULRWSlJc+BP4TmXZgrgPaXnVQcsyXwryKuFHqGOf5sVpX5vfDWyYORZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794649005;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZOsbJfJvrnMjUFu7nv0m4nTOGh3iE/W4vsa2ANt1bzk=;
	b=HPW+lEcwrs6BxhGsV4tUFP+cOOsidrJB6DzXvgboT9G5Rk0Pgzy/dsnZu7P5yLOvmaLs
	 g/u4VACPa8O3ulYAbrJg/UW1VehvVJN2ikeN6cqbBDmLG9+mLmeuhI45CsaAW5WVj/l8d
	 vv8MOa1jCDLzbkTAFrUTCF6kcFHqT2sWkPYAmLqr+s5dw7abNdoin86lncglombMhpNRq
	 vRYa2R64qeBSu/yBa72sFUdHi344PCqW866JjopHlN0jo/0Al5FfOw1bKWfEhHHzNSFdF
	 t34BoPijVbayHD89ce9DUbdx2a/XSc8HpUrkXnEBCtCD8fa+m0hVY22VjU3oxqM0P+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OySh6KlC;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C148606A338
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 09:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C148606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OySh6KlC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794649003; x=1826185003;
  h=date:from:to:cc:subject:message-id;
  bh=3OXKdnI8Nq2vtD2pnH2b9Vk+FqWvFJIr75iGw0HbVYk=;
  b=OySh6KlC1CD1gb+f2lMIGgbfMMk+XhDJe9z72tb1xUur4iH01UxVAjjH
   CuoszrWtV5mRG7n1P8fjFJg86VioEa/jU9HoV06I7Iy/W7EdV3g8f+tx0
   +qxb1avZhc19IEM9SfjC83L0lw5Kz2wj89EsYZAseri6GclEbrF18J/ZX
   ARyquJueUWz4OfPGQKcsKT0YLGDpG51mu+hkOCeK8SMlgPP1mTG4edwgL
   kAZ+YGrL5dj+ffH3OhetpakIZQqpZIkqGZtQ/oDD9xkdLyGFEBiH1vDSd
   cP6ATuQWOe0TMXVHgHPt2zySDobw/71wvfMk/QMzLkaJsiMGbsELtIbfu
   w==;
X-CSE-ConnectionGUID: JCXikdfbQE2EJ4Q1CUwPhg==
X-CSE-MsgGUID: JwVjWP2rR0CEqfqWtN5HZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3460167"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3460167"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 01:36:42 -0800
X-CSE-ConnectionGUID: 9IOuuKtQSduVGgEkPH9NUg==
X-CSE-MsgGUID: j9IDxrDNSIuBS297Iz03zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9374341"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 14 Nov 2026 01:36:40 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSABZ-000000001XL-3Q0k;
	Sat, 14 Nov 2026 09:36:37 +0000
Date: Sat, 14 Nov 2026 10:35:39 +0100
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dom Cobley <popcornmix@gmail.com>, Phil Elwell <phil@raspberrypi.com>,
 Alexander Winkowski <dereference23@outlook.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Juerg Haefliger <juerg.haefliger@canonical.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [broadcom-stblinux:drivers/next 8/22]
 drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:473
 vc_sm_cma_import_dmabuf_internal() warn: unsigned 'import.kernel_id' is never
 less than zero.
Message-ID: <202611141042.Rxt6cuNo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/Broadcom/stblinux drivers/next
head:   0cab822bca7a59667774725b83e948b71462290f
commit: 0d6409fd70afa8e0e43dfd8b15a419d84a2a802d [8/22] platform/raspberrypi: Add VideoCore shared memory support
config: powerpc-randconfig-2200-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141042.Rxt6cuNo-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611141042.Rxt6cuNo-lkp@intel.com/

smatch warnings:
drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:473 vc_sm_cma_import_dmabuf_internal() warn: unsigned 'import.kernel_id' is never less than zero.

vim +473 drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c

   404	
   405	/* Import a dma_buf to be shared with VC. */
   406	static int
   407	vc_sm_cma_import_dmabuf_internal(struct dma_buf *dma_buf,
   408					 int fd,
   409					 struct dma_buf **imported_buf)
   410	{
   411		DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
   412		struct dma_buf_attachment *attach = NULL;
   413		struct vc_sm_import_result result = { };
   414		struct vc_sm_buffer *buffer = NULL;
   415		struct vc_sm_import import = { };
   416		struct sg_table *sgt = NULL;
   417		dma_addr_t dma_addr;
   418		u32 cache_alias;
   419		int ret = 0;
   420		int status;
   421	
   422		/* Setup our allocation parameters */
   423		if (fd < 0)
   424			get_dma_buf(dma_buf);
   425		else
   426			dma_buf = dma_buf_get(fd);
   427	
   428		if (!dma_buf)
   429			return -EINVAL;
   430	
   431		attach = dma_buf_attach(dma_buf, &sm_state->device->dev);
   432		if (IS_ERR(attach)) {
   433			ret = PTR_ERR(attach);
   434			goto error;
   435		}
   436	
   437		sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
   438		if (IS_ERR(sgt)) {
   439			ret = PTR_ERR(sgt);
   440			goto error;
   441		}
   442	
   443		/* Verify that the address block is contiguous */
   444		if (sgt->nents != 1) {
   445			ret = -ENOMEM;
   446			goto error;
   447		}
   448	
   449		/* Allocate local buffer to track this allocation. */
   450		buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
   451		if (!buffer) {
   452			ret = -ENOMEM;
   453			goto error;
   454		}
   455	
   456		import.type = VC_SM_ALLOC_NON_CACHED;
   457		dma_addr = sg_dma_address(sgt->sgl);
   458		import.addr = (u32)dma_addr;
   459		cache_alias = import.addr & VC_SM_VC4_ALIAS_MASK;
   460		if (cache_alias != VC_SM_VC4_UNCACHED_ALIAS &&
   461		    cache_alias != VC_SM_VC4_COHERENT_ALIAS) {
   462			dev_err(&sm_state->device->dev, "%s: Expecting an uncached alias for dma_addr %pad\n",
   463				__func__, &dma_addr);
   464			/*
   465			 * Note that this assumes we're on >= Pi2, but it implies a
   466			 * DT configuration error.
   467			 */
   468			import.addr |= VC_SM_VC4_UNCACHED_ALIAS;
   469		}
   470		import.size = sg_dma_len(sgt->sgl);
   471		import.allocator = current->tgid;
   472		import.kernel_id = get_kernel_id(buffer);
 > 473		if (import.kernel_id < 0) {
   474			ret = import.kernel_id;
   475			goto error;
   476		}
   477	
   478		memcpy(import.name, VC_SM_RESOURCE_NAME_DEFAULT,
   479		       sizeof(VC_SM_RESOURCE_NAME_DEFAULT));
   480	
   481		/* Allocate the videocore buffer. */
   482		status = vc_sm_cma_vchi_import(sm_state->sm_handle, &import, &result,
   483					       &sm_state->int_trans_id);
   484		if (status == -EINTR) {
   485			dev_dbg(&sm_state->device->dev,
   486				"%s: requesting import memory action restart (trans_id: %u)\n",
   487				__func__, sm_state->int_trans_id);
   488			ret = -ERESTARTSYS;
   489			sm_state->restart_sys = -EINTR;
   490			sm_state->int_action = VC_SM_MSG_TYPE_IMPORT;
   491			goto error;
   492		} else if (status || !result.res_handle) {
   493			dev_dbg(&sm_state->device->dev,
   494				"%s: failed to import memory on videocore (status: %u, trans_id: %u)\n",
   495				 __func__, status, sm_state->int_trans_id);
   496			ret = -ENOMEM;
   497			goto error;
   498		}
   499	
   500		mutex_init(&buffer->lock);
   501		INIT_LIST_HEAD(&buffer->attachments);
   502		memcpy(buffer->name, import.name,
   503		       min(sizeof(buffer->name), sizeof(import.name) - 1));
   504	
   505		/* Keep track of the buffer we created. */
   506		buffer->vc_handle = result.res_handle;
   507		buffer->size = import.size;
   508		buffer->vpu_state = VPU_MAPPED;
   509	
   510		buffer->imported_dma_buf = dma_buf;
   511	
   512		buffer->attach = attach;
   513		buffer->sgt = sgt;
   514		buffer->dma_addr = dma_addr;
   515		buffer->in_use = true;
   516		buffer->kernel_id = import.kernel_id;
   517	
   518		/*
   519		 * We're done - we need to export a new dmabuf chaining through most
   520		 * functions, but enabling us to release our own internal references
   521		 * here.
   522		 */
   523		exp_info.ops = &dma_buf_import_ops;
   524		exp_info.size = import.size;
   525		exp_info.flags = O_RDWR;
   526		exp_info.priv = buffer;
   527	
   528		buffer->dma_buf = dma_buf_export(&exp_info);
   529		if (IS_ERR(buffer->dma_buf)) {
   530			ret = PTR_ERR(buffer->dma_buf);
   531			goto error;
   532		}
   533	
   534		vc_sm_add_resource(buffer);
   535	
   536		*imported_buf = buffer->dma_buf;
   537	
   538		return 0;
   539	
   540	error:
   541		if (result.res_handle) {
   542			struct vc_sm_free_t free = { result.res_handle, 0 };
   543	
   544			vc_sm_cma_vchi_free(sm_state->sm_handle, &free,
   545					    &sm_state->int_trans_id);
   546		}
   547		free_kernel_id(import.kernel_id);
   548		kfree(buffer);
   549		if (sgt)
   550			dma_buf_unmap_attachment_unlocked(attach, sgt,
   551							  DMA_BIDIRECTIONAL);
   552		if (attach)
   553			dma_buf_detach(dma_buf, attach);
   554		dma_buf_put(dma_buf);
   555		return ret;
   556	}
   557	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
