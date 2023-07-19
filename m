Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CA63D394
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 15:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689782357; x=1721318357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I+4SrhCvMYd91J1CaVkbIi8nk9ruASOSxjYdhiA25fY=;
  b=c6Kq98Fxx0w+GtHi6cTUw0U33V+u6SOVc2jc5x+3weO6EpK9mvDo6KTW
   Om7hbjXvy9YHbVJMA7GLZTY6A+LpDwscjPjfD5hF5QnPIk/f+1JMjOXu7
   DwyaBxUiJKBmZ0Kv/Po4VdSkCUjUoM1qre+MTM3V+PFg9cSHN0CIPeFjv
   gqreuzIMFBY4L4b36K9Vheu0HoCDsiQTenoLI5Nvnsb4hjAQwmqyBa+Db
   sf8SRehVqhQqLAuyGcgGdOenT0va7Bo3/YRlMNr5EQPiRLO2ZDbeqViGB
   1rooYugpw6uMDlRq/aLERf/Q5CYM9An1XXasyfqHQXH01Bn0Ge1Y2uT90
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="346808874"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="346808874"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 08:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="837748304"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="837748304"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2023 08:59:15 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM9a6-00055J-2P;
	Wed, 19 Jul 2023 15:59:14 +0000
Date: Wed, 19 Jul 2023 23:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/637 3332/12466]
 ./usr/include/linux/imx_vpu.h:22:1: error: C++ style comments are not
 allowed in ISO C90
Message-ID: <202307192346.KFbaEhJ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/637
head:   ec33c7fc43bef23fa0b69db996fee0ba601875e9
commit: b82c78d77f16b30cffdd304eb2c6c1a3ab4f68ba [3332/12466] arm64: imx8mx: vpu: add vsi v4l2 decoder and encoder
config: i386-randconfig-i005-20230718 (https://download.01.org/0day-ci/archive/20230719/202307192346.KFbaEhJ9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192346.KFbaEhJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307192346.KFbaEhJ9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from ./usr/include/linux/imx_vpu.h:17,
                    from <command-line>:
   usr/include/linux/videodev2.h:2437:41: error: field 'timestamp' has incomplete type
    2437 |         struct timespec                 timestamp;
         |                                         ^~~~~~~~~
>> ./usr/include/linux/imx_vpu.h:22:1: error: C++ style comments are not allowed in ISO C90
      22 | //ctrls & extension ctrls definitions
         | ^
   ./usr/include/linux/imx_vpu.h:22:1: note: (this will be reported only once per input file)
>> ./usr/include/linux/imx_vpu.h:111:9: warning: extra tokens at end of #endif directive [-Wendif-labels]
     111 | #endif  //#ifndef __LINUX_IMX_VPU_H
         |         ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
