Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAD5157472
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718079; cv=none; b=nlbsaFcXT9iKf9i+yNJ5XoLjasvSSR8vkinSjplIfByNXNvzbxtWi9es5sXPgk2xr6oJK6PBu31JWF1Tgc8KPqPLrL1RrQcBVFxqFNiANC/ZipVTrDPDpt6JQpObI+CmLcNPPky3XM8ljg8R4sacwEPqY0uPiaFylHGvZJlSps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718079; c=relaxed/simple;
	bh=3aKnNxcPXFhA5CtpJoDCBG7u+vro6xowdXWQR1NdH3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SE9tZq+93wE5e1fnBxGDJ+s68hWC/Mw0d/2h+GEet0gu7K3C02IJXzf4JOLu7mcovvAomM7Se6eqKo0sEjcqTVUYTtIU51o5pqVnxpiM+9ojlg+iu8mVZHZyelT+HixfXZ6ER3ddy4RTImZL0tGTqpG3/SJ33MgSIGZVpfZc1v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NO5sQu9F; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NO5sQu9F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718073; x=1765254073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3aKnNxcPXFhA5CtpJoDCBG7u+vro6xowdXWQR1NdH3c=;
  b=NO5sQu9FgCbfLCtacq+CwooXmZxAATrW99j0++Yx5TmW7lFYB9cWAd6b
   XNkItb+lHeyYusKg+TlJIkXt8LcMAQ9kKtdYF9Qvlb4pYBKlOc7omC/BQ
   sKqtE6uwGU5xe4MSZlSgHXwuKP8Uu3oG55PFfOSw1cxvmuQ3FkYcDQJuh
   GW2Yp3QWdG3xrnBhAQczh6E9HkTBWE3j8Kjc9YY78gGQkB+otpfWxDRaT
   d3F4R3lVkNgqrGrj9AvlfLJ61AWZIEvCri1aI8TAN1QaumFctk9UG4meY
   rCUHv4hmF54FdojfFS2rfDVuxCw54hA9gzA0hOd1Dxaww1IJSlCqKOHCv
   Q==;
X-CSE-ConnectionGUID: nTrzqg4CST2lkcd0KLSqZA==
X-CSE-MsgGUID: YtFwdO30T4WyD2j2Tk+7lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51530146"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51530146"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:21:11 -0800
X-CSE-ConnectionGUID: ZlTjeZ5QSZeByVQ6l5gC1Q==
X-CSE-MsgGUID: hz0mGAhPQUmDfuhrp+FI+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="118201868"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Dec 2024 20:21:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVGc-0003pt-30;
	Mon, 09 Dec 2024 04:21:06 +0000
Date: Mon, 9 Dec 2024 12:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wanrenyong <wanry@yunsilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2544/2544]
 drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse:
 sparse: invalid bitfield specifier for type restricted __le32.
Message-ID: <202412072100.cNplmLvN-lkp@intel.com>
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
commit: d48b7d951d22f7f97d68ae7b580769827683d404 [2544/2544] drivers: initial support for xsc drivers from Yunsilicon Technology
config: x86_64-randconfig-123-20241205 (https://download.01.org/0day-ci/archive/20241207/202412072100.cNplmLvN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412072100.cNplmLvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412072100.cNplmLvN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
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
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c: note: in included file:
>> drivers/net/ethernet/yunsilicon/xsc//common/qp.h:26:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:27:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:28:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:29:36: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:30:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/qp.h:37:53: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:43:52: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:44:50: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:47:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:48:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:49:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:54:40: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:56:45: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:57:48: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:62:46: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:63:44: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
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
   drivers/net/ethernet/yunsilicon/xsc/pci/eq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/eq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/pci/wq.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/qp.h:26:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:27:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:28:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:29:36: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:30:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/qp.h:37:53: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:43:52: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:44:50: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:47:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:48:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:49:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:54:40: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:56:45: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:57:48: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:62:46: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:63:44: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/intf.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/intf.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
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
   drivers/net/ethernet/yunsilicon/xsc/pci/intf.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/debugfs.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/debugfs.c: note: in included file:
>> drivers/net/ethernet/yunsilicon/xsc//common/qp.h:26:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:27:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:28:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:29:36: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:30:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/qp.h:37:53: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:43:52: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:44:50: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:47:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:48:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:49:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:54:40: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:56:45: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:57:48: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:62:46: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:63:44: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/wq.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/wq.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
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
   drivers/net/ethernet/yunsilicon/xsc/pci/wq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/wq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc/pci/wq.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/qp.h:26:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:27:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:28:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:29:36: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:30:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/qp.h:37:53: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:43:52: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:44:50: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:47:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:48:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:49:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:54:40: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:56:45: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:57:48: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:62:46: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:63:44: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/alloc.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/cq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/qp.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/qp.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/pci/qp.c: note: in included file:
>> drivers/net/ethernet/yunsilicon/xsc//common/qp.h:26:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:27:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:28:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:29:36: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:30:31: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/qp.h:37:53: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:43:52: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:44:50: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:47:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:48:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:49:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:54:40: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:56:45: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:57:48: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:62:46: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/qp.h:63:44: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
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
   drivers/net/ethernet/yunsilicon/xsc/pci/fw.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/port.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/mr.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/mad.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/pd.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_pci_ctrl.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/devlink.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/devlink.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
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
   drivers/net/ethernet/yunsilicon/xsc/pci/devlink.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/pagealloc.c: note: in included file (through include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/pagealloc.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/pagealloc.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/pagealloc.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h, include/linux/ipv6.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/pagealloc.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_mem.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_mem.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
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
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_mem.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/osdep.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/osdep.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
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
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/osdep.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/xsc_port_ctrl.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/cmd.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/cmd.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
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
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/vport.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_res.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_res.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h, ...):
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
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_res.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h, ...):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/eswitch.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h, ...):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
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
   drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c: note: in included file (through drivers/net/ethernet/yunsilicon/xsc//common/driver.h):
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_flow.c: note: in included file (through include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/yunsilicon/xsc/pci/fw/xsc_flow.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, drivers/net/ethernet/yunsilicon/xsc//common/xsc_core.h):
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
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:272:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:282:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:285:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:297:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:307:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:310:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:328:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:423:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:424:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:425:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:428:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:429:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:430:23: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:433:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:434:27: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h:435:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.

vim +272 drivers/net/ethernet/yunsilicon/xsc//common/xsc_hsi.h

   263	
   264	struct xsc_cqe {
   265		union {
   266			u8		msg_opcode;
   267			struct {
   268				u8		error_code:7;
   269				u8		is_error:1;
   270			};
   271		};
 > 272		__le32		qp_id:15;
   273		u8		rsv1:1;
   274		u8		se:1;
   275		u8		has_pph:1;
   276		u8		type:1;
   277		u8		with_immdt:1;
   278		u8		csum_err:4;
   279		__le32		imm_data;
   280		__le32		msg_len;
   281		__le32		vni;
 > 282		__le64		ts:48;
   283		__le16		wqe_id;
   284		__le16		rsv[3];
 > 285		__le16		rsv2:15;
   286		u8		owner:1;
   287	};
   288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
