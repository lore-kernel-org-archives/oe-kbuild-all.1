Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D23347C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 21:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695158791; x=1726694791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YJNTpEqHwE0d5IZhxbZbyM1zFqYhtuUDvHUgux2KLcc=;
  b=ay6QwLeye0pta5Z9aeRZPnAnUzG3IhXNdOLN+2ojiwjs/WPg5D6XbPcA
   MhHH0sXfn0azxWATNpiiWk4GH9A+/BYozVIxfWdvj2Lo6PmQD7Ji3IHSr
   OvCMmNma5QuVMvv/vD6YuEFSLtKAi7vVgvt1mgkKI39Knl99CvfdDP/OL
   zAMx9be5s3T6JL8cASsfWkcREbITIuMwtZcEbb20BXYs0iBx71xW6euLz
   JlsIAICmkyc+yMo4PwHOPtp8o12xSMcjSiqkSa2VAC7ddCXZaku8OjbGd
   U0UYQ8g5IiAMX+a9LScqEG9xHYuL8SVmLEopF2wcHJtdKujLjNlllMjlN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="365102482"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="365102482"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 14:26:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="920020270"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="920020270"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Sep 2023 14:26:28 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiiEk-0007wm-2I;
	Tue, 19 Sep 2023 21:26:26 +0000
Date: Wed, 20 Sep 2023 05:25:38 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 1023/1363] core.c:undefined
 reference to `ulpi_write'
Message-ID: <202309200559.okEK6DBC-lkp@intel.com>
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
commit: a9a2045ee9fff8975ed0b20887309d5883ef5edb [1023/1363] usb: dwc3: core: Add support for disabling vbus when suspended
config: arm64-randconfig-003-20230920 (https://download.01.org/0day-ci/archive/20230920/202309200559.okEK6DBC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200559.okEK6DBC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200559.okEK6DBC-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: ID map text too big or misaligned
   aarch64-linux-ld: drivers/usb/dwc3/core.o: in function `dwc3_runtime_suspend':
>> core.c:(.text+0x242c): undefined reference to `ulpi_write'
   aarch64-linux-ld: drivers/usb/dwc3/core.o: in function `dwc3_runtime_resume':
   core.c:(.text+0x3510): undefined reference to `ulpi_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
