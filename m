Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86ACD533
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 21:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680815235; x=1712351235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VoLLDF9MVAIjloSkpliRlQJxsY39EfmlYAD9O1M+fD8=;
  b=mp7vSxfpfqYx84PiFiWJT7lRXztQRcUjDjQuxOGClN45EdQ0Nsaj8Vic
   vGrUu3t4EmMZFcvU9C0jBXZojpA9gA/yQfu1mmx/g15Zt71xm16U1Nyyg
   gksbSBpeNvHEPHqTVCoxIx8V/C/pHgFaa7iBQxbitWoBwYzLGOAbOKXcH
   pY45BQEJBiixd+QTB6jcE4/x3uYNq4ODmhqlrF0xJ1jIXlGBI7cBdqBJH
   N+D3ktpfk478SU3ha7yp13h77BS+q5tiz2TDsa/MFhzJWGhU/jD6RZUm3
   914Dmb+Esg0tOPo3YrLfCBAQ9tnOv3tphGiH49dH+icHjD6F+XMt5pF02
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326914849"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="326914849"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 14:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="687291433"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="687291433"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Apr 2023 14:07:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkWp5-000RmG-1j;
	Thu, 06 Apr 2023 21:07:11 +0000
Date: Fri, 7 Apr 2023 05:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
	Melissa Wen <mwen@igalia.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/vkms: add module parameter to set background color
Message-ID: <202304070429.B1aKOT5a-lkp@intel.com>
References: <20230406172002.124456-1-mcanal@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230406172002.124456-1-mcanal@igalia.com>

Hi Maíra,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-ra-Canal/drm-vkms-add-module-parameter-to-set-background-color/20230407-012233
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230406172002.124456-1-mcanal%40igalia.com
patch subject: [PATCH] drm/vkms: add module parameter to set background color
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230407/202304070429.B1aKOT5a-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d725068207852d3b6a0dd795bf224422804101e1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ma-ra-Canal/drm-vkms-add-module-parameter-to-set-background-color/20230407-012233
        git checkout d725068207852d3b6a0dd795bf224422804101e1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070429.B1aKOT5a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vkms/vkms_composer.c: In function 'blend':
>> drivers/gpu/drm/vkms/vkms_composer.c:93:59: warning: right shift count >= width of type [-Wshift-count-overflow]
      93 |                 .r = (*vkms_dev->config->background_color >> 32) & 0xffff,
         |                                                           ^~


vim +93 drivers/gpu/drm/vkms/vkms_composer.c

    70	
    71	/**
    72	 * @wb_frame_info: The writeback frame buffer metadata
    73	 * @crtc_state: The crtc state
    74	 * @crc32: The crc output of the final frame
    75	 * @output_buffer: A buffer of a row that will receive the result of the blend(s)
    76	 * @stage_buffer: The line with the pixels from plane being blend to the output
    77	 *
    78	 * This function blends the pixels (Using the `pre_mul_alpha_blend`)
    79	 * from all planes, calculates the crc32 of the output from the former step,
    80	 * and, if necessary, convert and store the output to the writeback buffer.
    81	 */
    82	static void blend(struct vkms_device *vkms_dev,
    83			  struct vkms_writeback_job *wb,
    84			  struct vkms_crtc_state *crtc_state,
    85			  u32 *crc32, struct line_buffer *stage_buffer,
    86			  struct line_buffer *output_buffer, size_t row_size)
    87	{
    88		struct vkms_plane_state **plane = crtc_state->active_planes;
    89		u32 n_active_planes = crtc_state->num_active_planes;
    90	
    91		const struct pixel_argb_u16 background_color = {
    92			.a =  0xffff,
  > 93			.r = (*vkms_dev->config->background_color >> 32) & 0xffff,
    94			.g = (*vkms_dev->config->background_color >> 16) & 0xffff,
    95			.b = *vkms_dev->config->background_color & 0xffff,
    96		};
    97	
    98		size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
    99	
   100		for (size_t y = 0; y < crtc_y_limit; y++) {
   101			fill_background(&background_color, output_buffer);
   102	
   103			/* The active planes are composed associatively in z-order. */
   104			for (size_t i = 0; i < n_active_planes; i++) {
   105				if (!check_y_limit(plane[i]->frame_info, y))
   106					continue;
   107	
   108				plane[i]->plane_read(stage_buffer, plane[i]->frame_info, y);
   109				pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
   110						    output_buffer);
   111			}
   112	
   113			*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
   114	
   115			if (wb)
   116				wb->wb_write(&wb->wb_frame_info, output_buffer, y);
   117		}
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
