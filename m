Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7501529AC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 23:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676761760; x=1708297760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iFcmWYgT+B2/w8GP625B0/yHmhmf1gG76CjlGk+KC74=;
  b=GqtcUP7F/jPS+uPj0VLfzZmpMn2OP7PEz++8tHDcywU5MX918ecjVWVo
   +4bidG4H1uiDmvqPk2m4pUZdxtaCTPJdQbq+8q/WreiojWw7LSqSn47at
   DFE+Q1aEO6B3VmS6Y5wnF4PPA3UquV1U6zDj/hHe+5dBdxSoVQvQwCeHR
   3z9silaGa9Gjx5gbjq11B5A454umGZYV6kf4SQAoAJTw6BuU/9nEvg+nb
   Ro3X0QWhzNd7JZWgtfQA2HVvjmDvNWo25DP4TmyDirfVzEruHi8rBf0PU
   KDnfwuzZ0sAkUU/poeclTyqqBR/7bc45z1W9NXkbn7AT7XZ7eJUPMJRjZ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="418433020"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="418433020"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 15:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="670939986"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="670939986"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Feb 2023 15:09:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTWKT-000CqH-2J;
	Sat, 18 Feb 2023 23:09:17 +0000
Date: Sun, 19 Feb 2023 07:08:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [omap-audio:peter/linux-next-wip 14/49]
 sound/soc/soc-utils.c:243:34: warning: unused variable 'soc_dummy_ids'
Message-ID: <202302190751.nSDvYhvN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   fafc4699b23203f885cef070f38bab20cb3840d5
commit: 719fb66af43bd0a82073d5fddfcfb95846cfe574 [14/49] ASoC: soc-utils: HACK: DT binding for snd-soc-dummy
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230219/202302190751.nSDvYhvN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/omap-audio/linux-audio/commit/719fb66af43bd0a82073d5fddfcfb95846cfe574
        git remote add omap-audio https://github.com/omap-audio/linux-audio
        git fetch --no-tags omap-audio peter/linux-next-wip
        git checkout 719fb66af43bd0a82073d5fddfcfb95846cfe574
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302190751.nSDvYhvN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-utils.c:243:34: warning: unused variable 'soc_dummy_ids' [-Wunused-const-variable]
   static const struct of_device_id soc_dummy_ids[] = {
                                    ^
   1 warning generated.


vim +/soc_dummy_ids +243 sound/soc/soc-utils.c

   242	
 > 243	static const struct of_device_id soc_dummy_ids[] = {
   244		{ .compatible = "linux,snd-soc-dummy", },
   245		{ }
   246	};
   247	MODULE_DEVICE_TABLE(of, soc_dummy_ids);
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
