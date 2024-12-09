Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A58158D6A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718560; cv=none; b=WgNCfzVl8jPG+9K2Kh87i3w4xsF6M46Beytc3ZaKjc1aGSVgXp/COxfuTpzYMM20P/cSQAZ7zBoRB9gVvuw7X3suyJ2VnSGSMHXxVK9by3DOTYII8crwHxDbof1gSz2MClfNCMbMNs+i6QkOcfVz6YQXvtjjETqXoQil5G54dVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718560; c=relaxed/simple;
	bh=rAtRfpiDxdLqV19rOn9f0h1VOWEVUPOlSecD1DP3Z54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uQan2V5VDTdheTYAy4RqqyUA7bsjdSncn0/qp8hvyqLeqmMw1z+p7gxINLmUh4uj2Li5mpnVK6VR7HjVFe9kL1zSp9osCcB45I55HCWm5hpev5EZ+m+ln/lnpqwUltnJhuhe5Og9+T3dZ6UCC6mtSOSrsvBBgX4wCY3gyknlJRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZ9caENN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZ9caENN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718558; x=1765254558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rAtRfpiDxdLqV19rOn9f0h1VOWEVUPOlSecD1DP3Z54=;
  b=aZ9caENNhdOsuHZjGsQ97mDnyvY5GABuLJkidOb1JshJ99uOB6PI6No/
   ftCAkGulNV2GGIckL3ehtevCgbDh6d08IieCGCDbHUd4N2xY//AxYa/xN
   ufbwA0Zb4Ze7vfmL2SRLvBSznvS40pm9OBES7j99eLVXe06m7z3BvKndG
   IZVLzik0AceppqSsSP6Zg3lAVezLYaDV+7ujNlcEIJFw2U1WqEr0LqyoV
   C8MNJQk+vcItU8nxb96X5iM1c1uDUpCXTuTr4VQL9o5TOqOyBC7792rBt
   pSIp72AXB2XV6yRI7HegJ3KkymQFUP8P/yCbuNs4Zf69CpzQQertOOcq5
   w==;
X-CSE-ConnectionGUID: PNVqkrOtSUK6OAzyPHWiJA==
X-CSE-MsgGUID: uCwpFinfTOuH67OrhSp32Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34122907"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34122907"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:29:16 -0800
X-CSE-ConnectionGUID: fFg4ig11Rry3zjogkS26Gw==
X-CSE-MsgGUID: s8HGigRDTDWdohEO6obN5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99404809"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2024 20:29:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVOT-0003rO-0F;
	Mon, 09 Dec 2024 04:29:13 +0000
Date: Mon, 9 Dec 2024 12:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2544/2544]
 drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:64:39: sparse:
 sparse: invalid bitfield specifier for type restricted __le16.
Message-ID: <202412080108.TdjUJRNN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c8dbb3a6e214ad66d5d6099bf76e1f1c6eefc06f
commit: 656d579e9c4f700f9f7debda0c2541f34fc39a35 [2544/2544] drivers: initial support for rnpgbevf drivers from Mucse Technology
config: x86_64-randconfig-123-20241205 (https://download.01.org/0day-ci/archive/20241208/202412080108.TdjUJRNN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080108.TdjUJRNN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080108.TdjUJRNN-lkp@intel.com/

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
