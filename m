Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B9353E26
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 04:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715316830; cv=none; b=JIwvQiL7WcVyE128opBpb8SbA2Jp6E96GCzKeloLjBqD2vmppPcMaMEBOFdJ39kREE/8cX6F56NppwXn3rk/UTNowspqlWzjL8HhxcupaFpJU1WxcLVH0pJFFRm8NAqoEy4fo3dt/sK2I3ZeSmjse4HdkwsXe3nXfO4LbUZsivg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715316830; c=relaxed/simple;
	bh=wstIwcJ5d32pzTm5GMRJI2/RPjRLmnE/iAku0UFZFaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oCe4Rxa8r5dRnOp+ZWzWJHtzJ2VPKzdt2eaYxfTEqInjc5NDzJk5fzU9c5nCGGducw2tKILBYChp0bOkTzqprLt4ROGfzCSL9YdZSJRx/er2rGhriU83bWFh4NCh9QKAwdHGW75jI07M/945N4i33jWCvEg+fe6hNX2jlpkfsUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChLSajp9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChLSajp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715316828; x=1746852828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wstIwcJ5d32pzTm5GMRJI2/RPjRLmnE/iAku0UFZFaw=;
  b=ChLSajp9uogtj6eAFFSKZAWzqIALF6SwCrLQwLYAVlEzIZyq7ppwYX1T
   ZL03N337YEJXyP8xj2ZZrS8OJ4GM+fGVsA4BFkCUeHJG1NKln0CcCDg7K
   uLyCNrOha/JastrAbALrTMxo7YBCTRnWa9dwc8cGvmu+cpZiHC63cgsHx
   7B/8m5SL/T4lT6Y2sm7AOlqsKCTr4HVB+zAcS4fKxFduv4dyhM3M0oAqR
   y+juHLjvk1HyvqIqhkJstBeWHTBcrNigKq9v25agRjdy2mAy5Zl6+4lYc
   D53OIGG9cdCWimZXkqRHYM/2spJ37/5OnLGEjF6iMG413WPlGt27TWtNc
   Q==;
X-CSE-ConnectionGUID: SiLAN9hiRCWNhbjSopJuog==
X-CSE-MsgGUID: HJzR27xoSo64aP0TCWSwHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11140608"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="11140608"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 21:53:47 -0700
X-CSE-ConnectionGUID: JAPdGYZ+SPSn26REXrmlVg==
X-CSE-MsgGUID: YvTDPasfRti0SpOYr4Ip7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="60339981"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 May 2024 21:53:45 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5IGM-0005jp-36;
	Fri, 10 May 2024 04:53:42 +0000
Date: Fri, 10 May 2024 12:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 101/104]
 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c:320:15:
 error: cast to pointer from integer of different size
Message-ID: <202405101205.enk8iQTh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   cb75f24663df84986d5056df93e821564be6d886
commit: 35d65c4423bf525d557b423789c0c3f3c41fa92c [101/104] CHROMIUM: media: platform: mediatek: isp: add IMGSYS driver
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240510/202405101205.enk8iQTh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405101205.enk8iQTh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101205.enk8iQTh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c: In function 'imgsys_scp_handler':
>> drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c:320:15: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
     320 |         req = (struct mtk_imgsys_request *)swfrm_info->req_vaddr;
         |               ^
   drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c: In function 'mtk_imgsys_hw_connect':
>> drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c:461:25: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     461 |         info.drv_data = (u64)&imgsys_dev;
         |                         ^
   drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c: In function 'imgsys_composer_workfunc':
   drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c:700:33: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     700 |         ipi_param.req_addr_va = (u64)req;
         |                                 ^
   cc1: all warnings being treated as errors
--
   drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c: In function 'mtk_imgsys_vb2_meta_buf_init':
>> drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c:276:40: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     276 |                 dev_buf->va_daddr[0] = (u64)vb2_plane_vaddr(vb, 0);
         |                                        ^
   cc1: all warnings being treated as errors


vim +320 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c

   267	
   268	static void imgsys_scp_handler(void *data, unsigned int len, void *priv)
   269	{
   270		int job_id;
   271		struct mtk_imgsys_pipe *pipe;
   272		int pipe_id;
   273		struct mtk_imgsys_request *req;
   274		struct mtk_imgsys_dev *imgsys_dev = (struct mtk_imgsys_dev *)priv;
   275		struct img_sw_buffer *swbuf_data;
   276		struct swfrm_info_t *swfrm_info;
   277		int i = 0;
   278		void *gce_virt;
   279		int total_framenum = 0;
   280	
   281		if (!data) {
   282			WARN_ONCE(!data, "%s: failed due to NULL data\n", __func__);
   283			return;
   284		}
   285	
   286		if (WARN_ONCE(len != sizeof(struct img_sw_buffer),
   287			      "%s: len(%d) not match img_sw_buffer\n", __func__, len))
   288			return;
   289	
   290		swbuf_data = (struct img_sw_buffer *)data;
   291		gce_virt = mtk_hcp_get_gce_mem_virt(imgsys_dev->scp_pdev);
   292		if (!gce_virt) {
   293			pr_info("%s: invalid gce_virt(%p)\n",
   294				__func__, gce_virt);
   295			return;
   296		}
   297	
   298		swfrm_info = (struct swfrm_info_t *)(gce_virt + (swbuf_data->offset));
   299		if ((int)swbuf_data->offset < 0 ||
   300		    swbuf_data->offset > mtk_hcp_get_gce_mem_size(imgsys_dev->scp_pdev)) {
   301			pr_info("%s: invalid swbuf_data->offset(%d), max(%llu)\n",
   302				__func__, swbuf_data->offset,
   303				(u64)mtk_hcp_get_gce_mem_size(imgsys_dev->scp_pdev));
   304			return;
   305		}
   306	
   307		swfrm_info->req_sbuf_goft = swbuf_data->offset;
   308		swfrm_info->req_sbuf_kva = gce_virt + (swbuf_data->offset);
   309	
   310		job_id = swfrm_info->handle;
   311		pipe_id = mtk_imgsys_pipe_get_pipe_from_job_id(job_id);
   312		pipe = mtk_imgsys_dev_get_pipe(imgsys_dev, pipe_id);
   313		if (!pipe) {
   314			dev_info(imgsys_dev->dev,
   315				 "%s: get invalid img_ipi_frameparam index(%d) from firmware\n",
   316				 __func__, job_id);
   317			return;
   318		}
   319	
 > 320		req = (struct mtk_imgsys_request *)swfrm_info->req_vaddr;
   321		if (!req) {
   322			WARN_ONCE(!req, "%s: frame_no(%d) is lost\n", __func__, job_id);
   323			return;
   324		}
   325	
   326		if (!req->working_buf) {
   327			dev_dbg(imgsys_dev->dev,
   328				"%s: (reqfd-%d) composing\n",
   329				__func__, req->request_fd);
   330		}
   331	
   332		swfrm_info->is_sent = false;
   333		swfrm_info->req = (void *)req;
   334		swfrm_info->pipe = (void *)pipe;
   335		swfrm_info->cb_frmcnt = 0;
   336		swfrm_info->total_taskcnt = 0;
   337		swfrm_info->chan_id = 0;
   338		swfrm_info->hw_hang = -1;
   339		total_framenum = swfrm_info->total_frmnum;
   340	
   341		if (total_framenum < 0 || total_framenum > TMAX) {
   342			dev_info(imgsys_dev->dev,
   343				 "%s:unexpected total_framenum (%d -> %d), batchnum(%d) MAX (%d/%d)\n",
   344				 __func__, swfrm_info->total_frmnum,
   345				 total_framenum,
   346				 swfrm_info->batchnum,
   347				 TMAX, TIME_MAX);
   348			return;
   349		}
   350	
   351		for (i = 0 ; i < total_framenum ; i++) {
   352			swfrm_info->user_info[i].g_swbuf = gce_virt + (swfrm_info->user_info[i].sw_goft);
   353			swfrm_info->user_info[i].bw_swbuf = gce_virt + (swfrm_info->user_info[i].sw_bwoft);
   354		}
   355	
   356		req->swfrm_info = swfrm_info;
   357	
   358		up(&imgsys_dev->sem);
   359	
   360		INIT_WORK(&req->runner_work, imgsys_runner_func);
   361		queue_work(req->imgsys_pipe->imgsys_dev->runner_wq,
   362			   &req->runner_work);
   363	}
   364	
   365	static int mtk_imgsys_hw_flush_pipe_jobs(struct mtk_imgsys_pipe *pipe)
   366	{
   367		struct mtk_imgsys_request *req;
   368		struct list_head job_list = LIST_HEAD_INIT(job_list);
   369		unsigned long flag;
   370		int num;
   371		int ret;
   372	
   373		spin_lock_irqsave(&pipe->running_job_lock, flag);
   374		list_splice_init(&pipe->pipe_job_running_list, &job_list);
   375		pipe->num_jobs = 0;
   376		spin_unlock_irqrestore(&pipe->running_job_lock, flag);
   377	
   378		ret = wait_event_timeout
   379			(pipe->imgsys_dev->flushing_waitq,
   380			 !(num = atomic_read(&pipe->imgsys_dev->num_composing)),
   381			 msecs_to_jiffies(1000 / 30 * IMGSYS_WORKING_BUF_NUM * 3));
   382		if (!ret && num) {
   383			dev_info(pipe->imgsys_dev->dev,
   384				 "flushing is aborted, num(%d)\n", num);
   385			return -EINVAL;
   386		}
   387	
   388		list_for_each_entry(req, &job_list, list)
   389			mtk_imgsys_pipe_job_finish(req, VB2_BUF_STATE_ERROR);
   390	
   391		dev_dbg(pipe->imgsys_dev->dev,
   392			"%s: wakeup num(%d)\n", __func__, num);
   393		return 0;
   394	}
   395	
   396	static void module_uninit(struct kref *kref)
   397	{
   398		struct mtk_imgsys_dev *imgsys_dev;
   399		int i;
   400	
   401		imgsys_dev = container_of(kref, struct mtk_imgsys_dev, init_kref);
   402	
   403		for (i = 0; i < (imgsys_dev->num_mods); i++)
   404			if (imgsys_dev->modules[i].uninit)
   405				imgsys_dev->modules[i].uninit(imgsys_dev);
   406	}
   407	
   408	void mtk_imgsys_mod_put(struct mtk_imgsys_dev *imgsys_dev)
   409	{
   410		struct kref *kref;
   411	
   412		kref = &imgsys_dev->init_kref;
   413		kref_put(kref, module_uninit);
   414	}
   415	
   416	void mtk_imgsys_mod_get(struct mtk_imgsys_dev *imgsys_dev)
   417	{
   418		struct kref *kref;
   419	
   420		kref = &imgsys_dev->init_kref;
   421		kref_get(kref);
   422	}
   423	
   424	static int mtk_imgsys_hw_connect(struct mtk_imgsys_dev *imgsys_dev)
   425	{
   426		int ret, i;
   427		u32 user_cnt = 0;
   428		struct img_init_info info;
   429	
   430		user_cnt = atomic_read(&imgsys_dev->imgsys_user_cnt);
   431		if (user_cnt != 0)
   432			dev_info(imgsys_dev->dev,
   433				 "%s: [ERROR] imgsys user count is not zero(%d)\n",
   434				 __func__, user_cnt);
   435	
   436		atomic_set(&imgsys_dev->imgsys_user_cnt, 0);
   437	
   438		pm_runtime_get_sync(imgsys_dev->dev);
   439		/* set default value for hw module */
   440		for (i = 0; i < (imgsys_dev->num_mods); i++)
   441			imgsys_dev->modules[i].init(imgsys_dev);
   442		kref_init(&imgsys_dev->init_kref);
   443	
   444		pm_runtime_put_sync(imgsys_dev->dev);
   445		if (!imgsys_quick_onoff_en) {
   446			pm_runtime_get_sync(imgsys_dev->dev);
   447			for (i = 0; i < (imgsys_dev->num_mods); i++)
   448				if (imgsys_dev->modules[i].set)
   449					imgsys_dev->modules[i].set(imgsys_dev);
   450		}
   451	
   452		ret = mtk_hcp_allocate_working_buffer(imgsys_dev->scp_pdev, 0);
   453		if (ret) {
   454			dev_err(imgsys_dev->dev, "%s: mtk_hcp_allocate_working_buffer failed %d\n",
   455				__func__, ret);
   456			return -EBUSY;
   457		}
   458	
   459		/* IMGSYS HW INIT */
   460		memset(&info, 0, sizeof(info));
 > 461		info.drv_data = (u64)&imgsys_dev;
   462		info.header_version = HEADER_VER;
   463		info.frameparam_size = sizeof(struct img_ipi_frameparam);
   464		info.reg_phys_addr = imgsys_dev->imgsys_resource->start;
   465		info.reg_range = resource_size(imgsys_dev->imgsys_resource);
   466	
   467		mtk_hcp_get_init_info(imgsys_dev->scp_pdev, &info);
   468		info.sec_tag = imgsys_dev->imgsys_pipe[0].init_info.sec_tag;
   469		info.full_wd = imgsys_dev->imgsys_pipe[0].init_info.sensor.full_wd;
   470		info.full_ht = imgsys_dev->imgsys_pipe[0].init_info.sensor.full_ht;
   471		info.smvr_mode = 0;
   472	
   473		ret = imgsys_send(imgsys_dev->scp_pdev, HCP_IMGSYS_INIT_ID,
   474				  (void *)&info, sizeof(info), 0, 1);
   475	
   476		if (ret) {
   477			dev_err(imgsys_dev->dev, "%s: send SCP_IPI_DIP_FRAME failed %d\n",
   478				__func__, ret);
   479			return -EBUSY;
   480		}
   481	
   482		/* calling cmdq stream on */
   483		imgsys_cmdq_streamon(imgsys_dev);
   484	
   485		mtk_hcp_register(imgsys_dev->scp_pdev, HCP_IMGSYS_FRAME_ID,
   486				 imgsys_scp_handler, "imgsys_scp_handler", imgsys_dev);
   487	
   488		return 0;
   489	}
   490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
