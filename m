Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D46E2F3F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 10:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681900499; x=1713436499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Eyb6Y45ibwYFuYVfFWFDmQkoTA3Six5A/RDqI1FAuY=;
  b=GImwqhOeuDmrl403BrLPXBoFRPaDRDQSVFbqrEW98GNeBC0M0OMquI9U
   PVKODVGol4NqYUefVeQS6gwOmYy7uRp5tsFUBp16ZU2HvtnYWkJHngZ9f
   hsMSfiQ3DCPyGy0PllD1DYhRUyx37AhmwBXmfOPLRrl7QVBjM0wU75PZa
   GbDsvpFG6OuzjxW4Mdnxc1uL++DxodEk0bZpfPNMr45RjRc1IfWaOJyS/
   niJORV5c72gfVajrz9HB60kZjsq2u/ZBHgNSqpua3+B3entU8HTVU1Ves
   0Hab4Aj3CuQRwxca5Peg9HRqyPJskZiwQFZnqxtFr9FC+E9dcVAfs0sw5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="345414000"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="345414000"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 03:34:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="694004325"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="694004325"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Apr 2023 03:34:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp59D-000eod-0E;
	Wed, 19 Apr 2023 10:34:47 +0000
Date: Wed, 19 Apr 2023 18:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Huang <Leon.Huang1@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [agd5f:drm-next 15/67]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:233:18:
 warning: unused variable 'otg_inst'
Message-ID: <202304191838.XXJ0UhYd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   86b20703e4c5a3c39891def0a68e7438aeca9db9
commit: 6f0ef80a00adfd51be22b6ab84acd48de1d3938d [15/67] drm/amd/display: Fix ABM pipe/backlight issues when change backlight
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230419/202304191838.XXJ0UhYd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 6f0ef80a00adfd51be22b6ab84acd48de1d3938d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/ drivers/gpu/drm/amd/display/dc/dcn21/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191838.XXJ0UhYd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c: In function 'dcn21_set_backlight_level':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:233:18: warning: unused variable 'otg_inst' [-Wunused-variable]
     233 |         uint32_t otg_inst = pipe_ctx->stream_res.tg->inst;
         |                  ^~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:230:27: warning: unused variable 'cmd' [-Wunused-variable]
     230 |         union dmub_rb_cmd cmd;
         |                           ^~~


vim +/otg_inst +233 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c

474ac4a875ca6fe Yongqiang Sun 2020-04-27  225  
474ac4a875ca6fe Yongqiang Sun 2020-04-27  226  bool dcn21_set_backlight_level(struct pipe_ctx *pipe_ctx,
474ac4a875ca6fe Yongqiang Sun 2020-04-27  227  		uint32_t backlight_pwm_u16_16,
474ac4a875ca6fe Yongqiang Sun 2020-04-27  228  		uint32_t frame_ramp)
474ac4a875ca6fe Yongqiang Sun 2020-04-27  229  {
474ac4a875ca6fe Yongqiang Sun 2020-04-27 @230  	union dmub_rb_cmd cmd;
474ac4a875ca6fe Yongqiang Sun 2020-04-27  231  	struct dc_context *dc = pipe_ctx->stream->ctx;
474ac4a875ca6fe Yongqiang Sun 2020-04-27  232  	struct abm *abm = pipe_ctx->stream_res.abm;
474ac4a875ca6fe Yongqiang Sun 2020-04-27 @233  	uint32_t otg_inst = pipe_ctx->stream_res.tg->inst;
474ac4a875ca6fe Yongqiang Sun 2020-04-27  234  	struct panel_cntl *panel_cntl = pipe_ctx->stream->link->panel_cntl;
474ac4a875ca6fe Yongqiang Sun 2020-04-27  235  
474ac4a875ca6fe Yongqiang Sun 2020-04-27  236  	if (dc->dc->res_pool->dmcu) {
474ac4a875ca6fe Yongqiang Sun 2020-04-27  237  		dce110_set_backlight_level(pipe_ctx, backlight_pwm_u16_16, frame_ramp);
474ac4a875ca6fe Yongqiang Sun 2020-04-27  238  		return true;
474ac4a875ca6fe Yongqiang Sun 2020-04-27  239  	}
474ac4a875ca6fe Yongqiang Sun 2020-04-27  240  
6f0ef80a00adfd5 Leon Huang    2022-12-08  241  	if (abm != NULL) {
6f0ef80a00adfd5 Leon Huang    2022-12-08  242  		uint32_t otg_inst = pipe_ctx->stream_res.tg->inst;
474ac4a875ca6fe Yongqiang Sun 2020-04-27  243  
6f0ef80a00adfd5 Leon Huang    2022-12-08  244  		if (abm && panel_cntl) {
6f0ef80a00adfd5 Leon Huang    2022-12-08  245  			if (abm->funcs && abm->funcs->set_pipe_ex) {
6f0ef80a00adfd5 Leon Huang    2022-12-08  246  				abm->funcs->set_pipe_ex(abm, otg_inst, SET_ABM_PIPE_NORMAL, panel_cntl->inst);
6f0ef80a00adfd5 Leon Huang    2022-12-08  247  			} else {
6f0ef80a00adfd5 Leon Huang    2022-12-08  248  				dmub_abm_set_pipe(abm, otg_inst, SET_ABM_PIPE_NORMAL, panel_cntl->inst);
6f0ef80a00adfd5 Leon Huang    2022-12-08  249  			}
6f0ef80a00adfd5 Leon Huang    2022-12-08  250  		}
6f0ef80a00adfd5 Leon Huang    2022-12-08  251  	}
474ac4a875ca6fe Yongqiang Sun 2020-04-27  252  
6f0ef80a00adfd5 Leon Huang    2022-12-08  253  	if (abm && abm->funcs && abm->funcs->set_backlight_level_pwm)
6f0ef80a00adfd5 Leon Huang    2022-12-08  254  		abm->funcs->set_backlight_level_pwm(abm, backlight_pwm_u16_16,
6f0ef80a00adfd5 Leon Huang    2022-12-08  255  			frame_ramp, 0, panel_cntl->inst);
6f0ef80a00adfd5 Leon Huang    2022-12-08  256  	else
6f0ef80a00adfd5 Leon Huang    2022-12-08  257  		dmub_abm_set_backlight(dc, backlight_pwm_u16_16, frame_ramp, panel_cntl->inst);
474ac4a875ca6fe Yongqiang Sun 2020-04-27  258  
474ac4a875ca6fe Yongqiang Sun 2020-04-27  259  	return true;
474ac4a875ca6fe Yongqiang Sun 2020-04-27  260  }
474ac4a875ca6fe Yongqiang Sun 2020-04-27  261  

:::::: The code at line 233 was first introduced by commit
:::::: 474ac4a875ca6fea3fc5183d3ad22ef7523dca53 drm/amd/display: Implement some asic specific abm call backs.

:::::: TO: Yongqiang Sun <yongqiang.sun@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
