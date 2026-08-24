Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9DD1E5B9A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 03:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787543215; cv=none; b=NOP+TXQULpPps2MwKfXP7GYV16TNAbbsPdYuQlBjmQNXlIr8mP2KfLS286wYRYWp2sHAZkIdirUbAn0GrXZglREL5hh/eH9qKR3dYiPxeYUmD4Q/IAOc3x5hPaYmnMS/mMbdT3i2tHyMCPXWH+mGgEpr3cSJewyQBs2A5mtw94M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787543215; c=relaxed/simple;
	bh=Jqr2k42qEvb3//SBbaSIHDoLkQeqm8RHuGLg/IPfYNA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sG1MG078zaRj0wie3E+/iYJFcn1ZHLSJnkeh22VQxGKprH6Ifo/qSuzsXaUgBwBP8APNMh8Op8iD7PHzrAgJ/yA/wJa2bYJJyEieeee1EHY/x35s5PUSxCZrLmfhGpSsUrSeuC7RMyR+wDWQssVwwpbdOR6NefbShwhT6ODKzQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cv9JG2ql; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cv9JG2ql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787543213; x=1819079213;
  h=date:from:to:cc:subject:message-id;
  bh=Jqr2k42qEvb3//SBbaSIHDoLkQeqm8RHuGLg/IPfYNA=;
  b=Cv9JG2ql8rvzHzPQ/Tpv4ObYPlGsc/s5B3VpQdiUUwL0hg8YVJ3mu4S6
   dZgX20BhDaMnfGVthWehmf5/7a8u8b9n320CPYQmWBLSHRklu7UzjKO1y
   vFuEG358j1VAxZgZoA+T8zw1FHupuUq/hpoByvRy0APcftnykgbbv6lWT
   g6iLglB3N9RVzI4/HWOwde7Dm2VvJEPdl6W5YkKpzLRIp95cf8ZJuMDud
   4W1q7gy0AzkDqM06gSam1u/VeKN4WyboO/m3/8ST3kj3kLTlsE8D//s/7
   jfxne/bW8NDn18by8VARo4k5g08ViXDldHjiJd+gAn5FQcNYBtj+uidq/
   w==;
X-CSE-ConnectionGUID: PxNMhqimQWC6ULztekZzXA==
X-CSE-MsgGUID: cbJidQe3SWywhLZJn9npdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="105363642"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="105363642"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 20:46:53 -0700
X-CSE-ConnectionGUID: bNtUanQiQHqntQS9N9YE7A==
X-CSE-MsgGUID: rCzhMgIAT/qgJMTNbJXGFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="263171410"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 Aug 2026 20:46:51 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyLe4-000000000GF-467Z;
	Mon, 24 Aug 2026 03:46:48 +0000
Date: Mon, 24 Aug 2026 05:46:26 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/158] htmldocs: Warning:
 anolis/changelog/002-changelog.6.6.25-2 references a file that doesn't exist:
 Documentation/x86
Message-ID: <202608240546.jFUMNtth-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tianchen,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   fb512bc986e8e5e13460409fae533531d54fa59b
commit: 5c79516ebe734e67eb8ab9847049b332100d0c25 [0/158] anolis: changelog: sync and consolidate historical changelogs
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260824/202608240546.jFUMNtth-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240546.jFUMNtth-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: anolis/changelog/002-changelog.6.6.25-2 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/004-changelog.6.6.88-4 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/64
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/hw-vuln
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/kernel-parameters
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/amd/hsmp
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: include/net/netns/ipv4.h references a file that doesn't exist: Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: anolis/changelog/002-changelog.6.6.25-2 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/004-changelog.6.6.88-4 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/64
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/hw-vuln
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/kernel-parameters
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/amd/hsmp
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: include/net/netns/ipv4.h references a file that doesn't exist: Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
