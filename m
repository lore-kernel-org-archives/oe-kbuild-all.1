Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB03381DC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 20:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705870171; cv=none; b=cMkZIgwKISwATfUYhHekkkbL2GmzXtuT/xaZ06HAAjtJG3oaHhOJZXgg0Ang0SGUOIVHsrdAsdnzi+1ZbrThkZrDUHC9pypR3a0R/LFYpkSjhBFS567fFde39qE2tPfaOOK2bl7BIX/SWppgVypCzc/NuHfOhHN4n8z3cEOSW5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705870171; c=relaxed/simple;
	bh=saRBhE+5LCAtfY/zhNqhBd690Z/h7NBkU0p1bYA1/Rg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r6GzRW2madqlFU51qTAyxg1cPMvVN6UCAX3/KEJVY+3Ij4c5ltR7y+Mcv1f0PL76N03AneJ6UkF5zDKL0XIvubpHsA21h6Qz8+hF0hMZJsMeeYKnsVvZv0dxF+aSsuEIooExLbKQ6MUZqRAnEoLkY61nvNOrTSwt4KlC+qvwFWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cP0IAtcQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cP0IAtcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705870169; x=1737406169;
  h=date:from:cc:subject:message-id:mime-version;
  bh=saRBhE+5LCAtfY/zhNqhBd690Z/h7NBkU0p1bYA1/Rg=;
  b=cP0IAtcQClwuwYa1gj+6hSiQuE+tjhb4xwJl7ACX6ZuGLHFyY7HKN8Yh
   53bJRipj928BhoJUPparwtvXp48tdBE7L/ABup8S2dbCQIV0z3ENoq0td
   k4cSVSjd3jbZleagcLcv34ig74TvkfTCaN8TpOFSguKufYGkHmSmuqdWV
   t04ZEJjN8n4r+FAnCl9t7BGAFZ/9CQnsHLSaPlmLW8LrWOXr26/qinD2J
   UoIB0C0sV/GTU6mdu+iwO8YMIP9QsiJFvwakN224JGrPW+2iLNM9YSCXb
   bXodyFC5zqbHZed2Fq7oAKFg7FEnd1LBQpsU1e/kpQT7XAV3Z/+PNWHIV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="8441617"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="8441617"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 12:49:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="761563461"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="761563461"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Jan 2024 12:49:26 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rReku-0006Bc-19
	for oe-kbuild-all@lists.linux.dev;
	Sun, 21 Jan 2024 20:49:24 +0000
Date: Mon, 22 Jan 2024 04:49:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 2228/6555]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5216:26:
 warning: no previous prototype for 'dm_determine_update_type_for_commit'
Message-ID: <202401220417.IZqwV8mr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 55c3dd9c16f4bc58948023e6d379413df74b1d91 [2228/6555] UPSTREAM: drm/amd/display: Build stream update and plane updates in dm
config: i386-randconfig-011-20240117 (https://download.01.org/0day-ci/archive/20240122/202401220417.IZqwV8mr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401220417.IZqwV8mr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401220417.IZqwV8mr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'dm_resume':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:733:27: warning: variable 'plane' set but not used [-Wunused-but-set-variable]
     733 |         struct drm_plane *plane;
         |                           ^~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:730:26: warning: variable 'crtc' set but not used [-Wunused-but-set-variable]
     730 |         struct drm_crtc *crtc;
         |                          ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_notify_freesync':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1733:37: warning: variable 'old_con_state' set but not used [-Wunused-but-set-variable]
    1733 |         struct drm_connector_state *old_con_state, *new_con_state;
         |                                     ^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1732:31: warning: variable 'connector' set but not used [-Wunused-but-set-variable]
    1732 |         struct drm_connector *connector;
         |                               ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3233:6: warning: no previous prototype for 'dm_drm_plane_destroy_state' [-Wmissing-prototypes]
    3233 | void dm_drm_plane_destroy_state(struct drm_plane *plane,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_atomic_commit_tail':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4478:31: warning: variable 'connector' set but not used [-Wunused-but-set-variable]
    4478 |         struct drm_connector *connector;
         |                               ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4837:6: warning: no previous prototype for 'set_freesync_on_stream' [-Wmissing-prototypes]
    4837 | void set_freesync_on_stream(struct amdgpu_display_manager *dm,
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5216:26: warning: no previous prototype for 'dm_determine_update_type_for_commit' [-Wmissing-prototypes]
    5216 | enum surface_update_type dm_determine_update_type_for_commit(struct dc *dc, struct drm_atomic_state *state)
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'dm_determine_update_type_for_commit':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5223:43: warning: variable 'old_plane_crtc' set but not used [-Wunused-but-set-variable]
    5223 |         struct drm_crtc *new_plane_crtc, *old_plane_crtc;
         |                                           ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5222:53: warning: variable 'old_dm_plane_state' set but not used [-Wunused-but-set-variable]
    5222 |         struct dm_plane_state *new_dm_plane_state, *old_dm_plane_state;
         |                                                     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_atomic_check':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5317:31: warning: variable 'connector' set but not used [-Wunused-but-set-variable]
    5317 |         struct drm_connector *connector;
         |                               ^~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:67:
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h: At top level:
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:208:29: warning: 'FUSE_BASE' defined but not used [-Wunused-const-variable=]
     208 | static const struct IP_BASE FUSE_BASE                   = { { { { 0x00017400, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:203:29: warning: 'CLK_BASE' defined but not used [-Wunused-const-variable=]
     203 | static const struct IP_BASE CLK_BASE                    = { { { { 0x00016C00, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:198:29: warning: 'PWR_BASE' defined but not used [-Wunused-const-variable=]
     198 | static const struct IP_BASE PWR_BASE                    = { { { { 0x00016A00, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:193:29: warning: 'SMUIO_BASE' defined but not used [-Wunused-const-variable=]
     193 | static const struct IP_BASE SMUIO_BASE                  = { { { { 0x00016800, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:188:29: warning: 'THM_BASE' defined but not used [-Wunused-const-variable=]
     188 | static const struct IP_BASE THM_BASE                    = { { { { 0x00016600, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:183:29: warning: 'UMC_BASE' defined but not used [-Wunused-const-variable=]
     183 | static const struct IP_BASE UMC_BASE                    = { { { { 0x00014000, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:178:29: warning: 'XDMA_BASE' defined but not used [-Wunused-const-variable=]
     178 | static const struct IP_BASE XDMA_BASE                   = { { { { 0x00003400, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:173:29: warning: 'SDMA1_BASE' defined but not used [-Wunused-const-variable=]
     173 | static const struct IP_BASE SDMA1_BASE                  = { { { { 0x00001460, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:168:29: warning: 'SDMA0_BASE' defined but not used [-Wunused-const-variable=]
     168 | static const struct IP_BASE SDMA0_BASE                  = { { { { 0x00001260, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:163:29: warning: 'OSSSYS_BASE' defined but not used [-Wunused-const-variable=]
     163 | static const struct IP_BASE OSSSYS_BASE         = { { { { 0x000010A0, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:158:29: warning: 'HDP_BASE' defined but not used [-Wunused-const-variable=]
     158 | static const struct IP_BASE HDP_BASE                    = { { { { 0x00000F20, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:153:29: warning: 'RSMU_BASE' defined but not used [-Wunused-const-variable=]
     153 | static const struct IP_BASE RSMU_BASE                   = { { { { 0x00012000, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:148:29: warning: 'MMHUB_BASE' defined but not used [-Wunused-const-variable=]
     148 | static const struct IP_BASE MMHUB_BASE                  = { { { { 0x0001A000, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:143:29: warning: 'GC_BASE' defined but not used [-Wunused-const-variable=]
     143 | static const struct IP_BASE GC_BASE                     = { { { { 0x00002000, 0x0000A000, 0, 0, 0 } },
         |                             ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:138:29: warning: 'VCE_BASE' defined but not used [-Wunused-const-variable=]
     138 | static const struct IP_BASE VCE_BASE                    = { { { { 0x00007E00, 0x00048800, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:133:29: warning: 'ATHUB_BASE' defined but not used [-Wunused-const-variable=]
     133 | static const struct IP_BASE ATHUB_BASE                  = { { { { 0x00000C20, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:128:29: warning: 'IOHC_BASE' defined but not used [-Wunused-const-variable=]
     128 | static const struct IP_BASE IOHC_BASE                   = { { { { 0x00010000, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:123:29: warning: 'L2IMU_BASE' defined but not used [-Wunused-const-variable=]
     123 | static const struct IP_BASE L2IMU_BASE                  = { { { { 0x00007DC0, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:118:29: warning: 'SYSTEMHUB_BASE' defined but not used [-Wunused-const-variable=]
     118 | static const struct IP_BASE SYSTEMHUB_BASE              = { { { { 0x00000EA0, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:113:29: warning: 'ISP_BASE' defined but not used [-Wunused-const-variable=]
     113 | static const struct IP_BASE ISP_BASE                    = { { { { 0x00018000, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:108:29: warning: 'DFX_BASE' defined but not used [-Wunused-const-variable=]
     108 | static const struct IP_BASE DFX_BASE                    = { { { { 0x00000580, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:103:29: warning: 'DFX_DAP_BASE' defined but not used [-Wunused-const-variable=]
     103 | static const struct IP_BASE DFX_DAP_BASE                = { { { { 0x000005A0, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:98:29: warning: 'DBGU_IO_BASE' defined but not used [-Wunused-const-variable=]
      98 | static const struct IP_BASE DBGU_IO_BASE                = { { { { 0x000001E0, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:93:29: warning: 'DBGU_NBIO_BASE' defined but not used [-Wunused-const-variable=]
      93 | static const struct IP_BASE DBGU_NBIO_BASE              = { { { { 0x000001C0, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:88:29: warning: 'DBGU_BASE' defined but not used [-Wunused-const-variable=]
      88 | static const struct IP_BASE DBGU_BASE                   = { { { { 0x00000180, 0x000001A0, 0, 0, 0 } },
         |                             ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:83:29: warning: 'VCN_BASE' defined but not used [-Wunused-const-variable=]
      83 | static const struct IP_BASE VCN_BASE                    = { { { { 0x00007800, 0x00007E00, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:78:29: warning: 'UVD_BASE' defined but not used [-Wunused-const-variable=]
      78 | static const struct IP_BASE UVD_BASE                    = { { { { 0x00007800, 0x00007E00, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:73:29: warning: 'DF_BASE' defined but not used [-Wunused-const-variable=]
      73 | static const struct IP_BASE DF_BASE                     = { { { { 0x00007000, 0, 0, 0, 0 } },
         |                             ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vega10_ip_offset.h:68:29: warning: 'MP2_BASE' defined but not used [-Wunused-const-variable=]


vim +/dm_determine_update_type_for_commit +5216 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

  5082	
  5083	static int dm_update_planes_state(struct dc *dc,
  5084					  struct drm_atomic_state *state,
  5085					  bool enable,
  5086					  bool *lock_and_validation_needed)
  5087	{
  5088		struct drm_crtc *new_plane_crtc, *old_plane_crtc;
  5089		struct drm_crtc_state *old_crtc_state, *new_crtc_state;
  5090		struct drm_plane *plane;
  5091		struct drm_plane_state *old_plane_state, *new_plane_state;
  5092		struct dm_crtc_state *dm_new_crtc_state, *dm_old_crtc_state;
  5093		struct dm_atomic_state *dm_state = to_dm_atomic_state(state);
  5094		struct dm_plane_state *dm_new_plane_state, *dm_old_plane_state;
  5095		int i ;
  5096		/* TODO return page_flip_needed() function */
  5097		bool pflip_needed  = !state->allow_modeset;
  5098		int ret = 0;
  5099	
  5100	
  5101		/* Add new planes, in reverse order as DC expectation */
  5102		for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
  5103			new_plane_crtc = new_plane_state->crtc;
  5104			old_plane_crtc = old_plane_state->crtc;
  5105			dm_new_plane_state = to_dm_plane_state(new_plane_state);
  5106			dm_old_plane_state = to_dm_plane_state(old_plane_state);
  5107	
  5108			/*TODO Implement atomic check for cursor plane */
  5109			if (plane->type == DRM_PLANE_TYPE_CURSOR)
  5110				continue;
  5111	
  5112			/* Remove any changed/removed planes */
  5113			if (!enable) {
  5114				if (pflip_needed &&
  5115				    plane->type != DRM_PLANE_TYPE_OVERLAY)
  5116					continue;
  5117	
  5118				if (!old_plane_crtc)
  5119					continue;
  5120	
  5121				old_crtc_state = drm_atomic_get_old_crtc_state(
  5122						state, old_plane_crtc);
  5123				dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
  5124	
  5125				if (!dm_old_crtc_state->stream)
  5126					continue;
  5127	
  5128				DRM_DEBUG_ATOMIC("Disabling DRM plane: %d on DRM crtc %d\n",
  5129						plane->base.id, old_plane_crtc->base.id);
  5130	
  5131				if (!dc_remove_plane_from_context(
  5132						dc,
  5133						dm_old_crtc_state->stream,
  5134						dm_old_plane_state->dc_state,
  5135						dm_state->context)) {
  5136	
  5137					ret = EINVAL;
  5138					return ret;
  5139				}
  5140	
  5141	
  5142				dc_plane_state_release(dm_old_plane_state->dc_state);
  5143				dm_new_plane_state->dc_state = NULL;
  5144	
  5145				*lock_and_validation_needed = true;
  5146	
  5147			} else { /* Add new planes */
  5148				struct dc_plane_state *dc_new_plane_state;
  5149	
  5150				if (drm_atomic_plane_disabling(plane->state, new_plane_state))
  5151					continue;
  5152	
  5153				if (!new_plane_crtc)
  5154					continue;
  5155	
  5156				new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_crtc);
  5157				dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
  5158	
  5159				if (!dm_new_crtc_state->stream)
  5160					continue;
  5161	
  5162				if (pflip_needed &&
  5163				    plane->type != DRM_PLANE_TYPE_OVERLAY)
  5164					continue;
  5165	
  5166				WARN_ON(dm_new_plane_state->dc_state);
  5167	
  5168				dc_new_plane_state = dc_create_plane_state(dc);
  5169				if (!dc_new_plane_state)
  5170					return -ENOMEM;
  5171	
  5172				DRM_DEBUG_DRIVER("Enabling DRM plane: %d on DRM crtc %d\n",
  5173						plane->base.id, new_plane_crtc->base.id);
  5174	
  5175				ret = fill_plane_attributes(
  5176					new_plane_crtc->dev->dev_private,
  5177					dc_new_plane_state,
  5178					new_plane_state,
  5179					new_crtc_state);
  5180				if (ret) {
  5181					dc_plane_state_release(dc_new_plane_state);
  5182					return ret;
  5183				}
  5184	
  5185				/*
  5186				 * Any atomic check errors that occur after this will
  5187				 * not need a release. The plane state will be attached
  5188				 * to the stream, and therefore part of the atomic
  5189				 * state. It'll be released when the atomic state is
  5190				 * cleaned.
  5191				 */
  5192				if (!dc_add_plane_to_context(
  5193						dc,
  5194						dm_new_crtc_state->stream,
  5195						dc_new_plane_state,
  5196						dm_state->context)) {
  5197	
  5198					dc_plane_state_release(dc_new_plane_state);
  5199					return -EINVAL;
  5200				}
  5201	
  5202				dm_new_plane_state->dc_state = dc_new_plane_state;
  5203	
  5204				/* Tell DC to do a full surface update every time there
  5205				 * is a plane change. Inefficient, but works for now.
  5206				 */
  5207				dm_new_plane_state->dc_state->update_flags.bits.full_update = 1;
  5208	
  5209				*lock_and_validation_needed = true;
  5210			}
  5211		}
  5212	
  5213	
  5214		return ret;
  5215	}
> 5216	enum surface_update_type dm_determine_update_type_for_commit(struct dc *dc, struct drm_atomic_state *state)
  5217	{
  5218	
  5219	
  5220		int i, j, num_plane;
  5221		struct drm_plane_state *old_plane_state, *new_plane_state;
  5222		struct dm_plane_state *new_dm_plane_state, *old_dm_plane_state;
  5223		struct drm_crtc *new_plane_crtc, *old_plane_crtc;
  5224		struct drm_plane *plane;
  5225	
  5226		struct drm_crtc *crtc;
  5227		struct drm_crtc_state *new_crtc_state, *old_crtc_state;
  5228		struct dm_crtc_state *new_dm_crtc_state, *old_dm_crtc_state;
  5229		struct dc_stream_status *status = NULL;
  5230	
  5231		struct dc_surface_update *updates = kzalloc(MAX_SURFACES * sizeof(struct dc_surface_update), GFP_KERNEL);
  5232		struct dc_plane_state *surface = kzalloc(MAX_SURFACES * sizeof(struct dc_plane_state), GFP_KERNEL);
  5233		struct dc_stream_update stream_update;
  5234		enum surface_update_type update_type = UPDATE_TYPE_FAST;
  5235	
  5236	
  5237		for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
  5238			new_dm_crtc_state = to_dm_crtc_state(new_crtc_state);
  5239			old_dm_crtc_state = to_dm_crtc_state(old_crtc_state);
  5240			num_plane = 0;
  5241	
  5242			if (new_dm_crtc_state->stream) {
  5243	
  5244				for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, j) {
  5245					new_plane_crtc = new_plane_state->crtc;
  5246					old_plane_crtc = old_plane_state->crtc;
  5247					new_dm_plane_state = to_dm_plane_state(new_plane_state);
  5248					old_dm_plane_state = to_dm_plane_state(old_plane_state);
  5249	
  5250					if (plane->type == DRM_PLANE_TYPE_CURSOR)
  5251						continue;
  5252	
  5253					if (!state->allow_modeset)
  5254						continue;
  5255	
  5256					if (crtc == new_plane_crtc) {
  5257						updates[num_plane].surface = &surface[num_plane];
  5258	
  5259						if (new_crtc_state->mode_changed) {
  5260							updates[num_plane].surface->src_rect =
  5261										new_dm_plane_state->dc_state->src_rect;
  5262							updates[num_plane].surface->dst_rect =
  5263										new_dm_plane_state->dc_state->dst_rect;
  5264							updates[num_plane].surface->rotation =
  5265										new_dm_plane_state->dc_state->rotation;
  5266							updates[num_plane].surface->in_transfer_func =
  5267										new_dm_plane_state->dc_state->in_transfer_func;
  5268							stream_update.dst = new_dm_crtc_state->stream->dst;
  5269							stream_update.src = new_dm_crtc_state->stream->src;
  5270						}
  5271	
  5272						if (new_crtc_state->color_mgmt_changed) {
  5273							updates[num_plane].gamma =
  5274									new_dm_plane_state->dc_state->gamma_correction;
  5275							updates[num_plane].in_transfer_func =
  5276									new_dm_plane_state->dc_state->in_transfer_func;
  5277							stream_update.gamut_remap =
  5278									&new_dm_crtc_state->stream->gamut_remap_matrix;
  5279							stream_update.out_transfer_func =
  5280									new_dm_crtc_state->stream->out_transfer_func;
  5281						}
  5282	
  5283						num_plane++;
  5284					}
  5285				}
  5286	
  5287				if (num_plane > 0) {
  5288					status = dc_stream_get_status(new_dm_crtc_state->stream);
  5289					update_type = dc_check_update_surfaces_for_stream(dc, updates, num_plane,
  5290											  &stream_update, status);
  5291	
  5292					if (update_type > UPDATE_TYPE_MED) {
  5293						update_type = UPDATE_TYPE_FULL;
  5294						goto ret;
  5295					}
  5296				}
  5297	
  5298			} else if (!new_dm_crtc_state->stream && old_dm_crtc_state->stream) {
  5299				update_type = UPDATE_TYPE_FULL;
  5300				goto ret;
  5301			}
  5302		}
  5303	
  5304	ret:
  5305		kfree(updates);
  5306		kfree(surface);
  5307	
  5308		return update_type;
  5309	}
  5310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
