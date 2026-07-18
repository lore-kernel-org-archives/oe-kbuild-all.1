Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB6C37EFFB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 16:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784392773; cv=none; b=clqrEnMYeLtaBt36w0RprWAINDrMsO9NGKbNAGJo8xnjXHQgvN2LUtCdrMnuctx6HUGVFE0hT10n97h4sOPYpvTP0GmYwxusgovAxHWzDCHD/exodIx7I2CMaslRFNafsKwhNc5Sz+oMSoVg+aZrM+BCJZFzPzfeFFfjHeXORds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784392773; c=relaxed/simple;
	bh=h0WXw953jvM0BFN/PsqAcMXaO7FfJ8xp799SCS3xpJA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EgC2VnJTgaQ7pwmd4NyF930wr8eSrosBqUbKkyeUIp/ORGTVD96alCrSBppXMdyi4EOSSHxG14+CMGQP+LeU04JIy3Uk6mwAhAFl5EYjUb26ie56stQrBnOXQiLx4ILgpmXMhrxlahvjLCS1ZgcIXZ6DvlCCv43p/XpgsUwafR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IwX2TFBq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IwX2TFBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784392772; x=1815928772;
  h=date:from:to:cc:subject:message-id;
  bh=h0WXw953jvM0BFN/PsqAcMXaO7FfJ8xp799SCS3xpJA=;
  b=IwX2TFBq32w8XyYdx4eAL2FclNuh5sZd8slpfOplVgGJMI1RlXhTi6ps
   WQIbSIYElzOP4dwFKYI0yiWmdokwTFsMt6SWEmKhddemkhHlJriIUF5fD
   JwAsWxICmLq5LexS/O0EU89whYmHiJE00oS1wS/oNU8wal12Q93vIQ63P
   czBrxcgsMDuOU0Oje4aYtSmG1WLHUF2XvSR3c4+xRftJ5wZMpGGfXRlH5
   IA3O0WT5TVTZ1S1sEkCi+eZKYRFlEAnf6ka8Uj+tpWrHLT3LUSHw18k3Z
   yCtp8eB+Etz5DEiCVm0mpChkGAGAvGvJmLvFgyXanKEPLmluzJmYixLsO
   A==;
X-CSE-ConnectionGUID: 0mETnTU1SXGfmPb2xAeG7A==
X-CSE-MsgGUID: /1PharBGSraT9c0F1oPQzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="84987115"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="84987115"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 09:39:31 -0700
X-CSE-ConnectionGUID: PqwiXby5SQe3TqKvntrCxQ==
X-CSE-MsgGUID: 0fHFZjtFQ9i/QeLiHMiYEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="287110888"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 18 Jul 2026 09:39:29 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl84V-000000005qj-40rh;
	Sat, 18 Jul 2026 16:39:27 +0000
Date: Sat, 18 Jul 2026 18:39:11 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/105] htmldocs: Warning:
 anolis/changelog/002-changelog.6.6.25-2 references a file that doesn't exist:
 Documentation/x86
Message-ID: <202607181836.Ls6ZFASB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   4f8a6ab0f5f0b5f85efcae83321abf317723182d
commit: 5c79516ebe734e67eb8ab9847049b332100d0c25 [0/105] anolis: changelog: sync and consolidate historical changelogs
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260718/202607181836.Ls6ZFASB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181836.Ls6ZFASB-lkp@intel.com/

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
