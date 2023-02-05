Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C01323B4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 09:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675589117; x=1707125117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Df99HyDrosle/JXu/3JFQ3h9SeA0KobmxpwIwPQlTJc=;
  b=fKHttNbSVdtQRAY9bB7oSpBulkhkL7GJ0V6a7667thJ43aYjNZDZ7iTK
   XbpH7APkyQ/1JnNltM/CqKDpEp3T3YzIc5KNYa4039ksuCRVzpJOOFsML
   iLAv269qUs8pFS8ymq4PrCaDftm/3cMFp973/Agj2Z9KEtWcOKWgiQssu
   RER260fur6P+F7zNWwXPaaw6nUpBtvaEjyinkTO072qTVZEfobigOgvj+
   DIF0VuKwYbNrRhvtnzGVa48T5HXU4nBcsPIncrnyR7lfYlUvmSg4HL/nh
   +TGS8gqZwwauhygUjrIzd0/oO3ZwkaF0pmBb8UthYLURhODUT5tnpvjmo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="393629184"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="393629184"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 01:25:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="643720442"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="643720442"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Feb 2023 01:25:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pObGt-0001uE-0e;
	Sun, 05 Feb 2023 09:25:15 +0000
Date: Sun, 5 Feb 2023 17:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 3770/20208]
 ./usr/include/linux/imx_vpu.h:22:1: warning: // comments are not allowed in
 this language
Message-ID: <202302051726.rwdzjWMj-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 0a3658b7bccb93a6ceec4bc4f6b220384f4d58b6 [3770/20208] arm64: imx8mx: vpu: add vsi v4l2 decoder and encoder
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20230205/202302051726.rwdzjWMj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/0a3658b7bccb93a6ceec4bc4f6b220384f4d58b6
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 0a3658b7bccb93a6ceec4bc4f6b220384f4d58b6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
https://github.com/intel/lkp-tests
