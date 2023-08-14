Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC711C154
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 15:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692025373; x=1723561373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UQGBiOYNkzgdCEcIE06oEd1YAAZBIFDe1KWDhrGZ1eM=;
  b=Fb2qDxjAP/+stHEoTkvpFAo1bY0Lxhcz5GpIM4VjdJzcSrSZcOJwhDW1
   JP3Xzrnu8kz+wPlKoyXtiPy6ZtNIGRt8aZJDAM598FHNk+nLKu+Hv/Gse
   jQ2R3C0g3Tzv4U2oEp1kZ/wflatM2Y/uganhxbaAe5QgPXJRLUt3IOtI8
   jsnKjFhQZauSPSGQiIqpYNLjCOyPU98pTK8Zm/BK7yFeoGA/Cpuaee7vb
   +ZJGilIdcqmRqug7g6A/KHC//PXvb+QmHxcYBpNxALwss0azTXE1OQpxw
   7z+GCMtPwAtGoc2hAmJq+ZZZaXB9Y7lk4144Glese5/gY+WwG8J7DWD4b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372050956"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="372050956"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 08:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="907264970"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="907264970"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Aug 2023 08:02:11 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVZ58-0000Ck-2r;
	Mon, 14 Aug 2023 15:02:10 +0000
Date: Mon, 14 Aug 2023 23:02:05 +0800
From: kernel test robot <lkp@intel.com>
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [srini-nvmem:for-next 17/22] drivers/nvmem/sec-qfprom.c:59:13:
 warning: unused variable 'ret'
Message-ID: <202308142248.QsUg82Wt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
head:   0e4a8e9e49ea29af87f9f308dc3e01fab969102f
commit: 9c7f2bce8a0e26d162ba8de6706b2c0557bb63cd [17/22] nvmem: sec-qfprom: Add Qualcomm secure QFPROM support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230814/202308142248.QsUg82Wt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308142248.QsUg82Wt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308142248.QsUg82Wt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvmem/sec-qfprom.c: In function 'sec_qfprom_probe':
>> drivers/nvmem/sec-qfprom.c:59:13: warning: unused variable 'ret' [-Wunused-variable]
      59 |         int ret;
         |             ^~~


vim +/ret +59 drivers/nvmem/sec-qfprom.c

    45	
    46	static int sec_qfprom_probe(struct platform_device *pdev)
    47	{
    48		struct nvmem_config econfig = {
    49			.name = "sec-qfprom",
    50			.stride = 1,
    51			.word_size = 1,
    52			.id = NVMEM_DEVID_AUTO,
    53			.reg_read = sec_qfprom_reg_read,
    54		};
    55		struct device *dev = &pdev->dev;
    56		struct nvmem_device *nvmem;
    57		struct sec_qfprom *priv;
    58		struct resource *res;
  > 59		int ret;
    60	
    61		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
    62		if (!priv)
    63			return -ENOMEM;
    64	
    65		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
    66		if (!res)
    67			return -EINVAL;
    68	
    69		priv->base = res->start;
    70	
    71		econfig.size = resource_size(res);
    72		econfig.dev = dev;
    73		econfig.priv = priv;
    74	
    75		priv->dev = dev;
    76	
    77		nvmem = devm_nvmem_register(dev, &econfig);
    78	
    79		return PTR_ERR_OR_ZERO(nvmem);
    80	}
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
