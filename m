Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861782C9C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 13:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675776064; x=1707312064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hB6AXE3Y8SYrawYXeK0FBc+tW0FaVPT0oobUbhsZCAs=;
  b=SQFhwfxGW+fz43TPrhByTTTkEP9Nk2q6bv+5FzsXv1BYT4ntCr20CkrB
   IOMKfUvohsYOCtEHWtHr0OdLa50SxRKokQfzPJ7XyfyY5uk5/oquf29jj
   FhRZWB043jjSVaFgSVlWHEqXgSn5hBo+5u/boMxtu8h6J+ibIrcgTyUDf
   nndZoQqGMJFPR3R9y8ZCxvzO9s3wKlgVzewEtIAizykgSKJbOHPptKaYg
   d4NuP5UyzwEpwZwbvqo2zX5sN/st7+0xy02yp0FvfByf5YfgY5uI4NJEx
   7jBUu/ArQaclEVoBPzbF/fb7DXFJSI+tmeJpcQ+NB7zVAJnlEvWehXoRj
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="313149195"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="313149195"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 05:21:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="666836901"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="666836901"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Feb 2023 05:21:02 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPNuA-0003ZK-0h;
	Tue, 07 Feb 2023 13:21:02 +0000
Date: Tue, 7 Feb 2023 21:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 1121/20208]
 drivers/gpu/drm/imx/dcss/dcss-rdsrc.c:86:13: warning: variable 'buf_size'
 set but not used
Message-ID: <202302072133.Xbv3CFX8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurentiu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 6796cfd611b0168dbe4c79fddda500adf40bca68 [1121/20208] drm/imx/dcss: add WRSCL/RDSRC support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230207/202302072133.Xbv3CFX8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/6796cfd611b0168dbe4c79fddda500adf40bca68
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 6796cfd611b0168dbe4c79fddda500adf40bca68
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/imx/dcss/dcss-rdsrc.c: In function 'dcss_rdsrc_setup':
>> drivers/gpu/drm/imx/dcss/dcss-rdsrc.c:86:13: warning: variable 'buf_size' set but not used [-Wunused-but-set-variable]
      86 |         u32 buf_size, pitch, bpp;
         |             ^~~~~~~~


vim +/buf_size +86 drivers/gpu/drm/imx/dcss/dcss-rdsrc.c

    82	
    83	void dcss_rdsrc_setup(struct dcss_rdsrc *rdsrc, u32 pix_format, u32 dst_xres,
    84			      u32 dst_yres, u32 base_addr)
    85	{
  > 86		u32 buf_size, pitch, bpp;
    87	
    88		/* since the scaler output is YUV444, the RDSRC output has to match */
    89		bpp = 4;
    90	
    91		rdsrc->ctrl_status = FIFO_512 << RDSRC_FIFO_SIZE_POS;
    92		rdsrc->ctrl_status |= PSIZE_256 << RDSRC_P_SIZE_POS;
    93		rdsrc->ctrl_status |= TSIZE_256 << RDSRC_T_SIZE_POS;
    94		rdsrc->ctrl_status |= BPP_32_10BIT_OUTPUT << RDSRC_BPP_POS;
    95	
    96		buf_size = dst_xres * dst_yres * bpp;
    97		pitch = dst_xres * bpp;
    98	
    99		rdsrc->buf_addr = base_addr;
   100	
   101		dcss_rdsrc_write(rdsrc, rdsrc->buf_addr, DCSS_RDSRC_BASE_ADDR);
   102		dcss_rdsrc_write(rdsrc, pitch, DCSS_RDSRC_PITCH);
   103		dcss_rdsrc_write(rdsrc, dst_xres, DCSS_RDSRC_WIDTH);
   104		dcss_rdsrc_write(rdsrc, dst_yres, DCSS_RDSRC_HEIGHT);
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
