Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A21200BC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 20:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691698701; x=1723234701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1IuTaNAUECZnlyjdVxSwcO2w6gzl2MWymFzVEgoeGXw=;
  b=Ua9rPtZsKu9zaF6bDJ88rP7bDJn/szgvsUy8vAIuB6B325IMl8/h9zib
   yl/W5dImb6ABLJ/3yJvTaKKQnS7LMD3itXnRgqyMoGLC8U7U4ggW4/xU0
   +4jO2a27+Dld6L2ASgDmf2cvYT4RmWxIg5lmkxBUz9NRcK5FkAhjboOeY
   2+RQKDXaerYj8gKyojWGeMUbFei8en3Fy40+ZmU8leSCl2DwCx/Pyjiru
   F6cunDWISnOjWppW9f4rqRSDNIFl6iHZuwUqK0xn9XoT2J06BzO3TFxYG
   tNJeLKofnhb0SGTWlMouofPXHvTl8L8uwGjSmnV0KfwwIyfVfBrwGS7gr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="375228605"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="375228605"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 13:18:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="767401391"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="767401391"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Aug 2023 13:18:19 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUC6s-0007EC-1G;
	Thu, 10 Aug 2023 20:18:18 +0000
Date: Fri, 11 Aug 2023 04:18:04 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abhinav Kumar <abhinavk@codeaurora.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 55/9999]
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1156:33: warning: variable
 'priv' set but not used
Message-ID: <202308110440.3OwSsIvy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   c275eaaaa34260e6c907bc5e7ee07c096bc45064
commit: 181ec5b45a22c0902892e41bb97fc23a01441d8a [55/9999] drm/msm/dp: Modify prototype of encoder based API
config: arm-qcom_defconfig (https://download.01.org/0day-ci/archive/20230811/202308110440.3OwSsIvy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110440.3OwSsIvy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110440.3OwSsIvy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: In function 'dpu_encoder_virt_enable':
>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1156:33: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
    1156 |         struct msm_drm_private *priv;
         |                                 ^~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: In function 'dpu_encoder_virt_disable':
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1205:33: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
    1205 |         struct msm_drm_private *priv;
         |                                 ^~~~


vim +/priv +1156 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1151  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1152  static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1153  {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1154  	struct dpu_encoder_virt *dpu_enc = NULL;
86b89080368b46 Jeykumar Sankaran 2018-09-05  1155  	int ret = 0;
c943b4948b5848 Chandan Uddaraju  2020-08-27 @1156  	struct msm_drm_private *priv;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1157  	struct drm_display_mode *cur_mode = NULL;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1158  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1159  	if (!drm_enc) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1160  		DPU_ERROR("invalid encoder\n");
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1161  		return;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1162  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1163  	dpu_enc = to_dpu_encoder_virt(drm_enc);
fba7427eb59496 Sean Paul         2018-11-16  1164  
fba7427eb59496 Sean Paul         2018-11-16  1165  	mutex_lock(&dpu_enc->enc_lock);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1166  	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
c943b4948b5848 Chandan Uddaraju  2020-08-27  1167  	priv = drm_enc->dev->dev_private;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1168  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1169  	trace_dpu_enc_enable(DRMID(drm_enc), cur_mode->hdisplay,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1170  			     cur_mode->vdisplay);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1171  
86b89080368b46 Jeykumar Sankaran 2018-09-05  1172  	/* always enable slave encoder before master */
86b89080368b46 Jeykumar Sankaran 2018-09-05  1173  	if (dpu_enc->cur_slave && dpu_enc->cur_slave->ops.enable)
86b89080368b46 Jeykumar Sankaran 2018-09-05  1174  		dpu_enc->cur_slave->ops.enable(dpu_enc->cur_slave);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1175  
86b89080368b46 Jeykumar Sankaran 2018-09-05  1176  	if (dpu_enc->cur_master && dpu_enc->cur_master->ops.enable)
86b89080368b46 Jeykumar Sankaran 2018-09-05  1177  		dpu_enc->cur_master->ops.enable(dpu_enc->cur_master);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1178  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1179  	ret = dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_KICKOFF);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1180  	if (ret) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1181  		DPU_ERROR_ENC(dpu_enc, "dpu resource control failed: %d\n",
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1182  				ret);
fba7427eb59496 Sean Paul         2018-11-16  1183  		goto out;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1184  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1185  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1186  	_dpu_encoder_virt_enable_helper(drm_enc);
fba7427eb59496 Sean Paul         2018-11-16  1187  
181ec5b45a22c0 Bjorn Andersson   2021-10-16  1188  	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
181ec5b45a22c0 Bjorn Andersson   2021-10-16  1189  		ret = msm_dp_display_enable(dpu_enc->dp, drm_enc);
c943b4948b5848 Chandan Uddaraju  2020-08-27  1190  		if (ret) {
c943b4948b5848 Chandan Uddaraju  2020-08-27  1191  			DPU_ERROR_ENC(dpu_enc, "dp display enable failed: %d\n",
c943b4948b5848 Chandan Uddaraju  2020-08-27  1192  				ret);
c943b4948b5848 Chandan Uddaraju  2020-08-27  1193  			goto out;
c943b4948b5848 Chandan Uddaraju  2020-08-27  1194  		}
c943b4948b5848 Chandan Uddaraju  2020-08-27  1195  	}
fba7427eb59496 Sean Paul         2018-11-16  1196  	dpu_enc->enabled = true;
fba7427eb59496 Sean Paul         2018-11-16  1197  
fba7427eb59496 Sean Paul         2018-11-16  1198  out:
fba7427eb59496 Sean Paul         2018-11-16  1199  	mutex_unlock(&dpu_enc->enc_lock);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1200  }
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1201  

:::::: The code at line 1156 was first introduced by commit
:::::: c943b4948b5848fc0e07f875edbd35a973879e22 drm/msm/dp: add displayPort driver support

:::::: TO: Chandan Uddaraju <chandanu@codeaurora.org>
:::::: CC: Rob Clark <robdclark@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
