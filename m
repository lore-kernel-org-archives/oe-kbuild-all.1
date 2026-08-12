Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF4E3876CD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 19:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564393; cv=none; b=maILfE7kYrZ4+HL4PAgZkXRnKL0ani88p/6X7zbIaKMTp+29rDFZ4V4AJYB6NaWpPF+K+8Am0VUo8NEVByFT/Hrk/YtexgK679QBs9jfRKyWjn7KxTpUzcbC4yyY6s9Z/Sl4sE+DmFu6h6ylpV4wLX9/d8xFq+CE+rOxLp/axWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564393; c=relaxed/simple;
	bh=qWrTI60mCRTUhA1KBH7POc1EsDo0LvIRG3QOTJIh3OM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LjqSLg9o7Ynq36HnX2AXe5wPIBz6Jl7m5DuYg3W/Ec+YuN6StTGAg8u6c3N0xH+AZSjVJbN4VOSwnd9haKH9MKM208m3fWiYFVMgNy5dnEob+0sW/NUSYJIpfqQqKQbeCZNUPD29NCUk7Oh/Zwcesjp4JSi0X3hsGS502XHIPAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T33y5JMA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T33y5JMA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786564391; x=1818100391;
  h=date:from:to:cc:subject:message-id;
  bh=qWrTI60mCRTUhA1KBH7POc1EsDo0LvIRG3QOTJIh3OM=;
  b=T33y5JMAKaXiMc/1ZPRznAybZcOUJIdWXiyRKGgeo/ysmFfnk0lum/1P
   kq0Shx81WYZoY+3h2zRWmnW9RplZ+13xag6i+5CUPkp8K3iRKEYz0CaRB
   Os0V+X/MXIiUIg74T1l/oaQ9xQIIGqd8DBteLSKJmqukTzk4oN3ByxBNh
   nkqBkmrJFsZaHBUrTqUtrRQqGUnAPDv1J6Q9RRSauipJe2tqRPF/3LaIA
   BXzb6s6rlOT6909kZ5810a6FacQFoz1tc3un361v2RzsYwOdR5SY2TnEt
   bWq29sbDmbLOGYpXcf+5GbsKvk1FTiiGPgYjxrOqtYTliHErYuxOY/xvi
   w==;
X-CSE-ConnectionGUID: hQ52++7bR4yY8HYPb0Yn9w==
X-CSE-MsgGUID: OVNQIvwMSASv3LtnR5Lvmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="109919322"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="109919322"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:53:10 -0700
X-CSE-ConnectionGUID: 3Ug3qbGYROmotoMGiiLGeQ==
X-CSE-MsgGUID: q+FLS9K6RKWVUfcAJxy4Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="267593416"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 12 Aug 2026 12:53:06 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuF0X-000000005s2-3DUx;
	Wed, 12 Aug 2026 19:53:01 +0000
Date: Wed, 12 Aug 2026 21:52:48 +0200
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 14690/14737] error[E0616]: field `0` of
 struct `module::ThisModule` is private
Message-ID: <202608122140.0CR6WA4v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   28d012efb4327f9c75d5e042a7c91e9a542efa98
commit: 96871599b7e78f16aeaa9bace332a51d204559fe [14690/14737] Merge branch 'driver-core-next' of https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260812/202608122140.0CR6WA4v-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608122140.0CR6WA4v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608122140.0CR6WA4v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0616]: field `0` of struct `module::ThisModule` is private
   --> rust/kernel/serdev.rs:90:89
   |
   90 |         to_result(unsafe { bindings::__serdev_device_driver_register(sdrv.get(), module.0) })
   |                                                                                         ^ private field

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
