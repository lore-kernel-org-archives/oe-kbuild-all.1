Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF3E4AB1AA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821373; cv=none; b=botiLySbb69nSzzEH9dwT7i+phIlgNyUzQH2vkYUcruNH3+36WWlyYRbFX43JsYY1SnEaW7HFq5RVbCPhjOf8mD6QJcdWqIgjZ46xfHRJ7HPrzD7LeKCf1MNjCCfUP4FtFBxolmjJKXOoJpoRFRiv7tk1DELXTFeIBjdZPVQM20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821373; c=relaxed/simple;
	bh=zKpWoq1v8R3ZCCPppr6bgcRZ+BeB2lhIXtanKXaglDI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b0TUY0NeQzzTKbRQU9NfeJjSij7ncacNbdjgku75PwTC/wVdP878c8DrmQTLu+ErtO7d4+kjpoS1L06a85R9orCRqwWPVQmSWN+gCmx7HSPZt5z1RDIJZo7XCo08S1nZ5g56ptEuNUxl/gfw6fGGkf6nBeEoiK33pATjtgFXjbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XrOPkYIP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XrOPkYIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791821372; x=1823357372;
  h=date:from:to:cc:subject:message-id;
  bh=zKpWoq1v8R3ZCCPppr6bgcRZ+BeB2lhIXtanKXaglDI=;
  b=XrOPkYIP6Rpsk9tQZ1/gw2dv+vQDM3/rCrztLp8c4cGyKbEcNtHaI6FS
   mw+kqk5AmKC+t69+TP+HcZVVBxvI2Tc7bGvYOrrq6kOev4ov83RFo5438
   O2HATF7AW1PRzRpAYlSEW57kx7358rOYaJsPiL6o6Nsit/mPCUegatq3T
   6jmLnQFg6GXnI8Xhf9EMmtcciWGw23d9d4P0xJzO9LSnfo4oqWu1SwP/B
   QBFZKK93gMox58YPhGaZmCPcRUVG/IJJ9NSB7hMwvS5ZBMV2/FbcyNzVr
   AifJHW1g+nHzb0Tqx83n3EPn5xd1V63HtEWtw+CytgHZe3WD8jZu+V5wx
   Q==;
X-CSE-ConnectionGUID: UEMwAuFARyG/LpnXHJxWkg==
X-CSE-MsgGUID: p5fGeHCuSVGSr/ZWSxHrgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="539344"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="539344"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 09:09:32 -0700
X-CSE-ConnectionGUID: AXHF8C7OS/W5kniZIBMW8w==
X-CSE-MsgGUID: MiFFVLdGTDGcF4Bqn5Acdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="893329"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 12 Oct 2026 09:09:30 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGIad-00000000A7L-0Fw1;
	Mon, 12 Oct 2026 16:09:27 +0000
Date: Mon, 12 Oct 2026 18:08:43 +0200
From: kernel test robot <lkp@intel.com>
To: Ricardo Robaina <rrobaina@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Justin M. Forbes" <jforbes@fedoraproject.org>,
 linux-doc@vger.kernel.org
Subject: [snitzer:kernel-7.3/trond-nfs-next 6048/7306] htmldocs:
 Warning: Documentation/admin-guide/kernel-parameters.txt references a file
 that doesn't exist: Documentation/admin-guide/rh-waived-features.rst
Message-ID: <202610121831.4ay2Qrkd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/trond-nfs-next
head:   8ed84ae4d26a6885be7dd8995bb73d8b7d1cefe9
commit: c49fa66a4dcc9b00c08e5a0d75ccf36244cb00a4 [6048/7306] kernel: extend rh_waived to cope better with the CVE mitigations case
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261012/202610121831.4ay2Qrkd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610121831.4ay2Qrkd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/admin-guide/kernel-parameters.txt references a file that doesn't exist: Documentation/admin-guide/rh-waived-features.rst
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
   Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
--
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:228: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:251: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/admin-guide/rh-waived-items.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
