Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10C53D7B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 19:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677352484; x=1708888484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0KoMKXjQUApcRlDXH4w7hCtoT6tBYjfCi+UzayKz7cM=;
  b=cGajlCcEtY6SeJIoeVWQr5NqSwTKZmCq5QGknlSomgYjgi4wuSDoQGjJ
   veKLC7mOjWoWtzdpoqCkATpQSpszpl+mXD50KBgm3fS+Ra2krS2gSW/4O
   jcy7aABV+I0l650ZNAiT1GoLgm+Nv179p+hwz2w6sKlwAjcKBnx8YP6PR
   sjwyRWcqO0Bhzj4D39dmfblhTWz775xVUojL+sKPotHbL3uKYjfDBEZab
   tYh0mdWJIW1NuVhDvm+ozaew/FQdUvtXpugYnwnu1YE46ZGd5Sq7zvOJa
   P6hGPFdUDNo4gL0ud0UOYgzmwHCre+Py/Fk5kI1yIytPtxZ3cFU2XSAT1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="332380338"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="332380338"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 11:14:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="705644472"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="705644472"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Feb 2023 11:14:41 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW00H-0003Nn-0U;
	Sat, 25 Feb 2023 19:14:41 +0000
Date: Sun, 26 Feb 2023 03:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Subject: drivers/i2c/busses/i2c-xiic.c:994:39: warning: 'xiic_2_00' defined
 but not used
Message-ID: <202302260317.PpagiXGe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7c3dc440b1f5c75f45e24430f913e561dc82a419
commit: 2fd5cf352efa0c62dd20d1e046bc8767395b1ec0 i2c: xiic: Switch to Xiic standard mode for i2c-read
date:   3 weeks ago
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230226/202302260317.PpagiXGe-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2fd5cf352efa0c62dd20d1e046bc8767395b1ec0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2fd5cf352efa0c62dd20d1e046bc8767395b1ec0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302260317.PpagiXGe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-xiic.c:994:39: warning: 'xiic_2_00' defined but not used [-Wunused-const-variable=]
     994 | static const struct xiic_version_data xiic_2_00 = {
         |                                       ^~~~~~~~~


vim +/xiic_2_00 +994 drivers/i2c/busses/i2c-xiic.c

   993	
 > 994	static const struct xiic_version_data xiic_2_00 = {
   995		.quirks = DYNAMIC_MODE_READ_BROKEN_BIT,
   996	};
   997	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
