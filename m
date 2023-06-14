Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A8125A2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 22:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686783490; x=1718319490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IJHTdKLuD8Hj7PVMz7Dq4Wv6vMbFgFWnfhV7Q8EXVY8=;
  b=Eir+Jv1jv2mzo+9Je6YJeX5NBogD+HRibtGrvW/pyU33cPYvyM7aSYz2
   O0Xx7ZkcEaMh/zq9X7Vl8PlPZLyUWSRshTufi4BA0v8sN1JlU8wxIIhcL
   GI6oCBdeMoTIIuneoXi+HoqdysTW7FiDm9sVok1nVSR9qTyhY2yym2onx
   wTaspvipaqddl+sQKB5sjNpjxmnhHf1eLTgh1dNMpqhnuWF/1CZL0Eq4D
   AX/t4oOELKZD+Q1iKofH2Dnqqg5xl2KKJbfglXgiKWHnoGKhF1yvtd7lS
   WjNrHYd7yCFuVVE0w54VCMfWtY06J8AzTi1wCsYUz8aRCPnRgi262Z2Mu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343453598"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="343453598"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 15:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="886434919"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="886434919"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Jun 2023 15:58:07 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9ZRG-00019J-0p;
	Wed, 14 Jun 2023 22:58:06 +0000
Date: Thu, 15 Jun 2023 06:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Athavale <rathaval@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radheys@xilinx.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS_2023.1_update 317/1079]
 drivers/media/platform/xilinx/xilinx-vpss-scaler.c:1236: warning: expecting
 prototype for xv_hscaler_coeff_select(). Prototype was for
 xv_hscaler_select_coeff() instead
Message-ID: <202306150620.5PQfEhHa-lkp@intel.com>
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
commit: ae291eb0ef46fbdf9e4ae097790036ab6730df64 [317/1079] v4l: xilinx-vpss-scaler: driver support for xilinx vpss scaler
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230615/202306150620.5PQfEhHa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/ae291eb0ef46fbdf9e4ae097790036ab6730df64
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
        git checkout ae291eb0ef46fbdf9e4ae097790036ab6730df64
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/xlnx/ drivers/media/platform/xilinx/ drivers/net/ethernet/xilinx/ drivers/staging/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306150620.5PQfEhHa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/xilinx/xilinx-vpss-scaler.c:1236: warning: expecting prototype for xv_hscaler_coeff_select(). Prototype was for xv_hscaler_select_coeff() instead
>> drivers/media/platform/xilinx/xilinx-vpss-scaler.c:1354: warning: expecting prototype for xv_vscaler_coeff_select(). Prototype was for xv_vscaler_select_coeff() instead


vim +1236 drivers/media/platform/xilinx/xilinx-vpss-scaler.c

  1209	
  1210	/**
  1211	 * xv_hscaler_coeff_select - Selection of H-Scaler coefficients of operation
  1212	 * @xscaler: VPSS Scaler device information
  1213	 * @width_in: Width of input video
  1214	 * @width_out: Width of desired output video
  1215	 *
  1216	 * There are instances when a N-tap filter might operate in an M-tap
  1217	 * configuration where N > M.
  1218	 *
  1219	 * For example :
  1220	 * Depending on the ratio of scaling (while downscaling), a 12-tap
  1221	 * filter may operate with 10 tap coefficients and zero-pads the remaining
  1222	 * coefficients.
  1223	 *
  1224	 * While upscaling the driver will program 6-tap filter coefficients
  1225	 * in any N-tap configurations (for N >= 6).
  1226	 *
  1227	 * This selection is adopted by the as it gives optimal
  1228	 * video output determined by repeated testing of the IP
  1229	 *
  1230	 * Return: Will return 0 if successful. Returns -EINVAL on an unsupported
  1231	 * H-scaler number of taps.
  1232	 */
  1233	static int
  1234	xv_hscaler_select_coeff(struct xscaler_device *xscaler,
  1235				u32 width_in, u32 width_out)
> 1236	{
  1237		const short *coeff;
  1238		u32 ntaps = xscaler->num_hori_taps;
  1239	
  1240		coeff = xv_select_coeff(xscaler, width_in, width_out, &ntaps);
  1241		if (!coeff)
  1242			return -EINVAL;
  1243	
  1244		xv_hscaler_load_ext_coeff(xscaler, coeff, ntaps);
  1245		return 0;
  1246	}
  1247	
  1248	static void xv_hscaler_set_coeff(struct xscaler_device *xscaler)
  1249	{
  1250		int val, i, j, offset, rd_indx;
  1251		u32 ntaps = xscaler->num_hori_taps;
  1252		u32 nphases = xscaler->max_num_phases;
  1253		u32 base_addr;
  1254	
  1255		offset = (XV_HSCALER_MAX_H_TAPS - ntaps) / 2;
  1256		base_addr = V_HSCALER_OFF + XV_HSCALER_CTRL_ADDR_HWREG_HFLTCOEFF_BASE;
  1257		for (i = 0; i < nphases; i++) {
  1258			for (j = 0; j < ntaps / 2; j++) {
  1259				rd_indx = j * 2 + offset;
  1260				val = (xscaler->hscaler_coeff[i][rd_indx + 1] <<
  1261				       XSCALER_BITSHIFT_16) |
  1262				       (xscaler->hscaler_coeff[i][rd_indx] &
  1263				       XHSC_MASK_LOW_16BITS);
  1264				 xvip_write(&xscaler->xvip, base_addr +
  1265					    ((i * ntaps / 2 + j) * 4), val);
  1266			}
  1267		}
  1268	}
  1269	
  1270	static void
  1271	xv_vscaler_load_ext_coeff(struct xscaler_device *xscaler,
  1272				  const short *coeff, u32 ntaps)
  1273	{
  1274		int i, j, pad, offset;
  1275		u32 nphases = xscaler->max_num_phases;
  1276	
  1277		/* Determine if coefficient needs padding (effective vs. max taps) */
  1278		pad = XV_VSCALER_MAX_V_TAPS - ntaps;
  1279		offset = pad ? (pad >> 1) : 0;
  1280	
  1281		dev_dbg(xscaler->xvip.dev,
  1282			"%s : Pad = %d Offset = %d Nphases = %d ntaps = %d",
  1283				__func__, pad, offset, nphases, ntaps);
  1284	
  1285		/* Load User defined coefficients into scaler coefficient table */
  1286		for (i = 0; i < nphases; i++) {
  1287			for (j = 0; j < ntaps; ++j)
  1288				xscaler->vscaler_coeff[i][j + offset] =
  1289							coeff[i * ntaps + j];
  1290		}
  1291	
  1292		if (pad) { /* effective taps < max_taps */
  1293			for (i = 0; i < nphases; i++) {
  1294				/* pad left */
  1295				for (j = 0; j < offset; j++)
  1296					xscaler->vscaler_coeff[i][j] = 0;
  1297				/* pad right */
  1298				j = ntaps + offset;
  1299				for (; j < XV_VSCALER_MAX_V_TAPS; j++)
  1300					xscaler->vscaler_coeff[i][j] = 0;
  1301			}
  1302		}
  1303	}
  1304	
  1305	static void xv_vscaler_set_coeff(struct xscaler_device *xscaler)
  1306	{
  1307		u32 nphases = xscaler->max_num_phases;
  1308		u32 ntaps   = xscaler->num_vert_taps;
  1309		int val, i, j, offset, rd_indx;
  1310		u32 base_addr;
  1311	
  1312		offset = (XV_VSCALER_MAX_V_TAPS - ntaps) / 2;
  1313		base_addr = V_VSCALER_OFF + XV_VSCALER_CTRL_ADDR_HWREG_VFLTCOEFF_BASE;
  1314	
  1315		for (i = 0; i < nphases; i++) {
  1316			for (j = 0; j < ntaps / 2; j++) {
  1317				rd_indx = j * 2 + offset;
  1318				val = (xscaler->vscaler_coeff[i][rd_indx + 1] <<
  1319				       XSCALER_BITSHIFT_16) |
  1320				       (xscaler->vscaler_coeff[i][rd_indx] &
  1321				       XVSC_MASK_LOW_16BITS);
  1322				xvip_write(&xscaler->xvip,
  1323					   base_addr + ((i * ntaps / 2 + j) * 4), val);
  1324			}
  1325		}
  1326	}
  1327	
  1328	/**
  1329	 * xv_vscaler_coeff_select - Selection of V-Scaler coefficients of operation
  1330	 * @xscaler: VPSS Scaler device information
  1331	 * @height_in: Height of input video
  1332	 * @height_out: Height of desired output video
  1333	 *
  1334	 * There are instances when a N-tap filter might operate in an M-tap
  1335	 * configuration where N > M.
  1336	 *
  1337	 * For example :
  1338	 * Depending on the ratio of scaling (while downscaling), a 10-tap
  1339	 * filter may operate with 6 tap coefficients and zero-pads the remaining
  1340	 * coefficients.
  1341	 *
  1342	 * While upscaling the driver will program 6-tap filter coefficients
  1343	 * in any N-tap configurations (for N >= 6).
  1344	 *
  1345	 * This selection is adopted by the as it gives optimal
  1346	 * video output determined by repeated testing of the IP
  1347	 *
  1348	 * Return: Will return 0 if successful. Returns -EINVAL on an unsupported
  1349	 * V-scaler number of taps.
  1350	 */
  1351	static int
  1352	xv_vscaler_select_coeff(struct xscaler_device *xscaler,
  1353				u32 height_in, u32 height_out)
> 1354	{
  1355		const short *coeff;
  1356		u32 ntaps = xscaler->num_vert_taps;
  1357	
  1358		coeff = xv_select_coeff(xscaler, height_in, height_out, &ntaps);
  1359		if (!coeff)
  1360			return -EINVAL;
  1361	
  1362		xv_vscaler_load_ext_coeff(xscaler, coeff, ntaps);
  1363		return 0;
  1364	}
  1365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
