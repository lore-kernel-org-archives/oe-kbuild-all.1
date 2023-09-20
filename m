Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F21D79FA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695206121; x=1726742121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nu0uPKuj6l7c/rwtzMfToNHhsaqRW3IbihtuYwV6BZ0=;
  b=a+phMrJkOQDgSWy2pEEoEuLYNjQ6zCVM6YvhzTZLEirVQDI/aB4SmPBM
   qjMHfgEF2KHgoLzjlWqEfPekHfPZoIl07bFpTaYwawe7Hn03v5O2lFlIo
   AkvxfLfXW4BHLYavfP06hOIsNvfLksQqk07qsZRclmV7N+GoEijq9l2uv
   7T4jCJY2nhM/mZg0otrXS7fYH1XFFJ+reGu7ZKWInOsEc2bbrIMZ0cqI3
   cN9CVvteVj2dvwsYWAeUm0qEZCl1QP78n/OPmEKWBirYLfiKQXzgSdqsw
   Ir056N31kB4B3lGn0D6WMhsnb1neMzNkN/NuJMQDVk1wrvyo1G35UCfm9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="365234828"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="365234828"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 03:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749849162"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="749849162"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 20 Sep 2023 03:35:19 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiuY2-0008eE-0y;
	Wed, 20 Sep 2023 10:35:15 +0000
Date: Wed, 20 Sep 2023 18:34:26 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 671/1363]
 drivers/usb/host/xhci-plat.c:94: undefined reference to
 `dwc3_host_wakeup_capable'
Message-ID: <202309201853.5M01WUwi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: c72511380a06150f86102ac467cefe77a69339e7 [671/1363] usb: xhci-plat: Add remote wakeup support
config: i386-randconfig-012-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201853.5M01WUwi-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201853.5M01WUwi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201853.5M01WUwi-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/usb/host/xhci-plat.o: in function `host_wakeup_register':
>> drivers/usb/host/xhci-plat.c:94: undefined reference to `dwc3_host_wakeup_capable'


vim +94 drivers/usb/host/xhci-plat.c

    91	
    92	static void host_wakeup_register(host_wakeup_t func)
    93	{
  > 94		host_wakeup_fn = func;
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
