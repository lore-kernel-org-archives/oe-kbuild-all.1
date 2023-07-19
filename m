Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544EFC138
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 12:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689769743; x=1721305743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z79mNhT2xthHynIOj3s5l4wF+52m1mxh2jYfLelCnaA=;
  b=ljs6+udDBurM3QPjg7OQhmvDAqRk6e8VS9vA0dxSh/TVjfi9rUqMsHNi
   pACd1JjmfOehlXpstMLbRhVoIb4pIJ7ytNLQ7UYdgcRNosZB2uQ8FH9B1
   knk/kXYtHsbO2biAGOtc2O+9nRtnzKLemWmlgV3x5IQuiynLq8pySMsJV
   DzHksHVcAiGDxI32w+4ARL0U5ryBfrdnvBSZsOE/8n2mbSw4QtPLX4ST+
   tG2Jwolv1LLmtK6V3ZK0Xw7Zf/knaLxuW49LNDtyyRztLwvpU8u1NdnaK
   J7IKe+Lkek3+ry2xkPtm9yNoekB+t/PS26lvi5k6kgIiEB/WMzgVZiy2j
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="397303356"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="397303356"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 05:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="793998623"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="793998623"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2023 05:28:42 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM6IL-0004n9-0k;
	Wed, 19 Jul 2023 12:28:41 +0000
Date: Wed, 19 Jul 2023 20:28:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/637 1300/12466]
 usr/include/linux/videodev2.h:2437:41: error: field 'timestamp' has
 incomplete type
Message-ID: <202307192011.yZ6HuS1b-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/637
head:   ec33c7fc43bef23fa0b69db996fee0ba601875e9
commit: d368bdd73e55410f089fc065109f13953f409d88 [1300/12466] video: fbdev: mxc: Forward IPUv3 framebuffer driver from imx_4.19.y kernel
config: i386-randconfig-i005-20230718 (https://download.01.org/0day-ci/archive/20230719/202307192011.yZ6HuS1b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192011.yZ6HuS1b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307192011.yZ6HuS1b-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/ipu.h:29,
                    from <command-line>:
>> usr/include/linux/videodev2.h:2437:41: error: field 'timestamp' has incomplete type
    2437 |         struct timespec                 timestamp;
         |                                         ^~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
