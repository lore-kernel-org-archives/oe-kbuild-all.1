Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8463264CD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Apr 2026 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019585; cv=none; b=gj/KUFT2A0d8o14sNiOaEFsRJEMYr9VsUj+EdEeV4Gg2YkqjNM7hJaavaeSpng2F/NbGhOI5QthFOSZVDb7IfCib6tQMfw9yIQuFnaVbZ/3iwt1CjoNKXs2dCdtFpYCoHoCHmke4kYwnZYQCQvjaL9ZVSp26t+kO7f8aB9o2/lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019585; c=relaxed/simple;
	bh=1yWIt/bw8aU307ULcNrvCXE+mEh5c8xlL7/IsmK7Z4U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hpEgKh0l46fin2CpN2sUEcTdnwjei5ASowlDOi4+KcSaYbHixNe/sBdaGiqa7G4AE2FkUnwwg8Qr0ItOT88Trdth65vp7zUZY1mjXCwV8Bl9pQ+vkvutwaB1nXA3baJIXOqXMUoWNaGjC1StfDER4yaHm3g2BYyUx/xQCZajeSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWtVSAHB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWtVSAHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777019583; x=1808555583;
  h=date:from:to:cc:subject:message-id;
  bh=1yWIt/bw8aU307ULcNrvCXE+mEh5c8xlL7/IsmK7Z4U=;
  b=GWtVSAHBzb9XFnOx6sMoilmJbkk1n/amp6SVDeYyjnzxaFgWUhLWUUbL
   nYVUCqgyFJQVhC0d3UJrwldw6wop7C1h8heOJXln3NbNF8IjrAPVPzpZp
   WQftVs/F1gg8bEBXVbKbBNJJpFJxQrOuj4DefVZbfofjyZVYielIvvVPq
   10b556eN9GN3JyWjcYuhDKqyZXDYVREApLLEHHLeSyRJgdm3dKUZMcfZ/
   Trd4TTRI5Ty1ct5/lwxXncoHqJwHaR3gNCjeGSEtr/+bVaIsuMEd+MZ85
   cmr7a0fAzc0nvo42asxHBaDLUSvdefsGA73id5EabKq+JZ61CUWNIww5p
   g==;
X-CSE-ConnectionGUID: BTTqPtXZSdaM/zntYKhBzA==
X-CSE-MsgGUID: fFUDsk1/QjGvDq0frk5yGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="80581349"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="80581349"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:33:01 -0700
X-CSE-ConnectionGUID: TkbepQTAQ/6qDM/Xot4Ipg==
X-CSE-MsgGUID: uEArGDH7SwWjr05pexzQlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="228564803"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 24 Apr 2026 01:33:00 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGBy6-000000003E5-0it3;
	Fri, 24 Apr 2026 08:32:58 +0000
Date: Fri, 24 Apr 2026 10:32:34 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/52] htmldocs: Warning:
 anolis/rpm/kernel.spec.template references a file that doesn't exist:
 linux-%{KVERREL}/tools/perf/Documentation/examples.txt
Message-ID: <202604241056.jVI8BaV5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qiao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   5effc28909b1319a2a2175f617f88ba32a208f1b
commit: b59c41852684e0cfcf198cb3ded58b8b37413a47 [0/52] anolis: spec: add basic framework to generate rpm tree
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260424/202604241056.jVI8BaV5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604241056.jVI8BaV5-lkp@intel.com/

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
