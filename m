Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDA47E9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 01:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676854915; x=1708390915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Hp/QfsoMajlo8cCMPPXhv21MaOR/wLGzDWQL9U922o=;
  b=IjGLd27hntlbQQYb10ZSfPfOLP4fIgchPVXT7HWgGJ7W2ym+FvLrhJgJ
   7R/Co9zLcVDMarh5xRp5DZKUB6QFBoYT2WL1v01lJu6kkSk1d7RpHlXc9
   dFbNYVHZ/9QAIUmJLZPdKs7etDz4bt/MmTRJiXrK704Mwvn3an3tUlxKG
   83BOLaw6i/X6ym0fKzgfj8WDf1dLUI8M1UQrLaQV19mPBBt8s16wKGoAT
   TlwY5NjDd8b67/mNtd0mVs81EEKA2u0jELTOdpyZYH1F6jHGWm9g99V2u
   G2MUFRkRZuvr049kC2r+k2ZkMGpfQm6MGne+0lXK8sXW39Cg6FLHTU1Af
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="359763566"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="359763566"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 17:01:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="795012186"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="795012186"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Feb 2023 17:01:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTuYx-000DWT-1a;
	Mon, 20 Feb 2023 01:01:51 +0000
Date: Mon, 20 Feb 2023 09:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: ERROR: modpost: "create_function_device"
 [drivers/usb/gadget/function/usb_f_audio_source.ko] undefined!
Message-ID: <202302200816.2veXrbKa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 79847ce8aefb51dd32202ad9c186aff0541b14a6 ANDROID: usb: gadget: f_audio_source: New gadget driver for audio output
date:   2 years, 2 months ago
config: x86_64-randconfig-r003-20230220 (https://download.01.org/0day-ci/archive/20230220/202302200816.2veXrbKa-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=79847ce8aefb51dd32202ad9c186aff0541b14a6
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 79847ce8aefb51dd32202ad9c186aff0541b14a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200816.2veXrbKa-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "create_function_device" [drivers/usb/gadget/function/usb_f_audio_source.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
