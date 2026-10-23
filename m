Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751529;
	b=yEIAKUWpn/hjXr6utvG+byoBMIW6nnq6XtefyotM6+OrRM9ArJ4O/+prbdDtzCMMxfus
	 l4X4aDvKOjPmFIBQvQLyLxdMRrOk+LclBw1l1FDeYXw8zOYTj8T6fZOrReNCZI7GAmdaY
	 yNJ0CgzzmfFOR2Nfp6EqtlwmHk0C7VKvdrzU6DNEqGAUH/RJE97MTiF6hnjhwOk/weZL3
	 +h+E7WGsfSCxqLENGP5/qL/3qheTrC2d8yzn/cKtJFuVD/gVvxx6MXrrrHxmuSSDPLGkO
	 IOSkT4hKdlhaoxBnxbjs+V2VthrjOpxwzV31sMK1bDhNrQuCEBQzn56m9JQLGSCINkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751529;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9WNDqTMN+R55qi24aecdzmj1lnphkOmydYI+eGO/Zrc=;
	b=T/JYJJ6TwQrhGXj1uwz+RYOmwa8ca4cz4CfsS5ILHElCroki3m3RK9S3vZSUGpElMLxN
	 v2iguwZne41foriiwJ2mdDA05SkKbf1WtvnemPsv4buc3/DzyCMzWS0vcT0bu4Tn7MWY4
	 Jj0nOOGrMQVTIZbtkozjklLuzEKyzlvsm/006ec4prVWn4bqa2tSr5g7bk+sk485Wky9z
	 CoLWB+r/NzDrIX9K90Q4s1RvKQfZnMA5GGYkhx+YsVMrHfT5VnScdCj4sDiPx6pDhaZSi
	 OpNE336sbZ+hD/+1iJqM6B6oPHXspc46S3cACTeaViRbk02OfUgzBc4mtFvabN5dlmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FXR0vOWh;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3C4606A31B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 10:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D3C4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FXR0vOWh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792751529; x=1824287529;
  h=date:from:to:cc:subject:message-id;
  bh=7wnzolyPiPVjjK7Eq0neDSHhtN05FJtt+HvRsgRnSeI=;
  b=FXR0vOWhTDnbEEY/Gk40QX5jrhCi7judD/o8Yby5qIFlV5O9peb59F9g
   9VnkReC8MDw1ZrlG3A6w+1Rg37dm0Jw8MrwEsoI6jYeAWJcBk584DnoCo
   4gpezoP3zLtlxns5SnHpHmcuNqd1IccXV/UHHGfLeS2Y682pmo0Ga++Di
   ZXqCYxbR9Fe4RGK4FD5Esd9UpMWz3Jt4ZFe5ShSAirA3tEu1GDEMykpEm
   Oo9Ymii8Flh+F510y99eKkyD7uYumA1w3dB3mEiGxrioZ8eXdEgx/whwW
   Z6860jciD2mQDwEAqCJd52lqILa26cABRaNVdVFxOmKTcWbi3vOdp2rV8
   A==;
X-CSE-ConnectionGUID: YDHuC1P8R9iS7Xuo14mTfw==
X-CSE-MsgGUID: PCXW1DO6TsWerwQDWUz+Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1518110"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1518110"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 03:32:08 -0700
X-CSE-ConnectionGUID: hJMCvIT1T+iXhKCYuDVUeg==
X-CSE-MsgGUID: fezzn+rYT2SKbs8d+utn+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3603192"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Oct 2026 03:32:07 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKCZA-00000000SZg-49kC;
	Fri, 23 Oct 2026 10:32:04 +0000
Date: Fri, 23 Oct 2026 18:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/genexis-xg6846b-ethernet 20/23] WARNING:
 modpost: drivers/net/ethernet/broadcom/bcmbca_xrdp_test.ko: missing
 MODULE_DESCRIPTION()
Message-ID: <202610231817.pjpf7IDe-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-ethernet
head:   cf136d48dabcbf056cf26e3c3377ac8cdf4b5b80
commit: f19ce282ca3fd68d4b44f1c38d0ea20308c79de8 [20/23] net: broadcom: Add KUnit tests for BCMBCA XRDP Ethernet
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20261023/202610231817.pjpf7IDe-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231817.pjpf7IDe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231817.pjpf7IDe-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/net/ethernet/broadcom/bcmbca_xrdp_test.ko: missing MODULE_DESCRIPTION()

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
