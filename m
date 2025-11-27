Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CD4335556
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 15:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764256846; cv=none; b=P/QRQFQoqdPw7UH2idDUYZlZESuhviYGppDrUtlZxpYfl9v3zwwv7L5eDUcpkp2LdfwHIlt2DlXEqpIXcwg/i7RpWYjvGBLccM+BW1M/BrHMqDcFHxn6m033fIJ32dp+sCscvSYQLXnn77xIgQC50xOBBuR72t80//d4cU1uqPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764256846; c=relaxed/simple;
	bh=6bDkdPeEbpiZ6eSCG6+CkvLFgAiVhHKfDf69WMi5FzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I773URoKu4RQIsQnJno+Up6Xa0GhnsKlpiWKF2numdNNNxB9Pb4HmatTPFo5wkqhKNKGtMdb7SLLi0/wFS23wgQfniWrGdYP+QziuDaBsrFJV5K4ohEwkNIXcp20ZMQn2VgejVkvcr5jF69M3g3IAI8ls/0stMM9uh8i2YCZDXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RR9famir; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RR9famir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764256844; x=1795792844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6bDkdPeEbpiZ6eSCG6+CkvLFgAiVhHKfDf69WMi5FzY=;
  b=RR9famirvANZAhcvP1ogbIFXRYn56RQdbZj9Q2al/lTczlzyocHZ9NUR
   mTXNAN8rAAOwBxtvY3u1PX3TU65nLURJKyw4q6PWf2ShAEWxij27NQ8xI
   g2yJzWa7z3wrXKufhmuik63qYa9bp3QV2Ry1g//66wiKpt54B80MqUgYQ
   tv1+GDF4NASJ/3uL+yx/79QF8KLdfsojsDwFOG0ldp73RPCr7w6KmDh7c
   eoYinM2LFfP5Vke5tTVbccwYCWgzFcREIW0RhgAXYY5WVFKjs3kQ6x91N
   WLY6LUq6cG9fr+jDnLMK/c6zqqycB2vHLBwTAvisje5CRMMx3MyXKlW4G
   Q==;
X-CSE-ConnectionGUID: bQDsJfkHQ0Ky11YDoA6t/A==
X-CSE-MsgGUID: Q5/JnQChQk2PKNMp2IAIfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66266121"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="66266121"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 07:20:44 -0800
X-CSE-ConnectionGUID: DWPVxdlsTZSzrFfdxU7cOw==
X-CSE-MsgGUID: hq6blX4sR0+OccS6ZMsJtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="197424294"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 27 Nov 2025 07:20:42 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOdnU-000000001mf-0fMB;
	Thu, 27 Nov 2025 15:20:40 +0000
Date: Thu, 27 Nov 2025 16:19:52 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Fengyan Mu <mufengyan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3392/3392] htmldocs:
 ./include/ub/ubase/ubase_comm_ctrlq.h:90: warning: Function parameter or
 member 'is_async' not described in 'ubase_ctrlq_msg'
Message-ID: <202511271621.CZZ36bxq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   344a2673d58146148c1454c968f3f3dadd3b8cd5
commit: c7286df8de9606db5221782319ac1a0e103f9524 [3392/3392] ub: ubase: Introduces the functions and data structures exposed by the ubase driver
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511271621.CZZ36bxq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271621.CZZ36bxq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/tty_port.h
   Error: Cannot open file ./include/linux/tty_port.h
   Error: Cannot open file ./include/linux/tty.h
   Error: Cannot open file ./include/linux/tty.h
   Error: Cannot open file ./include/linux/tty.h
>> ./include/ub/ubase/ubase_comm_ctrlq.h:90: warning: Function parameter or member 'is_async' not described in 'ubase_ctrlq_msg'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'sl_num' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'sl' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'tp_sl_num' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'tp_sl' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'ctp_sl_num' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'ctp_sl' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'vl_num' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'vl' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'tp_vl_num' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'tp_resp_vl_offset' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'tp_req_vl' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'ctp_vl_num' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'ctp_resp_vl_offset' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'ctp_req_vl' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'dscp_vl' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'ue_max_vl_id' not described in 'ubase_adev_qos'
>> ./include/ub/ubase/ubase_comm_dev.h:318: warning: Function parameter or member 'ue_sl_vl' not described in 'ubase_adev_qos'
   ./drivers/usb/dwc3/core.h:1370: warning: Function parameter or member 'gfladj_refclk_lpm_sel' not described in 'dwc3'
   Error: Cannot open file ./include/linux/usb/gadget.h
   Error: Cannot open file ./include/linux/usb/gadget.h
   Error: Cannot open file ./include/linux/usb/composite.h
   Error: Cannot open file ./include/linux/usb/composite.h


vim +90 ./include/ub/ubase/ubase_comm_ctrlq.h

727362c0978ca7 Xiongchuan Zhou 2025-09-20  60  
c7286df8de9606 Fengyan Mu      2025-11-21  61  /**
c7286df8de9606 Fengyan Mu      2025-11-21  62   * struct ubase_ctrlq_msg - ubase ctrlq msg structure
c7286df8de9606 Fengyan Mu      2025-11-21  63   * @service_ver: ctrlq service version
c7286df8de9606 Fengyan Mu      2025-11-21  64   * @service_type: ctrlq service type
c7286df8de9606 Fengyan Mu      2025-11-21  65   * @opcode: ctrlq opcode
c7286df8de9606 Fengyan Mu      2025-11-21  66   * @need_resp: whether the message need a response
c7286df8de9606 Fengyan Mu      2025-11-21  67   * @is_resp: whether the message is a response
c7286df8de9606 Fengyan Mu      2025-11-21  68   * @resv: reserved bits
c7286df8de9606 Fengyan Mu      2025-11-21  69   * @resp_ret: the return value of response message
c7286df8de9606 Fengyan Mu      2025-11-21  70   * @resp_seq: response message sequence
c7286df8de9606 Fengyan Mu      2025-11-21  71   * @in_size: input data buffer size
c7286df8de9606 Fengyan Mu      2025-11-21  72   * @out_size: output data buffer size
c7286df8de9606 Fengyan Mu      2025-11-21  73   * @in: input data buffer
c7286df8de9606 Fengyan Mu      2025-11-21  74   * @out: output data buffer
c7286df8de9606 Fengyan Mu      2025-11-21  75   */
d7ce08663cc5bc Xiongchuan Zhou 2025-09-17  76  struct ubase_ctrlq_msg {
d7ce08663cc5bc Xiongchuan Zhou 2025-09-17  77  	enum ubase_ctrlq_ser_ver	service_ver;
d7ce08663cc5bc Xiongchuan Zhou 2025-09-17  78  	enum ubase_ctrlq_ser_type	service_type;
d7ce08663cc5bc Xiongchuan Zhou 2025-09-17  79  	u8	opcode;
d7ce08663cc5bc Xiongchuan Zhou 2025-09-17  80  	u8	need_resp : 1;
d7ce08663cc5bc Xiongchuan Zhou 2025-09-17  81  	u8	is_resp : 1;
0ee149f4767688 Fengyan Mu      2025-11-12  82  	u8	is_async : 1;
0ee149f4767688 Fengyan Mu      2025-11-12  83  	u8	resv : 5;
d7ce08663cc5bc Xiongchuan Zhou 2025-09-17  84  	u8	resp_ret; /* must set when the is_resp field is true. */
d7ce08663cc5bc Xiongchuan Zhou 2025-09-17  85  	u16	resp_seq; /* must set when the is_resp field is true. */
d7ce08663cc5bc Xiongchuan Zhou 2025-09-17  86  	u16	in_size;
d7ce08663cc5bc Xiongchuan Zhou 2025-09-17  87  	u16	out_size;
d7ce08663cc5bc Xiongchuan Zhou 2025-09-17  88  	void	*in;
d7ce08663cc5bc Xiongchuan Zhou 2025-09-17  89  	void	*out;
d7ce08663cc5bc Xiongchuan Zhou 2025-09-17 @90  };
d7ce08663cc5bc Xiongchuan Zhou 2025-09-17  91  

:::::: The code at line 90 was first introduced by commit
:::::: d7ce08663cc5bc33993af7b046eb09e98640c404 ub: ubase: Supports for ctrl queue management.

:::::: TO: Xiongchuan Zhou <zhouxiongchuan@h-partners.com>
:::::: CC: Fengyan Mu <mufengyan@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
