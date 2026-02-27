Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ACD1DE2C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 02:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772159907; cv=none; b=tNhqwMEFMSgJldbQAlQyqAPJ69I33hornVH6Y05ZycVUKAvu0BJP6LenVMbvr6EAWcYW0z/z2Wqokbx2aCPNCjMZMtYoOaDYz4gn+pmANh4rU3QYNv7wJVJ5qCHLnLv8P5kV4plTFOr9UjVx0YuJTxa81rut5HC8lkHEGw+LRD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772159907; c=relaxed/simple;
	bh=JIK6NC8NN/ZihwCEYv6j2rUCYA+0Qkl1ubKdhxoiMt8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oNHiQlg9l2dcxSdbGHmdOfkmvgj93syQJnNUeHQLeLja9zxdRqPGIyctKjjuqVtMPHw8gdA+l0/ZyK4F4OWbpnNHlPjm8nZecvWucMLxgTrLBfXLdHcq5vunugxPeBz7H1ai4EJUq75T1ObWRaamZL9N4DlmF0T51xBwjDqRDOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9gHEOCP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9gHEOCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772159906; x=1803695906;
  h=date:from:to:cc:subject:message-id;
  bh=JIK6NC8NN/ZihwCEYv6j2rUCYA+0Qkl1ubKdhxoiMt8=;
  b=C9gHEOCPfHLRboD5i7Kjpd4q5VICF/478yRZ7PamFe6GDlAc3hzIKK+g
   NqEAuZt67E9c5JKRBJWji/T/4l7ifdiKsIZSC0XG9YkZ3S4MxB3QhOYXU
   +fltIvb5s9qWIImtmATI/Yop+OFMS8Cp1UYCvcgq7GU4QNEKO2tK/FrRb
   4rIEMO8mvFaMJDiszmZcszLtP/IULY/z12dgqDy+IXH67SwO8+IWKwCmh
   RvE0X9Jxt/Sko5pm7h68UjTdKz60ZueBvrXMKBaeWv/jIGWKEGj23yYcK
   qrMnVUbMdoozM+DEoGUEUAQ/tn2VPVmaWhnhTlayexq8E+faDUhCZEnaL
   g==;
X-CSE-ConnectionGUID: 573N2pNmTfOZXnojPYeSnA==
X-CSE-MsgGUID: RP6Qtyv9RauERdmPayPVUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84592540"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="84592540"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 18:38:26 -0800
X-CSE-ConnectionGUID: qR2uPv7mRuiCs2J/b3PcNg==
X-CSE-MsgGUID: P0aX+qzvQ02YHv7nYYR41g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="216879059"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 26 Feb 2026 18:38:25 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvnkE-000000000RB-10ub;
	Fri, 27 Feb 2026 02:38:22 +0000
Date: Fri, 27 Feb 2026 03:37:57 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1] htmldocs: Warning:
 Documentation/ABI/testing/dm-bow references a file that doesn't exist:
 Documentation/device-mapper/dm-bow
Message-ID: <202602270355.VxJSIMdK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   b5e973f489e4928831610623d5e272716600ff94
commit: 7a7986f840b09a4a80a6c042bb9316b71ef37b61 [0/1] ANDROID: dm-bow: Add ABI documentation
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260227/202602270355.VxJSIMdK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270355.VxJSIMdK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/ABI/testing/dm-bow references a file that doesn't exist: Documentation/device-mapper/dm-bow
   Warning: Documentation/bpf/index.rst references a file that doesn't exist: Documentation/bpf/libbpf/libbpf.rst
   Warning: Documentation/filesystems/locks.rst references a file that doesn't exist: Documentation/filesystems/mandatory-locking.rst
   Warning: Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst references a file that doesn't exist: Documentation/core-api/irq/irq-affinity
   Warning: Documentation/translations/zh_CN/core-api/memory-hotplug.rst references a file that doesn't exist: Documentation/core-api/memory_hotplug.rst
   Warning: Documentation/translations/zh_CN/doc-guide/kernel-doc.rst references a file that doesn't exist: Documentation/rust/docs.rst
--
>> Warning: Documentation/ABI/testing/dm-bow references a file that doesn't exist: Documentation/device-mapper/dm-bow
   Warning: Documentation/bpf/index.rst references a file that doesn't exist: Documentation/bpf/libbpf/libbpf.rst
   Warning: Documentation/filesystems/locks.rst references a file that doesn't exist: Documentation/filesystems/mandatory-locking.rst
   Warning: Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst references a file that doesn't exist: Documentation/core-api/irq/irq-affinity
   Warning: Documentation/translations/zh_CN/core-api/memory-hotplug.rst references a file that doesn't exist: Documentation/core-api/memory_hotplug.rst
   Warning: Documentation/translations/zh_CN/doc-guide/kernel-doc.rst references a file that doesn't exist: Documentation/rust/docs.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
