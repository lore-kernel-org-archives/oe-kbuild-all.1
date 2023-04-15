Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D157D7E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 03:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681528088; x=1713064088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sjfisFd+b1bjW9R+oQSY79Uw2QLFubwmBQETx2lLXLE=;
  b=San9xTxNm8rqMMxui1R+riCvSezMeuXdmJgI2w+MfmObQ31ARH9hy8an
   BBiC1br/C9u2mcibvPP1lQp39d8y5uR4e8ZDwjQQWsZh4rO8CsWHH40UA
   9F8lFLgANlwZCoKv39NgWbV4OvVdhtwKOf0rR4CGhlabgTCT7OtGoyYlD
   kHXqU2Z7p8D8G/M3W2K21o2NvuPgbQkiAVy9KI/+Vi8rEpGXrAKCvxstQ
   BjzHjZtr9emVnAPKZHVb36L9l/WlGMHgXAuwShJIpOp50j423Io+uoph4
   ilgr5x11vyOv6BnwIERn03AQmkl8PdxBhbmQgiv9tX6WM2ZuumUde6HVP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="328764747"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="328764747"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 20:08:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="667404712"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="667404712"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 Apr 2023 20:08:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnWGk-000aLp-1O;
	Sat, 15 Apr 2023 03:08:06 +0000
Date: Sat, 15 Apr 2023 11:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 123/9838]
 ./usr/include/linux/mxc_asrc.h:126:9: error: unknown type name
 'snd_pcm_format_t'
Message-ID: <202304151059.ImwZNQMd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 2103da1663c78848201107a827b058150d25df26 [123/9838] MLK-11398: ASoC: fsl_asrc: Add Memory to Memory support
config: x86_64-randconfig-a014-20230410 (https://download.01.org/0day-ci/archive/20230415/202304151059.ImwZNQMd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Freescale/linux-fslc/commit/2103da1663c78848201107a827b058150d25df26
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 2103da1663c78848201107a827b058150d25df26
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151059.ImwZNQMd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/mxc_asrc.h:126:9: error: unknown type name 'snd_pcm_format_t'
     126 |         snd_pcm_format_t input_format;
         |         ^~~~~~~~~~~~~~~~
   ./usr/include/linux/mxc_asrc.h:127:9: error: unknown type name 'snd_pcm_format_t'
     127 |         snd_pcm_format_t output_format;
         |         ^~~~~~~~~~~~~~~~
>> ./usr/include/linux/mxc_asrc.h:135:9: error: unknown type name 'uint64_t'
     135 |         uint64_t supported_in_format;
         |         ^~~~~~~~
   ./usr/include/linux/mxc_asrc.h:136:9: error: unknown type name 'uint64_t'
     136 |         uint64_t supported_out_format;
         |         ^~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
