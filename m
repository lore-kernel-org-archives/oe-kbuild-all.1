Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E468120C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708534838; cv=none; b=GDqIgreihCWb9YDCo1Ioup6llOPd+C8oZcch3KsO/9cO4tOJc1EQUF6YBO9xILVOJq8P4LcYGKbywRmn846SLunhZzmUTdAcacZbtGlPJbgpH3nM5kVRuHjMDv61Hx+EWbNy5OOpmp6KgtNvHCRwMsyKGph28i4IDzIR8eP/atk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708534838; c=relaxed/simple;
	bh=KDB16pqWiYvhhXXgBT9FtfdL4fQxVDjK/laD8FcIsHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FfY3bwlC43ezWosGynzxow4acJRYfe4XqVqQowGmR5X3d/fDMtBw+l3nrnyEpNr59dc5p2qUOUkUvbtfPvRjxAD/Z1aXCwnAlfTqYXdtwPX/EHNVypIm89G9VKnaHdcZ4wK6ozSfHvq7EEAFfqZYjjGvfjDQni7PMGul/SaKynE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOWRKQwu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOWRKQwu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708534836; x=1740070836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KDB16pqWiYvhhXXgBT9FtfdL4fQxVDjK/laD8FcIsHQ=;
  b=lOWRKQwuTDtvCheAHeUzG+nnAdaVTeyHTs19PkeAOr513hYvwVxUqPTJ
   M9qV4ItIstdxhadZCqjoerglNeWs3hOWh2sv1Tc8Rs0kvO6lBDNaWokBv
   0npSFfXdTval8AEx4VXyiOwbq630t9KbpYVfVZKfAFXdhWqJie+vFnvq5
   lwWcfrDwtKhIr71uqUsxt9N1Avky3ItEV1qIyz0c2HIBQkCl45LMK1dd+
   kk/rDVjKl5r7l4nEEJnwfY5wBmZaGr9cT/8deAlW3NJvLg/GsWWK9YZJX
   hvXMFhSG6PCo/6+h3PWulMKcEgSSiKq6t19FQaJZ6yuZwKyx3sVc+noLC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13325810"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="13325810"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 09:00:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="36214349"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Feb 2024 09:00:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcpx9-0005WK-2v;
	Wed, 21 Feb 2024 17:00:23 +0000
Date: Thu, 22 Feb 2024 00:57:59 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/crypto/hisilicon/uacce/uacce.c:61: warning: Function
 parameter or member 'dev' not described in 'dev_to_uacce'
Message-ID: <202402220040.ASuMNilo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 7274937282a3c591eb292c7bf267b25abf4d4a52 driver: update hisilicon hardware crypto engine
date:   1 year, 1 month ago
config: arm64-randconfig-002-20240221 (https://download.01.org/0day-ci/archive/20240222/202402220040.ASuMNilo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220040.ASuMNilo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220040.ASuMNilo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/hisilicon/uacce/uacce.c: In function 'numa_distance_show':
>> drivers/crypto/hisilicon/uacce/uacce.c:1027:23: warning: unused variable 'uacce' [-Wunused-variable]
    1027 |         struct uacce *uacce = UACCE_FROM_CDEV_ATTR(dev);
         |                       ^~~~~
   drivers/crypto/hisilicon/uacce/uacce.c: In function 'node_id_show':
   drivers/crypto/hisilicon/uacce/uacce.c:1041:23: warning: unused variable 'uacce' [-Wunused-variable]
    1041 |         struct uacce *uacce = UACCE_FROM_CDEV_ATTR(dev);
         |                       ^~~~~
--
>> drivers/crypto/hisilicon/uacce/uacce.c:61: warning: Function parameter or member 'dev' not described in 'dev_to_uacce'
>> drivers/crypto/hisilicon/uacce/uacce.c:82: warning: Function parameter or member 'uacce' not described in 'uacce_hw_err_isolate'
>> drivers/crypto/hisilicon/uacce/uacce.c:137: warning: Function parameter or member 'q' not described in 'uacce_wake_up'


vim +61 drivers/crypto/hisilicon/uacce/uacce.c

    55	
    56	/**
    57	 * dev_to_uacce - Get structure uacce from its device
    58	 * @dev the device
    59	 */
    60	struct uacce *dev_to_uacce(struct device *dev)
  > 61	{
    62		struct device **tdev = &dev;
    63		int ret;
    64	
    65		ret = class_for_each_device(uacce_class, NULL, tdev, cdev_get);
    66		if (ret) {
    67			dev = *tdev;
    68			return UACCE_FROM_CDEV_ATTR(dev);
    69		}
    70		return NULL;
    71	}
    72	EXPORT_SYMBOL_GPL(dev_to_uacce);
    73	
    74	/**
    75	 * uacce_hw_err_isolate - Try to isolate the uacce device with its VFs
    76	 * according to user's configuration of isolation strategy. Warning: this
    77	 * API should be called while there is no user on the device, or the users
    78	 * on this device are suspended by slot resetting preparation of PCI AER.
    79	 * @uacce the uacce device
    80	 */
    81	int uacce_hw_err_isolate(struct uacce *uacce)
  > 82	{
    83		struct uacce_err_isolate *isolate = uacce->isolate;
    84		struct uacce_hw_err *err, *tmp, *hw_err;
    85		u32 count = 0;
    86	
    87	#define SECONDS_PER_HOUR	3600
    88	
    89		/* all the hw errs are processed by PF driver */
    90		if (uacce->is_vf || atomic_read(&isolate->is_isolate) ||
    91			!isolate->hw_err_isolate_hz)
    92			return 0;
    93	
    94		hw_err = kzalloc(sizeof(*hw_err), GFP_ATOMIC);
    95		if (!hw_err)
    96			return -ENOMEM;
    97		hw_err->tick_stamp = jiffies;
    98		list_for_each_entry_safe(err, tmp, &isolate->hw_errs, list) {
    99			if ((hw_err->tick_stamp - err->tick_stamp) / HZ >
   100			    SECONDS_PER_HOUR) {
   101				list_del(&err->list);
   102				kfree(err);
   103			} else {
   104				count++;
   105			}
   106		}
   107		list_add(&hw_err->list, &isolate->hw_errs);
   108	
   109		if (count >= isolate->hw_err_isolate_hz)
   110			atomic_set(&isolate->is_isolate, 1);
   111	
   112		return 0;
   113	}
   114	EXPORT_SYMBOL_GPL(uacce_hw_err_isolate);
   115	
   116	static void uacce_hw_err_destroy(struct uacce *uacce)
   117	{
   118		struct uacce_hw_err *err, *tmp;
   119	
   120		list_for_each_entry_safe(err, tmp, &uacce->isolate_data.hw_errs, list) {
   121			list_del(&err->list);
   122			kfree(err);
   123		}
   124	}
   125	
   126	const char *uacce_qfrt_str(struct uacce_qfile_region *qfr)
   127	{
   128		return qfrt_str[qfr->type];
   129	}
   130	EXPORT_SYMBOL_GPL(uacce_qfrt_str);
   131	
   132	/**
   133	 * uacce_wake_up - Wake up the process who is waiting this queue
   134	 * @q the accelerator queue to wake up
   135	 */
   136	void uacce_wake_up(struct uacce_queue *q)
 > 137	{
   138		dev_dbg(&q->uacce->dev, "wake up\n");
   139		wake_up_interruptible(&q->wait);
   140	}
   141	EXPORT_SYMBOL_GPL(uacce_wake_up);
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
