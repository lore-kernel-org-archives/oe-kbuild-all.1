Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8351610FF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Apr 2023 16:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681749067; x=1713285067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B8IivnRe1ltImNbnQ/E3PK6mp8ZDLEBAikCgjtGrTZc=;
  b=UL44iGfYbDaBpwF9IUO08gGbxT4hviAnumAZGEEfaQNiTzNYg9T+843T
   XWFs89vvs2JNm9Gx8UhiY9B53IFV6z7+DaDt/9ApyQDjtJ1UXYVMUhWaQ
   AqC1kftONC3vUhKAT0lBVHGo7pxnwRNxH9Wuj4iusA0Ca5AkAVVdahzNW
   NrdCub2TDtBDBX3QdsNxPCsfFDErMQ4gDu4gKq2tJGac0uUPkDV5Db/lJ
   Sqx47bu5cNqf4YKSthZEPgjxi0T8kH5TNqh4RT3OWPK8LLf59MNgrDSSj
   siy+9//4b0gbZeWiq8XCpjMRn0ZFAgSoF4KtJjFxAglfW878cJx+IUYRA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="431225821"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="431225821"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 09:31:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="936897143"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="936897143"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Apr 2023 09:31:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poRkp-000caZ-24;
	Mon, 17 Apr 2023 16:30:59 +0000
Date: Tue, 18 Apr 2023 00:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Quan <evan.quan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/6.2 113/127]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/inc/smu_v13_0.h:65:18: warning:
 'pmfw_decoded_link_width' defined but not used
Message-ID: <202304180056.4S5WAh1R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/6.2
head:   d5cc4e26aebfe9964ac0652005daa9c4c40c2fd6
commit: ad81e956908f0f671e17ba5cb17c3db014018eb0 [113/127] drm/amd/pm: correct the pcie link state check for SMU13
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230418/202304180056.4S5WAh1R-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=ad81e956908f0f671e17ba5cb17c3db014018eb0
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/6.2
        git checkout ad81e956908f0f671e17ba5cb17c3db014018eb0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180056.4S5WAh1R-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.c:36:
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/inc/smu_v13_0.h:65:18: warning: 'pmfw_decoded_link_width' defined but not used [-Wunused-const-variable=]
      65 | static const int pmfw_decoded_link_width[7] = {0, 1, 2, 4, 8, 12, 16};
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/inc/smu_v13_0.h:64:18: warning: 'pmfw_decoded_link_speed' defined but not used [-Wunused-const-variable=]
      64 | static const int pmfw_decoded_link_speed[5] = {1, 2, 3, 4, 5};
         |                  ^~~~~~~~~~~~~~~~~~~~~~~


vim +/pmfw_decoded_link_width +65 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/inc/smu_v13_0.h

    63	
  > 64	static const int pmfw_decoded_link_speed[5] = {1, 2, 3, 4, 5};
  > 65	static const int pmfw_decoded_link_width[7] = {0, 1, 2, 4, 8, 12, 16};
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
