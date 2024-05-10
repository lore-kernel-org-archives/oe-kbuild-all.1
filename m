Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159BA16D4DF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 14:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715349920; cv=none; b=Y9lN6ejHHrB240RmTD5p5/wZtaJyUvgBncEjyZ8t1Pg4I5TIvLZ6QJ7W+LwejeiQsh1udtkEjhJ0yEMXiQHnZjgoB6zyTJE0T7MSzDw0+/DD3tzwSDmENdrB924AHuRKQmFI3O8r4ZCeg7hLLWdpYJ6Sl/Gf3/4Na/GIf9l9F0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715349920; c=relaxed/simple;
	bh=ciida4ilytw+6eXeWGR4Nw2vwF2mUFh0eA8Ml1dnGa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fjhEmU2hU93+EPvHp0bWN/RQ7nqjT1CgL4BmUb9ShbVa8I9XjqMpHhXKu/9kea+uq51sQjUNuPUU3nmqJiLtAp7FQq72JTayuZecgHlYRghWmlnA1+imnHE7Rszr8cZve5A8HhJ/bwPMqMZ+Whgz4JaBveUa31SJIcjPKCL73s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ahwtwqjz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ahwtwqjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715349918; x=1746885918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ciida4ilytw+6eXeWGR4Nw2vwF2mUFh0eA8Ml1dnGa4=;
  b=AhwtwqjzhW6eiRA+OHg7h3LgBRhG8Cu6omUZMc1MjnmqvBdpZbCcHkWw
   qFiSHCciCv43oPHztJzOURQWIwCbp5683vUjuHjysrvIA1ANmftEBIIKe
   EykCfhIAYRrNnS4dPDl2MY3IDeh4HvyP+JEf8KlDMZ7l0u5M2iBlhk3Y7
   LoCzkYDQYXzJcPAYSCsAj9Niy5S4ssdedA7GT1grofZGzf7/r5F/+Nj19
   sRPMrGjV6OC0u0cTs3I9P5NktbUbYo76flmeOnN9vJp5dcrJv7fZ9no6R
   am19iEYOru17MbMNkxrJX4GU+M0/NRs32FxWN8YjuHifbJ7fEEZcsHBVg
   g==;
X-CSE-ConnectionGUID: WVPHKfFxQe+e0AnE/ZuoTw==
X-CSE-MsgGUID: EZcK/7CkRHu3LIfyj/dWIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11192379"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11192379"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 07:05:17 -0700
X-CSE-ConnectionGUID: nuWXBl2NRR2Sfb5kGlaKMQ==
X-CSE-MsgGUID: KixxxcA0Tn6w28PngIVh9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="34274776"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 May 2024 07:05:15 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5Qs5-0006EJ-0D;
	Fri, 10 May 2024 14:05:13 +0000
Date: Fri, 10 May 2024 22:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 25/78] drivers/hid/hid-himax.c:5037:33:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202405102148.2LoX62zX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   15ad8f5fe720a6d74211ce8e00a02924d039e005
commit: 59768788df9572f3dc9fd9a9cee10f1846c8ecac [25/78] CHROMIUM: HID: hid-himax: Add TP inspection function
config: arm64-randconfig-r113-20240510 (https://download.01.org/0day-ci/archive/20240510/202405102148.2LoX62zX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240510/202405102148.2LoX62zX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405102148.2LoX62zX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-himax.c:5037:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected int n_frame @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:5037:33: sparse:     expected int n_frame
   drivers/hid/hid-himax.c:5037:33: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:5039:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected int n_frame @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:5039:33: sparse:     expected int n_frame
   drivers/hid/hid-himax.c:5039:33: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:473:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:473:35: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:473:35: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:540:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:540:35: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:540:35: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:784:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:784:28: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:784:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:792:30: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:824:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:824:28: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:824:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:826:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:826:28: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:826:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:876:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:876:26: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:876:26: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:924:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:924:30: sparse:     expected unsigned short
   drivers/hid/hid-himax.c:924:30: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:941:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:941:36: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:941:36: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:978:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:978:26: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:978:26: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:994:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:994:30: sparse:     expected unsigned short
   drivers/hid/hid-himax.c:994:30: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:1050:30: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:1386:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1386:20: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:1386:20: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1400:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1400:20: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:1400:20: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1407:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1407:20: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:1407:20: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1429:21: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:1511:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1511:20: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:1511:20: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1518:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:1518:22: sparse:     expected unsigned short
   drivers/hid/hid-himax.c:1518:22: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:1519:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:1519:22: sparse:     expected unsigned short
   drivers/hid/hid-himax.c:1519:22: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:1532:13: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:1544:30: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:1552:39: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:1588:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1588:37: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:1588:37: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1590:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1590:37: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:1590:37: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1635:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1635:24: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:1635:24: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1684:16: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:1706:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] vid @@     got restricted __be16 [usertype] @@
   drivers/hid/hid-himax.c:1706:26: sparse:     expected unsigned short [usertype] vid
   drivers/hid/hid-himax.c:1706:26: sparse:     got restricted __be16 [usertype]
   drivers/hid/hid-himax.c:1707:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] pid @@     got restricted __be16 [usertype] @@
   drivers/hid/hid-himax.c:1707:26: sparse:     expected unsigned short [usertype] pid
   drivers/hid/hid-himax.c:1707:26: sparse:     got restricted __be16 [usertype]
   drivers/hid/hid-himax.c:1712:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] y_res @@     got restricted __be16 [usertype] @@
   drivers/hid/hid-himax.c:1712:28: sparse:     expected unsigned short [usertype] y_res
   drivers/hid/hid-himax.c:1712:28: sparse:     got restricted __be16 [usertype]
   drivers/hid/hid-himax.c:1713:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] x_res @@     got restricted __be16 [usertype] @@
   drivers/hid/hid-himax.c:1713:28: sparse:     expected unsigned short [usertype] x_res
   drivers/hid/hid-himax.c:1713:28: sparse:     got restricted __be16 [usertype]
   drivers/hid/hid-himax.c:1857:57: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] *[assigned] word @@
   drivers/hid/hid-himax.c:1857:57: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1857:57: sparse:     got unsigned int [usertype] *[assigned] word
   drivers/hid/hid-himax.c:1859:61: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] *[assigned] word @@
   drivers/hid/hid-himax.c:1859:61: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1859:61: sparse:     got unsigned int [usertype] *[assigned] word
   drivers/hid/hid-himax.c:1981:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1981:20: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:1981:20: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:2085:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be16 const [usertype] *p @@     got unsigned short [usertype] * @@
   drivers/hid/hid-himax.c:2085:31: sparse:     expected restricted __be16 const [usertype] *p
   drivers/hid/hid-himax.c:2085:31: sparse:     got unsigned short [usertype] *
   drivers/hid/hid-himax.c:2086:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be16 const [usertype] *p @@     got unsigned short [usertype] * @@
   drivers/hid/hid-himax.c:2086:31: sparse:     expected restricted __be16 const [usertype] *p
   drivers/hid/hid-himax.c:2086:31: sparse:     got unsigned short [usertype] *
   drivers/hid/hid-himax.c:2187:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:2187:26: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:2187:26: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:2298:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:2298:44: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:2298:44: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:2299:41: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:2299:41: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:2299:41: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:2306:52: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:2306:52: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:2306:52: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:2307:49: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:2307:49: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:2307:49: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:2308:50: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:2308:50: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:2308:50: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:2362:60: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:2362:60: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:2362:60: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:2435:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:2435:26: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:2435:26: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:2913:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:2913:35: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:2913:35: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:2918:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:2918:47: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:2918:47: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:2924:46: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:3280:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:3280:41: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:3280:41: sparse:     got restricted __le32 [usertype]
>> drivers/hid/hid-himax.c:3938:60: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short static [toplevel] [usertype] report_cnt @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:3938:60: sparse:     expected unsigned short static [toplevel] [usertype] report_cnt
   drivers/hid/hid-himax.c:3938:60: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:4132:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:4134:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:4136:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:4138:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:4140:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:4142:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:4144:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:4146:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:4148:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:4150:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:4294:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:4294:28: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:4294:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:4296:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:4296:28: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:4296:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:4712:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:4712:20: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:4712:20: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:4722:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:4722:28: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:4722:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:4725:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:4725:28: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:4725:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:4728:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:4728:28: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:4728:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:4731:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:4731:28: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:4731:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:4735:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:4735:28: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:4735:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:4739:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:4739:28: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:4739:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:4868:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:4868:20: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:4868:20: sparse:     got restricted __le32 [usertype]
>> drivers/hid/hid-himax.c:4899:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] wait_pwd @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:4899:26: sparse:     expected unsigned short [usertype] wait_pwd
   drivers/hid/hid-himax.c:4899:26: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:4902:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] wait_pwd @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:4902:26: sparse:     expected unsigned short [usertype] wait_pwd
   drivers/hid/hid-himax.c:4902:26: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:4905:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] wait_pwd @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:4905:26: sparse:     expected unsigned short [usertype] wait_pwd
   drivers/hid/hid-himax.c:4905:26: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:4908:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] wait_pwd @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:4908:26: sparse:     expected unsigned short [usertype] wait_pwd
   drivers/hid/hid-himax.c:4908:26: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:4911:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] wait_pwd @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:4911:26: sparse:     expected unsigned short [usertype] wait_pwd
   drivers/hid/hid-himax.c:4911:26: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:4915:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] wait_pwd @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:4915:26: sparse:     expected unsigned short [usertype] wait_pwd
   drivers/hid/hid-himax.c:4915:26: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:4927:14: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:4957:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] wait_pwd @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:4957:26: sparse:     expected unsigned short [usertype] wait_pwd
   drivers/hid/hid-himax.c:4957:26: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:4960:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] wait_pwd @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:4960:26: sparse:     expected unsigned short [usertype] wait_pwd
   drivers/hid/hid-himax.c:4960:26: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:4963:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] wait_pwd @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:4963:26: sparse:     expected unsigned short [usertype] wait_pwd
   drivers/hid/hid-himax.c:4963:26: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:4966:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] wait_pwd @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:4966:26: sparse:     expected unsigned short [usertype] wait_pwd
   drivers/hid/hid-himax.c:4966:26: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:4969:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] wait_pwd @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:4969:26: sparse:     expected unsigned short [usertype] wait_pwd
   drivers/hid/hid-himax.c:4969:26: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:4972:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] wait_pwd @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:4972:26: sparse:     expected unsigned short [usertype] wait_pwd
   drivers/hid/hid-himax.c:4972:26: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:4984:22: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c: note: in included file (through include/drm/drm_panel.h, drivers/hid/hid-himax.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +5037 drivers/hid/hid-himax.c

  4875	
  4876	/**
  4877	 * himax_check_mode() - Check the inspection mode
  4878	 * @ts: Himax touch screen data
  4879	 * @checktype: Inspection mode
  4880	 *
  4881	 * This function is used to check the inspection mode for self test. It will
  4882	 * read the sorting mode register and compare it with the expected value.
  4883	 * If the mode is not matched, it will return
  4884	 * HIMAX_INSPECT_CHANGE_MODE_REQUIRED, otherwise return 0 indicate the mode
  4885	 * is matched.
  4886	 *
  4887	 * Return: 0 on mode matched, HIMAX_INSPECT_CHANGE_MODE_REQUIRED when mode
  4888	 * change required, negative error code on failure
  4889	 */
  4890	static int himax_check_mode(struct himax_ts_data *ts, u32 checktype)
  4891	{
  4892		int ret;
  4893		const u16 passwd_mask = GENMASK(15, 0);
  4894		u16 wait_pwd;
  4895		union himax_dword_data data;
  4896	
  4897		switch (checktype) {
  4898		case HIMAX_INSPECT_SORTING:
> 4899			wait_pwd = cpu_to_le16(HIMAX_PWD_SORTING_END);
  4900			break;
  4901		case HIMAX_INSPECT_OPEN:
  4902			wait_pwd = cpu_to_le16(HIMAX_PWD_OPEN_END);
  4903			break;
  4904		case HIMAX_INSPECT_MICRO_OPEN:
  4905			wait_pwd = cpu_to_le16(HIMAX_PWD_OPEN_END);
  4906			break;
  4907		case HIMAX_INSPECT_SHORT:
  4908			wait_pwd = cpu_to_le16(HIMAX_PWD_SHORT_END);
  4909			break;
  4910		case HIMAX_INSPECT_RAWDATA:
  4911			wait_pwd = cpu_to_le16(HIMAX_PWD_RAWDATA_END);
  4912			break;
  4913	
  4914		case HIMAX_INSPECT_ABS_NOISE:
  4915			wait_pwd = cpu_to_le16(HIMAX_PWD_NOISE_END);
  4916			break;
  4917	
  4918		default:
  4919			dev_err(ts->dev, "%s: Wrong type = %u\n", __func__, checktype);
  4920			return -HIMAX_INSPECT_ESWITCHMODE;
  4921		}
  4922	
  4923		ret = himax_mcu_check_sorting_mode(ts, data.byte);
  4924		if (ret)
  4925			return ret;
  4926	
  4927		if ((le32_to_cpu(data.dword) & passwd_mask) == wait_pwd) {
  4928			dev_info(ts->dev, "%s: Current sorting mode: %s\n", __func__,
  4929				 g_himax_inspection_mode[checktype]);
  4930			return 0;
  4931		} else {
  4932			return HIMAX_INSPECT_CHANGE_MODE_REQUIRED;
  4933		}
  4934	}
  4935	
  4936	/**
  4937	 * himax_wait_sorting_mode() - Wait the inspection mode
  4938	 * @ts: Himax touch screen data
  4939	 * @checktype: Inspection mode
  4940	 *
  4941	 * This function is used to wait the inspection mode for self test. It will
  4942	 * read current sorting mode for most 10 times each interval 50ms to check
  4943	 * if the target mode is reached.
  4944	 *
  4945	 * Return: 0 on success, negative error code on failure
  4946	 */
  4947	static int himax_wait_sorting_mode(struct himax_ts_data *ts, u32 checktype)
  4948	{
  4949		const u16 passwd_mask = GENMASK(15, 0);
  4950		u16 wait_pwd;
  4951		u32 retry_cnt;
  4952		const u32 retry_limit = 10;
  4953		union himax_dword_data data;
  4954	
  4955		switch (checktype) {
  4956		case HIMAX_INSPECT_SORTING:
  4957			wait_pwd = cpu_to_le16(HIMAX_PWD_SORTING_END);
  4958			break;
  4959		case HIMAX_INSPECT_OPEN:
  4960			wait_pwd = cpu_to_le16(HIMAX_PWD_OPEN_END);
  4961			break;
  4962		case HIMAX_INSPECT_MICRO_OPEN:
  4963			wait_pwd = cpu_to_le16(HIMAX_PWD_OPEN_END);
  4964			break;
  4965		case HIMAX_INSPECT_SHORT:
  4966			wait_pwd = cpu_to_le16(HIMAX_PWD_SHORT_END);
  4967			break;
  4968		case HIMAX_INSPECT_RAWDATA:
  4969			wait_pwd = cpu_to_le16(HIMAX_PWD_RAWDATA_END);
  4970			break;
  4971		case HIMAX_INSPECT_ABS_NOISE:
  4972			wait_pwd = cpu_to_le16(HIMAX_PWD_NOISE_END);
  4973			break;
  4974	
  4975		default:
  4976			dev_warn(ts->dev, "%s: No target type = %u\n", __func__, checktype);
  4977			return -HIMAX_INSPECT_ESWITCHMODE;
  4978		}
  4979		dev_info(ts->dev, "%s: NowType: %s, Expected = 0x%04X\n", __func__,
  4980			 g_himax_inspection_mode[checktype], wait_pwd);
  4981		for (retry_cnt = 0; retry_cnt < retry_limit; retry_cnt++) {
  4982			if (himax_mcu_check_sorting_mode(ts, data.byte))
  4983				return -HIMAX_INSPECT_ESWITCHMODE;
  4984			if ((le32_to_cpu(data.dword) & passwd_mask) == wait_pwd)
  4985				return 0;
  4986			usleep_range(50000, 50100);
  4987		}
  4988	
  4989		return -HIMAX_INSPECT_ESWITCHMODE;
  4990	}
  4991	
  4992	/**
  4993	 * himax_self_test() - Self test work function
  4994	 * @work: Work structure
  4995	 *
  4996	 * This function is used to perform the self test. It will check current
  4997	 * mode, switch mode if required, wait the sorting mode, switch data type,
  4998	 * set N frame, and get the data. The switch mode step may take more time
  4999	 * by circustance, so it will retry 3 times if it failed. Wheather the
  5000	 * self test is finished or failed, it will unlock the hid_ioctl_lock.
  5001	 *
  5002	 * Return: None
  5003	 */
  5004	static void himax_self_test(struct work_struct *work)
  5005	{
  5006		int ret, n_frame;
  5007		int switch_mode_cnt = 0;
  5008		const int switch_mode_retry_limit = 3;
  5009		struct himax_ts_data *ts =
  5010			container_of(work, struct himax_ts_data, work_self_test.work);
  5011		u32 checktype = ts->hid_req_cfg.self_test_type;
  5012	
  5013		ret = himax_check_mode(ts, checktype);
  5014		if (ret < 0) {
  5015			ts->hid_req_cfg.handshake_get = HIMAX_HID_SELF_TEST_ERROR;
  5016			goto END;
  5017		}
  5018	
  5019		if (ret == HIMAX_INSPECT_CHANGE_MODE_REQUIRED) {
  5020			dev_info(ts->dev, "%s: Need Change Mode, target = %s\n", __func__,
  5021				 g_himax_inspection_mode[checktype]);
  5022	SWITCH_MODE:
  5023			ret = hx83102j_sense_off(ts, true);
  5024			if (ret) {
  5025				ts->hid_req_cfg.handshake_get = HIMAX_HID_SELF_TEST_ERROR;
  5026				goto END;
  5027			}
  5028	
  5029			ret = himax_switch_mode_inspection(ts, checktype);
  5030			if (ret) {
  5031				dev_err(ts->dev, "%s: switch mode failed!\n", __func__);
  5032				ts->hid_req_cfg.handshake_get = HIMAX_HID_SELF_TEST_ERROR;
  5033				goto END;
  5034			}
  5035	
  5036			if (checktype == HIMAX_INSPECT_ABS_NOISE)
> 5037				n_frame = cpu_to_le32(HIMAX_NFRAME_NOISE);
  5038			else
  5039				n_frame = cpu_to_le32(HIMAX_NFRAME_OTHER);
  5040	
  5041			ret = himax_set_N_frame(ts, n_frame, checktype);
  5042			if (ret) {
  5043				dev_err(ts->dev, "%s: set N frame failed!\n", __func__);
  5044				ts->hid_req_cfg.handshake_get = HIMAX_HID_SELF_TEST_ERROR;
  5045				goto END;
  5046			}
  5047			ret = hx83102j_sense_on(ts, true);
  5048			if (ret) {
  5049				dev_err(ts->dev, "%s: sense on failed!\n", __func__);
  5050				ts->hid_req_cfg.handshake_get = HIMAX_HID_SELF_TEST_ERROR;
  5051				goto END;
  5052			}
  5053		}
  5054	
  5055		ret = himax_wait_sorting_mode(ts, checktype);
  5056		if (ret) {
  5057			if (ret == -HIMAX_INSPECT_ESWITCHMODE &&
  5058			    switch_mode_cnt < switch_mode_retry_limit) {
  5059				switch_mode_cnt++;
  5060				himax_mcu_ic_reset(ts, false);
  5061				goto SWITCH_MODE;
  5062			}
  5063			dev_err(ts->dev, "%s: Wait sorting mode timeout\n", __func__);
  5064			ts->hid_req_cfg.handshake_get = HIMAX_HID_SELF_TEST_ERROR;
  5065			goto END;
  5066		}
  5067		ret = himax_switch_data_type(ts, checktype);
  5068		if (ret) {
  5069			dev_err(ts->dev, "%s: switch data type failed\n", __func__);
  5070			ts->hid_req_cfg.handshake_get = HIMAX_HID_SELF_TEST_ERROR;
  5071			goto END;
  5072		}
  5073	
  5074		ts->hid_req_cfg.handshake_get = HIMAX_HID_SELF_TEST_FINISH;
  5075	END:
  5076		mutex_unlock(&ts->hid_ioctl_lock);
  5077	}
  5078	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
