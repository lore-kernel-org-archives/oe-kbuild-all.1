Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28272257A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 11:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682595564; x=1714131564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W+qEVLnZXkjvqK8g0vmrUvNQJzHb6PylQWSwWeHVLG0=;
  b=V7OxhhX/sPIExycKgGk9OWuHemkp0Mc4BVy+KD5eG3vxRmupY91u/lm3
   SyIBya93sqEUTFr/IV/xgqDH9NkhdckcWX4TkmNkQ02zl4K2ly91Afq5T
   8buyxsauSBjwD05WGZibEDD8JL9EhZXU9Sm4OlRQZUCedYlKisU+R4toE
   SVMTBF+HlhGVIWOoy1ASFwA2+J/CsRT4Wnzk6a/BfLoRja0G8loveI8qn
   2AW3UBbpxYa2rkGepy2B93zeUQIySyO2m+Qtv+HSKKfw5ikLkwGdzDzPe
   zVFITT0kD9HYNad1DFRMeafWi6b8HGtpAZ55X0iGNtIGLL9FULPOtPq1h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="327733062"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="327733062"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 04:39:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="724853365"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="724853365"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Apr 2023 04:39:20 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1przy4-0000CX-0e;
	Thu, 27 Apr 2023 11:39:20 +0000
Date: Thu, 27 Apr 2023 19:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, jejb@linux.ibm.com,
	martin.petersen@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, bblock@linux.ibm.com,
	acelan.kao@canonical.com,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ata: libata: Defer rescan on suspended device
Message-ID: <202304271942.yVqlIimT-lkp@intel.com>
References: <20230427050603.612145-2-kai.heng.feng@canonical.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427050603.612145-2-kai.heng.feng@canonical.com>

Hi Kai-Heng,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on linus/master pavel-leds/for-next v6.3 next-20230426]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kai-Heng-Feng/ata-libata-Defer-rescan-on-suspended-device/20230427-130726
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230427050603.612145-2-kai.heng.feng%40canonical.com
patch subject: [PATCH v3 2/2] ata: libata: Defer rescan on suspended device
config: mips-randconfig-r014-20230427 (https://download.01.org/0day-ci/archive/20230427/202304271942.yVqlIimT-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0e5dc37a85d9e0c92e2ae38903928499b2b17d04
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kai-Heng-Feng/ata-libata-Defer-rescan-on-suspended-device/20230427-130726
        git checkout 0e5dc37a85d9e0c92e2ae38903928499b2b17d04
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271942.yVqlIimT-lkp@intel.com/

All errors (new ones prefixed by >>):

   mipsel-linux-ld: drivers/ata/libata-eh.o: in function `ata_eh_revalidate_and_attach':
>> libata-eh.c:(.text.ata_eh_revalidate_and_attach+0x74): undefined reference to `pm_suspend_target_state'
>> mipsel-linux-ld: libata-eh.c:(.text.ata_eh_revalidate_and_attach+0x1f8): undefined reference to `pm_suspend_target_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
