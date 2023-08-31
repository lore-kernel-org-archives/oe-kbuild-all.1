Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2031170A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 18:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693508345; x=1725044345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sCY/kYw6wlhhMFhgr6o1NBoasbM8BQjoyI2HRKmKNE4=;
  b=ZGI1xXSRNrMI9eCPo/XQ/1++1d/2SdcdRtRSUFcsxfmFBoF0t/6tR5Yl
   e7PASF/L05qWLfWQVl7hDIbwC7xH/C9j5z+m8bDPOVagJfwNk2TrTe+ba
   CnNbslh287prwfvLKwMU+4EIG3gC9rvEQouDIdIm9AszChnpohv/rA1BC
   rjl1yU2867ckbDoBB4NCdyjCE7gn/X/L2cUEX6lA0+fiamcgy+B9WIIuQ
   MDnu4+cwe3EHbTbZ5XzrxwP3jov88+vniCqRRogr3Rv8+5vV6Ejv36SVn
   n1c/lVYvrZB8MjLoTAKd03tMlJ/KimKPhM6r1HDcfpTm1wjWBv1uRdNSu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366264373"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="366264373"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="768909201"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="768909201"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 31 Aug 2023 11:59:03 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbmse-0000Si-3A;
	Thu, 31 Aug 2023 18:59:00 +0000
Date: Fri, 1 Sep 2023 02:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 1331/24604]
 ./usr/include/linux/videodev2.h:2398:20: error: field has incomplete type
 'struct timespec'
Message-ID: <202309010215.XAm8lULA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: 0103d73732ea64a7956c8423ff3ec99d9f8b119f [1331/24604] MLK-21876-13 ipu: add uapi headfile for yocto build pass
config: x86_64-randconfig-r015-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010215.XAm8lULA-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010215.XAm8lULA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010215.XAm8lULA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/ipu.h:29:
>> ./usr/include/linux/videodev2.h:2398:20: error: field has incomplete type 'struct timespec'
           struct timespec                 timestamp;
                                           ^
   ./usr/include/linux/videodev2.h:2398:9: note: forward declaration of 'struct timespec'
           struct timespec                 timestamp;
                  ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
