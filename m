Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C2D149DF0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 14:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733496385; cv=none; b=D/qNISqCi5hftLq7uI9TRubiTKLzvn0rbZLfnjM3DYrdb/KVjfap8juNHzDYauXlaSXDvjnEY0JHFWCs6EuFKrQET5i7TYlbBYZK8EU53kF6czWItrIpUmBW/7U+U36DXvrTaD4iaVVTwflqSUM7XVQP5zfiZLpgF13eNVnPB1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733496385; c=relaxed/simple;
	bh=4aHjW0Q8DThucIqZ5lgxZ0EwBuoB83qwJ1Mmj/zh65U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MU6mILBxL1Xm28YiwDhTvXMkF14bvkSfhBUnV4S89+3yG25q8/NqmG35Zxe2qWAop7dy+dtKW4Aw9AUaYCDd+eD5FuZcIpVe+p6A1TgPUN5ABaoJ8ZCKXVdso3OIfK0iOHTBLDewavLJGSkYVmkuAJ8awkC8eZ3Xxp7g5auR+J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SGM5zd5z; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SGM5zd5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733496384; x=1765032384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4aHjW0Q8DThucIqZ5lgxZ0EwBuoB83qwJ1Mmj/zh65U=;
  b=SGM5zd5zQf1rRdNlKzsrhyZO5rfo4Evqaux7/lCleOwLj78iwUCPLcHc
   p230NQ+HhISiNr2AC+7U/crFs5JUCbPtnyyMiQVS8QkyfmyGyfvtWIx3B
   Qc+vscQHb0VHmbraE37VHghyn63Kz5ubPdGI39/nWYQ2f4F3njw4qCvRt
   rqGmM/dOgOANeG1o+N+2WVc+KfnKtdeeauI3x0keG54zWgHOQHwlN4Lgf
   9iV1QZOY+BCreC7K+4DF6sGyfNZ71lurs58FUM8+/vxtNA58WImlh85WI
   bzA6D0VQ5jHxmQPCb6T9QRJBhp2MwOwAc2ye5eCJZEeWuk5n0b6mQogAv
   w==;
X-CSE-ConnectionGUID: /0Um6HB1RkuN6Bd2z5KSeA==
X-CSE-MsgGUID: F2ocrm3AT6SDZ1FRxG5cSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="37526182"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="37526182"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 06:46:21 -0800
X-CSE-ConnectionGUID: ptN/p7hhQOmONmXBLyAOUQ==
X-CSE-MsgGUID: wD8cXCcgQX+IhtqOM+oeAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="99374661"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Dec 2024 06:46:19 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJZay-0001GK-2z;
	Fri, 06 Dec 2024 14:46:16 +0000
Date: Fri, 6 Dec 2024 22:45:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2544/2544]
 drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:64:39: sparse:
 sparse: invalid bitfield specifier for type restricted __le16.
Message-ID: <202412062204.1rdIvvRJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9cf5f60a8d57b2498fb9f9223825d6933b2d2fd5
commit: 656d579e9c4f700f9f7debda0c2541f34fc39a35 [2544/2544] drivers: initial support for rnpgbevf drivers from Mucse Technology
config: x86_64-randconfig-123-20241205 (https://download.01.org/0day-ci/archive/20241206/202412062204.1rdIvvRJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412062204.1rdIvvRJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412062204.1rdIvvRJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_mbx.c: note: in included file (through include/linux/string.h, include/linux/uuid.h, include/linux/mod_devicetable.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_mbx.c: note: in included file (through include/linux/kernel.h, include/asm-generic/bug.h, arch/x86/include/asm/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_mbx.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/asm-generic/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_mbx.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbevf/vf.h, drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_mbx.h):
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:64:39: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:65:40: sparse: sparse: invalid bitfield specifier for type restricted __le16.
--
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_sysfs.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_sysfs.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_sysfs.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_sysfs.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbevf/vf.h, drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf.h):
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:64:39: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:65:40: sparse: sparse: invalid bitfield specifier for type restricted __le16.
--
   drivers/net/ethernet/mucse/rnpgbevf/vf.c: note: in included file (through include/linux/string.h, include/linux/uuid.h, include/linux/mod_devicetable.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/vf.c: note: in included file (through include/linux/kernel.h, include/asm-generic/bug.h, arch/x86/include/asm/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/vf.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/asm-generic/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/vf.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbevf/vf.h):
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:64:39: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:65:40: sparse: sparse: invalid bitfield specifier for type restricted __le16.
>> drivers/net/ethernet/mucse/rnpgbevf/vf.c:236:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:236:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:236:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:238:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:238:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:238:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:239:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:239:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:239:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:240:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:240:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:240:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:241:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:241:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/vf.c:241:9: sparse:    void *
--
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_ethtool.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_ethtool.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_ethtool.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_ethtool.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbevf/vf.h, drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf.h):
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:64:39: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:65:40: sparse: sparse: invalid bitfield specifier for type restricted __le16.
--
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: note: in included file (through drivers/net/ethernet/mucse/rnpgbevf/vf.h, drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf.h):
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:64:39: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:65:40: sparse: sparse: invalid bitfield specifier for type restricted __le16.
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:111:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:111:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:111:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1969:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1969:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1969:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2026:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2026:17: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2026:17: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3163:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3163:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3163:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3206:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3206:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3206:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3283:25: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3283:25: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3283:25: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3343:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3343:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3343:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3347:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3347:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3347:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3424:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3424:17: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3424:17: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3466:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3466:17: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3466:17: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4031:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4031:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4031:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4035:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4035:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4035:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4133:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4133:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4133:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4137:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4137:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4137:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4277:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4277:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4277:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4367:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4367:9: sparse:    void
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4367:9: sparse:    void *

vim +64 drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h

    51	
    52	/* Transmit Descriptor - Advanced */
    53	struct rnp_tx_desc {
    54		union {
    55			__le64 pkt_addr; /* Packet buffer address */
    56			struct {
    57				__le32 adr_lo;
    58				__le32 adr_hi;
    59			};
    60		};
    61		__le16 blen;
    62		union {
    63			struct {
  > 64				__le16 ip_len : 9;
    65				__le16 mac_len : 7;
    66			};
    67			__le16 mac_ip_len; /* used only in  tso & csum */
    68		};
    69		__le16 vlan;
    70	#define RNPGBE_TXD_FLAGS_VLAN_PRIO_MASK 0xe000
    71	#define RNPGBE_TX_FLAGS_VLAN_PRIO_SHIFT 13
    72	#define RNPGBE_TX_FLAGS_VLAN_CFI_SHIFT 12
    73	
    74		__le16 cmd;
    75	#define RNPGBE_TXD_VLAN_VALID (0x1 << 15)
    76	#define RNPGBE_TXD_SVLAN_TYPE (0x1 << 9)
    77	#define RNPGBE_TXD_VLAN_CTRL_NOP (0x00 << 13)
    78	#define RNPGBE_TXD_VLAN_CTRL_RM_VLAN (0x01 << 13)
    79	#define RNPGBE_TXD_VLAN_CTRL_INSERT_VLAN (0x02 << 13)
    80	#define RNPGBE_TXD_L4_CSUM (0x1 << 12)
    81	#define RNPGBE_TXD_IP_CSUM (0x1 << 11)
    82	#define RNPGBE_TXD_TUNNEL_MASK (0x3000000)
    83	#define RNPGBE_TXD_TUNNEL_VXLAN (0x01 << 8)
    84	#define RNPGBE_TXD_TUNNEL_NVGRE (0x02 << 8)
    85	#define RNPGBE_TXD_L4_TYPE_UDP (0x03 << 6)
    86	#define RNPGBE_TXD_L4_TYPE_TCP (0x01 << 6)
    87	#define RNPGBE_TXD_L4_TYPE_SCTP (0x02 << 6)
    88	#define RNPGBE_TXD_FLAG_IPV4 (0x0 << 5)
    89	#define RNPGBE_TXD_FLAG_IPV6 (0x1 << 5)
    90	#define RNPGBE_TXD_FLAG_TSO (0x1 << 4)
    91	#define RNPGBE_TXD_CMD_RS (0x1 << 2)
    92	#define RNPGBE_TXD_STAT_DD (0x1 << 1)
    93	#define RNPGBE_TXD_CMD_EOP (0x1 << 0)
    94	} __packed;
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
