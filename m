Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A048D15CA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 10:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682593044; x=1714129044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SLj/Xnkp0ovw6yMU6P6HV5gsFG1WBUMr4Ctk1pEZW8E=;
  b=TXHHKkdW6mMIBGRaHLy0sqTrtCFy1boYNNdnxqMa5FZVcLLxoymchOFV
   S/MVgwyS/bxbTj2i2LPIlzP1axSTaeVS42nkaj8IBHlRltjpH0uFvAIqs
   KxWYRqjy/34zGk6nmtLCdwLopVJow0wUmaA5LTOWvQ5gcaENYoZGGCcqc
   Y3EcAu2NYR5OnmCcBYQwzDW95w1mQW5X2l5/R/TvJxqnK61uTMKmq4sKe
   Fu8kw9aB2rzDFjRNsSA/YXZJywyk2acUTq2j5OTmG1aXZbbbGWEt+s9wn
   Q6KmfAESKerzTUDpuOHVipyW7F+T/2YYkk3gDcNh8ItcxKpzmeNVrRUlV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="350252390"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="350252390"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 03:57:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="644649684"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="644649684"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Apr 2023 03:57:20 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1przJP-0000BV-1W;
	Thu, 27 Apr 2023 10:57:19 +0000
Date: Thu, 27 Apr 2023 18:56:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, jejb@linux.ibm.com,
	martin.petersen@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, bblock@linux.ibm.com,
	acelan.kao@canonical.com,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ata: libata: Defer rescan on suspended device
Message-ID: <202304271800.2IH4Swv7-lkp@intel.com>
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
[also build test ERROR on linus/master v6.3 next-20230426]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kai-Heng-Feng/ata-libata-Defer-rescan-on-suspended-device/20230427-130726
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230427050603.612145-2-kai.heng.feng%40canonical.com
patch subject: [PATCH v3 2/2] ata: libata: Defer rescan on suspended device
config: i386-randconfig-a005 (https://download.01.org/0day-ci/archive/20230427/202304271800.2IH4Swv7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/0e5dc37a85d9e0c92e2ae38903928499b2b17d04
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kai-Heng-Feng/ata-libata-Defer-rescan-on-suspended-device/20230427-130726
        git checkout 0e5dc37a85d9e0c92e2ae38903928499b2b17d04
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271800.2IH4Swv7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pm_suspend_target_state" [drivers/ata/libata.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
