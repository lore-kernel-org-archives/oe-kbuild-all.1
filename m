Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B76A2FB3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 21:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694035686; x=1725571686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NgrpIcsrADIMNf6sQZymPDW5La0L4/IcqdfuXj0rsBQ=;
  b=MjhuNQa0IZ7H3fU4Pr9SgPUVDgCg8sm7O4UEDolBSS2ndiz8uleu4vyD
   ns84rXMtI/MnczKQOdNxN+8+x63voekk3YHm4Cos3eicIkhqVYf1NNxUN
   jcU5N1OszCaHOeKGY7KczBmPKEVLCNaNOCaXktJmSNL8RsXqzCRhB0IZb
   Ml11mJGuz0FXomvXvZS/SrSBaJcUBSRSnMSCl0vk7tobDjWhpnFMd/ElE
   c4KwpSlMVPhHsiA4ViC6HG9if0MaseFYr1Zr6wmQ1JF0xibLDifcBoxeu
   H9voNXeNtbyNogAsJUdtiQUBbC9Xm2cKB/ymmnAJrd3ACa9bkgEDCpkCc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379898109"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="379898109"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 14:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="691458857"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="691458857"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Sep 2023 14:28:04 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe04A-0000bf-0u;
	Wed, 06 Sep 2023 21:28:02 +0000
Date: Thu, 7 Sep 2023 05:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/640 3770/24604]
 ./usr/include/linux/imx_vpu.h:22:1: error: (this will be reported only once
 per input file)
Message-ID: <202309070548.gAog8mnV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/640
head:   20d5c9a132fc5a44f95fe7410c3cac6f43f0bd6c
commit: 0a3658b7bccb93a6ceec4bc4f6b220384f4d58b6 [3770/24604] arm64: imx8mx: vpu: add vsi v4l2 decoder and encoder
config: x86_64-randconfig-016-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070548.gAog8mnV-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070548.gAog8mnV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070548.gAog8mnV-lkp@intel.com/

Note: the freescale-fslc/pr/640 HEAD 20d5c9a132fc5a44f95fe7410c3cac6f43f0bd6c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/imx_vpu.h:17:0,
                    from <command-line>:32:
   ./usr/include/linux/videodev2.h:2428:20: error: field 'timestamp' has incomplete type
     struct timespec   timestamp;
                       ^~~~~~~~~
   In file included from <command-line>:32:0:
   ./usr/include/linux/imx_vpu.h:22:1: error: C++ style comments are not allowed in ISO C90
    //ctrls & extension ctrls definitions
    ^
>> ./usr/include/linux/imx_vpu.h:22:1: error: (this will be reported only once per input file)
   ./usr/include/linux/imx_vpu.h:111:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
    #endif //#ifndef __LINUX_IMX_VPU_H
           ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
