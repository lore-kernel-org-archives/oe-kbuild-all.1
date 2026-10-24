Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792847802;
	b=EfFUdbJgc5okgvtLrMNMH7XRKFTBOr1d8d4pXYl1QZUKGxF70djOZLHMYOzH3bSv9JLV
	 5ySL5ZVwZSaphW2VOxSqD8H4NvcYMTQVRjOipEmmpCy+oqMLVmImoUdkmPEQU0LAoiuBB
	 Q1JAvIvHLzmfdX8D/0Y3dna2oclHTarA6hcUqln5CtYDAFybFIVUeQtLgkesAAwqofZgN
	 SDVtuANrkmJyI5pMQxqfEnAdyFbeklZLxrdjQTAnwPyqTNbn+edkSIP1p5M8/Jp7W5OZd
	 7YlSkTNNjNvr7X2mk+njXLVELIn6GPgKB2kOEqmePca8ma8ouzk79QOy5qj/Yj+asgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792847802;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YSFgOajXbjj00QFxt/4oxT5xQYnZimoW02ksPI9B/vk=;
	b=5O5wgxojeGX3qfr5pTV2nkoxw8nbMESiiVEIVgSMTnUc/WLDVVAKfLGkCmnDt57Xt7h7
	 3Lti0BV6ZYBN4r3nGiotmasCMd4JtpWrUU76oZgN5/h1SGyYkAY/r+etb1K2Oy2/8gQyk
	 IlI4dHEL0mbdl/g4rqI7yAUEDl22rGMV9jR2Jicwd/NQgsyxOoEBn1/cZyMK0xBXuIkLC
	 V5QMD1+Q/GSSPpDL9jtkf3iilIYy5cG+IBqimTdOUnPBQTDvFOi4RvmjyEI6M7RCCGbIz
	 M0vafpAWUSgxLOyDkDos0zcAASxsVR+qjuD5wr9G4jyC5uCEPiQyNd1Vb3j/cAZZlnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KcuYwUpj;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46CB606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 13:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E46CB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KcuYwUpj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792847800; x=1824383800;
  h=date:from:to:cc:subject:message-id;
  bh=0QykBRM0KbEFVoJaQipcfej9SJG4y2rTteO4ggJW4+A=;
  b=KcuYwUpjCTS+g1SgNDRLgJh4kyO+UBFR4q4ad5dRznTfWyc01Zpp1zgy
   Qf+lkJltxidMknkERaUcj5c6bGUscn0NG5VlbimUO4FdCxc4u6BLcjzoa
   Q7TOak0iRS5mGRLQgWATzKEaH/4WgM+pxaYylMsNrGyYYptfxqQIXuAlD
   nklbA7Jb4aK4D/3qV5MdlzoOUVS0TR1jYtkhzwl1qHW/8LgowT49Xh4ll
   WFhBSY0jQTGtXDcu/oX5ydILYZOy5+ad5NhsBbEAVPjtevK3I+fmcepn7
   JNVuGqWKVr5kh9nJWl+C2XB/XJZMNezYTRDcsDbUpf9AGyFdsgeAaUFxj
   A==;
X-CSE-ConnectionGUID: /e+Ft2VwRBuaHhk7ljNNTQ==
X-CSE-MsgGUID: QawdtazPTzGNkAC6M34Znw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1570288"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1570288"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 06:16:38 -0700
X-CSE-ConnectionGUID: WiMPiGW/RC2MQrsKgDp72Q==
X-CSE-MsgGUID: Q3QhVP7+RpSYdDcRiCr8gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="3975263"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Oct 2026 06:16:37 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKbbu-00000000Tti-0jH8;
	Sat, 24 Oct 2026 13:16:34 +0000
Date: Sat, 24 Oct 2026 21:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 drivers/hid/hid-steam.c:1154:7: warning: variable 'connected' set but not
 used
Message-ID: <202610242103.sTUyI8qV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Vicki,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   60cf931c5a95dacbbd86483d5d0978e80a756ccd
commit: e1147961b2145fa61c3078a4a797d9576cde91ab [0/1] HID: hid-steam: Move hidraw input (un)registering to work
config: i386-buildonly-randconfig-1000-20261020 (https://download.01.org/0day-ci/archive/20261024/202610242103.sTUyI8qV-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610242103.sTUyI8qV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610242103.sTUyI8qV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-steam.c:1154:7: warning: variable 'connected' set but not used [-Wunused-but-set-variable]
    1154 |         bool connected;
         |              ^
   1 warning generated.


vim +/connected +1154 drivers/hid/hid-steam.c

c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  1148  
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  1149  static void steam_client_ll_close(struct hid_device *hdev)
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  1150  {
4bff980f9206936 Rodrigo Rivas Costa 2018-05-22  1151  	struct steam_device *steam = hdev->driver_data;
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  1152  
6b538cc21334b83 Rodrigo Rivas Costa 2019-03-15  1153  	unsigned long flags;
6b538cc21334b83 Rodrigo Rivas Costa 2019-03-15 @1154  	bool connected;
6b538cc21334b83 Rodrigo Rivas Costa 2019-03-15  1155  
6b538cc21334b83 Rodrigo Rivas Costa 2019-03-15  1156  	spin_lock_irqsave(&steam->lock, flags);
9544708c64bc2c3 Vicki Pfau          2023-12-19  1157  	steam->client_opened = false;
9544708c64bc2c3 Vicki Pfau          2023-12-19  1158  	connected = steam->connected && !steam->client_opened;
6b538cc21334b83 Rodrigo Rivas Costa 2019-03-15  1159  	spin_unlock_irqrestore(&steam->lock, flags);
6b538cc21334b83 Rodrigo Rivas Costa 2019-03-15  1160  
e1147961b2145fa Vicki Pfau          2025-02-04  1161  	schedule_work(&steam->unregister_work);
9544708c64bc2c3 Vicki Pfau          2023-12-19  1162  }
c164d6abf3841ff Rodrigo Rivas Costa 2018-04-16  1163  

:::::: The code at line 1154 was first introduced by commit
:::::: 6b538cc21334b83f09b25dec4aa2d2726bf07ed0 HID: steam: fix deadlock with input devices.

:::::: TO: Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
