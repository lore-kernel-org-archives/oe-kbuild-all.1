Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795058594;
	b=vFP8em412En3CzQB3t6wqu1aJLBAyOZf6/+tqCL0ZOttuzHyBF0tgyNlJSgBSKVaMJBB
	 44+crg9hAqzD43wG3ZOSmk3wdXoGPr5YUB4bnGoyMz1hVHn6KGPHsOLZ4+gk47WvXGp9m
	 5EKWHYZYE9tnenIpAd7nBiEj5Pk8xAlqSFRnYIGyjkoHM5aTcsOHANmhzaJKFjylOdnO9
	 33TurHicYuTElFIWBgEj4qb11O0L/ONQ04g5gzO/ZI+IRHNYOeV+IwxW5N98qThaM2dHj
	 cp1yi/z90OjFcPLqTSQ/QnApZSkGO1oUVmfE7x0XpoIQL9tRBPC+b0ZsU8zhipJEzcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058594;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=U/IaiTWAYk2fCMQVR/36yrxHziQ7ODCkb+F6ykhVv5w=;
	b=1l4pPKcdzrq7DZEeGEAPqPebChSlTHgZwaV4hzRKWnAO8knonBH9SvyDprUYCi52oxN8
	 sh2kmUxXdZtpPXZjvkOQaI6vYxXF2pROtltDeA9wzbk4v0eOUYN3SuXsMbRoXM5Jf52fg
	 PEE6Fl8X3gOhxUNnAGKDm2jsNT+vUA0L0a0jo2ZJhmZ6P+ynq1N5AaUUBEbFgbgqgDjzs
	 aIrZrt64E3dNZ1dFaGkpXjPK474gPalygTqFpoIuX2HfYm8MnT0XbaXZdQUDH29fgd+Gr
	 BUdHNQKhivollfyuVfuiMzQKd1izWl8tNZeu5SqEeuh/xnBZqDyo5/6lw7HgKCe5ggQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iA4jWmDn;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB983606A32C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 03:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB983606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iA4jWmDn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795058591; x=1826594591;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=POkFCdr1xfUp9FpqZLmWfwZ7LjmZBIfhh3tdcciIZ1Q=;
  b=iA4jWmDnAVnRiDUDHIauj43mK4g26dnsd5YPPtu7n/zaNNZ9iQjBEgEA
   nEa/+S+X0j6Xojv8AKew0sk6mfFwju/bCgrnkylP4VTEoNUnDd+we9OZ4
   tO/3kMul0ZbpaSHzwbskFBAhGxxcxQ1kpPgIcnnc2v3xFETKVeiZ7wRUA
   f2/0M5Av+B74GBelzoWmhu1y5I20Mtt+s/HAcxheRoX5+qtCJNrahZVQc
   RiU7r83PC8MclQKGM0iqVkKQ11SQa9jOwlgJ9ZB7zuWn/bD8rBIso97O3
   H2v0+VF3OnTw9RSsnJyKWbWAnt8tyqD2EN+xOu/xnG2yMX4zE69M/GRt5
   w==;
X-CSE-ConnectionGUID: 31U3rQWcQa+IzVeDtjHzaw==
X-CSE-MsgGUID: BafDhCfCTyqW1bqnrwhzDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3890881"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3890881"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 19:23:11 -0800
X-CSE-ConnectionGUID: f+a0p9YdSAy6x2lU5yfwaQ==
X-CSE-MsgGUID: RL+FQswERXiMRyQNMLGI5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10313654"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Nov 2026 19:23:09 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTsjq-000000003cb-2T0j;
	Thu, 19 Nov 2026 03:23:06 +0000
Date: Thu, 19 Nov 2026 04:22:28 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 272/460]
 drivers/pinctrl/pinctrl-mcp23s08_spi.c:29:47: sparse: sparse: incorrect type
 in initializer (different modifiers)
Message-ID: <20261119042019.mC2MbUZ2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/bvanassche/linux thread-safety
head:   754c0efaaee1c85b67fd7f8a45f7be89900b661f
commit: b92d6bdb8a97a9e35c1baf80d282833e714e75de [272/460] spi: Convert to_=
spi_device() into an inline function
config: x86_64-randconfig-2300-20261118 (https://download.01.org/0day-ci/ar=
chive/20261119/20261119042019.mC2MbUZ2-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261119/20261119042019.mC2MbUZ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119042019.mC2MbUZ2-lkp=
@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pinctrl/pinctrl-mcp23s08_spi.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/pinctrl/pinctrl-mcp23s08_spi.c:29:47: sparse: sparse: incorrect =
type in initializer (different modifiers) @@     expected struct spi_device=
 *spi @@     got struct spi_device const * @@
   drivers/pinctrl/pinctrl-mcp23s08_spi.c:29:47: sparse:     expected struc=
t spi_device *spi
   drivers/pinctrl/pinctrl-mcp23s08_spi.c:29:47: sparse:     got struct spi=
_device const *
   drivers/pinctrl/pinctrl-mcp23s08_spi.c:46:47: sparse: sparse: incorrect =
type in initializer (different modifiers) @@     expected struct spi_device=
 *spi @@     got struct spi_device const * @@
   drivers/pinctrl/pinctrl-mcp23s08_spi.c:46:47: sparse:     expected struc=
t spi_device *spi
   drivers/pinctrl/pinctrl-mcp23s08_spi.c:46:47: sparse:     got struct spi=
_device const *
   drivers/pinctrl/pinctrl-mcp23s08_spi.c:64:47: sparse: sparse: incorrect =
type in initializer (different modifiers) @@     expected struct spi_device=
 *spi @@     got struct spi_device const * @@
   drivers/pinctrl/pinctrl-mcp23s08_spi.c:64:47: sparse:     expected struc=
t spi_device *spi
   drivers/pinctrl/pinctrl-mcp23s08_spi.c:64:47: sparse:     got struct spi=
_device const *
--
   drivers/nfc/trf7970a.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/nfc/trf7970a.c:2244:47: sparse: sparse: incorrect type in initia=
lizer (different modifiers) @@     expected struct spi_device *spi @@     g=
ot struct spi_device const * @@
   drivers/nfc/trf7970a.c:2244:47: sparse:     expected struct spi_device *=
spi
   drivers/nfc/trf7970a.c:2244:47: sparse:     got struct spi_device const *
   drivers/nfc/trf7970a.c:2258:47: sparse: sparse: incorrect type in initia=
lizer (different modifiers) @@     expected struct spi_device *spi @@     g=
ot struct spi_device const * @@
   drivers/nfc/trf7970a.c:2258:47: sparse:     expected struct spi_device *=
spi
   drivers/nfc/trf7970a.c:2258:47: sparse:     got struct spi_device const *
   drivers/nfc/trf7970a.c:2275:47: sparse: sparse: incorrect type in initia=
lizer (different modifiers) @@     expected struct spi_device *spi @@     g=
ot struct spi_device const * @@
   drivers/nfc/trf7970a.c:2275:47: sparse:     expected struct spi_device *=
spi
   drivers/nfc/trf7970a.c:2275:47: sparse:     got struct spi_device const *
   drivers/nfc/trf7970a.c:2290:47: sparse: sparse: incorrect type in initia=
lizer (different modifiers) @@     expected struct spi_device *spi @@     g=
ot struct spi_device const * @@
   drivers/nfc/trf7970a.c:2290:47: sparse:     expected struct spi_device *=
spi
   drivers/nfc/trf7970a.c:2290:47: sparse:     got struct spi_device const *
--
   drivers/hwmon/max31722.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
   drivers/hwmon/max31722.c:60:45: sparse: sparse: cast to restricted __le16
>> drivers/hwmon/max31722.c:119:54: sparse: sparse: incorrect type in initi=
alizer (different modifiers) @@     expected struct spi_device *spi_device =
@@     got struct spi_device const * @@
   drivers/hwmon/max31722.c:119:54: sparse:     expected struct spi_device =
*spi_device
   drivers/hwmon/max31722.c:119:54: sparse:     got struct spi_device const=
 *
   drivers/hwmon/max31722.c:127:54: sparse: sparse: incorrect type in initi=
alizer (different modifiers) @@     expected struct spi_device *spi_device =
@@     got struct spi_device const * @@
   drivers/hwmon/max31722.c:127:54: sparse:     expected struct spi_device =
*spi_device
   drivers/hwmon/max31722.c:127:54: sparse:     got struct spi_device const=
 *
--
   drivers/spi/spi.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/spi/spi.c:53:53: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:53:53: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:53:53: sparse:     got struct spi_device const *
   drivers/spi/spi.c:175:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:175:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:175:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:176:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:176:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:176:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:177:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:177:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:177:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:178:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:178:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:178:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:180:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:180:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:180:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:181:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:181:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:181:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:182:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:182:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:182:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:184:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:184:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:184:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:185:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:185:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:185:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:186:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:186:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:186:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:192:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:192:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:192:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:193:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:193:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:193:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:194:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:194:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:194:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:195:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:195:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:195:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:196:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:196:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:196:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:197:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:197:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:197:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:198:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:198:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:198:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:199:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:199:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:199:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:200:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:200:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:200:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:201:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:201:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:201:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:202:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:202:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:202:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:203:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:203:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:203:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:204:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:204:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:204:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:205:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:205:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:205:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:206:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:206:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:206:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:207:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:207:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:207:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:208:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:208:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:208:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:210:1: sparse: sparse: incorrect type in initializer (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:210:1: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:210:1: sparse:     got struct spi_device const *
   drivers/spi/spi.c:598:61: sparse: sparse: incorrect type in initializer =
(different modifiers) @@     expected struct spi_device *spi @@     got str=
uct spi_device const * @@
   drivers/spi/spi.c:598:61: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:598:61: sparse:     got struct spi_device const *
>> drivers/spi/spi.c:631:43: sparse: sparse: incorrect type in argument 1 (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:631:43: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:631:43: sparse:     got struct spi_device const *
   drivers/spi/spi.c:640:53: sparse: sparse: incorrect type in argument 1 (=
different modifiers) @@     expected struct spi_device *spi @@     got stru=
ct spi_device const * @@
   drivers/spi/spi.c:640:53: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:640:53: sparse:     got struct spi_device const *
   drivers/spi/spi.c:836:47: sparse: sparse: incorrect type in initializer =
(different modifiers) @@     expected struct spi_device *spi @@     got str=
uct spi_device const * @@
   drivers/spi/spi.c:836:47: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:836:47: sparse:     got struct spi_device const *
   drivers/spi/spi.c:3870:44: sparse: sparse: incorrect type in argument 1 =
(different modifiers) @@     expected struct spi_device *spi @@     got str=
uct spi_device const * @@
   drivers/spi/spi.c:3870:44: sparse:     expected struct spi_device *spi
   drivers/spi/spi.c:3870:44: sparse:     got struct spi_device const *
>> drivers/spi/spi.c:5359:29: sparse: sparse: incorrect type in return expr=
ession (different modifiers) @@     expected struct spi_device * @@     got=
 struct spi_device const * @@
   drivers/spi/spi.c:5359:29: sparse:     expected struct spi_device *
   drivers/spi/spi.c:5359:29: sparse:     got struct spi_device const *
--
   drivers/gpio/gpio-74x164.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/gpio/gpio-74x164.c:38:39: sparse: sparse: incorrect type in argu=
ment 1 (different modifiers) @@     expected struct spi_device *spi @@     =
got struct spi_device const * @@
   drivers/gpio/gpio-74x164.c:38:39: sparse:     expected struct spi_device=
 *spi
   drivers/gpio/gpio-74x164.c:38:39: sparse:     got struct spi_device cons=
t *
--
   drivers/gpio/gpio-max7301.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/gpio/gpio-max7301.c:22:47: sparse: sparse: incorrect type in ini=
tializer (different modifiers) @@     expected struct spi_device *spi @@   =
  got struct spi_device const * @@
   drivers/gpio/gpio-max7301.c:22:47: sparse:     expected struct spi_devic=
e *spi
   drivers/gpio/gpio-max7301.c:22:47: sparse:     got struct spi_device con=
st *
   drivers/gpio/gpio-max7301.c:34:47: sparse: sparse: incorrect type in ini=
tializer (different modifiers) @@     expected struct spi_device *spi @@   =
  got struct spi_device const * @@
   drivers/gpio/gpio-max7301.c:34:47: sparse:     expected struct spi_devic=
e *spi
   drivers/gpio/gpio-max7301.c:34:47: sparse:     got struct spi_device con=
st *
--
   drivers/fpga/lattice-sysconfig-spi.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/fpga/lattice-sysconfig-spi.c:22:47: sparse: sparse: incorrect ty=
pe in initializer (different modifiers) @@     expected struct spi_device *=
spi @@     got struct spi_device const * @@
   drivers/fpga/lattice-sysconfig-spi.c:22:47: sparse:     expected struct =
spi_device *spi
   drivers/fpga/lattice-sysconfig-spi.c:22:47: sparse:     got struct spi_d=
evice const *
   drivers/fpga/lattice-sysconfig-spi.c:30:47: sparse: sparse: incorrect ty=
pe in initializer (different modifiers) @@     expected struct spi_device *=
spi @@     got struct spi_device const * @@
   drivers/fpga/lattice-sysconfig-spi.c:30:47: sparse:     expected struct =
spi_device *spi
   drivers/fpga/lattice-sysconfig-spi.c:30:47: sparse:     got struct spi_d=
evice const *
   drivers/fpga/lattice-sysconfig-spi.c:67:47: sparse: sparse: incorrect ty=
pe in initializer (different modifiers) @@     expected struct spi_device *=
spi @@     got struct spi_device const * @@
   drivers/fpga/lattice-sysconfig-spi.c:67:47: sparse:     expected struct =
spi_device *spi
   drivers/fpga/lattice-sysconfig-spi.c:67:47: sparse:     got struct spi_d=
evice const *
   drivers/fpga/lattice-sysconfig-spi.c:82:47: sparse: sparse: incorrect ty=
pe in initializer (different modifiers) @@     expected struct spi_device *=
spi @@     got struct spi_device const * @@
   drivers/fpga/lattice-sysconfig-spi.c:82:47: sparse:     expected struct =
spi_device *spi
   drivers/fpga/lattice-sysconfig-spi.c:82:47: sparse:     got struct spi_d=
evice const *
--
   drivers/mux/adgs1408.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/mux/adgs1408.c:37:47: sparse: sparse: incorrect type in initiali=
zer (different modifiers) @@     expected struct spi_device *spi @@     got=
 struct spi_device const * @@
   drivers/mux/adgs1408.c:37:47: sparse:     expected struct spi_device *spi
   drivers/mux/adgs1408.c:37:47: sparse:     got struct spi_device const *
--
   drivers/input/rmi4/rmi_spi.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/input/rmi4/rmi_spi.c:449:47: sparse: sparse: incorrect type in i=
nitializer (different modifiers) @@     expected struct spi_device *spi @@ =
    got struct spi_device const * @@
   drivers/input/rmi4/rmi_spi.c:449:47: sparse:     expected struct spi_dev=
ice *spi
   drivers/input/rmi4/rmi_spi.c:449:47: sparse:     got struct spi_device c=
onst *
   drivers/input/rmi4/rmi_spi.c:462:47: sparse: sparse: incorrect type in i=
nitializer (different modifiers) @@     expected struct spi_device *spi @@ =
    got struct spi_device const * @@
   drivers/input/rmi4/rmi_spi.c:462:47: sparse:     expected struct spi_dev=
ice *spi
   drivers/input/rmi4/rmi_spi.c:462:47: sparse:     got struct spi_device c=
onst *
   drivers/input/rmi4/rmi_spi.c:475:47: sparse: sparse: incorrect type in i=
nitializer (different modifiers) @@     expected struct spi_device *spi @@ =
    got struct spi_device const * @@
   drivers/input/rmi4/rmi_spi.c:475:47: sparse:     expected struct spi_dev=
ice *spi
   drivers/input/rmi4/rmi_spi.c:475:47: sparse:     got struct spi_device c=
onst *
   drivers/input/rmi4/rmi_spi.c:488:47: sparse: sparse: incorrect type in i=
nitializer (different modifiers) @@     expected struct spi_device *spi @@ =
    got struct spi_device const * @@
   drivers/input/rmi4/rmi_spi.c:488:47: sparse:     expected struct spi_dev=
ice *spi
   drivers/input/rmi4/rmi_spi.c:488:47: sparse:     got struct spi_device c=
onst *
--
   drivers/base/regmap/regmap-spi.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/base/regmap/regmap-spi.c:31:47: sparse: sparse: incorrect type i=
n initializer (different modifiers) @@     expected struct spi_device *spi =
@@     got struct spi_device const * @@
   drivers/base/regmap/regmap-spi.c:31:47: sparse:     expected struct spi_=
device *spi
   drivers/base/regmap/regmap-spi.c:31:47: sparse:     got struct spi_devic=
e const *
   drivers/base/regmap/regmap-spi.c:41:47: sparse: sparse: incorrect type i=
n initializer (different modifiers) @@     expected struct spi_device *spi =
@@     got struct spi_device const * @@
   drivers/base/regmap/regmap-spi.c:41:47: sparse:     expected struct spi_=
device *spi
   drivers/base/regmap/regmap-spi.c:41:47: sparse:     got struct spi_devic=
e const *
   drivers/base/regmap/regmap-spi.c:62:47: sparse: sparse: incorrect type i=
n initializer (different modifiers) @@     expected struct spi_device *spi =
@@     got struct spi_device const * @@
   drivers/base/regmap/regmap-spi.c:62:47: sparse:     expected struct spi_=
device *spi
   drivers/base/regmap/regmap-spi.c:62:47: sparse:     got struct spi_devic=
e const *
   drivers/base/regmap/regmap-spi.c:96:47: sparse: sparse: incorrect type i=
n initializer (different modifiers) @@     expected struct spi_device *spi =
@@     got struct spi_device const * @@
   drivers/base/regmap/regmap-spi.c:96:47: sparse:     expected struct spi_=
device *spi
   drivers/base/regmap/regmap-spi.c:96:47: sparse:     got struct spi_devic=
e const *
--
   drivers/iio/dac/ad5686-spi.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/iio/dac/ad5686-spi.c:95:47: sparse: sparse: incorrect type in in=
itializer (different modifiers) @@     expected struct spi_device *spi @@  =
   got struct spi_device const * @@
   drivers/iio/dac/ad5686-spi.c:95:47: sparse:     expected struct spi_devi=
ce *spi
   drivers/iio/dac/ad5686-spi.c:95:47: sparse:     got struct spi_device co=
nst *
   drivers/iio/dac/ad5686-spi.c:104:47: sparse: sparse: incorrect type in i=
nitializer (different modifiers) @@     expected struct spi_device *spi @@ =
    got struct spi_device const * @@
   drivers/iio/dac/ad5686-spi.c:104:47: sparse:     expected struct spi_dev=
ice *spi
   drivers/iio/dac/ad5686-spi.c:104:47: sparse:     got struct spi_device c=
onst *
--
   drivers/iio/adc/ad7768.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/iio/adc/ad7768.c:1278:47: sparse: sparse: incorrect type in init=
ializer (different modifiers) @@     expected struct spi_device *spi @@    =
 got struct spi_device const * @@
   drivers/iio/adc/ad7768.c:1278:47: sparse:     expected struct spi_device=
 *spi
   drivers/iio/adc/ad7768.c:1278:47: sparse:     got struct spi_device cons=
t *
--
   drivers/iio/adc/ad7606_spi.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/iio/adc/ad7606_spi.c:57:47: sparse: sparse: incorrect type in in=
itializer (different modifiers) @@     expected struct spi_device *spi @@  =
   got struct spi_device const * @@
   drivers/iio/adc/ad7606_spi.c:57:47: sparse:     expected struct spi_devi=
ce *spi
   drivers/iio/adc/ad7606_spi.c:57:47: sparse:     got struct spi_device co=
nst *
   drivers/iio/adc/ad7606_spi.c:77:47: sparse: sparse: incorrect type in in=
itializer (different modifiers) @@     expected struct spi_device *spi @@  =
   got struct spi_device const * @@
   drivers/iio/adc/ad7606_spi.c:77:47: sparse:     expected struct spi_devi=
ce *spi
   drivers/iio/adc/ad7606_spi.c:77:47: sparse:     got struct spi_device co=
nst *
   drivers/iio/adc/ad7606_spi.c:90:47: sparse: sparse: incorrect type in in=
itializer (different modifiers) @@     expected struct spi_device *spi @@  =
   got struct spi_device const * @@
   drivers/iio/adc/ad7606_spi.c:90:47: sparse:     expected struct spi_devi=
ce *spi
   drivers/iio/adc/ad7606_spi.c:90:47: sparse:     got struct spi_device co=
nst *
   drivers/iio/adc/ad7606_spi.c:102:47: sparse: sparse: incorrect type in i=
nitializer (different modifiers) @@     expected struct spi_device *spi @@ =
    got struct spi_device const * @@
   drivers/iio/adc/ad7606_spi.c:102:47: sparse:     expected struct spi_dev=
ice *spi
   drivers/iio/adc/ad7606_spi.c:102:47: sparse:     got struct spi_device c=
onst *
   drivers/iio/adc/ad7606_spi.c:128:47: sparse: sparse: incorrect type in i=
nitializer (different modifiers) @@     expected struct spi_device *spi @@ =
    got struct spi_device const * @@
   drivers/iio/adc/ad7606_spi.c:128:47: sparse:     expected struct spi_dev=
ice *spi
   drivers/iio/adc/ad7606_spi.c:128:47: sparse:     got struct spi_device c=
onst *
   drivers/iio/adc/ad7606_spi.c:156:47: sparse: sparse: incorrect type in i=
nitializer (different modifiers) @@     expected struct spi_device *spi @@ =
    got struct spi_device const * @@
   drivers/iio/adc/ad7606_spi.c:156:47: sparse:     expected struct spi_dev=
ice *spi
   drivers/iio/adc/ad7606_spi.c:156:47: sparse:     got struct spi_device c=
onst *
   drivers/iio/adc/ad7606_spi.c:277:47: sparse: sparse: incorrect type in i=
nitializer (different modifiers) @@     expected struct spi_device *spi @@ =
    got struct spi_device const * @@
   drivers/iio/adc/ad7606_spi.c:277:47: sparse:     expected struct spi_dev=
ice *spi
   drivers/iio/adc/ad7606_spi.c:277:47: sparse:     got struct spi_device c=
onst *
--
   drivers/iio/pressure/mpl115_spi.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/iio/pressure/mpl115_spi.c:25:47: sparse: sparse: incorrect type =
in initializer (different modifiers) @@     expected struct spi_device *spi=
 @@     got struct spi_device const * @@
   drivers/iio/pressure/mpl115_spi.c:25:47: sparse:     expected struct spi=
_device *spi
   drivers/iio/pressure/mpl115_spi.c:25:47: sparse:     got struct spi_devi=
ce const *
   drivers/iio/pressure/mpl115_spi.c:39:47: sparse: sparse: incorrect type =
in initializer (different modifiers) @@     expected struct spi_device *spi=
 @@     got struct spi_device const * @@
   drivers/iio/pressure/mpl115_spi.c:39:47: sparse:     expected struct spi=
_device *spi
   drivers/iio/pressure/mpl115_spi.c:39:47: sparse:     got struct spi_devi=
ce const *
   drivers/iio/pressure/mpl115_spi.c:60:47: sparse: sparse: incorrect type =
in initializer (different modifiers) @@     expected struct spi_device *spi=
 @@     got struct spi_device const * @@
   drivers/iio/pressure/mpl115_spi.c:60:47: sparse:     expected struct spi=
_device *spi
   drivers/iio/pressure/mpl115_spi.c:60:47: sparse:     got struct spi_devi=
ce const *
--
   drivers/iio/pressure/abp2030pa_spi.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/iio/pressure/abp2030pa_spi.c:17:47: sparse: sparse: incorrect ty=
pe in initializer (different modifiers) @@     expected struct spi_device *=
spi @@     got struct spi_device const * @@
   drivers/iio/pressure/abp2030pa_spi.c:17:47: sparse:     expected struct =
spi_device *spi
   drivers/iio/pressure/abp2030pa_spi.c:17:47: sparse:     got struct spi_d=
evice const *
--
   drivers/iio/pressure/bmp280-spi.c: note: in included file:
   include/linux/spi/spi.h:290:33: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:284:33: sparse:  the previous one is here
   include/linux/spi/spi.h:296:39: sparse: sparse: multiple definitions for=
 function 'to_spi_device'
   include/linux/spi/spi.h:290:33: sparse:  the previous one is here
>> drivers/iio/pressure/bmp280-spi.c:18:47: sparse: sparse: incorrect type =
in initializer (different modifiers) @@     expected struct spi_device *spi=
 @@     got struct spi_device const * @@
   drivers/iio/pressure/bmp280-spi.c:18:47: sparse:     expected struct spi=
_device *spi
   drivers/iio/pressure/bmp280-spi.c:18:47: sparse:     got struct spi_devi=
ce const *
   drivers/iio/pressure/bmp280-spi.c:34:47: sparse: sparse: incorrect type =
in initializer (different modifiers) @@     expected struct spi_device *spi=
 @@     got struct spi_device const * @@
   drivers/iio/pressure/bmp280-spi.c:34:47: sparse:     expected struct spi=
_device *spi
   drivers/iio/pressure/bmp280-spi.c:34:47: sparse:     got struct spi_devi=
ce const *
   drivers/iio/pressure/bmp280-spi.c:42:47: sparse: sparse: incorrect type =
in initializer (different modifiers) @@     expected struct spi_device *spi=
 @@     got struct spi_device const * @@
   drivers/iio/pressure/bmp280-spi.c:42:47: sparse:     expected struct spi=
_device *spi
   drivers/iio/pressure/bmp280-spi.c:42:47: sparse:     got struct spi_devi=
ce const *

vim +29 drivers/pinctrl/pinctrl-mcp23s08_spi.c

0f04a81784fe3d Andy Shevchenko 2020-04-07  25 =20
0f04a81784fe3d Andy Shevchenko 2020-04-07  26  static int mcp23sxx_spi_writ=
e(void *context, const void *data, size_t count)
0f04a81784fe3d Andy Shevchenko 2020-04-07  27  {
0f04a81784fe3d Andy Shevchenko 2020-04-07  28  	struct mcp23s08 *mcp =3D co=
ntext;
0f04a81784fe3d Andy Shevchenko 2020-04-07 @29  	struct spi_device *spi =3D =
to_spi_device(mcp->dev);
0f04a81784fe3d Andy Shevchenko 2020-04-07  30  	struct spi_message m;
0f04a81784fe3d Andy Shevchenko 2020-04-07  31  	struct spi_transfer t[2] =
=3D { { .tx_buf =3D &mcp->addr, .len =3D 1, },
0f04a81784fe3d Andy Shevchenko 2020-04-07  32  				     { .tx_buf =3D data,=
 .len =3D count, }, };
0f04a81784fe3d Andy Shevchenko 2020-04-07  33 =20
0f04a81784fe3d Andy Shevchenko 2020-04-07  34  	spi_message_init(&m);
0f04a81784fe3d Andy Shevchenko 2020-04-07  35  	spi_message_add_tail(&t[0],=
 &m);
0f04a81784fe3d Andy Shevchenko 2020-04-07  36  	spi_message_add_tail(&t[1],=
 &m);
0f04a81784fe3d Andy Shevchenko 2020-04-07  37 =20
0f04a81784fe3d Andy Shevchenko 2020-04-07  38  	return spi_sync(spi, &m);
0f04a81784fe3d Andy Shevchenko 2020-04-07  39  }
0f04a81784fe3d Andy Shevchenko 2020-04-07  40 =20

:::::: The code at line 29 was first introduced by commit
:::::: 0f04a81784fe3ddc00cae74c517265b3ddb8825c pinctrl: mcp23s08: Split to=
 three parts: core, I=C2=B2C, SPI

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
