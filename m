Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C001B2CA6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 20:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678827055; x=1710363055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WvJZ2FkokNfEMyPPR+i/GecJ2rinfx4+09UtweV4HY0=;
  b=julRJ2XT7tgwH+6/8ZpjthvzCe8RcuN+KitZbvITWfiGzY0lB4AJeMpC
   72BGV0k9lJ7awhbZS7huGisjhWdpS72jwL9zeE+HcUejmc7fflYjv7ceT
   h82fXFuyCy147dRmq/RoELgTR7GqElWYEdcSDAVWm4CBG/4uCSP43tTLA
   RITJQbdjrF77tv9jDDQa6LcL1SeiEurSQB3aDMerXJ2bn5H55qno3GQiS
   mu8Z3o+8Hk/NTn+F+myfh2vAETRh5IDJrharWcM2NP7IhrsYdlOl53Dvb
   /E/BExwsQzVVnD+XgApHWrvcL2fSnCaawJ10/ty4V0aa991ZzMCl5DGDp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="365215142"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="365215142"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 13:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="679227576"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="679227576"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Mar 2023 13:50:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcBbf-0007Bj-0D;
	Tue, 14 Mar 2023 20:50:51 +0000
Date: Wed, 15 Mar 2023 04:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream 14/157] kismet: WARNING: unmet direct
 dependencies detected for RESTRICTEDMEM when selected by KVM_PRIVATE_MEM
Message-ID: <202303150443.LW5uJxmz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   af455bd9233d89034be3007550c0209df72914f1
commit: 205241cb269370dc4286c1bd0f2dfe58b2e8e629 [14/157] KVM: x86: Add support for "protected VMs" that can utilize private memory
config: x86_64-kismet-CONFIG_RESTRICTEDMEM-CONFIG_KVM_PRIVATE_MEM-0-0 (https://download.01.org/0day-ci/archive/20230315/202303150443.LW5uJxmz-lkp@intel.com/config)
reproduce:
        # https://github.com/intel/tdx/commit/205241cb269370dc4286c1bd0f2dfe58b2e8e629
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream
        git checkout 205241cb269370dc4286c1bd0f2dfe58b2e8e629
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_RESTRICTEDMEM --selectors CONFIG_KVM_PRIVATE_MEM -a=x86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=x86_64 olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303150443.LW5uJxmz-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESTRICTEDMEM when selected by KVM_PRIVATE_MEM
   .config:5089:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for RESTRICTEDMEM
     Depends on [n]: TMPFS [=n]
     Selected by [y]:
     - KVM_PRIVATE_MEM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
