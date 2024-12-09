Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F87C158534
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718392; cv=none; b=fk/6jwpQRXITeml9Q4aA6h0Z2NUBMHwjjO35JGPdIBHQbdc5y3K24E7Gosx0smstk6zXfgrmJeRzriqEGT+umbDckiEyM/P3Rr1cZfZS46eyrrxCOAHZOJY2TuFrugGtCLqGpjxlBVgyBC/kcKb1hlvEccbohdz+v54eKsq9W0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718392; c=relaxed/simple;
	bh=cHv2ImZTTbhebeJkgDAYi7UPjfywieX+z0l10euUnUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C1QSB9YOT6CO6kyTRVAXL9cyx8AWR7+O+VQQRSUhN1xZjwgPp6kn60HibGsKxO+jOnAIlxcQk68au/T15CowPu4XKxFEqkmpFhyewCeJXDVzxS2B2tdXtgqQGIvsSJ9t1XPLcTJ6R30TTDfKJP1G9MgNAl0zguVXdMQzN3v8EzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRDZZRcC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRDZZRcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718381; x=1765254381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cHv2ImZTTbhebeJkgDAYi7UPjfywieX+z0l10euUnUY=;
  b=IRDZZRcC1gMnm7gFrU+ktZXT6nQ4Y5bGpZ0RzAT60JgoITNt2jz/vzuW
   sn66Ofh99d8/HqD4p2zi9giAbSzCOsJdpbLdqZbxQHcVOME9y0zaDdsWg
   luVvaCtVoLwwfYsopKUN6/xbKsmNQnlGfekwRStWur7Otp4cELJK+K6UR
   HRudviHqjoC34QVohKYLTue0mzYaowy0u+5WkjXPMKFr7ky92o2QNDppg
   im6M3wNld5nWJuFXRTfJWCPirWOnz3Jer1ITQghaAOcoTYEs4X1JguGMt
   BVK/75gMJT2TCcIKeoA0ktp9tlJRAePIJsmF17t3VKW7me9bvfFaB0hl5
   A==;
X-CSE-ConnectionGUID: unieNx1dTduN3/juC2X9Pw==
X-CSE-MsgGUID: K58Evh/EQTS1j5abAIps7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="45012831"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="45012831"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:26:18 -0800
X-CSE-ConnectionGUID: HX2y1JHyTjWaxap48Voedg==
X-CSE-MsgGUID: EKBmIHsMSeeXcWoAEz0cJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95047886"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2024 20:26:16 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVLY-0003qn-1x;
	Mon, 09 Dec 2024 04:26:12 +0000
Date: Mon, 9 Dec 2024 12:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, tianx <tianx@yunsilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2544/2544]
 drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse:
 invalid bitfield specifier for type restricted __be32.
Message-ID: <202412072336.8Do0o4DT-lkp@intel.com>
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
commit: 23b8024ef459f8b615c223df6175ea17c6b50c48 [2544/2544] drivers: update yunsilicon drivers to version 1.1.0.375
config: x86_64-randconfig-123-20241205 (https://download.01.org/0day-ci/archive/20241207/202412072336.8Do0o4DT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412072336.8Do0o4DT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412072336.8Do0o4DT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/yunsilicon/xsc/pci/eq.c: note: in included file (through include/linux/kernel.h, include/linux/interrupt.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/eq.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/interrupt.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/eq.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/eq.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/eq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/eq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/eq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/pci/wq.h):
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:25:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:26:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:27:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:28:36: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:29:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:36:53: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:42:52: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:43:50: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:46:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:47:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:48:15: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:53:40: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:55:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:56:48: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:61:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:62:44: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: note: in included file:
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:25:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:26:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:27:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:28:36: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:29:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:36:53: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:42:52: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:43:50: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:46:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:47:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:48:15: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:53:40: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:55:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:56:48: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:61:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:62:44: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/intf.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/intf.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/intf.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/intf.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/intf.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/intf.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/cq.c: note: in included file (through include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/cq.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/cq.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/cq.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/cq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/cq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/alloc.c: note: in included file (through include/linux/kernel.h, include/asm-generic/bug.h, arch/x86/include/asm/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/alloc.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/asm-generic/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/alloc.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/alloc.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/alloc.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/alloc.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/wq.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/wq.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/wq.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/wq.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/wq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/wq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/wq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/pci/wq.h):
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:25:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:26:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:27:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:28:36: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:29:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:36:53: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:42:52: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:43:50: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:46:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:47:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:48:15: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:53:40: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:55:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:56:48: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:61:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:62:44: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/debugfs.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/wait.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/debugfs.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/debugfs.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/debugfs.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/debugfs.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/debugfs.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/debugfs.c: note: in included file:
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:25:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:26:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:27:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:28:36: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:29:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:36:53: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:42:52: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:43:50: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:46:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:47:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:48:15: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:53:40: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:55:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:56:48: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:61:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:62:44: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/qp.c: note: in included file (through include/linux/kernel.h, include/asm-generic/bug.h, arch/x86/include/asm/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/qp.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/asm-generic/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/qp.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/qp.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/qp.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/qp.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/qp.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h, ...):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/qp.c: note: in included file:
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:25:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:26:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:27:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:28:36: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:29:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:36:53: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:42:52: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:43:50: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:46:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:47:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:48:15: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:53:40: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:55:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:56:48: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:61:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/qp.h:62:44: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/port.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/port.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/port.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/port.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/port.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/port.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/fw.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/pd.c: note: in included file (through include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/pd.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/pd.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/pd.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/pd.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/pd.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/mr.c: note: in included file (through include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/mr.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/mr.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/mr.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/mr.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/mr.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/mad.c: note: in included file (through include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/mad.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/mad.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/mad.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/mad.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/mad.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov.c: note: in included file (through include/linux/string.h, include/linux/uuid.h, include/linux/mod_devicetable.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov.c: note: in included file (through include/linux/kernel.h, include/asm-generic/bug.h, arch/x86/include/asm/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/asm-generic/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/devlink.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/devlink.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/devlink.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/devlink.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/devlink.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/devlink.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/vport.c: note: in included file (through include/linux/kernel.h, include/linux/skbuff.h, include/linux/if_ether.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/vport.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/vport.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/vport.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/vport.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/vport.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/kobject.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/timer.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_pci_ctrl.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_pci_ctrl.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_pci_ctrl.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_pci_ctrl.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_pci_ctrl.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_pci_ctrl.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c: note: in included file (through include/linux/string.h, include/linux/uuid.h, include/linux/mod_devicetable.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c: note: in included file (through include/linux/kernel.h, include/asm-generic/bug.h, arch/x86/include/asm/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/asm-generic/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/qpts.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/qpts.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/qpts.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/qpts.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/qpts.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/qpts.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_port_ctrl.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_port_ctrl.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_port_ctrl.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_port_ctrl.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_port_ctrl.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_port_ctrl.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/eswitch.c: note: in included file (through include/linux/kernel.h, include/linux/skbuff.h, include/linux/if_ether.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/eswitch.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/eswitch.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/eswitch.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/eswitch.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/vport.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/eswitch.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, ...):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/res_obj.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, drivers/net/ethernet/yunsilicon/xsc/common/res_obj.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/res_obj.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/res_obj.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/res_obj.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/res_obj.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/common/res_obj.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/res_obj.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, ...):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/cmd.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/cmd.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/cmd.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/cmd.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/cmd.c: note: in included file:
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/cmd.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_mem.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_mem.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_mem.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_mem.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_mem.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_mem.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/osdep.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/osdep.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/osdep.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/osdep.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/osdep.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/osdep.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_res.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_res.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_res.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_res.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_res.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, drivers/net/ethernet/yunsilicon/xsc/pci/fw/osdep.h, ...):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_res.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/driver.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h, ...):
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_flow.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_flow.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_flow.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_flow.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_flow.c: note: in included file:
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:209:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:219:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:222:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:234:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:244:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:247:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:265:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:360:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:361:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:362:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:365:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:366:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:367:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:370:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:371:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:372:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_flow.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:913:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:914:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:915:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:916:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:918:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:919:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:920:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:921:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:922:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:923:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:924:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
>> drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:935:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:936:35: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:937:36: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:938:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:939:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:940:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:988:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:989:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:990:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:991:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:992:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:993:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:994:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:995:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:996:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:997:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:998:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:999:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1000:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1001:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1006:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1007:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1008:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.

vim +913 drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h

   910	
   911	/* vport mbox */
   912	struct xsc_nic_vport_context {
 > 913		__be32		min_wqe_inline_mode:3;
   914		__be32		disable_mc_local_lb:1;
 > 915		__be32		disable_uc_local_lb:1;
   916		__be32		roce_en:1;
   917	
   918		__be32		arm_change_event:1;
   919		__be32		event_on_mtu:1;
   920		__be32		event_on_promisc_change:1;
   921		__be32		event_on_vlan_change:1;
   922		__be32		event_on_mc_address_change:1;
   923		__be32		event_on_uc_address_change:1;
   924		__be32		affiliation_criteria:4;
   925		__be32		affiliated_vhca_id;
   926	
   927		__be16		mtu;
   928	
   929		__be64		system_image_guid;
   930		__be64		port_guid;
   931		__be64		node_guid;
   932	
   933		__be32		qkey_violation_counter;
   934	
 > 935		__be16		promisc_uc:1;
   936		__be16		promisc_mc:1;
   937		__be16		promisc_all:1;
   938		__be16		vlan_allowed:1;
   939		__be16		allowed_list_type:3;
   940		__be16		allowed_list_size:10;
   941	
   942		u8		permanent_address[6];
   943		u8		current_address[6];
   944		u8		current_uc_mac_address[0][2];
   945	};
   946	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
