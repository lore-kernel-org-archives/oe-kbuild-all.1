Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66945347C6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 12:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P041RLRm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697632431; x=1729168431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ohpHPCuV3zTimpRAZZruIryiZ6eKvWd8i3PcWsvwzU=;
  b=P041RLRmm5oOo2P5Yc4gnt51mMfJw3nS0eH65T2h9l5X3yM5KkGnIFS7
   VaeS7hnh2wueXRZqrLggplmzH0QuSItwCkFaCi+aFGruUAGTOM1o3WGlH
   LqBl9V/VDEuNGt7BbTiRSCYDWkY/uS1pLSm5S0a0H139vEQ+EdwFW0epj
   c9yYGrcsvw+40kva52m7QaIsW3bLjkcd8xTT5ZITEVEI18A+7E9CvXMAg
   PlHV8xQg/ODEzrNxqqyO/QbDFK2ADPPYJVrQEXnoe4bbueoU4oJiTH00w
   ctBJcppxj+BWB1pnEnM5297c/9gjZJGtEZwvMJMJEwD683WFZB3cdUtk9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="452471742"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="452471742"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 05:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="873012990"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="873012990"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2023 05:33:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt5k9-0000MI-1k;
	Wed, 18 Oct 2023 12:33:45 +0000
Date: Wed, 18 Oct 2023 20:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: Subhajit Paul <subhajit_paul@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 149/382]
 drivers/rpmsg-kdrv/rpmsg_kdrv.c:228:24: warning: array subscript <unknown>
 is outside array bounds of 'u8[0]' {aka 'unsigned char[]'}
Message-ID: <202310182013.pA0QOotV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   16d0a659489f8743de04200269719b4b1813a280
commit: 1054df2805fd51d2e675274233c95f986023be2c [149/382] rpmsg-kdrv: Add support for device virtualization
config: sh-defconfig (https://download.01.org/0day-ci/archive/20231018/202310182013.pA0QOotV-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310182013.pA0QOotV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310182013.pA0QOotV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rpmsg-kdrv/rpmsg_kdrv.c:134:12: warning: 'rpmsg_kdrv_disconnect' defined but not used [-Wunused-function]
     134 | static int rpmsg_kdrv_disconnect(struct rpmsg_device *rpdev, struct rpmsg_kdrv_device *kddev)
         |            ^~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg-kdrv/rpmsg_kdrv.c:115:12: warning: 'rpmsg_kdrv_connect' defined but not used [-Wunused-function]
     115 | static int rpmsg_kdrv_connect(struct rpmsg_device *rpdev, struct rpmsg_kdrv_device *kddev)
         |            ^~~~~~~~~~~~~~~~~~
   drivers/rpmsg-kdrv/rpmsg_kdrv.c:58:12: warning: 'rpmsg_kdrv_match_name' defined but not used [-Wunused-function]
      58 | static int rpmsg_kdrv_match_name(struct device *dev, const void *data)
         |            ^~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg-kdrv/rpmsg_kdrv.c: In function 'rpmsg_kdrv_get_devices_cb':
>> drivers/rpmsg-kdrv/rpmsg_kdrv.c:228:24: warning: array subscript <unknown> is outside array bounds of 'u8[0]' {aka 'unsigned char[]'} [-Warray-bounds=]
     228 |                        &info_resp->device_data[dev->device_data_offset],
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/rpmsg-kdrv/rpmsg_kdrv.c:13:
   drivers/rpmsg-kdrv/shared/rpmsg-kdrv-transport.h:60:12: note: while referencing 'device_data'
      60 |         u8 device_data[0];
         |            ^~~~~~~~~~~


vim +228 drivers/rpmsg-kdrv/rpmsg_kdrv.c

   200	
   201	static int rpmsg_kdrv_get_devices_cb(void *cb_data, void *req, int req_sz, void *resp, int resp_sz)
   202	{
   203		int i, cnt;
   204		struct rpmsg_device *rpdev = cb_data;
   205		struct rpmsg_kdrv_priv *priv = dev_get_drvdata(&rpdev->dev);
   206		struct rpmsg_kdrv_init_dev_info_response *info_resp = resp;
   207		struct rpmsg_kdrv_init_device_info *dev;
   208		int ret = 0;
   209	
   210		if (info_resp->header.message_type != RPMSG_KDRV_TP_INIT_DEV_INFO_RESPONSE) {
   211			dev_err(&rpdev->dev, "%s: wrong response type\n", __func__);
   212			ret = -EINVAL;
   213			goto out;
   214		}
   215	
   216		for (i = 0; i < info_resp->num_devices; i++) {
   217			dev = &info_resp->devices[i];
   218			cnt = priv->num_raw_devices;
   219	
   220			priv->raw_device_data_size[cnt] = dev->device_data_len;
   221			priv->raw_device_data[cnt] = devm_kzalloc(&rpdev->dev, dev->device_data_len,
   222								  GFP_KERNEL);
   223			if (!priv->raw_device_data[cnt]) {
   224				ret = -ENOMEM;
   225				goto out;
   226			}
   227			memcpy(priv->raw_device_data[cnt],
 > 228			       &info_resp->device_data[dev->device_data_offset],
   229			       dev->device_data_len);
   230			memcpy(&priv->raw_devices[cnt], dev, sizeof(*dev));
   231			priv->num_raw_devices++;
   232	
   233			dev_dbg(&rpdev->dev, "new device: %s\n", dev->device_name);
   234		}
   235	
   236		for (i = 0; i < priv->num_raw_devices; i++)
   237			rpmsg_kdrv_device_create(rpdev, i);
   238	
   239	out:
   240		devm_kfree(&rpdev->dev, req);
   241		return ret;
   242	}
   243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
