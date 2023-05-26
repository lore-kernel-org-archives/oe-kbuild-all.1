Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2BD6FA2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 07:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685085624; x=1716621624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xdMZPRCW6qaazMFnGdAtfAiQ0ciKth4zhPpxqk5JgWs=;
  b=MRCesnFaanXhcU+K8h9b2qB80SL+rYpNlqSnMf7R30/9eg2WFJBw7Zfq
   PmazgvdGj64vyQTyK/C3VvttAlI9qglwaUxikxCwe6KEDU7A3j/IeRYrB
   eY7mXkEG6CEc6SqHm2rPdTvIJfs/JkS1Eb5yMyBy1tCPxhjEyqT+5+FuQ
   aMi+Jcf4bHtK94FjgiEdJH2ZopLoW4+NKUmVPM9P+DhUtEOHMMRA8dUP1
   NEyDoFHo5B9kQxBEmCY1Mt/LET7V4ARdZma4RByspAG3HSYvL0ExcRON2
   T7+WUcRNHtiDU+WZuu81f+fgsfX0V2eGG8zhT/hDBTz7t5H/72XlzZQ6X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="356523684"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="356523684"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 00:20:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="738152275"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="738152275"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 May 2023 00:20:22 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2RkL-000J91-36;
	Fri, 26 May 2023 07:20:21 +0000
Date: Fri, 26 May 2023 15:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 420/9879]
 ./usr/include/linux/mxc_v4l2.h:52:2: error: unknown type name 'uint32_t'
Message-ID: <202305261554.ch0n0val-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: 317b1cf90ab94b50bef4c49148f8726aa1e42ea1 [420/9879] media: capture: add mxc v4l2 capture driver
config: i386-randconfig-i006-20230525 (https://download.01.org/0day-ci/archive/20230526/202305261554.ch0n0val-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/317b1cf90ab94b50bef4c49148f8726aa1e42ea1
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout 317b1cf90ab94b50bef4c49148f8726aa1e42ea1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261554.ch0n0val-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/mxc_v4l2.h:52:2: error: unknown type name 'uint32_t'
           uint32_t u_offset;
           ^
   ./usr/include/linux/mxc_v4l2.h:53:2: error: unknown type name 'uint32_t'
           uint32_t v_offset;
           ^
>> ./usr/include/linux/mxc_v4l2.h:57:2: error: unknown type name '__u32'
           __u32                   type;   /* enum v4l2_buf_type */
           ^
   3 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
