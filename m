Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1816920F6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 20:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681504710; x=1713040710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=seTmvdxyU5r5IgDSV1g02RcOFOje8YC+JhrPRrIw2cM=;
  b=UW/0Z7DAhPM/7VuKZIU9hpeROcI/d8h/qY89RIPOEasO9YgzQpprEQGJ
   0LNdTFRqZE9nGSkGwkBciRuVJ7fnWXm/Qrws9w4h9F7LWsHasjn8MI6MR
   11W0URWGYvUX0gEwhggPIUUaexsW1xdpHZWwSlDwp9r/CxOL2H7K3oSSG
   rSUGtwN2fjxfSQ+cKxfPgqvO1ZR3bk3N2ZWG8MQycB4A2T3LEYf0gHWr6
   j8JOvRRd9nAB8u60kkI6DC8qo9rg0GsMDexSbbHI6Uk4RqWgbnPlX1sgL
   3GqE9e3DX4qnoPWLB82bSREqmwefqMunWn/L4Kwl7WKeoycYJ8YTWbmcI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="328722001"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="328722001"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 13:36:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="779324715"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="779324715"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2023 13:36:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnQA4-000ZwL-1g;
	Fri, 14 Apr 2023 20:36:48 +0000
Date: Sat, 15 Apr 2023 04:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Levinsky <ben.levinsky@xilinx.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Wendy Liang <wendy.liang@xilinx.com>,
	Ed Mooring <ed.mooring@xilinx.com>, Jason Wu <j.wu@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.10 73/1981] kismet: WARNING: unmet
 direct dependencies detected for ZYNQMP_IPI_MBOX when selected by
 ZYNQMP_R5_REMOTEPROC
Message-ID: <202304150415.xcDtGOqJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.10
head:   87ec9a2d98a7a7dfc98b57348a0ec310fd170e4b
commit: f044d7cb1b51c86ffce14094ef414cb83e09b242 [73/1981] remoteproc: Add initial zynqmp R5 remoteproc driver
config: arm64-kismet-CONFIG_ZYNQMP_IPI_MBOX-CONFIG_ZYNQMP_R5_REMOTEPROC-0-0 (https://download.01.org/0day-ci/archive/20230415/202304150415.xcDtGOqJ-lkp@intel.com/config)
reproduce:
        # https://github.com/Xilinx/linux-xlnx/commit/f044d7cb1b51c86ffce14094ef414cb83e09b242
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.10
        git checkout f044d7cb1b51c86ffce14094ef414cb83e09b242
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_ZYNQMP_IPI_MBOX --selectors CONFIG_ZYNQMP_R5_REMOTEPROC -a=arm64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=arm64 olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150415.xcDtGOqJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ZYNQMP_IPI_MBOX when selected by ZYNQMP_R5_REMOTEPROC
   
   WARNING: unmet direct dependencies detected for ZYNQMP_IPI_MBOX
     Depends on [n]: MAILBOX [=n] && ARCH_ZYNQMP [=y] && OF [=y]
     Selected by [y]:
     - ZYNQMP_R5_REMOTEPROC [=y] && REMOTEPROC [=y] && PM [=y] && ARCH_ZYNQMP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
