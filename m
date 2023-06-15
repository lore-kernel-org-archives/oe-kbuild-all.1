Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E8536A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 02:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686797808; x=1718333808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+F9AswzTQa6ajVliWWfRyyUcyEkQ487bADUOrnI+rl8=;
  b=Vxvr2eQrfULCAWhxqCVKoIflwdlzeFcfcNiD8y2K8axs6bdslHX9z/AG
   lVSzjhylB2kkVk5fxaOusYyyuh0jWiP6btY4iwfzKHfRv50LsZDvmy4EA
   mYOnjHxJMW2rco7k7/dd1Ipe+5CQU7swDVXUvGZVEWJuzl0PoHJGPlbOe
   zfdHy2QT+p1VNSJxxAHStZYUrhyjZldJt+1w53fAfzAofAd7TZVbovCCq
   9ng2e9wENhaAUyhb1X5QakXWqhQ8gfPIWR0futR7CKMXz8R4fILfxITrB
   ebapWWnvJtfmozU8bc3jLmEH/C8p85ES8v4lYOb0QVVdoFH++mfZ+mjbQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="387213420"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="387213420"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 19:56:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="886496654"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="886496654"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Jun 2023 19:56:45 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9dA7-0001KT-0k;
	Thu, 15 Jun 2023 02:56:39 +0000
Date: Thu, 15 Jun 2023 10:55:49 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateshwar Rao G <venkateshwar.rao.gannavarapu@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS_2023.1_update 353/1079]
 drivers/gpu/drm/xlnx/xlnx_scaler.c:1394:21: warning: variable 'fmt_out' set
 but not used
Message-ID: <202306151012.3rVTH7tD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
head:   b8d15414a440db0904ee32f03268e2d262dbf397
commit: af45feae931d1696e8c45cdc0b516659f026c2e5 [353/1079] drm: xlnx: scaler: Adding vpss-scaler driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230615/202306151012.3rVTH7tD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/af45feae931d1696e8c45cdc0b516659f026c2e5
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
        git checkout af45feae931d1696e8c45cdc0b516659f026c2e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/xlnx/ drivers/media/platform/xilinx/ drivers/net/ethernet/xilinx/ drivers/staging/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151012.3rVTH7tD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/xlnx_scaler.c: In function 'xilinx_scaler_stream':
>> drivers/gpu/drm/xlnx/xlnx_scaler.c:1394:21: warning: variable 'fmt_out' set but not used [-Wunused-but-set-variable]
    1394 |         u32 fmt_in, fmt_out;
         |                     ^~~~~~~
>> drivers/gpu/drm/xlnx/xlnx_scaler.c:1394:13: warning: variable 'fmt_in' set but not used [-Wunused-but-set-variable]
    1394 |         u32 fmt_in, fmt_out;
         |             ^~~~~~
--
>> drivers/gpu/drm/xlnx/xlnx_scaler.c:934: warning: expecting prototype for xv_hscaler_coeff_select(). Prototype was for xv_hscaler_select_coeff() instead
>> drivers/gpu/drm/xlnx/xlnx_scaler.c:1119: warning: expecting prototype for xv_vscaler_coeff_select(). Prototype was for xv_vscaler_select_coeff() instead


vim +/fmt_out +1394 drivers/gpu/drm/xlnx/xlnx_scaler.c

  1383	
  1384	/**
  1385	 * xilinx_scaler_stream - Set up v-scaler and h-scaler for streaming
  1386	 * @scaler: Pointer to scaler device structure
  1387	 *
  1388	 * This function sets up the required configuration of v-scaler and h-scaler
  1389	 *
  1390	 * Return: 0 on success. Returns -EINVAL on failure conditions.
  1391	 */
  1392	static int xilinx_scaler_stream(struct xilinx_scaler *scaler)
  1393	{
> 1394		u32 fmt_in, fmt_out;
  1395		u32 pixel_rate;
  1396		u32 line_rate;
  1397		int ret;
  1398	
  1399		fmt_in = scaler->fmt_in;
  1400		fmt_out = scaler->fmt_out;
  1401		line_rate = (scaler->height_in * STEP_PRECISION) / scaler->height_out;
  1402	
  1403		if (scaler->is_polyphase) {
  1404			ret = xv_vscaler_select_coeff(scaler, scaler->height_in,
  1405						      scaler->height_out);
  1406			if (ret < 0) {
  1407				dev_info(scaler->dev, "Failed: vscaler select coeff\n");
  1408				return ret;
  1409			}
  1410			xv_vscaler_set_coeff(scaler);
  1411		}
  1412		xilinx_scaler_write(scaler->base, V_VSCALER_OFF +
  1413				    XV_VSCALER_CTRL_ADDR_HWREG_LINERATE_DATA,
  1414				    line_rate);
  1415		ret = xv_vscaler_setup_video_fmt(scaler, scaler->fmt_in);
  1416		if (ret < 0) {
  1417			dev_info(scaler->dev, "Failed: vscaler setup video format\n");
  1418			return ret;
  1419		}
  1420		pixel_rate = (scaler->width_in * STEP_PRECISION) / scaler->width_out;
  1421		xilinx_scaler_write(scaler->base, V_HSCALER_OFF +
  1422				    XV_HSCALER_CTRL_ADDR_HWREG_PIXELRATE_DATA,
  1423				    pixel_rate);
  1424		ret = xv_hscaler_setup_video_fmt(scaler, scaler->fmt_out, ret);
  1425		if (ret < 0) {
  1426			dev_info(scaler->dev, "Failed: vscaler setup video format\n");
  1427			return ret;
  1428		}
  1429		if (scaler->is_polyphase) {
  1430			ret = xv_hscaler_select_coeff(scaler, scaler->width_in,
  1431						      scaler->width_out);
  1432			if (ret < 0) {
  1433				dev_info(scaler->dev, "Failed: hscaler select coeff\n");
  1434				return ret;
  1435			}
  1436			xv_hscaler_set_coeff(scaler);
  1437		}
  1438		xv_hscaler_calculate_phases(scaler, scaler->width_in,
  1439					    scaler->width_out, pixel_rate);
  1440		xv_hscaler_set_phases(scaler);
  1441		return 0;
  1442	}
  1443	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
