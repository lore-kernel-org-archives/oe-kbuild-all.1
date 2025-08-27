Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51769225761
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 16:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756313946; cv=none; b=JVFT0q4dZqmtO4WBq77xXSqs/dhNnrX5nXMu53MAdwD3Wuoa5Olw3YZwcg0jG15i51DYlQq82X7f0avUDNsIpiXrhBYu6F20imYLsIADijdmWKoEhMSvlSz8/E+UJMQLmnPXYjGyQ+3QxVyulZXxNx74PFFdlpYgc3OEF8DjHzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756313946; c=relaxed/simple;
	bh=iwzt9mRM5t+UL280ZMbN4UbUAf4p84mQUJMxskp+ZZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nhALpBQh1tU0uWbb6tsK9Ad7jHNQYjLX9jShqC03xm9fb/TK9sEHAKe97zEx7guBtDwpKA41S3DE7mgpzTE1AZVikhJ69E31VF18HgqSPlLEG3Ep6NHSQoK9WBIoLrc7yaEVRYsxHL8PoWkLkKKUybnnyUtniUQ7tUM15Zccp3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vz+dyWBk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vz+dyWBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756313943; x=1787849943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iwzt9mRM5t+UL280ZMbN4UbUAf4p84mQUJMxskp+ZZc=;
  b=Vz+dyWBkdfc9r0r/YvVDXsVAaMnc80yzvGb0Vap1nT3ruA9nIFUB24q7
   o+FRkfTMBEu/e0v+JI1mgb9xnJfS60dvHgRNEqUCQxoujGcRhQwiX+X0R
   Uq3VmjDQ4Y8lhsKU3MUhlnKN9PLugTuoBFNeh8MiDj9nmKY4sxw75snBA
   9k4fswxPdWh0XBAyKkTaZPhzEKLEiJ8fC08k5ZS+TtS7JsBY6iQ+D2LbH
   muqWtofBQGD/WrFw9n2rw5BxsjIo3UGB8aVEEUcVex25COjmg5R2axJan
   st+/7gbuklgicZ9V76MEWYTBhmQLXP+wUL6H4ajXIojLSDIfdUubYfHhL
   Q==;
X-CSE-ConnectionGUID: wu+FAGL+T0S9Mu+p8HtSpQ==
X-CSE-MsgGUID: vPS76l+oSlSEzy6nZga+2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="76170939"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="76170939"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 09:59:02 -0700
X-CSE-ConnectionGUID: 8IqIA0J9Q0e3A0Ex1uX+bg==
X-CSE-MsgGUID: ihse7Le+RIyJRlnC2OwKFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="169794078"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 27 Aug 2025 09:59:01 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urJUA-0002fv-30;
	Wed, 27 Aug 2025 16:58:58 +0000
Date: Wed, 27 Aug 2025 18:58:45 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 5/5] htmldocs: Warning:
 anolis/rpm/kernel.spec.template references a file that doesn't exist:
 linux-%{KVERREL}/tools/perf/Documentation/examples.txt
Message-ID: <202508271831.VVOP6msC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   ec0924f318b78f9cf68f73a94e22131d79f88bc0
commit: eb6664f1ccfb97071a7af6841973c816fc854d38 [5/5] anolis: spec: add basic framework to generate rpm tree
reproduce: (https://download.01.org/0day-ci/archive/20250827/202508271831.VVOP6msC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508271831.VVOP6msC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
