Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116667;
	b=I2Qtschy0eV7qI8zyJN3bR2/xrW5IV3oSlkP7vzYW6FVryccnynv94IbXRiJPmSnFOGH
	 KIW/8aos1jMEY/n75Fxafl1Mnf0w6Pq1DDjFW+e8zyVjOCdhCc+dKikzIhlfeDDJuVnen
	 4Xd3csSG9jxeMp/vGTFPoN6bAXZWOLlh0R6u/hfyfOTxe7XtWXb3btHW8dmKxiehx0rjW
	 hrfxSy9d4V7OVS4bQo8V0y6qrFW+nyEc3hNDKWfyo3AFDwpk35k7qKsc1L+NoDTRo/sIo
	 XLbIs426gVpTF+O3prwYz81BhwQi0cR4Ow0POkAlQxYS+7K6zLfeayi/am6A/yKf+nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116667;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=53Suc0LQ56+RjmOPnzMMlPEO84rGdxJuKKben43KcMU=;
	b=NvRXdMoh6Wk8Bndo6zyFTm2fA5MiMI0JHZqSHDpg5VYdCbuBbALGLPzlVpoz7/1caIMi
	 cokUnCGSfozCP6xuD2EVZ0nqzX585CvdCKadmN7OddJOKqhCpU71ktINA4t7AEkHJ92Jn
	 lgq5POasyDXAkqAdY2+ByiNM0iUp8rQqcsugat4Qnn0BOz2nhs3S8oZU3xzVD3MVmFxJF
	 523ouLjloCsgBta6oUFz4F7yCxxMW6ohXVC1k0Hp1oHrBMESNqaYwMJU6nzeSCTuNd2MP
	 U9tROb/BxQ9MzOHqSXnjKZY4dmZmp5lbehfDt0jH9U5h4zQ0mqeZgzyTWFZgzQrjExA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gz+SsGt2;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8265606A337
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 19:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8265606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gz+SsGt2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795116664; x=1826652664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eM+uxASknNDO/yTU081gByylneivQm+QbffrB3t3h78=;
  b=Gz+SsGt2tht6zpzot7BbCEiLTiBgTVQ7jPwPNPg+wgXGC5O5bGgWtCrB
   hdASx2zKOR0yg8AJvvCav2oCUYlADm5m2xJHhDXFvj6BKWtoUfT/PkATI
   j5b8hTnoy7yQlBx7FnGv4b1ritxjZIK1BAS9Jw5eXeWJzIlc3g9wf4z6q
   V+aa53xSj+tGCItLFZsQHOA5hSFDfmfsNLuxCAXMthRX8U1Xqt/TOmrWm
   9bWH09wNkho68Mo4qSzwTDYGC2hLJkYCBwh+qo0F+NlYgymc3a+/BIkYC
   Xe7QfXmPKt1lTEDmxzocauNsBIsJqqtU7BHYaIL2N/u1EtVq7OwD43RKm
   Q==;
X-CSE-ConnectionGUID: OEjHsrEURpe6TE32Yg+Rew==
X-CSE-MsgGUID: tZ/BLjOEQK6JpaOlsbLrHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3977668"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3977668"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 11:31:00 -0800
X-CSE-ConnectionGUID: 1wB7DRh6RO+seeE6L/NKmw==
X-CSE-MsgGUID: xmv9mldpRuuA/a/FofNAjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12366274"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 19 Nov 2026 11:30:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU7qQ-000000003pn-0Vi0;
	Thu, 19 Nov 2026 19:30:54 +0000
Date: Thu, 19 Nov 2026 20:30:44 +0100
From: kernel test robot <lkp@intel.com>
To: Ava <ava@oven.ninja>
Cc: oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "Ilpo =?utf-8?Q?J=C3=A4rvinen"?= <ilpo.jarvinen@linux.intel.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 45/49] Warning:
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:238 function parameter
 'dest' not described in 'strscpy_attr'
Message-ID: <20261119202348.sU1Eppmh-lkp@intel.com>
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
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   518e9d2eeaa5a8568951269a47be2182f4674efa
commit: a2b19337b0da259ba22226440eaa56518ae0571d [45/49] platform/x86: dell-wmi-sysman: replace deprecated strlcpy with strscpy
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261119/20261119202348.sU1Eppmh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119202348.sU1Eppmh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119202348.sU1Eppmh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:238 function parameter 'dest' not described in 'strscpy_attr'
>> Warning: drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:238 function parameter 'src' not described in 'strscpy_attr'
>> Warning: drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:238 function parameter 'size' not described in 'strscpy_attr'
>> Warning: drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:238 function parameter 'dest' not described in 'strscpy_attr'
>> Warning: drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:238 function parameter 'src' not described in 'strscpy_attr'
>> Warning: drivers/platform/x86/dell/dell-wmi-sysman/sysman.c:238 function parameter 'size' not described in 'strscpy_attr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
