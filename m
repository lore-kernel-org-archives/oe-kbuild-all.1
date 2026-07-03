Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20793B893C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 11:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077246; cv=none; b=QFuPGJ7u3/+0/byUkhSLcYdb+IdfKHHrHUFZnghprywOguya9ur+pQXT3k87Tv+8sV7TO0gMXLFnqluBrc+KErJ2JXWzYvf+RyUCDXTd1wVFPiePOw+eRleCBbHrfZL80PKt5pBDTfVXUO70A1yiMmcp9ZH/FuiS6Dcc6JXK8lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077246; c=relaxed/simple;
	bh=g8NU1zEbzzOkSCXF2RNXWg0TBtRPLPN6c+2SealPD5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M5Djf+BkOp01L/JxqFANIfFReW2BKKL99q6KG21w/ILjb7cub9GO5mnls6fh0Ubp11yod3tKByy21iNQ79jU4OqcN93FywgiArHXMRpHy5JcHLf+g+qlUOGhAmr8k7eNn3VDVVyXo3GTmvH9efk6MWD9CLpo83lDbhvjD+ZZD1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isST4IEE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="isST4IEE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783077243; x=1814613243;
  h=date:from:to:cc:subject:message-id;
  bh=g8NU1zEbzzOkSCXF2RNXWg0TBtRPLPN6c+2SealPD5w=;
  b=isST4IEEmfWOZdADRSxYmiyI7D9cOAckjmWeMvW4jgcD6omKLgSgAssK
   xYphCossuX7Ugi3JkyFIDnUZuIyS+DXDDIhlZBBrD1yFezAvylZIyvz8J
   ePVmNa/RIbxRhGv28skeJ8qK5tmJ5I+9HDi1HtsfT/YuU9dbRHc9h6V5P
   YzyKURal7yr+P1s2ekWuqoWL3fV++cSswhVB8CRx2WfLjuGQIdgYIabID
   DnIjDm70rztVgY7MYWJNGf/MRBbCFLdB6MognLRLNJqlVHQN3BlMcPyQ8
   YL2dzLAPpIzKqANp9EoNe3rMrjx6gQoppR/mbkpdDXfER0r8VEWyezXM6
   A==;
X-CSE-ConnectionGUID: XFtnpx9GTju5Pb3uEJIJ1w==
X-CSE-MsgGUID: Jv33/mumTNCbe+eKG/a4/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87510715"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="87510715"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 04:14:03 -0700
X-CSE-ConnectionGUID: wW0GwMhESPiMRbMPfMEU6Q==
X-CSE-MsgGUID: AxSkOpGaQpakooncdBPm7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="246716764"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jul 2026 04:14:01 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfbqI-000000001V3-2zPX;
	Fri, 03 Jul 2026 11:13:58 +0000
Date: Fri, 03 Jul 2026 13:12:59 +0200
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/gpu/nova/core/tlv.rst: WARNING:
 document isn't included in any toctree [toc.not_included]
Message-ID: <202607031322.BZaSlip5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/rust-firmware-add-request_into_buf/20260703-033738
head:   7fe1e13ce246645500b8ee008a265a8e1712ab16
commit: 8fbab058c7d971fd4850555b76f58bc002988f96 gpu: nova-core: add TLV parser for firmware files
date:   15 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260703/202607031322.BZaSlip5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031322.BZaSlip5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:228: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:251: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/gpu/nova/core/tlv.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
