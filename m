Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1B4BA4E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 23:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681430171; x=1712966171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kIo+UvUiCXZGoh+x0pt7le20mfuylnvCKUxFQkC+au4=;
  b=fJfsSebEn01lHRKIbcUy0MKmtbVx5IKzYkgeT8MDUN/9AsWFrMqo11oA
   Tcbp/6htSMcHrGzwpJgkgYsEYRuHQXoirkXdqTErkcbzlzx10+tJ7tosX
   hyi8j6I8XKYBA2yDkTXPlo6GIYPOHE14yxTcDS58pqHnLWhzNaQ3DEcgh
   T4hXGI31lZMA5UlSyX0/KB/iGIZbEWGp0n5gs3J+qh2m27FIcXMIBXr/5
   XU+y+UKTWNittYRNOkUZKTxaAd5mTCqYra+I6+9woR5qilxd25j2JGSfI
   c8JpmKace5KNdh6KyKJOh1864Gt6Ek0+BG9iAW65CSwhtPa8WHiap6e42
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="323965085"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="323965085"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 16:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="689581249"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="689581249"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Apr 2023 16:56:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn6nO-000Z2n-2R;
	Thu, 13 Apr 2023 23:56:06 +0000
Date: Fri, 14 Apr 2023 07:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [linux-next:master 8653/11447] kismet: WARNING: unmet direct
 dependencies detected for RESET_STARFIVE_JH7110 when selected by
 CLK_STARFIVE_JH7110_SYS
Message-ID: <202304140706.aOBNhUj2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3342532ecd39bbd9c2ab5b9001cec1589bc37e9
commit: 82327b127d4117e5b867cca945f97a5074aef786 [8653/11447] reset: starfive: Add StarFive JH7110 reset driver
config: csky-kismet-CONFIG_RESET_STARFIVE_JH7110-CONFIG_CLK_STARFIVE_JH7110_SYS-0-0 (https://download.01.org/0day-ci/archive/20230414/202304140706.aOBNhUj2-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=82327b127d4117e5b867cca945f97a5074aef786
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 82327b127d4117e5b867cca945f97a5074aef786
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_RESET_STARFIVE_JH7110 --selectors CONFIG_CLK_STARFIVE_JH7110_SYS -a=csky
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=csky olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140706.aOBNhUj2-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESET_STARFIVE_JH7110 when selected by CLK_STARFIVE_JH7110_SYS
   .config:4526:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for RESET_STARFIVE_JH7110
     Depends on [n]: RESET_CONTROLLER [=n] && AUXILIARY_BUS [=y] && CLK_STARFIVE_JH7110_SYS [=y]
     Selected by [y]:
     - CLK_STARFIVE_JH7110_SYS [=y] && COMMON_CLK [=y] && (ARCH_STARFIVE || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
