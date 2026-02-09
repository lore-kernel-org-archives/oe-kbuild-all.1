Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2205D331233
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 20:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770668280; cv=none; b=AuBp3pLdJYTaUprVaWmTqj4upWFXM5nb2cVudWLIzAS7gdUjA1v0WUGBEqkLFazMh247hYBcPko9cP9+Wgu2oPXEI8Htgduop8+UHG8O3IvpMNL7TrGoVmojRmItAiG3I3foa7v/tlIfkMF8IR9efX4ViSmicQrw0oVvALXTf9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770668280; c=relaxed/simple;
	bh=H6z4O/01yvSqPsTBX3XOc8sOhDmughlt+6FcobT1LFM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Umvi7BoE7J5Pj3fD4nktwe8O0KGvpQnFhdaoZhE8VgmsLopk+eyBQReGQFgUPo8J2LQjJ1SXG35N1fwGlTLDZ0P4JF0id3LAheqTDYDaKOhN1z8SPyOKeuiem0OIsO6UgB9U9oyYw13XquBdc/f84aSMLQUnC1tf4J8xSCy1udU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAA44OAx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAA44OAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770668280; x=1802204280;
  h=date:from:to:cc:subject:message-id;
  bh=H6z4O/01yvSqPsTBX3XOc8sOhDmughlt+6FcobT1LFM=;
  b=CAA44OAxACGZWQGnLB/foPzjoaRjqkvAxS7DnhnKrtE0fqeNhIzELB35
   WDlV4Mx5j0tFR0jeB/I/tuxkPjgjxr7yQhrOoxEArwIOUi9OtJ63LyQfD
   DXhVgpFfHo7Wm2xbaSybepkFHt5aurfkSpmjUjdyLBId/HAgBN1AmIW4m
   FiLbRCJmOgbkhTiavg3TAY3ioKRC1qR1rT/cHrK7L3+PXeJNT5c7IdYVs
   GzOT2kiUdNdpdc0NjoZayLEfQn2F/qLJcBsqm+IP3uaY0+rICyrRqBjMq
   RlxDncrqVdagG66eKXtP0nPPwjDHZ2ZTKBK/fTpfqhVGiUHjQRTqS84qm
   A==;
X-CSE-ConnectionGUID: LSyICv8KQkehlrr32EiucA==
X-CSE-MsgGUID: 3j0KteKsQXu91xsnuHumKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89373403"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="89373403"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 12:17:58 -0800
X-CSE-ConnectionGUID: XcgelaMCR1+4spq89+hqPA==
X-CSE-MsgGUID: 4mw8LQj7SKOqHyYcimol5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211514293"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Feb 2026 12:17:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpXhi-00000000oIS-0r4G;
	Mon, 09 Feb 2026 20:17:54 +0000
Date: Tue, 10 Feb 2026 04:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 12/12]
 arch/powerpc/platforms/85xx/t1042rdb_diu.c:31:20: sparse: sparse: symbol
 'cpld_node' was not declared. Should it be static?
Message-ID: <202602100434.Q5tiFz4Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   85a63ffdaadcfb03afc73809d40b06e697cd1873
commit: 85a63ffdaadcfb03afc73809d40b06e697cd1873 [12/12] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: powerpc64-randconfig-r134-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100434.Q5tiFz4Z-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100434.Q5tiFz4Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100434.Q5tiFz4Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/85xx/t1042rdb_diu.c:31:20: sparse: sparse: symbol 'cpld_node' was not declared. Should it be static?
--
>> drivers/usb/gadget/udc/fsl_udc_core.c:69:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] wMaxPacketSize @@     got int @@
   drivers/usb/gadget/udc/fsl_udc_core.c:69:33: sparse:     expected restricted __le16 [usertype] wMaxPacketSize
   drivers/usb/gadget/udc/fsl_udc_core.c:69:33: sparse:     got int
>> drivers/usb/gadget/udc/fsl_udc_core.c:509:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] max_pkt_length @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:509:30: sparse:     expected unsigned int [usertype] max_pkt_length
   drivers/usb/gadget/udc/fsl_udc_core.c:509:30: sparse:     got restricted __le32 [usertype]
>> drivers/usb/gadget/udc/fsl_udc_core.c:707:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] next_dtd_ptr @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:707:26: sparse:     expected unsigned int [usertype] next_dtd_ptr
   drivers/usb/gadget/udc/fsl_udc_core.c:707:26: sparse:     got restricted __le32 [usertype]
>> drivers/usb/gadget/udc/fsl_udc_core.c:711:30: sparse: sparse: invalid assignment: &=
   drivers/usb/gadget/udc/fsl_udc_core.c:711:30: sparse:    left side has type unsigned int
   drivers/usb/gadget/udc/fsl_udc_core.c:711:30: sparse:    right side has type restricted __le32
>> drivers/usb/gadget/udc/fsl_udc_core.c:739:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] next_td_ptr @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:739:44: sparse:     expected unsigned int [usertype] next_td_ptr
   drivers/usb/gadget/udc/fsl_udc_core.c:739:44: sparse:     got restricted __le32 [usertype]
>> drivers/usb/gadget/udc/fsl_udc_core.c:790:21: sparse: sparse: cast to restricted __le32
>> drivers/usb/gadget/udc/fsl_udc_core.c:792:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size_ioc_sts @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:792:27: sparse:     expected unsigned int [usertype] size_ioc_sts
   drivers/usb/gadget/udc/fsl_udc_core.c:792:27: sparse:     got restricted __le32 [usertype]
>> drivers/usb/gadget/udc/fsl_udc_core.c:796:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] buff_ptr0 @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:796:24: sparse:     expected unsigned int [usertype] buff_ptr0
   drivers/usb/gadget/udc/fsl_udc_core.c:796:24: sparse:     got restricted __le32 [usertype]
>> drivers/usb/gadget/udc/fsl_udc_core.c:797:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] buff_ptr1 @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:797:24: sparse:     expected unsigned int [usertype] buff_ptr1
   drivers/usb/gadget/udc/fsl_udc_core.c:797:24: sparse:     got restricted __le32 [usertype]
>> drivers/usb/gadget/udc/fsl_udc_core.c:798:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] buff_ptr2 @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:798:24: sparse:     expected unsigned int [usertype] buff_ptr2
   drivers/usb/gadget/udc/fsl_udc_core.c:798:24: sparse:     got restricted __le32 [usertype]
>> drivers/usb/gadget/udc/fsl_udc_core.c:799:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] buff_ptr3 @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:799:24: sparse:     expected unsigned int [usertype] buff_ptr3
   drivers/usb/gadget/udc/fsl_udc_core.c:799:24: sparse:     got restricted __le32 [usertype]
>> drivers/usb/gadget/udc/fsl_udc_core.c:800:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] buff_ptr4 @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:800:24: sparse:     expected unsigned int [usertype] buff_ptr4
   drivers/usb/gadget/udc/fsl_udc_core.c:800:24: sparse:     got restricted __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:824:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size_ioc_sts @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:824:27: sparse:     expected unsigned int [usertype] size_ioc_sts
   drivers/usb/gadget/udc/fsl_udc_core.c:824:27: sparse:     got restricted __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:851:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] next_td_ptr @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:851:47: sparse:     expected unsigned int [usertype] next_td_ptr
   drivers/usb/gadget/udc/fsl_udc_core.c:851:47: sparse:     got restricted __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:859:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] next_td_ptr @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:859:26: sparse:     expected unsigned int [usertype] next_td_ptr
   drivers/usb/gadget/udc/fsl_udc_core.c:859:26: sparse:     got restricted __le32 [usertype]
>> drivers/usb/gadget/udc/fsl_udc_core.c:1369:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:1369:33: sparse:     expected unsigned short [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:1369:33: sparse:     got restricted __le16 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:1585:32: sparse: sparse: cast to restricted __le32
   drivers/usb/gadget/udc/fsl_udc_core.c:1586:30: sparse: sparse: cast to restricted __le32
   drivers/usb/gadget/udc/fsl_udc_core.c:1612:37: sparse: sparse: cast to restricted __le32
   drivers/usb/gadget/udc/fsl_udc_core.c:1617:26: sparse: sparse: cast to restricted __le32
   drivers/usb/gadget/udc/fsl_udc_core.c:1622:39: sparse: sparse: cast to restricted __le32
>> drivers/usb/gadget/udc/fsl_udc_core.c:1624:59: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size_ioc_int_sts @@     got restricted __le32 [usertype] @@
   drivers/usb/gadget/udc/fsl_udc_core.c:1624:59: sparse:     expected unsigned int [usertype] size_ioc_int_sts
   drivers/usb/gadget/udc/fsl_udc_core.c:1624:59: sparse:     got restricted __le32 [usertype]
   drivers/usb/gadget/udc/fsl_udc_core.c:1643:28: sparse: sparse: cast to restricted __le32
>> drivers/usb/gadget/udc/fsl_udc_core.c:2427:33: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/usb/gadget/udc/fsl_udc_core.c:2427:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct usb_sys_interface [noderef] __iomem *static [toplevel] usb_sys_regs @@     got void * @@
   drivers/usb/gadget/udc/fsl_udc_core.c:2427:30: sparse:     expected struct usb_sys_interface [noderef] __iomem *static [toplevel] usb_sys_regs
   drivers/usb/gadget/udc/fsl_udc_core.c:2427:30: sparse:     got void *
   drivers/usb/gadget/udc/fsl_udc_core.c:1789:20: sparse: sparse: context imbalance in 'reset_queues' - unexpected unlock
>> drivers/usb/gadget/udc/fsl_udc_core.c:2164:27: sparse: sparse: dereference of noderef expression
   drivers/usb/gadget/udc/fsl_udc_core.c:2167:27: sparse: sparse: dereference of noderef expression
--
   drivers/soc/fsl/qe/qmc.c:1958:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table @@     got void * @@
   drivers/soc/fsl/qe/qmc.c:1958:23: sparse:     expected struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table
   drivers/soc/fsl/qe/qmc.c:1958:23: sparse:     got void *
>> drivers/soc/fsl/qe/qmc.c:1964:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table @@
   drivers/soc/fsl/qe/qmc.c:1964:9: sparse:     expected void const *
   drivers/soc/fsl/qe/qmc.c:1964:9: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table
>> drivers/soc/fsl/qe/qmc.c:1964:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table @@
   drivers/soc/fsl/qe/qmc.c:1964:9: sparse:     expected void const *
   drivers/soc/fsl/qe/qmc.c:1964:9: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table
   drivers/soc/fsl/qe/qmc.c:1964:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table @@
   drivers/soc/fsl/qe/qmc.c:1964:9: sparse:     expected void *
   drivers/soc/fsl/qe/qmc.c:1964:9: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *bd_table
   drivers/soc/fsl/qe/qmc.c:1970:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned short [noderef] [usertype] __iomem *int_table @@     got void * @@
   drivers/soc/fsl/qe/qmc.c:1970:24: sparse:     expected unsigned short [noderef] [usertype] __iomem *int_table
   drivers/soc/fsl/qe/qmc.c:1970:24: sparse:     got void *
>> drivers/soc/fsl/qe/qmc.c:1976:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned short [noderef] [usertype] __iomem *int_table @@
   drivers/soc/fsl/qe/qmc.c:1976:9: sparse:     expected void const *
   drivers/soc/fsl/qe/qmc.c:1976:9: sparse:     got unsigned short [noderef] [usertype] __iomem *int_table
>> drivers/soc/fsl/qe/qmc.c:1976:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned short [noderef] [usertype] __iomem *int_table @@
   drivers/soc/fsl/qe/qmc.c:1976:9: sparse:     expected void const *
   drivers/soc/fsl/qe/qmc.c:1976:9: sparse:     got unsigned short [noderef] [usertype] __iomem *int_table
   drivers/soc/fsl/qe/qmc.c:1976:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got unsigned short [noderef] [usertype] __iomem *int_table @@
   drivers/soc/fsl/qe/qmc.c:1976:9: sparse:     expected void *
   drivers/soc/fsl/qe/qmc.c:1976:9: sparse:     got unsigned short [noderef] [usertype] __iomem *int_table

vim +/cpld_node +31 arch/powerpc/platforms/85xx/t1042rdb_diu.c

1c06552a703c6a Jason Jin 2016-11-25  30  
1c06552a703c6a Jason Jin 2016-11-25 @31  struct device_node *cpld_node;
1c06552a703c6a Jason Jin 2016-11-25  32  

:::::: The code at line 31 was first introduced by commit
:::::: 1c06552a703c6a4256976a1615d262b5a0d754e5 powerpc/85xx: Enable display support for t1042rdb

:::::: TO: Jason Jin <jason.jin@nxp.com>
:::::: CC: Scott Wood <oss@buserror.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
