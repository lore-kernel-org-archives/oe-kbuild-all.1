Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440C7E4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 00:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685405928; x=1716941928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o295C+v/CE09kkTGmSbiszEOHknig3JQ93SpZZxUYFk=;
  b=UkUiqyz1Ms1bz2gArhQbikLpQ1VoeMN7Y30V2cGpxcy/5OayCy4Fkzub
   FduNQXzfL3ub6WYyTQyoC2TnWVIYXPw7B6RAY3dPyg+d6tG+KJsj3M36Z
   skwZIVt76pREibUGX7PeMZ8pEic/RS0sr6xeKXHCqODR6CHTDPHCQCLlk
   xowPxVPxnEjkR4TWVfOSa4hNRDqaiaB6nqFEbLrzWcQJhzZ25yI+hWb6/
   MpJTK1HC1GTlSdTbPJ8POwER7s5U6Sw804rQVEQijzU3AMm5waO6R9KGl
   UrszVBKBTQpcLy/6vCH+6h0A5daMA+UKL9ulPOl/YkVGLwiNniVhTRdCs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="344285123"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="344285123"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 17:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="850530785"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="850530785"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 May 2023 17:18:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3n4X-000LBe-2F;
	Tue, 30 May 2023 00:18:45 +0000
Date: Tue, 30 May 2023 08:17:51 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>
Subject: [steev:lenovo-x13s-v6.4.0-rc4 116/119]
 drivers/firmware/qcom_scm.c:1553: warning: expecting prototype for
 qseecom_app_send(). Prototype was for qcom_scm_qseecom_app_send() instead
Message-ID: <202305300821.1AyL50E4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.4.0-rc4
head:   d754eb0b656ff904b29ee9bff5aac662275772d0
commit: 71c83877c9b3369f2014483b178ad8e514f07110 [116/119] firmware: qcom_scm: Add support for Qualcomm Secure Execution Environment SCM interface
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230530/202305300821.1AyL50E4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/steev/linux/commit/71c83877c9b3369f2014483b178ad8e514f07110
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev lenovo-x13s-v6.4.0-rc4
        git checkout 71c83877c9b3369f2014483b178ad8e514f07110
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/firmware/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305300821.1AyL50E4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/qcom_scm.c:1553: warning: expecting prototype for qseecom_app_send(). Prototype was for qcom_scm_qseecom_app_send() instead


vim +1553 drivers/firmware/qcom_scm.c

  1534	
  1535	/**
  1536	 * qseecom_app_send() - Send to and receive data from a given QSEE app.
  1537	 * @client:   The QSEECOM client device corresponding to the target app.
  1538	 * @req:      Request buffer sent to the app (must be DMA-mappable).
  1539	 * @req_size: Size of the request buffer.
  1540	 * @rsp:      Response buffer, written to by the app (must be DMA-mappable).
  1541	 * @rsp_size: Size of the response buffer.
  1542	 *
  1543	 * Sends a request to the QSEE app associated with the given client and read
  1544	 * back its response. The caller must provide two DMA memory regions, one for
  1545	 * the request and one for the response, and fill out the @req region with the
  1546	 * respective (app-specific) request data. The QSEE app reads this and returns
  1547	 * its response in the @rsp region.
  1548	 *
  1549	 * Return: Returns zero on success, nonzero error code on failure.
  1550	 */
  1551	int qcom_scm_qseecom_app_send(struct qseecom_client *client, void *req,
  1552				      size_t req_size, void *rsp, size_t rsp_size)
> 1553	{
  1554		struct qcom_scm_qseecom_resp res = {};
  1555		struct qcom_scm_desc desc = {};
  1556		dma_addr_t req_phys;
  1557		dma_addr_t rsp_phys;
  1558		int status;
  1559	
  1560		/* Map request buffer */
  1561		req_phys = dma_map_single(__scm->dev, req, req_size, DMA_TO_DEVICE);
  1562		if (dma_mapping_error(__scm->dev, req_phys)) {
  1563			dev_err(__scm->dev, "qseecom: failed to map request buffer\n");
  1564			return -EFAULT;
  1565		}
  1566	
  1567		/* Map response buffer */
  1568		rsp_phys = dma_map_single(__scm->dev, rsp, rsp_size, DMA_FROM_DEVICE);
  1569		if (dma_mapping_error(__scm->dev, rsp_phys)) {
  1570			dma_unmap_single(__scm->dev, req_phys, req_size, DMA_TO_DEVICE);
  1571			dev_err(__scm->dev, "qseecom: failed to map response buffer\n");
  1572			return -EFAULT;
  1573		}
  1574	
  1575		/* Set up SCM call data */
  1576		desc.owner = QSEECOM_TZ_OWNER_TZ_APPS,
  1577		desc.svc = QSEECOM_TZ_SVC_APP_ID_PLACEHOLDER,
  1578		desc.cmd = 0x01,
  1579		desc.arginfo = QCOM_SCM_ARGS(5, QCOM_SCM_VAL,
  1580					     QCOM_SCM_RW, QCOM_SCM_VAL,
  1581					     QCOM_SCM_RW, QCOM_SCM_VAL),
  1582		desc.args[0] = client->app_id,
  1583		desc.args[1] = req_phys;
  1584		desc.args[2] = req_size;
  1585		desc.args[3] = rsp_phys;
  1586		desc.args[4] = rsp_size;
  1587	
  1588		/* Perform call */
  1589		status = qcom_scm_qseecom_call(&desc, &res);
  1590	
  1591		/* Unmap buffers */
  1592		dma_unmap_single(__scm->dev, rsp_phys, rsp_size, DMA_FROM_DEVICE);
  1593		dma_unmap_single(__scm->dev, req_phys, req_size, DMA_TO_DEVICE);
  1594	
  1595		if (status)
  1596			return status;
  1597	
  1598		if (res.result != QSEECOM_RESULT_SUCCESS)
  1599			return -EIO;
  1600	
  1601		return 0;
  1602	}
  1603	EXPORT_SYMBOL(qcom_scm_qseecom_app_send);
  1604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
