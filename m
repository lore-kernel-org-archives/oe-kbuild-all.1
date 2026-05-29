Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173D83375CB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 20:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780088023; cv=none; b=hi4SVAQBIZwDbtKeSKLcuvRUhc7gClIsIsWM+fPbPteu+W9X9OLIBv5YdwUI1eDJ2mOIhWDCR/ml6UXprcbTzP5gyyhi2IfLSETTO+dH3/pWdrxwgSrfcApItinidYKEwVpIlnqYfSGo5loS1f23I0tN5gYbsPnaFLkFCUtZQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780088023; c=relaxed/simple;
	bh=alrpKLdV48Pp4sTZ1wT9OMUMdJJUOKy4Lb5RXMiQQhI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S4AWXU/IweGPSt09VQjCTKnT2qpjv6wUBGkprH+RBlwXaoYLjufuCLaBlC7vhxriEZzUifpwB+oG1WtHM/0DCJeOCFSWhh+L1daGiOKqWlv69HOEzkmfxeFPtrjniy8HRPeaammbcgEPpsgNwERhdef+AjL1HZ2RQLntcR/XBs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bu7TauIQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bu7TauIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780088021; x=1811624021;
  h=date:from:to:cc:subject:message-id;
  bh=alrpKLdV48Pp4sTZ1wT9OMUMdJJUOKy4Lb5RXMiQQhI=;
  b=bu7TauIQRAkAfQPI1+8afSTNMSzsV06U9TeVA1e/dOCCgS+EGZvcaNTV
   vX5q6189+05oK5VKdw1kCYEyrKN+WkkrVKOhX97kdLxXDdnh8Xz0vyaDC
   8Aq78MSermrRpsTtce4Z2LarqZ3scWWKnfVWgVyQvZDoqJoM/geiiMWPo
   7BdRbcYUqnRretOCD1KPVB1HVKd2rhG1FdE14BIstvg/12eh4QSIqSq9a
   2K1n/AALBnm/Yi7v8egqdg+i8GXQ8Cx++NxADctGNewURr2OH5skP/KtB
   9PEwrr8cXQxZ8XLzdzaVOWkKf32/F/Z7vws99qMwii8TcvXxsiLLcW/D+
   g==;
X-CSE-ConnectionGUID: WlD2ZnQAT4mewewlqRi1EA==
X-CSE-MsgGUID: QA11dWkyR3ugXJsgBufqzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81060488"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="81060488"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 13:53:41 -0700
X-CSE-ConnectionGUID: TsJbHAgJQ++pagbkSLbS1A==
X-CSE-MsgGUID: lNzHTciLSQKhVpxuK19mOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="242818409"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 29 May 2026 13:53:39 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT4D2-000000000wL-43rm;
	Fri, 29 May 2026 20:53:36 +0000
Date: Fri, 29 May 2026 22:52:43 +0200
From: kernel test robot <lkp@intel.com>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/iio/open-sensor-fusion-protocol-v0.rst: WARNING: document isn't
 included in any toctree [toc.not_included]
Message-ID: <202605292226.LXfXcakp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jinseob-Kim/dt-bindings-iio-add-OSF-GREEN-sensor-aggregation-device/20260529-203704
head:   1c52cc7956cbaab8331a893adeeae87be8eecbc0
commit: 6d2e81590d4f043dfe0119681118fff3d7d3da4f Documentation: iio: add Open Sensor Fusion protocol v0 reference
date:   8 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260529/202605292226.LXfXcakp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605292226.LXfXcakp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:191: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/iio/open-sensor-fusion-protocol-v0.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
