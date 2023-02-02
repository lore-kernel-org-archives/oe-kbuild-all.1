Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E00AD3A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 23:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675380183; x=1706916183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bn6l3TxTIC/CqdrEgmBOI9ZWD5WN5Blzw4xC/dDljDU=;
  b=VWppoBodarrFIo7aH/2ch+4JqVDcEsZLVVqAGsbhcLmTYvytnJ0EDwXn
   yMrKSHjK+AcYKsvw9SSH/o/uiGvHkAIM+QZ4tvSaQw3xvPwL4z3BSHZ5p
   Q+3QHrcd+I2y/NRw3zGEnpZ7PqJ2v0nYDD5ZI36KZDgnLxbXknZ17KCmi
   nAALYE2umIv0LZO01B2H6r9ZzPZ8u/3f6K0TtrzkA7j0fP+0szFE3y+Y6
   fOjUc0dd8WtQkj9BHAkzNBAaUMwuzkVcxQNunEmmLb/gmTGgi1/+d02LA
   27Y9QjRq4TULALdl/LYu+t9KJBaZH8C7L83YwWcA0+ZaeXpyqqthcBBBx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="355939758"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="355939758"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 15:23:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="643076420"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="643076420"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Feb 2023 15:22:55 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNius-0006wa-2r;
	Thu, 02 Feb 2023 23:22:54 +0000
Date: Fri, 3 Feb 2023 07:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: Frieder Schrempf <frieder@fris.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 4/7] rtc: Move BSM defines to separate header for DT usage
Message-ID: <202302030706.gBkl14ay-lkp@intel.com>
References: <20230201143431.863784-5-frieder@fris.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201143431.863784-5-frieder@fris.de>

Hi Frieder,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on arm/for-next arm/fixes arm64/for-next/core kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next xilinx-xlnx/master linus/master v6.2-rc6]
[cannot apply to abelloni/rtc-next next-20230202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frieder-Schrempf/dt-bindings-rtc-Move-RV3028-to-separate-binding-file/20230201-224450
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230201143431.863784-5-frieder%40fris.de
patch subject: [PATCH 4/7] rtc: Move BSM defines to separate header for DT usage
config: x86_64-randconfig-a004 (https://download.01.org/0day-ci/archive/20230203/202302030706.gBkl14ay-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/2dfe054992e73c8da87d242a35a30d969d87b1a0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Frieder-Schrempf/dt-bindings-rtc-Move-RV3028-to-separate-binding-file/20230201-224450
        git checkout 2dfe054992e73c8da87d242a35a30d969d87b1a0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/rtc.h:15:10: fatal error: dt-bindings/rtc/rtc.h: No such file or directory
      15 | #include <dt-bindings/rtc/rtc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
