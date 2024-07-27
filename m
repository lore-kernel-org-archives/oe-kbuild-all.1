Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73E916C867
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 15:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722092634; cv=none; b=RDW42sKADZuCdwoHbSDsYfpH+HwKa+DQO3SvGZid6j/4hAvjYQQa04G4Wj21sLCZWnmDczkbYX+LReLnqgCyzfS90PUc/qYf8F8r70yos7xwX/pFlVkKMq2LjVZJBJf+Ij/w/qUL6zlGeWw6VoHGPve6SD9mngBgrnYp01VjpRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722092634; c=relaxed/simple;
	bh=NeL9ur0Fqdon7nBXM7o2wh+59HKumynEQ8TT4Q1kUTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n+gTPFFs8XyMEeqShRF6YPQGZgbNgTWkUi2qUaMeZtBA+q7LTLhj0bVDo9nQ/tV8BxiSYGVWuuflZ9rPOcdtX1s49FBMcIPHe5lxLOMUM7v5asNjCFGSif7E6CUKHxl1ZdDXSKPJz8gculVTyd5Mp0MXnSUzSBdthi7T+nJjlhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rs37u+RS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rs37u+RS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722092631; x=1753628631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NeL9ur0Fqdon7nBXM7o2wh+59HKumynEQ8TT4Q1kUTQ=;
  b=Rs37u+RSfukcCnyV45kiBypd3BbKX/X4p8QKL9dKH/RebyGM5yA2Aabt
   bQ8GdcQrT/6J3oUup3bPPmQWjMw49u6GNqLh02yrp3SEolF2ifUSbAy/L
   4UT3F0xT2JvBdjUbM/r5papm0ppTaJfN2TXHCviOXqHryJzcWJ2tNOaln
   iQsXLRvRWn6jfl5lG6uET8eABMqGoaPkdXSNNH3KXHmws0LGqIS2ocMfp
   aMJFYy8fhQYqoSihXdxIE7Wu9tP8Qssat/JrXPIoQiSBCMvg09qJV9Xi6
   1FO5N+FM90HY5a88JpFGH8lp9VG1QUaGVA92FZJrgmB45glT+NrWSMFq9
   g==;
X-CSE-ConnectionGUID: r34KTYE2SZqf8v9gba6n1w==
X-CSE-MsgGUID: JuvJpCQhS9am/btn7EdkLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="37346707"
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="37346707"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 07:49:30 -0700
X-CSE-ConnectionGUID: iMNC8c1ETYCrF9zHoeLzqg==
X-CSE-MsgGUID: OE7xD3SUQBipnZyMqV6Ikg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="76762382"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jul 2024 07:49:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXije-000pzY-03;
	Sat, 27 Jul 2024 14:49:26 +0000
Date: Sat, 27 Jul 2024 22:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 4/10] drivers/usb/cdns3/drd.c:43:42: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202407272247.NJBCdaKb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   24f95d0e9b1707db180c68181603937d90783fd9
commit: 1a36f8033bac1979c6bb6c2166a6c143f2113f97 [4/10] BACKPORT: usb: cdns3: make signed 1 bit bitfields unsigned
config: i386-randconfig-062-20240727 (https://download.01.org/0day-ci/archive/20240727/202407272247.NJBCdaKb-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407272247.NJBCdaKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407272247.NJBCdaKb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/cdns3/drd.c:43:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:43:42: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:43:42: sparse:     got restricted __le32 *
>> drivers/usb/cdns3/drd.c:45:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:45:42: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:45:42: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:47:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:47:42: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:47:42: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:49:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:49:42: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:49:42: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:71:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:71:25: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:71:25: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:81:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:81:30: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:81:30: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:114:24: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:114:24: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:114:24: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:124:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:124:48: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:124:48: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:141:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:141:56: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:141:56: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:144:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:144:23: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:144:23: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:144:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:144:23: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:144:23: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:154:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:154:29: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:154:29: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:156:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:156:17: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:156:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:156:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:156:17: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:156:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:178:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:178:55: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:178:55: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:182:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:182:23: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:182:23: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:182:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:182:23: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:182:23: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:197:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:197:29: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:197:29: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:199:17: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:199:17: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:219:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:219:25: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:219:25: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:284:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:284:26: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:284:26: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:303:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:303:25: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:303:25: sparse:     got restricted __le32 *
>> drivers/usb/cdns3/drd.c:326:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdns3_otg_legacy_regs *otg_v0_regs @@     got void [noderef] <asn:2> *[assigned] regs @@
   drivers/usb/cdns3/drd.c:326:27: sparse:     expected struct cdns3_otg_legacy_regs *otg_v0_regs
   drivers/usb/cdns3/drd.c:326:27: sparse:     got void [noderef] <asn:2> *[assigned] regs
   drivers/usb/cdns3/drd.c:327:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:327:25: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:327:25: sparse:     got restricted __le32 *
>> drivers/usb/cdns3/drd.c:330:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdns3_otg_common_regs *otg_regs @@     got void [noderef] <asn:2> *[assigned] regs @@
   drivers/usb/cdns3/drd.c:330:32: sparse:     expected struct cdns3_otg_common_regs *otg_regs
   drivers/usb/cdns3/drd.c:330:32: sparse:     got void [noderef] <asn:2> *[assigned] regs
   drivers/usb/cdns3/drd.c:331:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:331:32: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:331:32: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:332:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:332:17: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:332:17: sparse:     got restricted __le32 *
>> drivers/usb/cdns3/drd.c:336:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cdns3_otg_regs *otg_v1_regs @@     got void [noderef] <asn:2> *[assigned] regs @@
   drivers/usb/cdns3/drd.c:336:35: sparse:     expected struct cdns3_otg_regs *otg_v1_regs
   drivers/usb/cdns3/drd.c:336:35: sparse:     got void [noderef] <asn:2> *[assigned] regs
   drivers/usb/cdns3/drd.c:339:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:339:32: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:339:32: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:340:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:340:17: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:340:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:340:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:340:17: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:340:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:345:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:345:17: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:345:17: sparse:     got restricted __le32 *
   drivers/usb/cdns3/drd.c:368:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got restricted __le32 * @@
   drivers/usb/cdns3/drd.c:368:28: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:368:28: sparse:     got restricted __le32 *

vim +43 drivers/usb/cdns3/drd.c

7733f6c32e36ff Pawel Laszczak 2019-08-26  22  
7733f6c32e36ff Pawel Laszczak 2019-08-26  23  /**
7733f6c32e36ff Pawel Laszczak 2019-08-26  24   * cdns3_set_mode - change mode of OTG Core
7733f6c32e36ff Pawel Laszczak 2019-08-26  25   * @cdns: pointer to context structure
7733f6c32e36ff Pawel Laszczak 2019-08-26  26   * @mode: selected mode from cdns_role
7733f6c32e36ff Pawel Laszczak 2019-08-26  27   *
7733f6c32e36ff Pawel Laszczak 2019-08-26  28   * Returns 0 on success otherwise negative errno
7733f6c32e36ff Pawel Laszczak 2019-08-26  29   */
7733f6c32e36ff Pawel Laszczak 2019-08-26  30  int cdns3_set_mode(struct cdns3 *cdns, enum usb_dr_mode mode)
7733f6c32e36ff Pawel Laszczak 2019-08-26  31  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  32  	int ret = 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  33  	u32 reg;
7733f6c32e36ff Pawel Laszczak 2019-08-26  34  
7733f6c32e36ff Pawel Laszczak 2019-08-26  35  	switch (mode) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  36  	case USB_DR_MODE_PERIPHERAL:
7733f6c32e36ff Pawel Laszczak 2019-08-26  37  		break;
7733f6c32e36ff Pawel Laszczak 2019-08-26  38  	case USB_DR_MODE_HOST:
7733f6c32e36ff Pawel Laszczak 2019-08-26  39  		break;
7733f6c32e36ff Pawel Laszczak 2019-08-26  40  	case USB_DR_MODE_OTG:
7733f6c32e36ff Pawel Laszczak 2019-08-26  41  		dev_dbg(cdns->dev, "Set controller to OTG mode\n");
7733f6c32e36ff Pawel Laszczak 2019-08-26  42  		if (cdns->version == CDNS3_CONTROLLER_V1) {
7733f6c32e36ff Pawel Laszczak 2019-08-26 @43  			reg = readl(&cdns->otg_v1_regs->override);
7733f6c32e36ff Pawel Laszczak 2019-08-26  44  			reg |= OVERRIDE_IDPULLUP;
7733f6c32e36ff Pawel Laszczak 2019-08-26 @45  			writel(reg, &cdns->otg_v1_regs->override);
7733f6c32e36ff Pawel Laszczak 2019-08-26  46  		} else {
7733f6c32e36ff Pawel Laszczak 2019-08-26  47  			reg = readl(&cdns->otg_v0_regs->ctrl1);
7733f6c32e36ff Pawel Laszczak 2019-08-26  48  			reg |= OVERRIDE_IDPULLUP_V0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  49  			writel(reg, &cdns->otg_v0_regs->ctrl1);
7733f6c32e36ff Pawel Laszczak 2019-08-26  50  		}
7733f6c32e36ff Pawel Laszczak 2019-08-26  51  
7733f6c32e36ff Pawel Laszczak 2019-08-26  52  		/*
7733f6c32e36ff Pawel Laszczak 2019-08-26  53  		 * Hardware specification says: "ID_VALUE must be valid within
7733f6c32e36ff Pawel Laszczak 2019-08-26  54  		 * 50ms after idpullup is set to '1" so driver must wait
7733f6c32e36ff Pawel Laszczak 2019-08-26  55  		 * 50ms before reading this pin.
7733f6c32e36ff Pawel Laszczak 2019-08-26  56  		 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  57  		usleep_range(50000, 60000);
7733f6c32e36ff Pawel Laszczak 2019-08-26  58  		break;
7733f6c32e36ff Pawel Laszczak 2019-08-26  59  	default:
7733f6c32e36ff Pawel Laszczak 2019-08-26  60  		dev_err(cdns->dev, "Unsupported mode of operation %d\n", mode);
7733f6c32e36ff Pawel Laszczak 2019-08-26  61  		return -EINVAL;
7733f6c32e36ff Pawel Laszczak 2019-08-26  62  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  63  
7733f6c32e36ff Pawel Laszczak 2019-08-26  64  	return ret;
7733f6c32e36ff Pawel Laszczak 2019-08-26  65  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  66  

:::::: The code at line 43 was first introduced by commit
:::::: 7733f6c32e36ff9d7adadf40001039bf219b1cbe usb: cdns3: Add Cadence USB3 DRD Driver

:::::: TO: Pawel Laszczak <pawell@cadence.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
