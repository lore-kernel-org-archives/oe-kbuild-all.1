Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76D115B4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 01:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675561925; x=1707097925;
  h=date:from:cc:subject:message-id:mime-version;
  bh=zkuOL7L8kILrqGOAJ7lQVdZuKJ5PKUg5Vx179Y+xqhQ=;
  b=i2u2EVzZZUdiLxB48coHYGZ4KLYEYtsZ4GReO/uBlwFKOfL+nfXQO+Mb
   cTkScRxuBsMaJqlsc4D3/k8ALH5CkTAt6+s9ln2DC5VHLR35kb1RJKfrd
   n/LZuonidV1Wo9p74p8PgDlYN05cx3LZ7X4sUgWdJy2RnHKwrjp8BuNPm
   qDGWFYc8XhGUewJFzUJjc2hTuGDtYMlitKW+RS6M9Uf2AhhjQ9hZog6PF
   HSRCkaqrn8UtnNFTMU0K0UICwENvvAoNPB8JQpY6ZbFPe0tOAKWgp/WWj
   ey5KmRjW8yQahnCm9RUyOXzBA0GXKomuVSrheRfIL37NoOC7s7zgiWpTN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="330303273"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="330303273"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 17:52:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="666132630"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="666132630"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Feb 2023 17:52:04 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOUCJ-0001eU-1n;
	Sun, 05 Feb 2023 01:52:03 +0000
Date: Sun, 5 Feb 2023 09:51:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:5.15/linux 20057/22285]
 drivers/gpu/drm/vkms/vkms_plane.c:102:6: warning: variable 'fmt' set but not
 used
Message-ID: <202302050956.A7oShcee-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   3fcbe6a0b3dc32ae64e534484770059e644250bc
commit: 5aeec08d7e1a50abcf959377b9735cc2e7f56687 [20057/22285] drm/vkms: fix variable dereferenced before check warning
config: riscv-randconfig-r042-20230205 (https://download.01.org/0day-ci/archive/20230205/202302050956.A7oShcee-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel/linux-intel-lts/commit/5aeec08d7e1a50abcf959377b9735cc2e7f56687
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.15/linux
        git checkout 5aeec08d7e1a50abcf959377b9735cc2e7f56687
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/vkms/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vkms/vkms_plane.c:102:6: warning: variable 'fmt' set but not used [-Wunused-but-set-variable]
           u32 fmt;
               ^
   1 warning generated.


vim +/fmt +102 drivers/gpu/drm/vkms/vkms_plane.c

    92	
    93	static void vkms_plane_atomic_update(struct drm_plane *plane,
    94					     struct drm_atomic_state *state)
    95	{
    96		struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
    97										   plane);
    98		struct vkms_plane_state *vkms_plane_state;
    99		struct drm_shadow_plane_state *shadow_plane_state;
   100		struct drm_framebuffer *fb = new_state->fb;
   101		struct vkms_frame_info *frame_info;
 > 102		u32 fmt;
   103	
   104		if (!new_state->crtc || !fb)
   105			return;
   106	
   107		fmt = fb->format->format;
   108		vkms_plane_state = to_vkms_plane_state(new_state);
   109		shadow_plane_state = &vkms_plane_state->base;
   110	
   111		frame_info = vkms_plane_state->frame_info;
   112		memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
   113		memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
   114		frame_info->fb = fb;
   115		memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
   116		drm_framebuffer_get(frame_info->fb);
   117		frame_info->offset = fb->offsets[0];
   118		frame_info->pitch = fb->pitches[0];
   119		frame_info->cpp = fb->format->cpp[0];
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
