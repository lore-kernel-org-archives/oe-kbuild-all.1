Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E756C1BB20
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 21:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689800432; x=1721336432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pBrgpnpp+opgT7f9XUv/ryT9JcPMBMWhYnPPXe+BEcY=;
  b=P7vfT3PuO9TPJTH7Fky1QPtMFCg6fk6qZYGg5zbS3U9y8cjRDKM5DAMF
   OXjzQUtVUzC38DjyFMQVVgm6VOzZz5gOOuClSY4Qrlr0CjhpY9G6UH7gD
   2wB1tjp5jFmDID2fXJYY4sm1x5oEkMcyIbgFqy5lecsRaQy/c8bzvHh9W
   ZdL7OhuKmzK4QEmWntKsL3Sk8tcPIjcPRxNaszF3uX7OO2pfsEzKPnArA
   q7S/58jCAdNrFnAYk9A48rmnI/CkfzorVur6MsRZKADVNqhlCQ1rchNI9
   c2AdAmYTvSF/bwpNIEDk54j4LkDXNqNscwqrBDItvGWr0Ln8ksfvASF7P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430336060"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="430336060"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 14:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="701390096"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="701390096"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Jul 2023 14:00:07 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMEHB-0005TN-1C;
	Wed, 19 Jul 2023 21:00:04 +0000
Date: Thu, 20 Jul 2023 04:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/638 1300/12469]
 usr/include/linux/videodev2.h:2437:20: error: field has incomplete type
 'struct timespec'
Message-ID: <202307200453.k8OBZsUd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/638
head:   3f1f2ea7295505de340ba4089817ae1021920928
commit: d368bdd73e55410f089fc065109f13953f409d88 [1300/12469] video: fbdev: mxc: Forward IPUv3 framebuffer driver from imx_4.19.y kernel
config: i386-randconfig-r026-20230718 (https://download.01.org/0day-ci/archive/20230720/202307200453.k8OBZsUd-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200453.k8OBZsUd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200453.k8OBZsUd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/ipu.h:29:
>> usr/include/linux/videodev2.h:2437:20: error: field has incomplete type 'struct timespec'
           struct timespec                 timestamp;
                                           ^
   usr/include/linux/videodev2.h:2437:9: note: forward declaration of 'struct timespec'
           struct timespec                 timestamp;
                  ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
