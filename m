Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FF678C8D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Aug 2024 22:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722895494; cv=none; b=OuV1cZzJE5nGbZpgs1an9Y1aiIutvDrUhRPmwK1scMep8Zs6v4KjtWKzcs8kmV2fAMl2eVJMXNAl9GECquiiGvzP35VwEoANp8mzmrUBf9jSJ9WN5h/PduYwVQHMMtLNZ/qRMutiDodeJiJTlgFygJplmh3d5HmmQ3m2P2WCeWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722895494; c=relaxed/simple;
	bh=fxePOx9H0Q+4bgk4ZxWXXHWSgGpz49e2shMnEKSfQv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T3ImC6Vil3usHQ+I3BjaZNIosYhzmGbGmNrUDDXLoF2N1ytwx/izarridHEU+i6CfvvdxaKDCAQzXYxB1kWRdyJ1SY6V4uT9f4izgM9zZ+nl23gYz0nfT/0kaEcK/y8t8yR4od1Q/lAXkAmIZ1+CvE7nq3IMMbIpgKjbwtaomLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkZplfVp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkZplfVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722895493; x=1754431493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fxePOx9H0Q+4bgk4ZxWXXHWSgGpz49e2shMnEKSfQv0=;
  b=YkZplfVpQ63VN8HrqOAZWB4rr4MuTAuO9bSssLjs4CfK3c6sgQlE9R52
   HBw6arxkY0iAS6+pGwQQJUE9YdyIbj9Mf3hFmfMfleMPk1ACtvEhvXeUV
   p2BmfVHDgTMzB2FpsiqCmwQJoRwXKy3YzRhURe1CsXgv+XqMLK3bfJl0D
   fQt8tN2mqhXitqx5U9ilrX/p8EeJXxiYVbG2+Fowwo5YaDmYDSi/3RLkQ
   82pWJcBH7Rq0eMlgIRlmsp1RncVsOZgx1LnybVQsD3t/vTH83VlErlPVW
   i1XhurjCGIE805djjpNQxKodpSUebF1R0u6gm/wbVr9ItrCvdrFvmMM9A
   g==;
X-CSE-ConnectionGUID: GtkhFTDFR+SuP4q733KrzQ==
X-CSE-MsgGUID: L3bwE+NzSemXnR6XOjA4FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21050250"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="21050250"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 15:04:52 -0700
X-CSE-ConnectionGUID: UktL++N/Sz6eyxIbUF4D5A==
X-CSE-MsgGUID: GWOHSDcIR6W+hykxIz9m0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="87222883"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 05 Aug 2024 15:04:51 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb5ov-0003nO-0Q;
	Mon, 05 Aug 2024 22:04:49 +0000
Date: Tue, 6 Aug 2024 06:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13192/23440]
 drivers/crypto/hisilicon/rde/rde_main.c:576:6: warning: no previous
 prototype for 'hisi_rde_hw_error_log'
Message-ID: <202408060608.ESB5dO3f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   f10f25f5188cddb47d7a8a4ddf63c200b33e5b49
commit: 73d33f5c59dc3824444baca6a458427f4de3d8fa [13192/23440] qm: Move all the same logic functions of hisilicon crypto to qm
config: arm64-randconfig-002-20240806 (https://download.01.org/0day-ci/archive/20240806/202408060608.ESB5dO3f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060608.ESB5dO3f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408060608.ESB5dO3f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/hisilicon/rde/rde_main.c:576:6: warning: no previous prototype for 'hisi_rde_hw_error_log' [-Wmissing-prototypes]
     576 | void hisi_rde_hw_error_log(struct hisi_qm *qm, u32 err_sts)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/hisilicon/rde/rde_main.c:607:5: warning: no previous prototype for 'hisi_rde_get_hw_err_status' [-Wmissing-prototypes]
     607 | u32 hisi_rde_get_hw_err_status(struct hisi_qm *qm)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/hisilicon/rde/rde_main.c:612:6: warning: no previous prototype for 'hisi_rde_clear_hw_err_status' [-Wmissing-prototypes]
     612 | void hisi_rde_clear_hw_err_status(struct hisi_qm *qm, u32 err_sts)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hisi_rde_hw_error_log +576 drivers/crypto/hisilicon/rde/rde_main.c

   575	
 > 576	void hisi_rde_hw_error_log(struct hisi_qm *qm, u32 err_sts)
   577	{
   578		const struct hisi_rde_hw_error *err = rde_hw_error;
   579		struct device *dev = &qm->pdev->dev;
   580		u32 err_val;
   581	
   582		while (err->msg) {
   583			if (err->int_msk & err_sts)
   584				dev_err_ratelimited(dev,
   585					"[%s] [Error status=0x%x] found.\n",
   586					err->msg, err->int_msk);
   587			err++;
   588		}
   589	
   590		if (HRDE_ECC_2BIT_ERR & err_sts) {
   591			err_val = (readl(qm->io_base + HRDE_ERR_CNT) &
   592				  HRDE_ECC_2BIT_CNT_MSK);
   593			dev_err_ratelimited(dev,
   594					    "Rde ecc 2bit sram num=0x%x.\n", err_val);
   595		}
   596	
   597		if (HRDE_STATE_INT_ERR & err_sts) {
   598			err_val = readl(qm->io_base + HRDE_AM_CURR_PORT_STS);
   599			dev_err_ratelimited(dev,
   600					    "Rde ooo cur port sts=0x%x.\n", err_val);
   601			err_val = readl(qm->io_base + HRDE_MASTER_TRANS_RET);
   602			dev_err_ratelimited(dev,
   603					    "Rde ooo outstanding sts=0x%x.\n", err_val);
   604		}
   605	}
   606	
 > 607	u32 hisi_rde_get_hw_err_status(struct hisi_qm *qm)
   608	{
   609		return readl(qm->io_base + HRDE_INT_STATUS);
   610	}
   611	
 > 612	void hisi_rde_clear_hw_err_status(struct hisi_qm *qm, u32 err_sts)
   613	{
   614		writel(err_sts, qm->io_base + HRDE_INT_SOURCE);
   615	}
   616	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
