Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB24644
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 05:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685167196; x=1716703196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sW4G7Fo2VCBBwcBAti3rUL2ihkjDLtil+XPo2QbdGDs=;
  b=Qg1eaG+22gtYVXzSeJK2oZJJ9DRvpDf+C64nqd4zADpfweMJk9bavqra
   Mz/zsK2b42b/Ta1QKLloT6W4cYEeK1bsWx8GjYYZb5SiB+M0xSK7YF5PO
   J52xNieWqsRce85CJPfjId8KqSmazVCuHXlv+BuHQH/Ef2eCvPqUMQ3Xv
   HMgN1+hYkDspnfKc6IAzDe1e6oQyqUgK9UCaETshWi/cRuJUsR/oFVZW9
   opayhfsp8Ta5JHDHyuHsnb4H2Ryxi7ac5exO19sRKZfZeHAvs73WBj7Qp
   tSIcvKK63cxSLMZvtBh3P9uGkHEfSSFcaIwXb2JSxI+WWxGzeeYvI2EoV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="338963344"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="338963344"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 22:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="775305377"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="775305377"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 May 2023 22:59:54 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2my1-000Jny-2t;
	Sat, 27 May 2023 05:59:53 +0000
Date: Sat, 27 May 2023 13:59:45 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 1061/9879]
 drivers/gpu/drm/imx/dcss/dcss-rdsrc.c:86:13: warning: variable 'buf_size'
 set but not used
Message-ID: <202305271311.jsdNHHt2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: 8d181fada260045dcc130d3b82e9e49f37f60dd6 [1061/9879] drm/imx/dcss: add WRSCL/RDSRC support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230527/202305271311.jsdNHHt2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/8d181fada260045dcc130d3b82e9e49f37f60dd6
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout 8d181fada260045dcc130d3b82e9e49f37f60dd6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271311.jsdNHHt2-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
