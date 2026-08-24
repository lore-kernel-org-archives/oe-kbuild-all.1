Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B2B22D4C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 01:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787533976; cv=none; b=FardwHHP9WrNpAPNKe+3BGJiPUz/KgYM53LLBBUjfY1jlaRcOLEEU5qKEfLIGMenPROGwrdN403i6DlJpFLxoeihQQkHIDlEY68A+G1Xx60a448nOUmYczitSbzeEC1K7h20I/tvZZvRlPuP/bgi1DfJn1ixGhBREnHD42C8oFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787533976; c=relaxed/simple;
	bh=333dcJgdKIPNL5C+srKB6rYKfeR9Bj7iGQ9zDWAXAGc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rqKtT4KlwsHwpQ1igAxUuf4Qj63/0+LIzcB8PTkUh72k2H8rOLW/00J32kl2H88VUZCgeqBASXXqJGEbH45zRJtL1lo9yqtT5+KS9/YcCmMvNgpPGrHpsdHTwHgVv0z2EHHEgtC01mGUozQG24GofzCoDNihoHJjVR/i0BK6UTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBdJs7ls; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBdJs7ls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787533973; x=1819069973;
  h=date:from:to:cc:subject:message-id;
  bh=333dcJgdKIPNL5C+srKB6rYKfeR9Bj7iGQ9zDWAXAGc=;
  b=XBdJs7ls/O8zWT3zUQckvBL+2oI2T8xZ75F8P5EpQX/5bJtwGlDqiHr2
   NEyh1hC4s/3htnN/w6qPU5JBL6muxfkRS0XGNdUoV641IsMI1vCgW6sz5
   v3lu0jXrsz8AdZTIqU46i76sj0weBzd18NlYDCWb1wKbABRmoHxDc51MG
   wLbeKRcCDbUcKEHWzBG/xq/45TQy0FAwv1/ltccFbNcEy6hAVsjABBCUv
   m+vadu9XXJbsV0sxlVCHVfy4TxKtFPBSAk25QsY1I5RtW5JkQcG5PiZlB
   jgLzsyOXZ9iZIRDUx/WaCgmV+s4RIucNq+8potCY3dfMZiTZJVKsM3Du9
   A==;
X-CSE-ConnectionGUID: 7jW9dN45RXi4N30lPbSktg==
X-CSE-MsgGUID: inQ1J2vCQOOt539My+5vEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="99139776"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="99139776"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 18:12:53 -0700
X-CSE-ConnectionGUID: QD22mQR4REau8CNyr4m7EA==
X-CSE-MsgGUID: YpDy90KpQ76T+fDyK/kk7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="291699085"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Aug 2026 18:12:47 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyJEy-000000000At-3HB0;
	Mon, 24 Aug 2026 01:12:44 +0000
Date: Mon, 24 Aug 2026 03:11:49 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/158] htmldocs: Warning:
 anolis/rpm/kernel.spec.template references a file that doesn't exist:
 linux-%{KVERREL}/tools/perf/Documentation/examples.txt
Message-ID: <202608240356.PnvQZ1VU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qiao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   fb512bc986e8e5e13460409fae533531d54fa59b
commit: b59c41852684e0cfcf198cb3ded58b8b37413a47 [0/158] anolis: spec: add basic framework to generate rpm tree
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260824/202608240356.PnvQZ1VU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240356.PnvQZ1VU-lkp@intel.com/

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
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
