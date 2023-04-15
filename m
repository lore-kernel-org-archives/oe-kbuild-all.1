Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5266A79E0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 21:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681594737; x=1713130737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D/c39fyIu0qirJAE28j5niB+ycZ9BoX9+IJWDL8114U=;
  b=FhNO2FYZV3m6D8HIc2NHpsknRsFZFQySdFnk70qyOvY++CDfrB8pecVA
   E443Lhz2B7tp2xy7eV0G//ptOhnx11/uuuuGCTkIm4EHrQgpgju0O1F08
   bE2aQATYHV8FOdBrSc09Q6jwGg2/pOkX+vT1JuSqW7c742AVqn8Y8t+8E
   rxJFr9+ZmW33kDk9HPQQDychwT19vG+NcLcxEdUeNAHXgVi9lBkWDoSpY
   4sEtNew4vXR83aFO2Jr0nNWaKTK6GWg1mQRJoOlpGvl3h+6nivxHpus+H
   tlT3K3wRzEkiaM/7BfPRuBqQmvZv5W3O187KhRd2V+fCp2NQc9pEe8A8z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="325026332"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="325026332"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 14:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="814324012"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="814324012"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Apr 2023 14:38:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnnbh-000bMm-3C;
	Sat, 15 Apr 2023 21:38:53 +0000
Date: Sun, 16 Apr 2023 05:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [omap-audio:peter/linux-next-wip 14/48]
 sound/soc/soc-utils.c:243:34: warning: 'soc_dummy_ids' defined but not used
Message-ID: <202304160509.oMbuoMEt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   81cfa47ce512c163ac0f26afd1b161d7f69b92f0
commit: b4e0343e19f09995f6db80eee41e67211d334674 [14/48] ASoC: soc-utils: HACK: DT binding for snd-soc-dummy
config: x86_64-randconfig-a004 (https://download.01.org/0day-ci/archive/20230416/202304160509.oMbuoMEt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/omap-audio/linux-audio/commit/b4e0343e19f09995f6db80eee41e67211d334674
        git remote add omap-audio https://github.com/omap-audio/linux-audio
        git fetch --no-tags omap-audio peter/linux-next-wip
        git checkout b4e0343e19f09995f6db80eee41e67211d334674
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304160509.oMbuoMEt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-utils.c:243:34: warning: 'soc_dummy_ids' defined but not used [-Wunused-const-variable=]
     243 | static const struct of_device_id soc_dummy_ids[] = {
         |                                  ^~~~~~~~~~~~~


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
