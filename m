Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B8F7E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 05:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKljkazA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697262839; x=1728798839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KeWOg5UBNYpiWrIJo2mfv54gPj5FlUQ0totsN9IBQJA=;
  b=nKljkazAO7lpQoDvbODqjlP2tIEY/D/ly5WmcTdysOxYSl4qLDGoLcdS
   5ZhhN3MrRkZACmazNB3gwHhEBRcJVWgLHkwICuW81BoAp9OJ4rwxf9vBc
   t1gAaeVaJf13Tv1iqJAWKqkiLu8pfTmEUvYCMdy+84yyhemS7/xCQJNg2
   +5BOaEmxbboAhFU1PO1Ui0my49wFfNMdpKIxLGjvv8cIJMON4+6kvS2XE
   bWkNu+DKcvLQzz2LjJ7YgumlqaW+lzoMNk0q8YZYec1+hM0b+vR4lbu29
   C7K9Efakvi6iAEM8ugoi8CE/uTpvfpfau7mocME1XepqiGSKQkPMqzmBe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="389165418"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="389165418"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 22:53:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="820903977"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="820903977"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 13 Oct 2023 22:53:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrXb1-0005kd-0f;
	Sat, 14 Oct 2023 05:53:55 +0000
Date: Sat, 14 Oct 2023 13:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 1121/25021]
 drivers/gpu/drm/imx/dcss/dcss-rdsrc.c:86:13: warning: variable 'buf_size'
 set but not used
Message-ID: <202310141330.sZXVYnG8-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: 6796cfd611b0168dbe4c79fddda500adf40bca68 [1121/25021] drm/imx/dcss: add WRSCL/RDSRC support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231014/202310141330.sZXVYnG8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141330.sZXVYnG8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141330.sZXVYnG8-lkp@intel.com/

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
