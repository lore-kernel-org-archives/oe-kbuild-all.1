Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FD710971
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 23:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685403946; x=1716939946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZQI3kc2aSF2cZqabaS6xUp8+IMAU/2U91xsN/bCXQVQ=;
  b=lAcY4BJiT1uhd/vz2hV/lCMPCoIZ875tNZfGoxxLRGyycEsvQwY1btBc
   uOMl7y9x6F/XVidRYLJY+I8o7+3naJtur7hzlpP+8fQYGjbn5/xwf2wRg
   2b+qxeXK7oD6QDjHO5Qp3p6bG2yHAhUektKafBggELbzoZmh0Cu5cIiiH
   agsEiWqmb8miE44Llplq9qfSLcgd7yVgJE19Rs+Gc6oBv1gbcErRAvsR5
   q6zTCEAxnPqunD5zj5x+D9V2M5buHPhTYZ2EkzwvW8yd2B6Dp8OEe7ro2
   gmji7shpv1474Lfv1TwKei2E0OoHsIAtlDSfiiUkZHCAMTtwRKqci845M
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420535400"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="420535400"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 16:45:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="683726204"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683726204"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 16:45:45 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3mYa-000LAs-1Q;
	Mon, 29 May 2023 23:45:44 +0000
Date: Tue, 30 May 2023 07:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: Quanyang Wang <quanyang.wang@windriver.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 7/711] ERROR: modpost:
 "dwc3_gadget_exit_hibernation" [drivers/usb/dwc3/dwc3.ko] undefined!
Message-ID: <202305300757.GX4l3MSj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Quanyang,

First bad commit (maybe != root cause):

tree:   https://github.com/Xilinx/linux-xlnx master
head:   cb1f2dbc7e487361688257fccf78bf3f3ce0e9ed
commit: fca9c137c1f41718c0abedfaa61eeb205489df18 [7/711] include: uapi: xlnxsync: fix hdrtest failure due to unknown type name
config: i386-randconfig-i071-20230529 (https://download.01.org/0day-ci/archive/20230530/202305300757.GX4l3MSj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/fca9c137c1f41718c0abedfaa61eeb205489df18
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout fca9c137c1f41718c0abedfaa61eeb205489df18
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305300757.GX4l3MSj-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dwc3_gadget_exit_hibernation" [drivers/usb/dwc3/dwc3.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
