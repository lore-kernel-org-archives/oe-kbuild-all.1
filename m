Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F0C1F09A8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 11:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769857458; cv=none; b=BaI+RfsaE1RX+7b9GixQUNyh6X1oNP14XMtq6OHZ/v8Q+lAlDjP7z1en3jBaLWsN0FwpYyAwuOeXLwsikggbN217NG7KazsuePUBK10i8NclCEr/UCfeXUMxW5hniaM06LJR/oHuvK1X2Z7stbYYoiWs1JfhqJ42idVb/u6AAuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769857458; c=relaxed/simple;
	bh=3SuezLgDikrPJJkSVwmSJEmxsBbHs5h33AxGFBfThbI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aIjIafNCnwj7T2kmiG/z9HItW9rEESnAnPYRXDwhCKfUj/yenGMdu4gW+S6ma4w9ccGwmlf2w4VrFwiP2IGjTRi27HRdO0Q3sCSMsdaxvjZ2/rV6MPulEP8mjcbqj+K79qeFCcDTT1/J6CCY9D6TDcPjwMMVyCpXX6SnFBmKQ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQMmAaBk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQMmAaBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769857455; x=1801393455;
  h=date:from:to:cc:subject:message-id;
  bh=3SuezLgDikrPJJkSVwmSJEmxsBbHs5h33AxGFBfThbI=;
  b=MQMmAaBkK5bRAcp1Syfuq1GVcoeCGeoPtGhXc85bW54FV3n7ooaiaTr4
   spYE8p/lOGWhJFo+Cb3Do1RzcX/0oZ2BveMynGT6GXk70YefovtPnp80r
   wEtSg5Jgf4rBwdZz1G3x4Kz34wiIfJ3e519Mt+SOqeznrUBEzUX5Z8UWp
   IsgjeT95FWq3QjpTgQV9cMStaXxlvLlquFh0yDiGYD4FF2bTxFuNiZ/eq
   exLL0BTOTzCZPjJEubU695lnBdpm/5bXIphXJyMTjF6fkDahH9vbtroJV
   lphDTMBP4Td7qwxM05UDyiEEBMMbA1wfmLypht9VhRcfz34ExykKV+RNe
   w==;
X-CSE-ConnectionGUID: igHMlmgfRfSFcXhiMIQi9A==
X-CSE-MsgGUID: 1nuLpnQDQvaFK+jdqHsepg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="73694984"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="73694984"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 03:04:14 -0800
X-CSE-ConnectionGUID: RgET8WDYQdqUWx66uAg0mw==
X-CSE-MsgGUID: 5GmPmeeOSoGTuBhun312CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="240337465"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jan 2026 03:04:14 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm8lw-000000002gb-2nLS;
	Sat, 31 Jan 2026 11:04:12 +0000
Date: Sat, 31 Jan 2026 12:03:42 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/3] htmldocs: Warning:
 anolis/rpm/kernel.spec.template references a file that doesn't exist:
 linux-%{KVERREL}/tools/perf/Documentation/examples.txt
Message-ID: <202601311213.2LnfxcQ2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qiao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   8f3dc34debe1467cc2306963037f0db6b36e1729
commit: b59c41852684e0cfcf198cb3ded58b8b37413a47 [0/3] anolis: spec: add basic framework to generate rpm tree
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601311213.2LnfxcQ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311213.2LnfxcQ2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using alabaster theme
   Error: Cannot open file ./include/linux/pci.h
   Error: Cannot open file ./include/linux/mod_devicetable.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
