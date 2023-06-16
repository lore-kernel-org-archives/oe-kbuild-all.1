Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74231ACD4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 16:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686932086; x=1718468086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5FWzSqt1I/6J4IrVSatQT9JGT7XQXXpEiRdTl/Z/lTk=;
  b=Pqw7X/CRlIRTZTFqpxE9xi6ptD1GEgF77YjSl+01z2uyERwDALRmidX/
   kIn09ya2Swu5ofwQ73FpAVNe4H530qiOGEGU/+46EsTIDV5ypbupsDMS8
   4kVyH/njb+njEBUvNK3no55RzMQ1TpjAQHriKyhoIgHalenZmHnef2TWh
   aTFOUXBC5PHlA7ngn+yj3l6Rzp/hxbwSerkKTuimLblOeuIlu9ufTVUUs
   JEafO5N9p76sB/zriYlzw4WbPKKeh1AU3xMg1Kw5f1csdIihwTHhwUVbK
   gq2a8AhfvugiBww18I76SBBLdxZQ9tqk7ibIMhtKF3+3IVn5JAJnpg6Q1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362666315"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="362666315"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 09:14:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="782960761"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="782960761"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2023 09:14:42 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAC5x-0001Xg-2Y;
	Fri, 16 Jun 2023 16:14:41 +0000
Date: Sat, 17 Jun 2023 00:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alison Wang <alison.wang@nxp.com>, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, leoyang.li@nxp.com, xuelin.shi@nxp.com,
	xiaofeng.ren@nxp.com, feng.guo@nxp.com,
	Alison Wang <alison.wang@nxp.com>
Subject: Re: [PATCH 7/8] ethosu: Add core message about inference cancellation
Message-ID: <202306162318.xhEoGf1L-lkp@intel.com>
References: <20230616055913.2360-8-alison.wang@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616055913.2360-8-alison.wang@nxp.com>

Hi Alison,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.4-rc6 next-20230616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alison-Wang/ethosu-Add-Arm-Ethos-U-driver/20230616-141036
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20230616055913.2360-8-alison.wang%40nxp.com
patch subject: [PATCH 7/8] ethosu: Add core message about inference cancellation
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230616/202306162318.xhEoGf1L-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306162318.xhEoGf1L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306162318.xhEoGf1L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/ethosu/ethosu_network.c: In function 'ethosu_network_ioctl':
>> drivers/firmware/ethosu/ethosu_network.c:149:1: warning: the frame size of 1580 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     149 | }
         | ^


vim +149 drivers/firmware/ethosu/ethosu_network.c

e66deaf1b03f9c Alison Wang 2023-06-16   91  
e66deaf1b03f9c Alison Wang 2023-06-16   92  static long ethosu_network_ioctl(struct file *file,
e66deaf1b03f9c Alison Wang 2023-06-16   93  				 unsigned int cmd,
e66deaf1b03f9c Alison Wang 2023-06-16   94  				 unsigned long arg)
e66deaf1b03f9c Alison Wang 2023-06-16   95  {
e66deaf1b03f9c Alison Wang 2023-06-16   96  	struct ethosu_network *net = file->private_data;
e66deaf1b03f9c Alison Wang 2023-06-16   97  	void __user *udata = (void __user *)arg;
e66deaf1b03f9c Alison Wang 2023-06-16   98  	int ret = -EINVAL;
e66deaf1b03f9c Alison Wang 2023-06-16   99  
e66deaf1b03f9c Alison Wang 2023-06-16  100  	ret = mutex_lock_interruptible(&net->edev->mutex);
e66deaf1b03f9c Alison Wang 2023-06-16  101  	if (ret)
e66deaf1b03f9c Alison Wang 2023-06-16  102  		return ret;
e66deaf1b03f9c Alison Wang 2023-06-16  103  
5d698f8bcb8aa1 Alison Wang 2023-06-16  104  	dev_dbg(net->edev->dev,
5d698f8bcb8aa1 Alison Wang 2023-06-16  105  		"Network ioctl: file=0x%pK, net=0x%pK, cmd=0x%x, arg=0x%lx\n",
5d698f8bcb8aa1 Alison Wang 2023-06-16  106  		file, net, cmd, arg);
e66deaf1b03f9c Alison Wang 2023-06-16  107  
e66deaf1b03f9c Alison Wang 2023-06-16  108  	switch (cmd) {
9bdfe23d58ca27 Alison Wang 2023-06-16  109  	case ETHOSU_IOCTL_NETWORK_INFO: {
9bdfe23d58ca27 Alison Wang 2023-06-16  110  		struct ethosu_uapi_network_info uapi;
9bdfe23d58ca27 Alison Wang 2023-06-16  111  
9bdfe23d58ca27 Alison Wang 2023-06-16  112  		if (copy_from_user(&uapi, udata, sizeof(uapi)))
9bdfe23d58ca27 Alison Wang 2023-06-16  113  			break;
9bdfe23d58ca27 Alison Wang 2023-06-16  114  
9bdfe23d58ca27 Alison Wang 2023-06-16  115  		dev_dbg(net->edev->dev,
9bdfe23d58ca27 Alison Wang 2023-06-16  116  			 "Network ioctl: Network info. net=0x%pK\n",
9bdfe23d58ca27 Alison Wang 2023-06-16  117  			 net);
9bdfe23d58ca27 Alison Wang 2023-06-16  118  
9bdfe23d58ca27 Alison Wang 2023-06-16  119  		ret = ethosu_network_info_request(net, &uapi);
9bdfe23d58ca27 Alison Wang 2023-06-16  120  		if (ret)
9bdfe23d58ca27 Alison Wang 2023-06-16  121  			break;
9bdfe23d58ca27 Alison Wang 2023-06-16  122  
9bdfe23d58ca27 Alison Wang 2023-06-16  123  		ret = copy_to_user(udata, &uapi, sizeof(uapi)) ? -EFAULT : 0;
9bdfe23d58ca27 Alison Wang 2023-06-16  124  		break;
9bdfe23d58ca27 Alison Wang 2023-06-16  125  	}
e66deaf1b03f9c Alison Wang 2023-06-16  126  	case ETHOSU_IOCTL_INFERENCE_CREATE: {
e66deaf1b03f9c Alison Wang 2023-06-16  127  		struct ethosu_uapi_inference_create uapi;
e66deaf1b03f9c Alison Wang 2023-06-16  128  
e66deaf1b03f9c Alison Wang 2023-06-16  129  		if (copy_from_user(&uapi, udata, sizeof(uapi)))
e66deaf1b03f9c Alison Wang 2023-06-16  130  			break;
e66deaf1b03f9c Alison Wang 2023-06-16  131  
5d698f8bcb8aa1 Alison Wang 2023-06-16  132  		dev_dbg(net->edev->dev,
5d698f8bcb8aa1 Alison Wang 2023-06-16  133  			"Network ioctl: Inference. ifm_fd=%u, ofm_fd=%u\n",
e66deaf1b03f9c Alison Wang 2023-06-16  134  			uapi.ifm_fd[0], uapi.ofm_fd[0]);
e66deaf1b03f9c Alison Wang 2023-06-16  135  
e66deaf1b03f9c Alison Wang 2023-06-16  136  		ret = ethosu_inference_create(net->edev, net, &uapi);
e66deaf1b03f9c Alison Wang 2023-06-16  137  		break;
e66deaf1b03f9c Alison Wang 2023-06-16  138  	}
e66deaf1b03f9c Alison Wang 2023-06-16  139  	default: {
e66deaf1b03f9c Alison Wang 2023-06-16  140  		dev_err(net->edev->dev, "Invalid ioctl. cmd=%u, arg=%lu",
e66deaf1b03f9c Alison Wang 2023-06-16  141  			cmd, arg);
e66deaf1b03f9c Alison Wang 2023-06-16  142  		break;
e66deaf1b03f9c Alison Wang 2023-06-16  143  	}
e66deaf1b03f9c Alison Wang 2023-06-16  144  	}
e66deaf1b03f9c Alison Wang 2023-06-16  145  
e66deaf1b03f9c Alison Wang 2023-06-16  146  	mutex_unlock(&net->edev->mutex);
e66deaf1b03f9c Alison Wang 2023-06-16  147  
e66deaf1b03f9c Alison Wang 2023-06-16  148  	return ret;
e66deaf1b03f9c Alison Wang 2023-06-16 @149  }
e66deaf1b03f9c Alison Wang 2023-06-16  150  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
