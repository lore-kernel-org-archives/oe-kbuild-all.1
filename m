Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1882D3B9DBA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911188; cv=none; b=TrpIr5Rc9/hLwmQESCz0hna6oOL8hM28IkygKNEic5fWBi1ipZcZ2bRSUaVZHuO9giNbsWPourPi7WqRYkjiMloJkJWgL8dXp/OpzSp9qPMp5EvjHkmLW0laYmabjieScPcHlADN1rWywjoJHdzRxlf1F1RuEpk5BQv1D9GZdDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911188; c=relaxed/simple;
	bh=LXQhLuWYMjPmSVR8Ffe7DwZdseXLZbvlaSf+S2nPuGU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KLTJw8D2D9e5SKIMRRkooTtdiRmDH4zBzbgd3Hi6nEmxtwvSOqrnX53BrswuhLTU2GjIa1mSnXR0HxyCYMmIM5vr3zS5IlGjDmgo2vsHTQOXf4wWOua9xLcaBzv4NqcexW/cCxTgx14dLxy/xg2eaMk3OayfB6rVueMwaVbcyqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=loSD5Ixl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loSD5Ixl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773911186; x=1805447186;
  h=date:from:to:cc:subject:message-id;
  bh=LXQhLuWYMjPmSVR8Ffe7DwZdseXLZbvlaSf+S2nPuGU=;
  b=loSD5Ixl4dcaOzfkNaEkYIwoM9fPe4V69BqP0odlsj1BmLnl3qRYiUhW
   0AGW+OMU8DQ/IbBcITJ/A0K1D3XAw9SFgF5RErDj0k8vYxP6Q80/xnsQQ
   SvYedAzZhJ5BQtVbwUNFeYVDLV5HCAUZPZkmk+52c7q40//u3yaek1iow
   ID+6FeGUQ5j6NZ5qCcoMTWnluKxFVWLsEilBIie57rTp+dD3StUmc4hYF
   tysyH2qHM+Es4jtZ4Ay4yCj3sVJ/UHjzjaKRNLJCtaD0rOBGFpNvrYurY
   CNbmMGFbJwxPLMRi8X+EJgHQWwegOUNZLhty1IpScbIlDNVl0r6TGMHNK
   g==;
X-CSE-ConnectionGUID: h31QDXRiRzqpgAhf4pA34A==
X-CSE-MsgGUID: u2UvPdqAQdutpeomfJp2ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86338618"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="86338618"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 02:06:21 -0700
X-CSE-ConnectionGUID: RgcYft8MQF6i2bfvZLh86Q==
X-CSE-MsgGUID: MnXF5xQ0Rb+arQWiZL3HgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="245927584"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 19 Mar 2026 02:06:19 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w39Ka-000000004o1-0p3u;
	Thu, 19 Mar 2026 09:06:16 +0000
Date: Thu, 19 Mar 2026 10:06:04 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/4] htmldocs: Warning:
 Documentation/trace/coresight/coresight-cpu-debug.rst references a file that
 doesn't exist:
 Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
Message-ID: <202603191018.ujiCcHZQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   7ae03274141ace633a6e590dcce9b01cc2e9c06b
commit: 3e7fa063af285361ae434a82b5eabfef99d0e59b [0/4] coresight: docs: Fix a broken reference
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260319/202603191018.ujiCcHZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191018.ujiCcHZQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
>> Warning: Documentation/trace/coresight/coresight-cpu-debug.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
--
   Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
>> Warning: Documentation/trace/coresight/coresight-cpu-debug.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
