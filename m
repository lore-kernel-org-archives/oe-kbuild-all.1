Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0FA22339
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 22:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723327730; cv=none; b=bs1cnogOmH0vP3Wx/QgUQtsNhc6266gKhPD9I5Wt0Wn/KDZmiNK5wJfhMAalz2nCMNF52zXXgIjpEsMcoANg49QiDFIhAaG9MLK5KSnb/HL978LoQbbdD44M3qCsY4clxeaX7agMMT7/Lzk+0lPPjruQd7as85uXt/D+CyqcDIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723327730; c=relaxed/simple;
	bh=D/oYPZRBmCRsUU2BP5Jp293OCeHZXOMf+skOlS8J9ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hd9GfPQeK4Nd7M9tS0ZVQunBcGL8Q+Xy0DxQlBck9n1rtgJ41XkjNUGWzR2MSZgvbF/7z6+53Rkcg+28c+AJ0QmCNymSn3Fd6zqrzuV7VMNRubCHX7gd7ftWyO8asSQrEpo2tMFDj31Sk6tngc3/3QOny15X75OqaUEU/slPzSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/FDC3dA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/FDC3dA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723327728; x=1754863728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D/oYPZRBmCRsUU2BP5Jp293OCeHZXOMf+skOlS8J9ZA=;
  b=f/FDC3dAVpEzt2NsSvJDcZ5LymAMv2xxpbhKNXroDP5K3McotoBq1Iyw
   1Yx1o1sypYCFYQDz2lvNIN4Wf84x3N+bBVL0AMAxEa8BOOBZqBDxtjutR
   J2NWIDjq64wwcVnw9wlj/85eR+dhbgCCtvyChMGuJu7InYsLFZ5IPRM/D
   z+ortz6EndeiOBXqBfczFNRVIztv+V7pZQ3U7EqfWPiBye4MK0cRPz9SZ
   e2NTOqifyCgOC61kQ1rq7TQrcUHOGwEWObvZn6mshF+NpAsVMl/3m4w5J
   TlaPNksdEouIe67JaDSULVow3m0A9eFomLCyjV4M8LJCvCAmgVy+5CnWq
   w==;
X-CSE-ConnectionGUID: b26pFbzoQge+xQj+rY5mSg==
X-CSE-MsgGUID: NsKOHZYJQxa2XImxmDDaIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21135555"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="21135555"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 15:08:47 -0700
X-CSE-ConnectionGUID: GRxI+eumRpqUi/D9sHo5Iw==
X-CSE-MsgGUID: /gz+eVwTS82guUgINmfqVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="57543528"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 10 Aug 2024 15:08:46 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scuGS-000ALN-14;
	Sat, 10 Aug 2024 22:08:44 +0000
Date: Sun, 11 Aug 2024 06:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chunkuang-hu:mediatek-cmdq11 4/5]
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:504:29: error: passing
 argument 1 of 'cmdq_pkt_destroy' from incompatible pointer type
Message-ID: <202408110525.pvOyx4ua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git mediatek-cmdq11
head:   e9ea7ca7912d1950de8e4427d644379321a1dbcb
commit: 78f3bb6adec9e7b904db5fe6c74e12f9c2559e09 [4/5] media: platform: mtk-mdp3: Use cmdq_pkt_create() and cmdq_pkt_destroy()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240811/202408110525.pvOyx4ua-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408110525.pvOyx4ua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408110525.pvOyx4ua-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c: In function 'mdp_auto_release_work':
>> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:504:29: error: passing argument 1 of 'cmdq_pkt_destroy' from incompatible pointer type [-Werror=incompatible-pointer-types]
     504 |         cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
         |                          ~~~^~~~~~~~~~
         |                             |
         |                             struct cmdq_client **
   In file included from drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h:12,
                    from drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:10:
   include/linux/soc/mediatek/mtk-cmdq.h:111:43: note: expected 'struct cmdq_client *' but argument is of type 'struct cmdq_client **'
     111 | void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
         |                       ~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c: In function 'mdp_handle_cmdq_callback':
   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:544:37: error: passing argument 1 of 'cmdq_pkt_destroy' from incompatible pointer type [-Werror=incompatible-pointer-types]
     544 |                 cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
         |                                  ~~~^~~~~~~~~~
         |                                     |
         |                                     struct cmdq_client **
   include/linux/soc/mediatek/mtk-cmdq.h:111:43: note: expected 'struct cmdq_client *' but argument is of type 'struct cmdq_client **'
     111 | void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
         |                       ~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c: In function 'mdp_cmdq_prepare':
   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:677:29: error: passing argument 1 of 'cmdq_pkt_destroy' from incompatible pointer type [-Werror=incompatible-pointer-types]
     677 |         cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
         |                          ~~~^~~~~~~~~~
         |                             |
         |                             struct cmdq_client **
   include/linux/soc/mediatek/mtk-cmdq.h:111:43: note: expected 'struct cmdq_client *' but argument is of type 'struct cmdq_client **'
     111 | void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
         |                       ~~~~~~~~~~~~~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +/cmdq_pkt_destroy +504 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c

   473	
   474	static void mdp_auto_release_work(struct work_struct *work)
   475	{
   476		struct mdp_cmdq_cmd *cmd;
   477		struct mdp_dev *mdp;
   478		struct mtk_mutex *mutex;
   479		enum mdp_pipe_id pipe_id;
   480	
   481		cmd = container_of(work, struct mdp_cmdq_cmd, auto_release_work);
   482		mdp = cmd->mdp;
   483	
   484		pipe_id = __get_pipe(mdp, cmd->comps[0].public_id);
   485		mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[pipe_id]);
   486		mtk_mutex_unprepare(mutex);
   487		mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
   488				    cmd->num_comps);
   489	
   490		if (refcount_dec_and_test(&mdp->job_count)) {
   491			if (cmd->mdp_ctx)
   492				mdp_m2m_job_finish(cmd->mdp_ctx);
   493	
   494			if (cmd->user_cmdq_cb) {
   495				struct cmdq_cb_data user_cb_data;
   496	
   497				user_cb_data.sta = cmd->data->sta;
   498				user_cb_data.pkt = cmd->data->pkt;
   499				cmd->user_cmdq_cb(user_cb_data);
   500			}
   501			wake_up(&mdp->callback_wq);
   502		}
   503	
 > 504		cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
   505		kfree(cmd->comps);
   506		cmd->comps = NULL;
   507		kfree(cmd);
   508		cmd = NULL;
   509	}
   510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
