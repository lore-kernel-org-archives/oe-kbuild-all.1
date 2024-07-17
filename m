Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE6D12E75
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 18:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721240443; cv=none; b=gkJm8qljpkKmQ932Z2AHJ2yKUKbF7W7cyhztvh2spBUD6CNTsoML7Rvk+wTZKFgKLukQbZ307ZBqeJtRIFY5nIyyzkFTZ5kJZxR9OHN8LlQCvHMciGW5U9ETVPAira8z705Bx/+gt+C+w41i8Qd32xxSgJsmb2qZu3jUSFLhXnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721240443; c=relaxed/simple;
	bh=taB3dz9hUoR5eKo6/btL372wq4FASkeokGWELP1iqFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oCOr/S+gIOM5aZ1EOQuIJb7BFmmh62TNCxLjUGlI9KvS+XsnTkQFmgKNF8x9mjtdC/sGzM1op2aHxRj+lkTSF8Dxenxfp7cpZQrT9D6DEJMC+qTz5XnTGZj02wxe+3tSi0OygTwU7OewwKfvUQ54iIn77QyDsu7Dj4EWNlr9oSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjPe6Dw7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjPe6Dw7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721240441; x=1752776441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=taB3dz9hUoR5eKo6/btL372wq4FASkeokGWELP1iqFY=;
  b=KjPe6Dw7JW6gqfPX03iCtlGKxP/1o+2dYMs2wyEEGSj83pTlHhGrPamq
   mDRYwhH0Oc+VbjKB5emS1p/ohYNorBzBPgpmMHwxIb6M8vA90sz4+gGCW
   tB7hxKO+NdgDMr35QF76lRpHADJFzAPi3uWR5aty28BBD/3kheQ6kl5IS
   hPp3EfK5hyKXx6pVHkaFLmhpS9jome+ihGZUbng4BNjvlsVoqJaZKl29E
   mnlqh2Lng6xFuIC1LdO0vb89j7A1sH7aW8k5o5L+EKxMDM/gf2kY4F/YZ
   5tpFwHYaXX9eoH3qnvat9XzynrDWZdIzvT/7/e4JIIiqw/XGexW5HeFz8
   Q==;
X-CSE-ConnectionGUID: BOGh2+WzQEeTxlUpWNC4vw==
X-CSE-MsgGUID: dpT3g8NvSuSWqOL7Sgm8dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="12593287"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="12593287"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 11:20:40 -0700
X-CSE-ConnectionGUID: qXGFNRj3RKSvG91+IFemsA==
X-CSE-MsgGUID: OeJEX4I9Rmm3xQJWDJ4yAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="50423579"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jul 2024 11:20:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sU9GW-000gaY-2Q;
	Wed, 17 Jul 2024 18:20:36 +0000
Date: Thu, 18 Jul 2024 02:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: Dillon Varone <dillon.varone@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Alvin Lee <alvin.lee2@amd.com>
Subject: [agd5f:amd-staging-drm-next 2068/2106]
 drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn10/dcn10_optc.c:165:
 warning: Function parameter or struct member 'pstate_keepout' not described
 in 'optc1_program_timing'
Message-ID: <202407180250.YESc2Lsb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   889478d56917b8d584aef1c9517b76ec0cf599a0
commit: c34c3f7c8ada4e6f464312777ac656a1dd00a5df [2068/2106] drm/amd/display: Add P-State Keepout to dcn401 Global Sync
config: i386-randconfig-004-20240717 (https://download.01.org/0day-ci/archive/20240718/202407180250.YESc2Lsb-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180250.YESc2Lsb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407180250.YESc2Lsb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn10/dcn10_optc.c:165: warning: Function parameter or struct member 'pstate_keepout' not described in 'optc1_program_timing'


vim +165 drivers/gpu/drm/amd/amdgpu/../display/dc/optc/dcn10/dcn10_optc.c

a122b62d8ac484 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Anthony Koo          2019-01-20  138  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  139  /**
ebbb0b103efdcf drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Srinivasan Shanmugam 2023-06-05  140   * optc1_program_timing() - used by mode timing set Program
ebbb0b103efdcf drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Srinivasan Shanmugam 2023-06-05  141   *                          CRTC Timing Registers - OTG_H_*,
ebbb0b103efdcf drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Srinivasan Shanmugam 2023-06-05  142   *                          OTG_V_*, Pixel repetition.
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  143   *                          Including SYNC. Call BIOS command table to program Timings.
ebbb0b103efdcf drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Srinivasan Shanmugam 2023-06-05  144   *
ebbb0b103efdcf drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Srinivasan Shanmugam 2023-06-05  145   * @optc: timing_generator instance.
ebbb0b103efdcf drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Srinivasan Shanmugam 2023-06-05  146   * @dc_crtc_timing: Timing parameters used to configure DCN blocks.
ebbb0b103efdcf drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Srinivasan Shanmugam 2023-06-05  147   * @vready_offset: Vready's starting position.
ebbb0b103efdcf drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Srinivasan Shanmugam 2023-06-05  148   * @vstartup_start: Vstartup period.
ebbb0b103efdcf drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Srinivasan Shanmugam 2023-06-05  149   * @vupdate_offset: Vupdate starting position.
ebbb0b103efdcf drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Srinivasan Shanmugam 2023-06-05  150   * @vupdate_width: Vupdate duration.
ebbb0b103efdcf drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Srinivasan Shanmugam 2023-06-05  151   * @signal: DC signal types.
ebbb0b103efdcf drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Srinivasan Shanmugam 2023-06-05  152   * @use_vbios: to program timings from BIOS command table.
ebbb0b103efdcf drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Srinivasan Shanmugam 2023-06-05  153   *
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  154   */
40e045a9733f3c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Yue Hin Lau          2017-11-22  155  void optc1_program_timing(
40e045a9733f3c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Yue Hin Lau          2017-11-22  156  	struct timing_generator *optc,
62a3213aca0bf5 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Dmytro Laktyushkin   2017-06-28  157  	const struct dc_crtc_timing *dc_crtc_timing,
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  158  	int vready_offset,
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  159  	int vstartup_start,
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  160  	int vupdate_offset,
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  161  	int vupdate_width,
c34c3f7c8ada4e drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c        Dillon Varone        2024-07-03  162  	int pstate_keepout,
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  163  	const enum signal_type signal,
62a3213aca0bf5 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Dmytro Laktyushkin   2017-06-28  164  	bool use_vbios)
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08 @165  {
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  166  	struct dc_crtc_timing patched_crtc_timing;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  167  	uint32_t asic_blank_end;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  168  	uint32_t asic_blank_start;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  169  	uint32_t v_total;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  170  	uint32_t v_sync_end;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  171  	uint32_t h_sync_polarity, v_sync_polarity;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  172  	uint32_t start_point = 0;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  173  	uint32_t field_num = 0;
1ba0a5802fba04 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Qingqing Zhuo        2019-07-23  174  	enum h_timing_div_mode h_div = H_TIMING_NO_DIV;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  175  
40e045a9733f3c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Yue Hin Lau          2017-11-22  176  	struct optc *optc1 = DCN10TG_FROM_TG(optc);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  177  
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  178  	optc1->signal = signal;
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  179  	optc1->vready_offset = vready_offset;
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  180  	optc1->vstartup_start = vstartup_start;
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  181  	optc1->vupdate_offset = vupdate_offset;
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  182  	optc1->vupdate_width = vupdate_width;
c34c3f7c8ada4e drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c        Dillon Varone        2024-07-03  183  	optc1->pstate_keepout = pstate_keepout;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  184  	patched_crtc_timing = *dc_crtc_timing;
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  185  	apply_front_porch_workaround(&patched_crtc_timing);
ac31a24d9188a9 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Charlene Liu         2020-04-03  186  	optc1->orginal_patched_timing = patched_crtc_timing;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  187  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  188  	/* Load horizontal timing */
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  189  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  190  	/* CRTC_H_TOTAL = vesa.h_total - 1 */
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  191  	REG_SET(OTG_H_TOTAL, 0,
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  192  			OTG_H_TOTAL,  patched_crtc_timing.h_total - 1);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  193  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  194  	/* h_sync_start = 0, h_sync_end = vesa.h_sync_width */
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  195  	REG_UPDATE_2(OTG_H_SYNC_A,
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  196  			OTG_H_SYNC_A_START, 0,
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  197  			OTG_H_SYNC_A_END, patched_crtc_timing.h_sync_width);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  198  
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  199  	/* blank_start = line end - front porch */
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  200  	asic_blank_start = patched_crtc_timing.h_total -
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  201  			patched_crtc_timing.h_front_porch;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  202  
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  203  	/* blank_end = blank_start - active */
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  204  	asic_blank_end = asic_blank_start -
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  205  			patched_crtc_timing.h_border_right -
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  206  			patched_crtc_timing.h_addressable -
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  207  			patched_crtc_timing.h_border_left;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  208  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  209  	REG_UPDATE_2(OTG_H_BLANK_START_END,
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  210  			OTG_H_BLANK_START, asic_blank_start,
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  211  			OTG_H_BLANK_END, asic_blank_end);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  212  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  213  	/* h_sync polarity */
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  214  	h_sync_polarity = patched_crtc_timing.flags.HSYNC_POSITIVE_POLARITY ?
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  215  			0 : 1;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  216  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  217  	REG_UPDATE(OTG_H_SYNC_A_CNTL,
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  218  			OTG_H_SYNC_A_POL, h_sync_polarity);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  219  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  220  	v_total = patched_crtc_timing.v_total - 1;
4a0ad70d690c9b drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Charlene Liu         2018-09-18  221  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  222  	REG_SET(OTG_V_TOTAL, 0,
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  223  			OTG_V_TOTAL, v_total);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  224  
97416d4cbb9efa drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Yongqiang Sun        2017-06-26  225  	/* In case of V_TOTAL_CONTROL is on, make sure OTG_V_TOTAL_MAX and
97416d4cbb9efa drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Yongqiang Sun        2017-06-26  226  	 * OTG_V_TOTAL_MIN are equal to V_TOTAL.
97416d4cbb9efa drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Yongqiang Sun        2017-06-26  227  	 */
15e8b368981e1e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Rodrigo Siqueira     2021-03-12  228  	optc->funcs->set_vtotal_min_max(optc, v_total, v_total);
97416d4cbb9efa drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Yongqiang Sun        2017-06-26  229  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  230  	/* v_sync_start = 0, v_sync_end = v_sync_width */
4a0ad70d690c9b drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Charlene Liu         2018-09-18  231  	v_sync_end = patched_crtc_timing.v_sync_width;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  232  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  233  	REG_UPDATE_2(OTG_V_SYNC_A,
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  234  			OTG_V_SYNC_A_START, 0,
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  235  			OTG_V_SYNC_A_END, v_sync_end);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  236  
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  237  	/* blank_start = frame end - front porch */
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  238  	asic_blank_start = patched_crtc_timing.v_total -
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  239  			patched_crtc_timing.v_front_porch;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  240  
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  241  	/* blank_end = blank_start - active */
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  242  	asic_blank_end = asic_blank_start -
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  243  			patched_crtc_timing.v_border_bottom -
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  244  			patched_crtc_timing.v_addressable -
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  245  			patched_crtc_timing.v_border_top;
72942b3de8dadf drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2018-09-14  246  
a122b62d8ac484 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Anthony Koo          2019-01-20  247  	REG_UPDATE_2(OTG_V_BLANK_START_END,
a122b62d8ac484 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Anthony Koo          2019-01-20  248  			OTG_V_BLANK_START, asic_blank_start,
a122b62d8ac484 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Anthony Koo          2019-01-20  249  			OTG_V_BLANK_END, asic_blank_end);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  250  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  251  	/* v_sync polarity */
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  252  	v_sync_polarity = patched_crtc_timing.flags.VSYNC_POSITIVE_POLARITY ?
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  253  			0 : 1;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  254  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  255  	REG_UPDATE(OTG_V_SYNC_A_CNTL,
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  256  		OTG_V_SYNC_A_POL, v_sync_polarity);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  257  
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  258  	if (optc1->signal == SIGNAL_TYPE_DISPLAY_PORT ||
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  259  			optc1->signal == SIGNAL_TYPE_DISPLAY_PORT_MST ||
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  260  			optc1->signal == SIGNAL_TYPE_EDP) {
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  261  		start_point = 1;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  262  		if (patched_crtc_timing.flags.INTERLACE == 1)
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  263  			field_num = 1;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  264  	}
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  265  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  266  	/* Interlace */
da1043cf22d3b9 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Eric Bernstein       2018-11-09  267  	if (REG(OTG_INTERLACE_CONTROL)) {
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  268  		if (patched_crtc_timing.flags.INTERLACE == 1)
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  269  			REG_UPDATE(OTG_INTERLACE_CONTROL,
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  270  					OTG_INTERLACE_ENABLE, 1);
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  271  		else
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  272  			REG_UPDATE(OTG_INTERLACE_CONTROL,
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  273  					OTG_INTERLACE_ENABLE, 0);
da1043cf22d3b9 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Eric Bernstein       2018-11-09  274  	}
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  275  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  276  	/* VTG enable set to 0 first VInit */
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  277  	REG_UPDATE(CONTROL,
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  278  			VTG0_ENABLE, 0);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  279  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  280  	/* original code is using VTG offset to address OTG reg, seems wrong */
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  281  	REG_UPDATE_2(OTG_CONTROL,
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  282  			OTG_START_POINT_CNTL, start_point,
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  283  			OTG_FIELD_NUMBER_CNTL, field_num);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  284  
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  285  	optc->funcs->program_global_sync(optc,
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  286  			vready_offset,
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  287  			vstartup_start,
e7e10c464a481e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2019-04-08  288  			vupdate_offset,
c34c3f7c8ada4e drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c        Dillon Varone        2024-07-03  289  			vupdate_width,
c34c3f7c8ada4e drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c        Dillon Varone        2024-07-03  290  			pstate_keepout);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  291  
5200c4017ef25f drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Martin Leung         2020-12-02  292  	optc->funcs->set_vtg_params(optc, dc_crtc_timing, true);
6476a7c8f03156 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Joshua Aberback      2019-04-29  293  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  294  	/* TODO
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  295  	 * patched_crtc_timing.flags.HORZ_COUNT_BY_TWO == 1
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  296  	 * program_horz_count_by_2
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  297  	 * for DVI 30bpp mode, 0 otherwise
40e045a9733f3c drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Yue Hin Lau          2017-11-22  298  	 * program_horz_count_by_2(optc, &patched_crtc_timing);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  299  	 */
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  300  
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  301  	/* Enable stereo - only when we need to pack 3D frame. Other types
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  302  	 * of stereo handled in explicit call
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  303  	 */
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  304  
471689ee1585a9 drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c        Wenjing Liu          2024-04-17  305  	if (optc->funcs->is_two_pixels_per_container(&patched_crtc_timing) || optc1->opp_count == 2)
1ba0a5802fba04 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Qingqing Zhuo        2019-07-23  306  		h_div = H_TIMING_DIV_BY2;
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  307  
8673b8dc89518d drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Oliver Logush        2021-09-14  308  	if (REG(OPTC_DATA_FORMAT_CONTROL) && optc1->tg_mask->OPTC_DATA_FORMAT != 0) {
9b42868c3fd44f drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2020-09-16  309  		uint32_t data_fmt = 0;
9b42868c3fd44f drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2020-09-16  310  
9b42868c3fd44f drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2020-09-16  311  		if (patched_crtc_timing.pixel_encoding == PIXEL_ENCODING_YCBCR422)
9b42868c3fd44f drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2020-09-16  312  			data_fmt = 1;
9b42868c3fd44f drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2020-09-16  313  		else if (patched_crtc_timing.pixel_encoding == PIXEL_ENCODING_YCBCR420)
9b42868c3fd44f drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2020-09-16  314  			data_fmt = 2;
9b42868c3fd44f drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2020-09-16  315  
9b42868c3fd44f drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2020-09-16  316  		REG_UPDATE(OPTC_DATA_FORMAT_CONTROL, OPTC_DATA_FORMAT, data_fmt);
9b42868c3fd44f drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2020-09-16  317  	}
9b42868c3fd44f drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Dmytro Laktyushkin   2020-09-16  318  
64e7f91e7ac88e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Bhawanpreet Lakha    2020-05-21  319  	if (optc1->tg_mask->OTG_H_TIMING_DIV_MODE != 0) {
64e7f91e7ac88e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Bhawanpreet Lakha    2020-05-21  320  		if (optc1->opp_count == 4)
64e7f91e7ac88e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Bhawanpreet Lakha    2020-05-21  321  			h_div = H_TIMING_DIV_BY4;
64e7f91e7ac88e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Bhawanpreet Lakha    2020-05-21  322  
64e7f91e7ac88e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Bhawanpreet Lakha    2020-05-21  323  		REG_UPDATE(OTG_H_TIMING_CNTL,
64e7f91e7ac88e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Bhawanpreet Lakha    2020-05-21  324  		OTG_H_TIMING_DIV_MODE, h_div);
20f2ffe5047286 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Alex Deucher         2020-11-02  325  	} else {
1ba0a5802fba04 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Qingqing Zhuo        2019-07-23  326  		REG_UPDATE(OTG_H_TIMING_CNTL,
1ba0a5802fba04 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Qingqing Zhuo        2019-07-23  327  		OTG_H_TIMING_DIV_BY2, h_div);
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  328  	}
64e7f91e7ac88e drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c             Bhawanpreet Lakha    2020-05-21  329  }
70ccab604049bb drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c Harry Wentland       2017-05-08  330  

:::::: The code at line 165 was first introduced by commit
:::::: 70ccab604049bbb995a57ab3b7fe8a3c2fdbb736 drm/amdgpu/display: Add core dc support for DCN

:::::: TO: Harry Wentland <harry.wentland@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
