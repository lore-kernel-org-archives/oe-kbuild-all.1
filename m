Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E0721D011
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 15:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762616535; cv=none; b=GacoGBgG8uhJ6fFjVCOSaW1pGt5nkmmKTtncgrcR5+WmiqoLmEmqpB9ISljbMKqktWDMkp4NG3iMemodvVa3eXqrEYHZoHbrLjRAMs/OVBobEa1t124Re484GKbjj899aKtX4UyhvRlzVVwRE40HjN54PXCgAoHbRFTQZwSIxFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762616535; c=relaxed/simple;
	bh=ZLOJg/sF8ez0bKw8HhJ1c1e1StUX4RcOsdZJ1I/0g6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CctGeMginqQAChZecRXagdoZszlK+4kHhwOfJfKofrtiCu25nfzJOpwkhfS2UbCB9k0KbHZX5c4Ci8rtm+Cm+UJgFBtlBUH8vvbLkiOeOin/k04N4Btz3FDEwHJMW0RVvUm6tAOx2rmPaiSZPXxQ6CrK6bpXRIR+x2S4M9kwaJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5tk9i3Z; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5tk9i3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762616532; x=1794152532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZLOJg/sF8ez0bKw8HhJ1c1e1StUX4RcOsdZJ1I/0g6E=;
  b=K5tk9i3ZPql86bGaVqaB5jT68ZFu290bdWs1442XBFX7jxBqooZyUx84
   lEoAIME46SbELvLGrWDcb+T82P0A3nwlede1VzM5Km/0LW4ZJFk9VWisL
   49IhBBVMqjA3+6rpfqacMHrxSVJR9R/f0nunqJQqLU5d73UOTu00Eikiu
   CeKBXAIHxp2mylk/cWiN/aw1HuqKw7YB1mdHxfRYenCjSWrTnWjzinB1w
   U3WhfBRBLP9rZtN9rqPNWWYyeWKPduVEDkUBwzbeDMy70AWp3VffKl4MW
   Lj+wlctLkRQQUKohQyiPUuk+l7tZxTSIqQT61WidKlwEWkLTJfeaK53Yi
   w==;
X-CSE-ConnectionGUID: oiZmGByZQ1aFr3OMk2m4eQ==
X-CSE-MsgGUID: VjtnQl3DQHikKieItow9xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="64830733"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="64830733"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 07:42:11 -0800
X-CSE-ConnectionGUID: MuJoYdzaRduJ9kRz2gE7EA==
X-CSE-MsgGUID: TgH02+W0TJeME2RHzp4znQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Nov 2025 07:42:10 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHl4q-0001At-1R;
	Sat, 08 Nov 2025 15:42:08 +0000
Date: Sat, 8 Nov 2025 23:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/ioctl.c:54:5: warning:
 no previous prototype for function 'ub_cdev_init'
Message-ID: <202511082355.OR9JXP3r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66984acf4b16f28a2cc0d5d6186b4b6bbfd92e26
commit: a4be501c749ab460697eed6d1235e9645fa08b30 [3075/3075] ub:ubus: Support for UB Character Device Driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251108/202511082355.OR9JXP3r-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511082355.OR9JXP3r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511082355.OR9JXP3r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/ioctl.c:54:5: warning: no previous prototype for function 'ub_cdev_init' [-Wmissing-prototypes]
      54 | int ub_cdev_init(void)
         |     ^
   drivers/ub/ubus/ioctl.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      54 | int ub_cdev_init(void)
         | ^
         | static 
>> drivers/ub/ubus/ioctl.c:97:6: warning: no previous prototype for function 'ub_cdev_uninit' [-Wmissing-prototypes]
      97 | void ub_cdev_uninit(void)
         |      ^
   drivers/ub/ubus/ioctl.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | void ub_cdev_uninit(void)
         | ^
         | static 
   2 warnings generated.


vim +/ub_cdev_init +54 drivers/ub/ubus/ioctl.c

    53	
  > 54	int ub_cdev_init(void)
    55	{
    56		struct cdev *cdev = &ubus_ctx.cdev;
    57		struct device *dev;
    58		struct class *cls;
    59		dev_t devno;
    60		int ret;
    61	
    62		ret = alloc_chrdev_region(&devno, 0, UBUS_MAX_DEVICES, UBUS_DEVICE_NAME);
    63		if (ret)
    64			return ret;
    65	
    66		cdev_init(cdev, &ubus_fops);
    67		ret = cdev_add(cdev, devno, UBUS_MAX_DEVICES);
    68		if (ret)
    69			goto out_unregister;
    70	
    71		cls = class_create(UBUS_CLASS_NAME);
    72		if (IS_ERR(cls)) {
    73			ret = PTR_ERR(cls);
    74			goto out_del;
    75		}
    76	
    77		dev = device_create(cls, NULL, devno, NULL, UBUS_DEVICE_NAME);
    78		if (IS_ERR(dev)) {
    79			ret = PTR_ERR(dev);
    80			goto out_destroy;
    81		}
    82	
    83		ubus_ctx.ub_class = cls;
    84		ubus_ctx.dev = dev;
    85		ubus_ctx.devno = devno;
    86		return 0;
    87	
    88	out_destroy:
    89		class_destroy(cls);
    90	out_del:
    91		cdev_del(cdev);
    92	out_unregister:
    93		unregister_chrdev_region(devno, UBUS_MAX_DEVICES);
    94		return ret;
    95	}
    96	
  > 97	void ub_cdev_uninit(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
