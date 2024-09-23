Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EA01F93E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727092948; cv=none; b=aALeoI94de4ns/TyNw7eApxqhmR2H3DyWLQWZP9uG7MiDyJdY+XAxP+DvH+oP+8dngQ84adXOlCfNK1zmlY6JW5lTifZyxduYsvn4au8SJJ1wVSLYkwXrWjWMAWvUqHSIwnXOoybs40MtW/tFJ7+ufj44UfhI4RFG5sax07C7jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727092948; c=relaxed/simple;
	bh=/zeC8c/iI2JPcS+OY3+3LQ7gI4iNWqhSGPBwLy3OcXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LVSZlH01SwLLlneU8jtdHR72aSaq8uE/9KDHfN7r7kdAuEmdfl5QY6NFsQT2uCbtwK+IV7ndmur66c7QhAiOIw0VLuPrJcOOIjh/RaLbFkIxSTIgZYu5l/JNi/EIW3I9ORA37UXXpLW9S7xc78fvOo38c+gHh2zpC7qGbp8JLko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHifLLNw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHifLLNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727092947; x=1758628947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/zeC8c/iI2JPcS+OY3+3LQ7gI4iNWqhSGPBwLy3OcXg=;
  b=HHifLLNwEbdxHDkSP1xnHgSnIpfiF2ZtKq/2gVhXmwa3JExW7kRVg072
   XvxKpB5btGD52nf95tM/Bdrf2wgGeYQe7d+ZO1WJ40dyaahfom+Ivs1BR
   yI3f6uTXhgJXS+fqSBstSap8H6M7OByfYEcWK2CkxExHZ5bfPW5e15NeM
   okTrHZ/7rLXrNklUhZlDFEMKgmI0S1REUE1NIoSZgO/D9UI4N6FnrijFn
   x9xBewI8pPfV+ORcyYYnQLAHhWRB5XaNTb8GzNUW0tBkQLeTmsR1ia6Hq
   XwfOhCYxH99bO0iY565XBiuVKBUKBYkckcntHO4RsQMKa1/+SMJabCKEG
   g==;
X-CSE-ConnectionGUID: 56qv8ip1S3i+A1NPeh54rQ==
X-CSE-MsgGUID: R841kBZdRCCQ2o7B3xfdIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43508431"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="43508431"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 05:02:26 -0700
X-CSE-ConnectionGUID: ihoc8zbnQOq+DaWWqRWrnQ==
X-CSE-MsgGUID: OWHZDAkOQ5WRiIR6X/N0cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="75815105"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Sep 2024 05:02:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sshlk-000HAI-23;
	Mon, 23 Sep 2024 12:02:20 +0000
Date: Mon, 23 Sep 2024 20:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1448/2441] htmldocs:
 Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file
 that doesn't exist: Documentation/driver-api/ioasid.rst
Message-ID: <202409231951.dnwjZXwp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 2336b804587bad15f1c80013b1c80ed607d92839 [1448/2441] docs: cgroup-v1: Add IOASIDs controller
reproduce: (https://download.01.org/0day-ci/archive/20240923/202409231951.dnwjZXwp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409231951.dnwjZXwp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/bpf/ringbuf.rst references a file that doesn't exist: Documentation/litmus_tests/bpf-rb/_
   Warning: Documentation/devicetree/bindings/cpu/cpu-topology.txt references a file that doesn't exist: Documentation/devicetree/bindings/riscv/cpus.txt
   Warning: Documentation/devicetree/bindings/timer/ingenic,tcu.txt references a file that doesn't exist: Documentation/mips/ingenic-tcu.txt
   Warning: Documentation/driver-api/gpio/driver.rst references a file that doesn't exist: Documentation/driver-model/design-patterns.txt
   Warning: Documentation/hwmon/inspur-ipsps1.rst references a file that doesn't exist: Documentation/i2c/instantiating-devices

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
