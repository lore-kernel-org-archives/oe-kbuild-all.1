Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F21417D2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 08:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674203156; x=1705739156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e5PUwE9V+2hI4G+AyMJPK9eT3fDxBd8xhyH+XjEh91s=;
  b=cpt30mtuHLYPw3l7fILPlKLudRWtolpwimb8Wy1NoOlc+UpvlQaWcQI0
   F8bnFjlrIi1fxZb7zCDPIFfyBYPJ2QfZB+/DANIvOaaLIxabEda/MhmBy
   zPmhy3O8kV8E1+kJ92cRb9WNtqIaAfgZSETTdPHigz/bkmOtcyBTCkR+q
   qNK41CqjwZQ6J/tAzO30PAju9TZk4mtatG9r+2xrrHq1aplKntgyBLNoP
   Aq38mAkypyvaAuSFElBjA+XO0q70jG2LFgTrp2O3PJqGnjyP75wu21dlQ
   bIqmWqAE3uyog5tA9JijCPJcrzPbjuEJt5vDuNuCG//PzYGWgUM2L+Wnp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="324215251"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="324215251"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 00:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="989334163"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="989334163"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2023 00:25:54 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pImia-0002Mx-2L;
	Fri, 20 Jan 2023 08:25:48 +0000
Date: Fri, 20 Jan 2023 16:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Izhar Ameer Shaikh <izhar.ameer.shaikh@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Tanmay Shah <tanmay.shah@xilinx.com>
Subject: [xilinx-xlnx:master 214/218]
 include/linux/firmware/xlnx-zynqmp.h:1186:12: warning:
 'zynqmp_pm_sec_mask_write_reg' defined but not used
Message-ID: <202301201652.jclVx9bv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   155ae9648df275d38841cfe45231ba0471baa1cb
commit: 6cb480b208248d57a9906d801469d7ea8292df52 [214/218] firmware: xilinx: Add support for secure read/write ioctl interface
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230120/202301201652.jclVx9bv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/6cb480b208248d57a9906d801469d7ea8292df52
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 6cb480b208248d57a9906d801469d7ea8292df52
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/spi/spi-zynqmp-gqspi.c:13:
>> include/linux/firmware/xlnx-zynqmp.h:1186:12: warning: 'zynqmp_pm_sec_mask_write_reg' defined but not used [-Wunused-function]
    1186 | static int zynqmp_pm_sec_mask_write_reg(const u32 node_id, const u32 offset,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/firmware/xlnx-zynqmp.h:1181:12: warning: 'zynqmp_pm_sec_read_reg' defined but not used [-Wunused-function]
    1181 | static int zynqmp_pm_sec_read_reg(u32 node_id, u32 offset, u32 *ret_value)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/zynqmp_pm_sec_mask_write_reg +1186 include/linux/firmware/xlnx-zynqmp.h

  1180	
> 1181	static int zynqmp_pm_sec_read_reg(u32 node_id, u32 offset, u32 *ret_value)
  1182	{
  1183		return -ENODEV;
  1184	}
  1185	
> 1186	static int zynqmp_pm_sec_mask_write_reg(const u32 node_id, const u32 offset,
  1187						u32 mask, u32 value)
  1188	{
  1189		return -ENODEV;
  1190	}
  1191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
