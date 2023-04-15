Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407157E4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 04:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681533073; x=1713069073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pl1v9j8IQ1yAwnWXCNXV3TJzVycL4unFVEVP10K+u20=;
  b=BjXZnSguiQ+/WlLQGWTebxDyA2X6GtnY8A+GWj4udZOyur/3VtAoVuFO
   Z5VfIbzgdKMqz30nGXmYJJul1JlU+MztgyWIY3lMkeJHQCMFhV/vdG3kG
   JYTPbO3JPHRz4P6S0B8TGuXolfjQK+EC+Aysv/qFCsCyGyPUvUokNPqwF
   pU6kB81llaeU96w6HzA1W2eMLEn7hWiSBRjdA7wWO3WzQrGufa9QFcGJG
   wWW87JnBSZa44USpgzU58/VFAot5Pg7SOfJusPqL2wqjK0YGTCUdRYuSb
   59yAzORGFu8YHIlwaVzj7UQlfUt60taeagAhQuRXqChiOFADqwunF4Mqz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="333400764"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="333400764"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 21:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="864416045"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="864416045"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Apr 2023 21:31:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnXZ8-000aR1-24;
	Sat, 15 Apr 2023 04:31:10 +0000
Date: Sat, 15 Apr 2023 12:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4742/9838]
 drivers/staging/media/imx/imx8-media-dev.c:727:1: warning: no previous
 prototype for 'mxc_md_parse_hdmi_rx_entity'
Message-ID: <202304151208.69Nm1KlU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: aa6e8979d728efcceef49ae02440bdda255e04e8 [4742/9838] Merge remote-tracking branch 'origin/capture/media-dev' into capture/next
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304151208.69Nm1KlU-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/aa6e8979d728efcceef49ae02440bdda255e04e8
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout aa6e8979d728efcceef49ae02440bdda255e04e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/mailbox/ drivers/media/platform/ drivers/net/ drivers/pwm/ drivers/regulator/ drivers/soc/imx/ drivers/staging/ drivers/video/fbdev/ sound/soc/fsl/ sound/soc/sof/amd/ sound/soc/sof/imx/ sound/soc/sof/intel/ sound/soc/sof/mediatek/mt8186/ sound/soc/sof/mediatek/mt8195/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151208.69Nm1KlU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx8-media-dev.c:625:6: warning: no previous prototype for 'mxc_sensor_notify' [-Wmissing-prototypes]
     625 | void mxc_sensor_notify(struct v4l2_subdev *sd, unsigned int notification,
         |      ^~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-media-dev.c:727:1: warning: no previous prototype for 'mxc_md_parse_hdmi_rx_entity' [-Wmissing-prototypes]
     727 | mxc_md_parse_hdmi_rx_entity(struct mxc_md *mxc_md, struct device_node *node)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mxc_md_parse_hdmi_rx_entity +727 drivers/staging/media/imx/imx8-media-dev.c

fd112bb6a0c292 Guoniu.zhou 2019-01-22  725  
ae19f942de1797 Sandor Yu   2020-11-16  726  struct mxc_hdmi_rx_info*
ae19f942de1797 Sandor Yu   2020-11-16 @727  mxc_md_parse_hdmi_rx_entity(struct mxc_md *mxc_md, struct device_node *node)
ae19f942de1797 Sandor Yu   2020-11-16  728  {
ae19f942de1797 Sandor Yu   2020-11-16  729  	struct mxc_hdmi_rx_info *hdmi_rx;
ae19f942de1797 Sandor Yu   2020-11-16  730  
ae19f942de1797 Sandor Yu   2020-11-16  731  	if (!mxc_md || !node)
ae19f942de1797 Sandor Yu   2020-11-16  732  		return NULL;
ae19f942de1797 Sandor Yu   2020-11-16  733  
ae19f942de1797 Sandor Yu   2020-11-16  734  	hdmi_rx = &mxc_md->hdmi_rx;
ae19f942de1797 Sandor Yu   2020-11-16  735  	if (!hdmi_rx)
ae19f942de1797 Sandor Yu   2020-11-16  736  		return NULL;
ae19f942de1797 Sandor Yu   2020-11-16  737  
ae19f942de1797 Sandor Yu   2020-11-16  738  	hdmi_rx->node = node;
ae19f942de1797 Sandor Yu   2020-11-16  739  	sprintf(hdmi_rx->sd_name, "mxc-hdmi-rx");
ae19f942de1797 Sandor Yu   2020-11-16  740  
ae19f942de1797 Sandor Yu   2020-11-16  741  	return hdmi_rx;
ae19f942de1797 Sandor Yu   2020-11-16  742  }
ae19f942de1797 Sandor Yu   2020-11-16  743  

:::::: The code at line 727 was first introduced by commit
:::::: ae19f942de17973a20994b89eeec1660548ad118 MLK-24081-04: staging: media: imx_csi: support hdmi rx for imx8qm

:::::: TO: Sandor Yu <Sandor.yu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
