Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9012E8882
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755351844; cv=none; b=RWLMQKPuumgGnBi/kUNXJ7WHTFiGFAjS7cZpKVW6fuJJU5Hddom37trdgn/hA3ETdjSa1gpgjt6xUFOnN/TDJLOJU7mJ/D6yUaGI63XNZfsT4Dj/V3G78/JCuHOhA4xAJoTC0VKJD+ii6hxIT8pRXzIiGvATqoZp77lNNS4VF3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755351844; c=relaxed/simple;
	bh=ew/x/ZJghIPOZr/hNDQKiC5O4se2m/ZLk5BqAjTWchc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FJ5mMJ5pbqBFAaJF/kFrgCVluueWJxBmCo0inIzEGB09+LdDgMoqtgXW75yb33pcYVMyUNiu7SXZXyZWw9nvfF83AtjbXkhquYBmT85zCwy1GCcrIClKAywCpp34G/m2qP+OURPsNTtEWDGFG3b+t16/tKYX6pVcZh3CBk8sZxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfICsQFQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfICsQFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755351842; x=1786887842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ew/x/ZJghIPOZr/hNDQKiC5O4se2m/ZLk5BqAjTWchc=;
  b=jfICsQFQQQhv6lKoOo+tzbViW/zbQc+oxnlzcxzs3lFdoBZFmgRNWviN
   rwH8fB+kBaX+dNRL6qfEspkE+6ljMIIF2/pLROfJwZNHoPK56TFEp2N5R
   mCU+mt2NENLvG3L134XV9wgeRhO/wC9MZ+pNSHS1voukYG4ehEPcjW2Wm
   nMj68FkAol22pLGRdiR8Ot4xXexrlqnA2/zMaNVzjaMG+gUvsm8tm4Qwj
   6CzhGjTT7DQB+Fw0P8+sITOwZvwYMe1O1pZnZOWXES8oEt1f5EqXChP8z
   RxoH8Cir4op+Eod7GnptyStDp72xb4uKAPctYQW8S8wW75dMQf47tg1zs
   g==;
X-CSE-ConnectionGUID: oM5We5GKT26OGJ6nC/9MXw==
X-CSE-MsgGUID: 9DqXwI4sSWGFkb8SKeYluQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57751263"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57751263"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 06:43:58 -0700
X-CSE-ConnectionGUID: YcDl6OoVTaOHKeug47uO9Q==
X-CSE-MsgGUID: 27u263uGTUi1Mw4n6uS5kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167596288"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 16 Aug 2025 06:43:56 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unHCM-000CtM-01;
	Sat, 16 Aug 2025 13:43:54 +0000
Date: Sat, 16 Aug 2025 21:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: Reza Amini <reza.amini@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Krunoslav Kovac <krunoslav.kovac@amd.com>,
	Roman Li <roman.li@amd.com>
Subject: [agd5f:drm-next 103/178]
 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c:447:1:
 warning: the frame size of 1160 bytes is larger than 1024 bytes
Message-ID: <202508162145.k9AB15wi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   d2fa0ec6e0aea6ffbd41939d0c7671db16991ca4
commit: e63e9f8b3d1c5d17fa4db9241905a8baf1e4bda8 [103/178] drm/amd/display: Fixing hubp programming of 3dlut fast load
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250816/202508162145.k9AB15wi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508162145.k9AB15wi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508162145.k9AB15wi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c: In function 'dcn10_log_hubp_states':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c:447:1: warning: the frame size of 1160 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     447 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c: In function 'dcn10_log_color_state':
   drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c:608:1: warning: the frame size of 1440 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     608 | }
         | ^


vim +447 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c

233dcd2092f9f9 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Tony Cheng          2017-08-03  293  
46659a83e4662e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Nicholas Kazlauskas 2018-08-15  294  static void dcn10_log_hubp_states(struct dc *dc, void *log_ctx)
0a93dc7f595f43 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-03-29  295  {
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  296  	struct dc_context *dc_ctx = dc->ctx;
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  297  	struct resource_pool *pool = dc->res_pool;
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  298  	int i;
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  299  
ae8cf9774e3a60 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Leo (Hanghong  Ma   2019-09-06  300) 	DTN_INFO(
ae8cf9774e3a60 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Leo (Hanghong  Ma   2019-09-06  301) 		"HUBP:  format  addr_hi  width  height  rot  mir  sw_mode  dcc_en  blank_en  clock_en  ttu_dis  underflow   min_ttu_vblank       qos_low_wm      qos_high_wm\n");
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  302  	for (i = 0; i < pool->pipe_count; i++) {
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  303  		struct hubp *hubp = pool->hubps[i];
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  304  		struct dcn_hubp_state *s = &(TO_DCN10_HUBP(hubp)->state);
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  305  
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  306  		hubp->funcs->hubp_read_state(hubp);
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  307  
a3cb1c1c8e5e49 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Nikola Cornij       2018-04-23  308  		if (!s->blank_en) {
ae8cf9774e3a60 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Leo (Hanghong  Ma   2019-09-06  309) 			DTN_INFO("[%2d]:  %5xh  %6xh  %5d  %6d  %2xh  %2xh  %6xh  %6d  %8d  %8d  %7d  %8xh",
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  310  					hubp->inst,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  311  					s->pixel_format,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  312  					s->inuse_addr_hi,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  313  					s->viewport_width,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  314  					s->viewport_height,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  315  					s->rotation_angle,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  316  					s->h_mirror_en,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  317  					s->sw_mode,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  318  					s->dcc_en,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  319  					s->blank_en,
ae8cf9774e3a60 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Leo (Hanghong  Ma   2019-09-06  320) 					s->clock_en,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  321  					s->ttu_disable,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  322  					s->underflow_status);
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  323  			DTN_INFO_MICRO_SEC(s->min_ttu_vblank);
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  324  			DTN_INFO_MICRO_SEC(s->qos_level_low_wm);
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  325  			DTN_INFO_MICRO_SEC(s->qos_level_high_wm);
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  326  			DTN_INFO("\n");
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  327  		}
a3cb1c1c8e5e49 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Nikola Cornij       2018-04-23  328  	}
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  329  
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  330  	DTN_INFO("\n=======HUBP FL======\n");
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  331  	char pLabels[18][50] = {
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  332  		"inst", "Enabled ", "Done ", "adr_mode ", "width ", "mpc_width ",
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  333  		"tmz", "xbar_sel_R", "xbar_sel_G", "xbar_sel_B", "adr_hi ",
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  334  		"adr_low", "REFCYC", "Bias", "Scale", "Mode",
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  335  		"Format", "prefetch"};
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  336  
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  337  	for (i = 0; i < pool->pipe_count; i++) {
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  338  		struct dcn_hubp_state *s = &(TO_DCN10_HUBP(pool->hubps[i])->state);
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  339  		struct dcn_fl_regs_st *fl_regs = &s->fl_regs;
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  340  		struct _vcs_dpi_display_dlg_regs_st *dlg_regs = &s->dlg_attr;
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  341  
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  342  		if (!s->blank_en) {
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  343  			uint32_t values[] = {
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  344  					pool->hubps[i]->inst,
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  345  					fl_regs->lut_enable,
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  346  					fl_regs->lut_done,
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  347  					fl_regs->lut_addr_mode,
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  348  					fl_regs->lut_width,
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  349  					fl_regs->lut_mpc_width,
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  350  					fl_regs->lut_tmz,
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  351  					fl_regs->lut_crossbar_sel_r,
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  352  					fl_regs->lut_crossbar_sel_g,
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  353  					fl_regs->lut_crossbar_sel_b,
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  354  					fl_regs->lut_addr_hi,
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  355  					fl_regs->lut_addr_lo,
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  356  					fl_regs->refcyc_3dlut_group,
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  357  					fl_regs->lut_fl_bias,
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  358  					fl_regs->lut_fl_scale,
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  359  					fl_regs->lut_fl_mode,
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  360  					fl_regs->lut_fl_format,
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  361  					dlg_regs->dst_y_prefetch};
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  362  
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  363  			int num_elements = 18;
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  364  
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  365  			for (int j = 0; j < num_elements; j++)
e63e9f8b3d1c5d drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Reza Amini          2025-07-14  366  				DTN_INFO("%s \t %8xh\n", pLabels[j], values[j]);
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  367  		}
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  368  	}
0ae0b670124bbd drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Yihan Zhu           2025-05-27  369  
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  370  	DTN_INFO("\n=========RQ========\n");
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  371  	DTN_INFO("HUBP:  drq_exp_m  prq_exp_m  mrq_exp_m  crq_exp_m  plane1_ba  L:chunk_s  min_chu_s  meta_ch_s"
b9c1c67aeb8805 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-06-05  372  		"  min_m_c_s  dpte_gr_s  mpte_gr_s  swath_hei  pte_row_h  C:chunk_s  min_chu_s  meta_ch_s"
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  373  		"  min_m_c_s  dpte_gr_s  mpte_gr_s  swath_hei  pte_row_h\n");
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  374  	for (i = 0; i < pool->pipe_count; i++) {
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  375  		struct dcn_hubp_state *s = &(TO_DCN10_HUBP(pool->hubps[i])->state);
0a93dc7f595f43 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-03-29  376  		struct _vcs_dpi_display_rq_regs_st *rq_regs = &s->rq_regs;
0a93dc7f595f43 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-03-29  377  
a3cb1c1c8e5e49 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Nikola Cornij       2018-04-23  378  		if (!s->blank_en)
b9c1c67aeb8805 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-06-05  379  			DTN_INFO("[%2d]:  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh\n",
a3cb1c1c8e5e49 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Nikola Cornij       2018-04-23  380  				pool->hubps[i]->inst, rq_regs->drq_expansion_mode, rq_regs->prq_expansion_mode, rq_regs->mrq_expansion_mode,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  381  				rq_regs->crq_expansion_mode, rq_regs->plane1_base_address, rq_regs->rq_regs_l.chunk_size,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  382  				rq_regs->rq_regs_l.min_chunk_size, rq_regs->rq_regs_l.meta_chunk_size,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  383  				rq_regs->rq_regs_l.min_meta_chunk_size, rq_regs->rq_regs_l.dpte_group_size,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  384  				rq_regs->rq_regs_l.mpte_group_size, rq_regs->rq_regs_l.swath_height,
b9c1c67aeb8805 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-06-05  385  				rq_regs->rq_regs_l.pte_row_height_linear, rq_regs->rq_regs_c.chunk_size, rq_regs->rq_regs_c.min_chunk_size,
b9c1c67aeb8805 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-06-05  386  				rq_regs->rq_regs_c.meta_chunk_size, rq_regs->rq_regs_c.min_meta_chunk_size,
b9c1c67aeb8805 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-06-05  387  				rq_regs->rq_regs_c.dpte_group_size, rq_regs->rq_regs_c.mpte_group_size,
b9c1c67aeb8805 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-06-05  388  				rq_regs->rq_regs_c.swath_height, rq_regs->rq_regs_c.pte_row_height_linear);
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  389  	}
0a93dc7f595f43 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-03-29  390  
0a93dc7f595f43 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-03-29  391  	DTN_INFO("========DLG========\n");
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  392  	DTN_INFO("HUBP:  rc_hbe     dlg_vbe    min_d_y_n  rc_per_ht  rc_x_a_s "
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  393  			"  dst_y_a_s  dst_y_pf   dst_y_vvb  dst_y_rvb  dst_y_vfl  dst_y_rfl  rf_pix_fq"
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  394  			"  vratio_pf  vrat_pf_c  rc_pg_vbl  rc_pg_vbc  rc_mc_vbl  rc_mc_vbc  rc_pg_fll"
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  395  			"  rc_pg_flc  rc_mc_fll  rc_mc_flc  pr_nom_l   pr_nom_c   rc_pg_nl   rc_pg_nc "
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  396  			"  mr_nom_l   mr_nom_c   rc_mc_nl   rc_mc_nc   rc_ld_pl   rc_ld_pc   rc_ld_l  "
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  397  			"  rc_ld_c    cha_cur0   ofst_cur1  cha_cur1   vr_af_vc0  ddrq_limt  x_rt_dlay"
00c391102abc13 drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Aurabindo Pillai    2024-03-20  398  			"  x_rp_dlay  x_rr_sfl  rc_td_grp\n");
00c391102abc13 drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Aurabindo Pillai    2024-03-20  399  
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  400  	for (i = 0; i < pool->pipe_count; i++) {
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  401  		struct dcn_hubp_state *s = &(TO_DCN10_HUBP(pool->hubps[i])->state);
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  402  		struct _vcs_dpi_display_dlg_regs_st *dlg_regs = &s->dlg_attr;
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  403  
a3cb1c1c8e5e49 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Nikola Cornij       2018-04-23  404  		if (!s->blank_en)
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  405  			DTN_INFO("[%2d]:  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh"
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  406  				"  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh"
00c391102abc13 drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Aurabindo Pillai    2024-03-20  407  				"  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh %xh\n",
a3cb1c1c8e5e49 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Nikola Cornij       2018-04-23  408  				pool->hubps[i]->inst, dlg_regs->refcyc_h_blank_end, dlg_regs->dlg_vblank_end, dlg_regs->min_dst_y_next_start,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  409  				dlg_regs->refcyc_per_htotal, dlg_regs->refcyc_x_after_scaler, dlg_regs->dst_y_after_scaler,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  410  				dlg_regs->dst_y_prefetch, dlg_regs->dst_y_per_vm_vblank, dlg_regs->dst_y_per_row_vblank,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  411  				dlg_regs->dst_y_per_vm_flip, dlg_regs->dst_y_per_row_flip, dlg_regs->ref_freq_to_pix_freq,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  412  				dlg_regs->vratio_prefetch, dlg_regs->vratio_prefetch_c, dlg_regs->refcyc_per_pte_group_vblank_l,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  413  				dlg_regs->refcyc_per_pte_group_vblank_c, dlg_regs->refcyc_per_meta_chunk_vblank_l,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  414  				dlg_regs->refcyc_per_meta_chunk_vblank_c, dlg_regs->refcyc_per_pte_group_flip_l,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  415  				dlg_regs->refcyc_per_pte_group_flip_c, dlg_regs->refcyc_per_meta_chunk_flip_l,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  416  				dlg_regs->refcyc_per_meta_chunk_flip_c, dlg_regs->dst_y_per_pte_row_nom_l,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  417  				dlg_regs->dst_y_per_pte_row_nom_c, dlg_regs->refcyc_per_pte_group_nom_l,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  418  				dlg_regs->refcyc_per_pte_group_nom_c, dlg_regs->dst_y_per_meta_row_nom_l,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  419  				dlg_regs->dst_y_per_meta_row_nom_c, dlg_regs->refcyc_per_meta_chunk_nom_l,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  420  				dlg_regs->refcyc_per_meta_chunk_nom_c, dlg_regs->refcyc_per_line_delivery_pre_l,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  421  				dlg_regs->refcyc_per_line_delivery_pre_c, dlg_regs->refcyc_per_line_delivery_l,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  422  				dlg_regs->refcyc_per_line_delivery_c, dlg_regs->chunk_hdl_adjust_cur0, dlg_regs->dst_y_offset_cur1,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  423  				dlg_regs->chunk_hdl_adjust_cur1, dlg_regs->vready_after_vcount0, dlg_regs->dst_y_delta_drq_limit,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  424  				dlg_regs->xfc_reg_transfer_delay, dlg_regs->xfc_reg_precharge_delay,
00c391102abc13 drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c   Aurabindo Pillai    2024-03-20  425  				dlg_regs->xfc_reg_remote_surface_flip_latency, dlg_regs->refcyc_per_tdlut_group);
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  426  	}
0a93dc7f595f43 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-03-29  427  
0a93dc7f595f43 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-03-29  428  	DTN_INFO("========TTU========\n");
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  429  	DTN_INFO("HUBP:  qos_ll_wm  qos_lh_wm  mn_ttu_vb  qos_l_flp  rc_rd_p_l  rc_rd_l    rc_rd_p_c"
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  430  			"  rc_rd_c    rc_rd_c0   rc_rd_pc0  rc_rd_c1   rc_rd_pc1  qos_lf_l   qos_rds_l"
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  431  			"  qos_lf_c   qos_rds_c  qos_lf_c0  qos_rds_c0 qos_lf_c1  qos_rds_c1\n");
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  432  	for (i = 0; i < pool->pipe_count; i++) {
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  433  		struct dcn_hubp_state *s = &(TO_DCN10_HUBP(pool->hubps[i])->state);
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  434  		struct _vcs_dpi_display_ttu_regs_st *ttu_regs = &s->ttu_attr;
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  435  
a3cb1c1c8e5e49 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Nikola Cornij       2018-04-23  436  		if (!s->blank_en)
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  437  			DTN_INFO("[%2d]:  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh  %8xh\n",
a3cb1c1c8e5e49 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Nikola Cornij       2018-04-23  438  				pool->hubps[i]->inst, ttu_regs->qos_level_low_wm, ttu_regs->qos_level_high_wm, ttu_regs->min_ttu_vblank,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  439  				ttu_regs->qos_level_flip, ttu_regs->refcyc_per_req_delivery_pre_l, ttu_regs->refcyc_per_req_delivery_l,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  440  				ttu_regs->refcyc_per_req_delivery_pre_c, ttu_regs->refcyc_per_req_delivery_c, ttu_regs->refcyc_per_req_delivery_cur0,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  441  				ttu_regs->refcyc_per_req_delivery_pre_cur0, ttu_regs->refcyc_per_req_delivery_cur1,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  442  				ttu_regs->refcyc_per_req_delivery_pre_cur1, ttu_regs->qos_level_fixed_l, ttu_regs->qos_ramp_disable_l,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  443  				ttu_regs->qos_level_fixed_c, ttu_regs->qos_ramp_disable_c, ttu_regs->qos_level_fixed_cur0,
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  444  				ttu_regs->qos_ramp_disable_cur0, ttu_regs->qos_level_fixed_cur1, ttu_regs->qos_ramp_disable_cur1);
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  445  	}
34cb6b3860a4ae drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-04-11  446  	DTN_INFO("\n");
0a93dc7f595f43 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-03-29 @447  }
0a93dc7f595f43 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c Dmytro Laktyushkin  2018-03-29  448  

:::::: The code at line 447 was first introduced by commit
:::::: 0a93dc7f595f43b621277ecfc05a44ed0c719a5f drm/amd/display: add rq/dlg/ttu to dtn log

:::::: TO: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
