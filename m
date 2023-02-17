Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177308BED
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 16:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676652991; x=1708188991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IUuasCU3Z+AenZRhVMqr12vIbPTJn4vd9OsthkprWqc=;
  b=WHj1raWLwRpCXVb3PYmGZ8PCHPlGO98tXVLM9ifoezdZpXsJtqCtCrTM
   qcyitcTBTLJoUCs9nViojvtbOHq/xeHcOKAmFIZ4qu6H97re/cNJ6J1VX
   DQ0tLhVh0TD0LAdKyLwhe/VJLZJ+7LvpwSJAtLieGc2XqvlW8yL3Hu1Wu
   ovC4LQXHLlRbfiHjqURnpEGRQreElTZunR/urBydKVDNzn91d8GHcQhdO
   Q+fQQWcwzm0q9iZLgcEtsryPriuofvg8lF4Ie7ot4IxSkLrgW+6NiR5AS
   pFvzOCKNCqq5ck7CVWFrAJLQD27qRG/GwmUgm7uOjqVLEyBe+1v4jo9Yv
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="311660964"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="311660964"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 08:56:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="663922829"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="663922829"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Feb 2023 08:56:28 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT427-000Bf0-22;
	Fri, 17 Feb 2023 16:56:27 +0000
Date: Sat, 18 Feb 2023 00:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-audio-wsa881x-gpio 43/615]
 drivers/thermal/qcom/qmi_cooling/qcom_qmi_cooling.c:545:37: warning:
 variable 'data' set but not used
Message-ID: <202302180026.nwl02IXg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bhupesh,

FYI, the error/warning still remains.

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
head:   04e5048badb91c86b22993d0d9fd1bf8b79c0d91
commit: 295f2c4508016845487dc47261e8e17b5cfb39ee [43/615] thermal: qcom: Add Kconfig entry & compilation support for qmi cooling driver
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230218/202302180026.nwl02IXg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/295f2c4508016845487dc47261e8e17b5cfb39ee
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
        git checkout 295f2c4508016845487dc47261e8e17b5cfb39ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/thermal/qcom/qmi_cooling/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302180026.nwl02IXg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/qcom/qmi_cooling/qcom_qmi_cooling.c: In function 'qmi_tmd_device_probe':
>> drivers/thermal/qcom/qmi_cooling/qcom_qmi_cooling.c:545:37: warning: variable 'data' set but not used [-Wunused-but-set-variable]
     545 |         const struct qmi_plat_data *data;
         |                                     ^~~~


vim +/data +545 drivers/thermal/qcom/qmi_cooling/qcom_qmi_cooling.c

8e3baf430c5060 Bhupesh Sharma 2022-07-28  538  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  539  static int qmi_tmd_device_probe(struct platform_device *pdev)
8e3baf430c5060 Bhupesh Sharma 2022-07-28  540  {
8e3baf430c5060 Bhupesh Sharma 2022-07-28  541  	struct device *dev;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  542  	struct device_node *np;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  543  	struct device_node *child;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  544  	struct qmi_tmd_instance *instances;
8e3baf430c5060 Bhupesh Sharma 2022-07-28 @545  	const struct qmi_plat_data *data;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  546  	const struct of_device_id *id;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  547  	struct qmi_tmd_priv *priv;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  548  	int ret;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  549  	u32 ninstances;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  550  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  551  	if (pdev->dev.of_node)
8e3baf430c5060 Bhupesh Sharma 2022-07-28  552  		dev = &pdev->dev;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  553  	else
8e3baf430c5060 Bhupesh Sharma 2022-07-28  554  		dev = pdev->dev.parent;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  555  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  556  	np = dev->of_node;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  557  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  558  	id = of_match_node(qmi_tmd_device_table, np);
8e3baf430c5060 Bhupesh Sharma 2022-07-28  559  	if (!id)
8e3baf430c5060 Bhupesh Sharma 2022-07-28  560  		return -ENODEV;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  561  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  562  	data = id->data;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  563  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  564  	if (np)
8e3baf430c5060 Bhupesh Sharma 2022-07-28  565  		ninstances = of_get_available_child_count(np);
8e3baf430c5060 Bhupesh Sharma 2022-07-28  566  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  567  	if (ninstances <= 0) {
8e3baf430c5060 Bhupesh Sharma 2022-07-28  568  		dev_err(dev, "No instances to process\n");
8e3baf430c5060 Bhupesh Sharma 2022-07-28  569  		return -EINVAL;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  570  	}
8e3baf430c5060 Bhupesh Sharma 2022-07-28  571  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  572  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
8e3baf430c5060 Bhupesh Sharma 2022-07-28  573  	if (!priv)
8e3baf430c5060 Bhupesh Sharma 2022-07-28  574  		return -ENOMEM;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  575  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  576  	priv->dev = dev;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  577  	priv->ninstances = ninstances;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  578  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  579  	priv->instances = devm_kcalloc(dev, priv->ninstances,
8e3baf430c5060 Bhupesh Sharma 2022-07-28  580  					sizeof(*priv->instances), GFP_KERNEL);
8e3baf430c5060 Bhupesh Sharma 2022-07-28  581  	if (!priv->instances)
8e3baf430c5060 Bhupesh Sharma 2022-07-28  582  		return -ENOMEM;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  583  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  584  	instances = priv->instances;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  585  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  586  	for_each_available_child_of_node(np, child) {
8e3baf430c5060 Bhupesh Sharma 2022-07-28  587  		ret = qmi_get_dt_instance_data(priv, instances, child);
8e3baf430c5060 Bhupesh Sharma 2022-07-28  588  		if (ret) {
8e3baf430c5060 Bhupesh Sharma 2022-07-28  589  			of_node_put(child);
8e3baf430c5060 Bhupesh Sharma 2022-07-28  590  			return ret;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  591  		}
8e3baf430c5060 Bhupesh Sharma 2022-07-28  592  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  593  		instances++;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  594  	}
8e3baf430c5060 Bhupesh Sharma 2022-07-28  595  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  596  	platform_set_drvdata(pdev, priv);
8e3baf430c5060 Bhupesh Sharma 2022-07-28  597  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  598  	ret = qmi_tmd_device_init(priv);
8e3baf430c5060 Bhupesh Sharma 2022-07-28  599  	if (ret)
8e3baf430c5060 Bhupesh Sharma 2022-07-28  600  		goto probe_err;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  601  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  602  	dev_dbg(dev, "QMI Thermal Mitigation Device driver probe success!\n");
8e3baf430c5060 Bhupesh Sharma 2022-07-28  603  	return 0;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  604  
8e3baf430c5060 Bhupesh Sharma 2022-07-28  605  probe_err:
8e3baf430c5060 Bhupesh Sharma 2022-07-28  606  	qmi_tmd_cleanup(priv);
8e3baf430c5060 Bhupesh Sharma 2022-07-28  607  	return ret;
8e3baf430c5060 Bhupesh Sharma 2022-07-28  608  }
8e3baf430c5060 Bhupesh Sharma 2022-07-28  609  

:::::: The code at line 545 was first introduced by commit
:::::: 8e3baf430c50605496406573095a89ee264265dc thermal: qcom: qmi_cooling: Add skeletal qmi cooling driver

:::::: TO: Bhupesh Sharma <bhupesh.sharma@linaro.org>
:::::: CC: Bhupesh Sharma <bhupesh.sharma@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
