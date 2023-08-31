Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38D853AE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 23:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693523653; x=1725059653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=goRga5rfnPGBUTjL89WY8ZXvp3NCWcmjHvtCYCN/F+Q=;
  b=DVZUnB5PQZxXAiiFvoECgZH6aF9eAyTsCh0mWqAL8NjVXaqQOP0Ohj5s
   CalJQjmwyxdRyjBGTkWGKDFGM4Jh8SSS40G7os9NLtulPKv9cGvyL17TO
   zhxAqcBTVqLC8QXbFEewGc2Y2B9CBwNns63k80+TeNxD+PZqvq0x+qQjb
   EMIuKYaYQUe/kp0KD6XXlzmRcO3W2njGixUhFvR6pL3vkkcMFUnf6Ri+x
   2YlvyyytIv/2c1tRT5F9+PCz6sp45lGBKwyp6PxxUKBgL3cBJN5RuUfDc
   e7irDxy4fDXZ9Ff1TkdSKluG82AZj6zjsFw6WTUV7mh3yrro4iay8YZik
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361112750"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="361112750"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 16:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="809837769"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="809837769"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Aug 2023 16:14:12 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbqrZ-0000dd-2u;
	Thu, 31 Aug 2023 23:14:09 +0000
Date: Fri, 1 Sep 2023 07:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3770/24604]
 ./usr/include/linux/imx_vpu.h:22:1: warning: // comments are not allowed in
 this language
Message-ID: <202309010754.mM0Xaejv-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: 0a3658b7bccb93a6ceec4bc4f6b220384f4d58b6 [3770/24604] arm64: imx8mx: vpu: add vsi v4l2 decoder and encoder
config: x86_64-randconfig-r015-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010754.mM0Xaejv-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010754.mM0Xaejv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010754.mM0Xaejv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/imx_vpu.h:17:
   ./usr/include/linux/videodev2.h:2428:20: error: field has incomplete type 'struct timespec'
           struct timespec                 timestamp;
                                           ^
   ./usr/include/linux/videodev2.h:2428:9: note: forward declaration of 'struct timespec'
           struct timespec                 timestamp;
                  ^
   In file included from <built-in>:1:
>> ./usr/include/linux/imx_vpu.h:22:1: warning: // comments are not allowed in this language [-Wcomment]
   //ctrls & extension ctrls definitions
   ^
   1 warning and 1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
