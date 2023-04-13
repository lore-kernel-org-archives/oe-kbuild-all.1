Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A787F2C9C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 18:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681412234; x=1712948234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vHoS9sKu17ISWhFocm++jn3cFWm2LnMEgI/eNrf6Wrc=;
  b=ju9jRZbAzBrmJdPEG+k3EZVHkpZen4xXYzlzxHS9oSpCNNmOpJ3SNzI5
   fG1BoT2edQU09Iyeap1CDXvOZ36D8PCYNo6KkdR71GII2KrRC/l2PhoSc
   KzlhMlouHQ87JL8lwLohfBRlKvPjYTdAAnEGgfIyZjs/rxorrOqgpKoyG
   91BVy/WL6ryHJlx5U4eoAl3g9KOlILIsTqPd3csfNVc6pN/RujO7We+TB
   WtxJkTQ6Fvrk01HdTM0yLlixuN10m5VTSRsXOoLugkH7wl9n0C6x6nJlX
   idrEiAqTdgQ0r1FBla+gXQYcrOQl2cNnet9lCumCsyd5LYyLr9ktjpYAI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="372131011"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="372131011"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 11:57:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="1019283449"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="1019283449"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Apr 2023 11:57:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn27v-000YtD-2z;
	Thu, 13 Apr 2023 18:56:59 +0000
Date: Fri, 14 Apr 2023 02:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [linux-next:master 8708/10976] kismet: WARNING: unmet direct
 dependencies detected for RESET_STARFIVE_JH7110 when selected by
 CLK_STARFIVE_JH7110_AON
Message-ID: <202304140256.aIlJMfbA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d8214bba44c1aa6a75921a09a691945d26a8d43
commit: 82327b127d4117e5b867cca945f97a5074aef786 [8708/10976] reset: starfive: Add StarFive JH7110 reset driver
config: csky-kismet-CONFIG_RESET_STARFIVE_JH7110-CONFIG_CLK_STARFIVE_JH7110_AON-0-0 (https://download.01.org/0day-ci/archive/20230414/202304140256.aIlJMfbA-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=82327b127d4117e5b867cca945f97a5074aef786
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 82327b127d4117e5b867cca945f97a5074aef786
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_RESET_STARFIVE_JH7110 --selectors CONFIG_CLK_STARFIVE_JH7110_AON -a=csky
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=csky olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140256.aIlJMfbA-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESET_STARFIVE_JH7110 when selected by CLK_STARFIVE_JH7110_AON
   .config:4572:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for RESET_STARFIVE_JH7110
     Depends on [n]: RESET_CONTROLLER [=n] && AUXILIARY_BUS [=y] && CLK_STARFIVE_JH7110_SYS [=y]
     Selected by [y]:
     - CLK_STARFIVE_JH7110_SYS [=y] && COMMON_CLK [=y] && (ARCH_STARFIVE || COMPILE_TEST [=y])
     - CLK_STARFIVE_JH7110_AON [=y] && COMMON_CLK [=y] && CLK_STARFIVE_JH7110_SYS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
