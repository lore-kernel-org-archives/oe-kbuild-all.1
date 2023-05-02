Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA9236B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 05:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683004635; x=1714540635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oQqAbmyP1/ckOS58rzHI9VgZQ8QRM/m5j6WKJXi/n0c=;
  b=RT4n3efp6i1BTaZYhClJV6ZheRkpGd8oZps6WFkbmczg+c1kzjLJj2ML
   2RsFe50pPzlP06B4I/PeXyzxvKdHC8/cWnPhps7nd6BAyRQi15vJdwaqz
   /4VhdFZcOEhfdV4YmFJo9JyMc7NzDg7TI/diy9FH8IVh/6GQvpEgmeaAQ
   h5LK5F1ZMqRfWz67oumVJ/q9RIQUPEw9elXjUPe+ojHKrkDf7CysTZXIN
   EeTwq6ionCw8E2eJZc3ZjN0H3tNJGZPmQo/O/+JRhUibBhZZobRBuWb0j
   bpkjKH/rqknrw66Ex7Nzy078DOjAgZTm3qExbcyF9ZWSo5DSBzAKwF14B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="327943975"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="327943975"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 22:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="1025921273"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="1025921273"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 May 2023 22:17:13 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptiO0-0000rc-2U;
	Tue, 02 May 2023 05:17:12 +0000
Date: Tue, 2 May 2023 13:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/7] phy: qcom-qmp-combo: Introduce drm_bridge
Message-ID: <202305021308.DC97W8mk-lkp@intel.com>
References: <20230425034010.3789376-6-quic_bjorande@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425034010.3789376-6-quic_bjorande@quicinc.com>

Hi Bjorn,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Andersson/dt-bindings-phy-qcom-sc8280xp-qmp-usb43dp-Add-ports-and-orientation-switch/20230425-114219
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230425034010.3789376-6-quic_bjorande%40quicinc.com
patch subject: [PATCH 5/7] phy: qcom-qmp-combo: Introduce drm_bridge
config: s390-randconfig-s041-20230430 (https://download.01.org/0day-ci/archive/20230502/202305021308.DC97W8mk-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/9d1c54037e7501c68b3ad3347abda7f8ca0d4a7a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bjorn-Andersson/dt-bindings-phy-qcom-sc8280xp-qmp-usb43dp-Add-ports-and-orientation-switch/20230425-114219
        git checkout 9d1c54037e7501c68b3ad3347abda7f8ca0d4a7a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305021308.DC97W8mk-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_drm_bridge_add" [drivers/phy/qualcomm/phy-qcom-qmp-combo.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
