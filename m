Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBB515CD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 03:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dg1VvgBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697253709; x=1728789709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R2aJya0zMflUHOoB6qWS8SqS2H/iGPNqP2QVh9V4yNw=;
  b=dg1VvgBXvutau8MMXaT1IJj4V1g0L5E0V7icaksPnu3pAXvz7fce0Nhk
   uQ6U6uxW74xDDX6dTTcuGhfykUmhKWwxwSjD61r8vZvi4v6B3sfQaNJbr
   Ft+0ibi4bkjRcwHzCI3oh5/INjOvwjL8Z0jspFHkXurbS7rEmHSIZxFkn
   6cjeiqJJlsur/gQWrlQ3whrsfTkZ1eqIe66qy+PS8v6/JgtEYKFpHS+aD
   wml9dAZpqgPbnXkTQ0MkD/gdPQQt9VNQJ9LQiTOtPyzilbUXHvE9DXlr+
   N/eFTqvFmotQRo8bEzbY0An+/NzK7KXWZLh823xYKkurKSKToNOylOiIp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="449487936"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="449487936"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 20:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="754931675"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="754931675"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Oct 2023 20:21:44 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrVDi-0005er-0v;
	Sat, 14 Oct 2023 03:21:42 +0000
Date: Sat, 14 Oct 2023 11:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3377/15768]
 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:716:22: error: 'up' redeclared
 as different kind of symbol
Message-ID: <202310141108.cSJmwuKv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 55319936a8f1f16f42d8ab4e20d45b023cd746e5 [3377/15768] MA-20005-12 hantro_vc8000e: Fix build error exposed by -Wunused-variable
config: arm64-randconfig-003-20231013 (https://download.01.org/0day-ci/archive/20231014/202310141108.cSJmwuKv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141108.cSJmwuKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141108.cSJmwuKv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c: In function 'ReleaseEncoder':
   drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:369:13: warning: variable 'core_num' set but not used [-Wunused-but-set-variable]
     369 |         u32 core_num = 0;
         |             ^~~~~~~~
   drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c: At top level:
>> drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:716:22: error: 'up' redeclared as different kind of symbol
     716 |         void __user *up = compat_ptr(arg);
         |                      ^~
   In file included from include/linux/fs.h:25,
                    from arch/arm64/include/asm/elf.h:141,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:22:
   include/linux/semaphore.h:43:13: note: previous declaration of 'up' with type 'void(struct semaphore *)'
      43 | extern void up(struct semaphore *sem);
         |             ^~
>> drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:716:38: error: 'arg' undeclared here (not in a function); did you mean 'karg'?
     716 |         void __user *up = compat_ptr(arg);
         |                                      ^~~
         |                                      karg
>> drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:718:9: error: expected identifier or '(' before 'switch'
     718 |         switch (_IOC_NR(cmd)) {
         |         ^~~~~~
>> drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:798:9: error: expected identifier or '(' before 'return'
     798 |         return 0;
         |         ^~~~~~
>> drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c:799:1: error: expected identifier or '(' before '}' token
     799 | }
         | ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [m]:
   - TEST_MAPLE_TREE [=m] && RUNTIME_TESTING_MENU [=y]


vim +/up +716 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c

5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  711  
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  712  union {
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  713  	unsigned long kux;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  714  	unsigned int kui;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  715  } karg;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07 @716  	void __user *up = compat_ptr(arg);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  717  
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07 @718  	switch (_IOC_NR(cmd)) {
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  719  	case _IOC_NR(HX280ENC_IOCGHWOFFSET): {
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  720  		err = get_user(karg.kux, (s32 __user *)up);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  721  		if (err)
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  722  			return err;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  723  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  724  		err = put_user(((s32)karg.kux), (s32 __user *)up);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  725  		break;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  726  	}
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  727  	case _IOC_NR(HX280ENC_IOCGHWIOSIZE): {
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  728  		err = get_user(karg.kui, (s32 __user *)up);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  729  		if (err)
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  730  			return err;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  731  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  732  		err = put_user(((s32)karg.kui), (s32 __user *)up);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  733  		break;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  734  	}
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  735  	case _IOC_NR(HX280ENC_IOCGSRAMOFFSET): {
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  736  		err = get_user(karg.kux, (s32 __user *)up);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  737  		if (err)
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  738  			return err;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  739  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  740  		err = put_user(((s32)karg.kux), (s32 __user *)up);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  741  		break;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  742  	}
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  743  	case _IOC_NR(HX280ENC_IOCGSRAMEIOSIZE):{
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  744  		err = get_user(karg.kui, (s32 __user *)up);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  745  		if (err)
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  746  			return err;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  747  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  748  		err = put_user(((s32)karg.kui), (s32 __user *)up);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  749  		break;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  750  	}
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  751  	case _IOC_NR(HX280ENC_IOCG_CORE_NUM): {
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  752  		err = get_user(karg.kui, (s32 __user *)up);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  753  		if (err)
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  754  			return err;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  755  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  756  		err = put_user(((s32)karg.kui), (s32 __user *)up);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  757  		break;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  758  	}
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  759  	case _IOC_NR(HX280ENC_IOCH_ENC_RESERVE): {
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  760  		err = get_user(karg.kui, (s32 __user *)up);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  761  		if (err)
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  762  			return err;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  763  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  764  		err = put_user(((s32)karg.kui), (s32 __user *)up);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  765  		break;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  766  	}
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  767  	case _IOC_NR(HX280ENC_IOCH_ENC_RELEASE): {
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  768  		err = get_user(karg.kui, (s32 __user *)up);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  769  		if (err)
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  770  			return err;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  771  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  772  		break;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  773  	}
cc36ca92c00adb drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  774  	case _IOC_NR(HX280ENC_IOCG_EN_CORE): {
cc36ca92c00adb drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  775  		err = get_user(karg.kui, (s32 __user *)up);
cc36ca92c00adb drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  776  		if (err)
cc36ca92c00adb drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  777  			return err;
cc36ca92c00adb drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  778  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)&karg);
cc36ca92c00adb drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  779  		break;
cc36ca92c00adb drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  780  	}
cc36ca92c00adb drivers/mxc/hantro_vc8000e/hx280enc.c         Zhou Peng   2020-03-11  781  
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  782  	case _IOC_NR(HX280ENC_IOCG_CORE_WAIT): {
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  783  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)up);
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  784  		break;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  785  	}
ab044253f22350 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  786  
ab044253f22350 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  787  	case _IOC_NR(HX280ENC_IOC_WRITE_REGS): {
ab044253f22350 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  788  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)up);
ab044253f22350 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  789  		break;
ab044253f22350 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  790  	}
ab044253f22350 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  791  
ab044253f22350 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  792  	case _IOC_NR(HX280ENC_IOC_READ_REGS): {
ab044253f22350 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  793  		HX280ENC_IOCTL32(err, filp, cmd, (unsigned long)up);
ab044253f22350 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  794  		break;
ab044253f22350 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  795  	}
ab044253f22350 drivers/mxc/hantro_vc8000e/hx280enc_vc8000e.c Shijie Qin  2021-09-15  796  
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  797  	}
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07 @798  	return 0;
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07 @799  }
5c3807db9ea949 drivers/mxc/hantro_vc8000e/hx280enc.c         xiahong.bao 2020-01-07  800  

:::::: The code at line 716 was first introduced by commit
:::::: 5c3807db9ea9495b3306289006ec18b619984a04 MA-16211: imx8mp: vpu: Implement hantro vc8000e ioctl32

:::::: TO: xiahong.bao <xiahong.bao@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
