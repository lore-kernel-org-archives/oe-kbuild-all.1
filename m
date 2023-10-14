Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38640EA0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 17:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfxUJlTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697303884; x=1728839884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VfgFbQTIdfeFkzt1swljBo4WdVr+9AhAARx4yZ8JkbE=;
  b=kfxUJlToqbpEpil/3+7jCA1QFs++2kMPkgHoWsJyIQO/4RvVhKzrEIDi
   vWUiNb3qiNlEO8foFzJsXQJzQbbU9BZfgVYe8udEgLTn+YE0YEbwtlUp6
   B8eKlhoxjGRKOIyzD54s+HTadE8zGX53XQtkzDjbrgPQmPavFR8pn3p2H
   /7Pdmg9IDIBswGq1n3JXVrmkAl3p6d+wdKveW7KFlCO1+vJnT7KfxgPVX
   xUN+VbLONhnWC2V4KR+MlV6QOyyJINSqB4UKsFRBJHKd7Ith3kzVU+P7J
   SWpAsB9WLOQgrmW6pUm38rEXmxJMTYuJtJeqoLp+OV7HrZTiZyeoB7qVd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370409570"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="370409570"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 10:18:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="845853586"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="845853586"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Oct 2023 10:18:01 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qriGy-0006RP-1G;
	Sat, 14 Oct 2023 17:17:57 +0000
Date: Sun, 15 Oct 2023 01:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3494/15768]
 drivers/staging/ethosu/ethosu_network.c:149:1: warning: the frame size of
 1588 bytes is larger than 1024 bytes
Message-ID: <202310150158.XLPCqkJB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alison,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 3a39366ac72824dade6536b0d1398b4a0392409d [3494/15768] ethosu: Add support for inference cancellation
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231015/202310150158.XLPCqkJB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150158.XLPCqkJB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150158.XLPCqkJB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/ethosu/ethosu_network.c: In function 'ethosu_network_ioctl':
>> drivers/staging/ethosu/ethosu_network.c:149:1: warning: the frame size of 1588 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     149 | }
         | ^


vim +149 drivers/staging/ethosu/ethosu_network.c

95ce4103b59b6a Alison Wang 2022-10-14   91  
95ce4103b59b6a Alison Wang 2022-10-14   92  static long ethosu_network_ioctl(struct file *file,
95ce4103b59b6a Alison Wang 2022-10-14   93  				 unsigned int cmd,
95ce4103b59b6a Alison Wang 2022-10-14   94  				 unsigned long arg)
95ce4103b59b6a Alison Wang 2022-10-14   95  {
95ce4103b59b6a Alison Wang 2022-10-14   96  	struct ethosu_network *net = file->private_data;
95ce4103b59b6a Alison Wang 2022-10-14   97  	void __user *udata = (void __user *)arg;
95ce4103b59b6a Alison Wang 2022-10-14   98  	int ret = -EINVAL;
95ce4103b59b6a Alison Wang 2022-10-14   99  
95ce4103b59b6a Alison Wang 2022-10-14  100  	ret = mutex_lock_interruptible(&net->edev->mutex);
95ce4103b59b6a Alison Wang 2022-10-14  101  	if (ret)
95ce4103b59b6a Alison Wang 2022-10-14  102  		return ret;
95ce4103b59b6a Alison Wang 2022-10-14  103  
68d267d8be8c72 Alison Wang 2022-09-27  104  	dev_dbg(net->edev->dev,
68d267d8be8c72 Alison Wang 2022-09-27  105  		"Network ioctl: file=0x%pK, net=0x%pK, cmd=0x%x, arg=0x%lx\n",
68d267d8be8c72 Alison Wang 2022-09-27  106  		file, net, cmd, arg);
95ce4103b59b6a Alison Wang 2022-10-14  107  
95ce4103b59b6a Alison Wang 2022-10-14  108  	switch (cmd) {
10684f4bdf1ef0 Alison Wang 2022-09-27  109  	case ETHOSU_IOCTL_NETWORK_INFO: {
10684f4bdf1ef0 Alison Wang 2022-09-27  110  		struct ethosu_uapi_network_info uapi;
10684f4bdf1ef0 Alison Wang 2022-09-27  111  
10684f4bdf1ef0 Alison Wang 2022-09-27  112  		if (copy_from_user(&uapi, udata, sizeof(uapi)))
10684f4bdf1ef0 Alison Wang 2022-09-27  113  			break;
10684f4bdf1ef0 Alison Wang 2022-09-27  114  
10684f4bdf1ef0 Alison Wang 2022-09-27  115  		dev_dbg(net->edev->dev,
10684f4bdf1ef0 Alison Wang 2022-09-27  116  			 "Network ioctl: Network info. net=0x%pK\n",
10684f4bdf1ef0 Alison Wang 2022-09-27  117  			 net);
10684f4bdf1ef0 Alison Wang 2022-09-27  118  
10684f4bdf1ef0 Alison Wang 2022-09-27  119  		ret = ethosu_network_info_request(net, &uapi);
10684f4bdf1ef0 Alison Wang 2022-09-27  120  		if (ret)
10684f4bdf1ef0 Alison Wang 2022-09-27  121  			break;
10684f4bdf1ef0 Alison Wang 2022-09-27  122  
10684f4bdf1ef0 Alison Wang 2022-09-27  123  		ret = copy_to_user(udata, &uapi, sizeof(uapi)) ? -EFAULT : 0;
10684f4bdf1ef0 Alison Wang 2022-09-27  124  		break;
10684f4bdf1ef0 Alison Wang 2022-09-27  125  	}
95ce4103b59b6a Alison Wang 2022-10-14  126  	case ETHOSU_IOCTL_INFERENCE_CREATE: {
95ce4103b59b6a Alison Wang 2022-10-14  127  		struct ethosu_uapi_inference_create uapi;
95ce4103b59b6a Alison Wang 2022-10-14  128  
95ce4103b59b6a Alison Wang 2022-10-14  129  		if (copy_from_user(&uapi, udata, sizeof(uapi)))
95ce4103b59b6a Alison Wang 2022-10-14  130  			break;
95ce4103b59b6a Alison Wang 2022-10-14  131  
68d267d8be8c72 Alison Wang 2022-09-27  132  		dev_dbg(net->edev->dev,
68d267d8be8c72 Alison Wang 2022-09-27  133  			"Network ioctl: Inference. ifm_fd=%u, ofm_fd=%u\n",
95ce4103b59b6a Alison Wang 2022-10-14  134  			uapi.ifm_fd[0], uapi.ofm_fd[0]);
95ce4103b59b6a Alison Wang 2022-10-14  135  
95ce4103b59b6a Alison Wang 2022-10-14  136  		ret = ethosu_inference_create(net->edev, net, &uapi);
95ce4103b59b6a Alison Wang 2022-10-14  137  		break;
95ce4103b59b6a Alison Wang 2022-10-14  138  	}
95ce4103b59b6a Alison Wang 2022-10-14  139  	default: {
95ce4103b59b6a Alison Wang 2022-10-14  140  		dev_err(net->edev->dev, "Invalid ioctl. cmd=%u, arg=%lu",
95ce4103b59b6a Alison Wang 2022-10-14  141  			cmd, arg);
95ce4103b59b6a Alison Wang 2022-10-14  142  		break;
95ce4103b59b6a Alison Wang 2022-10-14  143  	}
95ce4103b59b6a Alison Wang 2022-10-14  144  	}
95ce4103b59b6a Alison Wang 2022-10-14  145  
95ce4103b59b6a Alison Wang 2022-10-14  146  	mutex_unlock(&net->edev->mutex);
95ce4103b59b6a Alison Wang 2022-10-14  147  
95ce4103b59b6a Alison Wang 2022-10-14  148  	return ret;
95ce4103b59b6a Alison Wang 2022-10-14 @149  }
95ce4103b59b6a Alison Wang 2022-10-14  150  

:::::: The code at line 149 was first introduced by commit
:::::: 95ce4103b59b6af5d3c264fc137f9dd174e78d3e npu: ethosu: Add Arm ethos-u driver

:::::: TO: Alison Wang <alison.wang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
