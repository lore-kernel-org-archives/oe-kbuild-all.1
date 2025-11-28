Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F211C861A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 07:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764313494; cv=none; b=lxqkeY5eGXwtEKe718qMXUoJF2AwkAxvz/kkAmqBQtF/2zLc2kCqe1EQt90i2KICGyVzkBCLzdCbYZTkn9d2t6O1dZHZZM05bmOhjH3DmWeryArEhHHUBT9DLIZJGSmLQCjwGeENgeyRWzrMCY4xM+b1hefW7UZvsyMGmoxQoRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764313494; c=relaxed/simple;
	bh=EJsc0yAsdq2txGLOuGVrqFyCF5/U6tv+uZElnlJyIl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YmgRIYvoXgxSihgM3XHtLYfB5mc+lx6UVmipHomXOV0p9MPe5ONNGczyOWg4w/lrExYuWdjxffznVKFW3ybnbAZFX5iDxmfjrUnuV10Y7lQ5WYZqzuR78PXZq9mHX8JC1sJJeCvrSEY/++ZF9ERqYE3esw8JniI2FwdpBVXgduE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moU+l+S9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moU+l+S9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764313493; x=1795849493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EJsc0yAsdq2txGLOuGVrqFyCF5/U6tv+uZElnlJyIl4=;
  b=moU+l+S9DjgVPFiV0fVT8LcBmEXzWEwULhQ8AOpOrskF5UBBLAV4f7LI
   TXQq8lRuPOe1JhKr13YXlwXmyz8XEJGt6bJ85bPLVQWsczqMdCY8Tg2UB
   5Kr8iRFfNCptGB6tzcvnMV7lGnq7TEkrjdQoyt09mEFSWPOwvGlzAjQFV
   Ddev/mq3U5JCHDFTSIu8ZLdeMoWIl6v4HQqSq3YKxskSXIjKoLRBR2L5E
   PzrAvFTB7KGjK4hNXh+16zPK14iDxwoU6D4ZI7aq6Bmvsu4cnigWNUjoC
   96aotP9NV3g4orm/tZwfI7dQTwfJRnHCsRFb6pJwL1Y2xD0VfLepHlHuX
   Q==;
X-CSE-ConnectionGUID: vBgFCMd+QL23T9t9ZX5HlA==
X-CSE-MsgGUID: 8wsGqALLSqm8n+2LFrGXNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="53913277"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="53913277"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 23:04:53 -0800
X-CSE-ConnectionGUID: sja3sYRZRjCVleut13D9jQ==
X-CSE-MsgGUID: /vI2GWe+QLOtHONB4ZEY6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193290689"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 27 Nov 2025 23:04:52 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOsXB-000000001yr-3KY9;
	Fri, 28 Nov 2025 07:04:49 +0000
Date: Fri, 28 Nov 2025 08:04:45 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3406/3406] htmldocs:
 ./include/ub/cdma/cdma_api.h:94: warning: Function parameter or member
 'trans_mode' not described in 'queue_cfg'
Message-ID: <202511280817.PxN8S1S4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4e0f6ff6542664d2a6d350e8490d042a466aa0e6
commit: 27d2c29e4512954c7efcee4fa62b13fd67ce0f93 [3406/3406] ub: cdma: add CDMA driver-api documentation description
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511280817.PxN8S1S4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280817.PxN8S1S4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/tty_port.h
   Error: Cannot open file ./include/linux/tty_port.h
   Error: Cannot open file ./include/linux/tty.h
   Error: Cannot open file ./include/linux/tty.h
   Error: Cannot open file ./include/linux/tty.h
>> ./include/ub/cdma/cdma_api.h:94: warning: Function parameter or member 'trans_mode' not described in 'queue_cfg'
   ./include/ub/ubase/ubase_comm_ctrlq.h:90: warning: Function parameter or member 'is_async' not described in 'ubase_ctrlq_msg'
   ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'sl_num' not described in 'ubase_adev_qos'
   ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'sl' not described in 'ubase_adev_qos'
   ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'tp_sl_num' not described in 'ubase_adev_qos'
   ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'tp_sl' not described in 'ubase_adev_qos'
--
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function tty_port ./include/linux/tty_port.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function tty_port_operations ./include/linux/tty_port.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function tty_kref_get ./include/linux/tty.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function TTY Struct Flags ./include/linux/tty.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function tty_struct ./include/linux/tty.h' failed with return code 1
>> Documentation/driver-api/ub/cdma.rst:137: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
>> Documentation/driver-api/ub/cdma.rst:137: WARNING: Inline emphasis start-string without end-string. [docutils]
>> Documentation/driver-api/ub/cdma.rst:138: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/ub/index.rst:3: ERROR: Undefined substitution referenced: "copy". [docutils]
   Documentation/driver-api/ub/ubus:6: ./include/ub/ubus/ubus.h:317: WARNING: Inline emphasis start-string without end-string. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/usb/gadget.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/usb/composite.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function typec_altmode_driver -function typec_altmode_ops ./include/linux/usb/typec_altmode.h' failed with return code 1


vim +94 ./include/ub/cdma/cdma_api.h

3aa7aa335383c2 Zhipeng Lu 2025-08-29  74  
27d2c29e451295 Zhipeng Lu 2025-11-24  75  /**
27d2c29e451295 Zhipeng Lu 2025-11-24  76   * struct queue_cfg - DMA queue config structure
27d2c29e451295 Zhipeng Lu 2025-11-24  77   * @queue_depth: queue depth
27d2c29e451295 Zhipeng Lu 2025-11-24  78   * @priority: the priority of JFS, ranging from [0, 15]
27d2c29e451295 Zhipeng Lu 2025-11-24  79   * @user_ctx: user private data information, optional
27d2c29e451295 Zhipeng Lu 2025-11-24  80   * @dcna: remote device CNA
27d2c29e451295 Zhipeng Lu 2025-11-24  81   * @rmt_eid: remote device EID
27d2c29e451295 Zhipeng Lu 2025-11-24  82   * @rsv_bitmap: reserved field bitmap
27d2c29e451295 Zhipeng Lu 2025-11-24  83   * @rsvd: reserved field array
27d2c29e451295 Zhipeng Lu 2025-11-24  84   */
eecfd8889f72f8 Zhipeng Lu 2025-08-28  85  struct queue_cfg {
eecfd8889f72f8 Zhipeng Lu 2025-08-28  86  	u32 queue_depth;
eecfd8889f72f8 Zhipeng Lu 2025-08-28  87  	u8 priority;
eecfd8889f72f8 Zhipeng Lu 2025-08-28  88  	u64 user_ctx;
eecfd8889f72f8 Zhipeng Lu 2025-08-28  89  	u32 dcna;
eecfd8889f72f8 Zhipeng Lu 2025-08-28  90  	struct dev_eid rmt_eid;
eecfd8889f72f8 Zhipeng Lu 2025-08-28  91  	u32 trans_mode;
34c67ed8f4c107 Zhipeng Lu 2025-11-11  92  	u32 rsv_bitmap;
34c67ed8f4c107 Zhipeng Lu 2025-11-11  93  	u32 rsvd[6];
eecfd8889f72f8 Zhipeng Lu 2025-08-28 @94  };
eecfd8889f72f8 Zhipeng Lu 2025-08-28  95  

:::::: The code at line 94 was first introduced by commit
:::::: eecfd8889f72f8c03c8af731e508dc3cb46b4b14 ub: cdma: support for allocating queue

:::::: TO: Zhipeng Lu <luzhipeng8@h-partners.com>
:::::: CC: Zhipeng Lu <luzhipeng8@h-partners.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
