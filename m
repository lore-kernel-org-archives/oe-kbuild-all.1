Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF6010EF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695739099; x=1727275099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KQR8iiPglidr6630q2Ui91Hg8zY/g3LgUDo42up5Syc=;
  b=RXimyE+tUSiOJGeExlUcW83Z9guPWlVlNTQYfWXolAPTmzaGy0C3lM/8
   /l4P/yegv4NpRRe7kf1IQ6S4l3bbBSKXXwusdmRiIhTTIX76No4/8zvI+
   PgOWaJIxVlOQ5/p8OZJGucxvMhVuIRA11iJWrciO4pveMSCSz3GVgBuyb
   X/QdWoLeqtpaM8aD/TJGjiEiPojKATg1Uyv2AhQ82/MwedWH8IbbiL3Nz
   L0Fi/KG87JnDud1ighw+BqEy2Pug8mJLm0axdTjMdUoEeXThS4z8iyyEi
   TvTvzsVYeRp3/yGWW6Qn3kB0CDtjN34pFj5YbTM3R4MBLeOPGdA1ukBUH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="448075178"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="448075178"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 07:38:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="995834873"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="995834873"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2023 07:38:17 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ql9CX-0002vX-0c;
	Tue, 26 Sep 2023 14:38:14 +0000
Date: Tue, 26 Sep 2023 22:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14692/30000]
 drivers/tty/serial/msm_geni_serial_console.c:479:6: warning: variable
 'rx_stale' set but not used
Message-ID: <202309262210.RgsOTNtT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mukesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   8daba3e055d00086f153f5562449f11065001703
commit: 3b328707cf5e600683b13c9b19de3a3f22ea81e0 [14692/30000] ANDROID: serial: msm_geni_serial_console : Add Earlycon support
config: i386-randconfig-014-20230926 (https://download.01.org/0day-ci/archive/20230926/202309262210.RgsOTNtT-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309262210.RgsOTNtT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309262210.RgsOTNtT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/msm_geni_serial_console.c: In function 'msm_geni_serial_earlycon_setup':
>> drivers/tty/serial/msm_geni_serial_console.c:479:6: warning: variable 'rx_stale' set but not used [-Wunused-but-set-variable]
     u32 rx_stale = 0;
         ^~~~~~~~
>> drivers/tty/serial/msm_geni_serial_console.c:477:6: warning: variable 'rx_parity_cfg' set but not used [-Wunused-but-set-variable]
     u32 rx_parity_cfg = 0;
         ^~~~~~~~~~~~~
>> drivers/tty/serial/msm_geni_serial_console.c:476:6: warning: variable 'rx_trans_cfg' set but not used [-Wunused-but-set-variable]
     u32 rx_trans_cfg = 0;
         ^~~~~~~~~~~~


vim +/rx_stale +479 drivers/tty/serial/msm_geni_serial_console.c

   467	
   468	static int __init
   469	msm_geni_serial_earlycon_setup(struct earlycon_device *dev,
   470			const char *opt)
   471	{
   472		struct uart_port *uport = &dev->port;
   473		int ret = 0;
   474		u32 tx_trans_cfg = 0;
   475		u32 tx_parity_cfg = 0;
 > 476		u32 rx_trans_cfg = 0;
 > 477		u32 rx_parity_cfg = 0;
   478		u32 stop_bit = 0;
 > 479		u32 rx_stale = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
