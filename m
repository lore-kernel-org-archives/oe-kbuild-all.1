Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B7B7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 13:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682169166; x=1713705166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bsS4PPTiO+9t6llWbvxYpptc5blj31Kb/EwfKlUt+Uc=;
  b=ZFO3lif5GC4SGQJAS23ONuSYHG0hMBiG9vZMXlLR7HUWgv1B+gN+DFZA
   Ht9UDCU3LTGJVEx3uY7wTRITd69gnHwONboySD2FC2AAEBfRkELCNG67w
   2kkLr44Yoe1bB5+ZNsydInPVq1NYga0vWM6JRhyUgzReOjNCuK/UPoG2c
   yImosTx7w1CaeChExQDhjK0Fh8FP4cU667GXj4i3YB/6nh8aC1cI3Nwx/
   xHN3t4FGaHMj5vlYkp0jqcpoOvbG7U6Phrwnbg76ugCfr/Ekfkp00433S
   xmfmO6gJpzIffByZ83IKHqU0SCu4uAnwXiqCzAnzsvarLtY7w5mUNcbAq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="325753241"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="325753241"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 06:12:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="938785777"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="938785777"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Apr 2023 06:12:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqD2i-000hJa-1k;
	Sat, 22 Apr 2023 13:12:44 +0000
Date: Sat, 22 Apr 2023 21:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Verma <vishal.l.verma@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/4] cxl: add a firmware update mechanism using the sysfs
 firmware loader
Message-ID: <202304222029.3q8ek13o-lkp@intel.com>
References: <20230421-vv-fw_update-v1-3-22468747d72f@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421-vv-fw_update-v1-3-22468747d72f@intel.com>

Hi Vishal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 24b18197184ac39bb8566fb82c0bf788bcd0d45b]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishal-Verma/cxl-pci-Allocate-irq-vectors-earlier-in-pci-probe/20230422-111022
base:   24b18197184ac39bb8566fb82c0bf788bcd0d45b
patch link:    https://lore.kernel.org/r/20230421-vv-fw_update-v1-3-22468747d72f%40intel.com
patch subject: [PATCH 3/4] cxl: add a firmware update mechanism using the sysfs firmware loader
config: csky-kismet-CONFIG_FW_UPLOAD-CONFIG_CXL_MEM-0-0 (https://download.01.org/0day-ci/archive/20230422/202304222029.3q8ek13o-lkp@intel.com/config)
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/2078b2df13d74fa5fc7a9811dd337f94371efcd8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vishal-Verma/cxl-pci-Allocate-irq-vectors-earlier-in-pci-probe/20230422-111022
        git checkout 2078b2df13d74fa5fc7a9811dd337f94371efcd8
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_FW_UPLOAD --selectors CONFIG_CXL_MEM -a=csky
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=csky olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304222029.3q8ek13o-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FW_UPLOAD when selected by CXL_MEM
   .config:4692:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for FW_UPLOAD
     Depends on [n]: FW_LOADER [=n]
     Selected by [y]:
     - CXL_MEM [=y] && CXL_BUS [=y] && CXL_PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
