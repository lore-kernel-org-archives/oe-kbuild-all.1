Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793261798E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 01:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709601994; cv=none; b=C46z5QDHwSa+aXKVMunVBuymDKb54so3rCZRftHWZR0KmU6Km+1vDejZQxhtu5piV8i1O89hi3alarpnjqvNq7Rp1nVHgQuy8l6lEpzOebhCw0PcXfccytglGk6N6zr3x9SQwAH0TdlleBlg9WkiXc2LREb+8ioegNa3M1FvvDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709601994; c=relaxed/simple;
	bh=9uEz8aaXBlaWlRnnYjqJ3bKFKh6aCjF4n8NZPpWflkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R1uYTOb+eVlAvDOlRdJaRYxPqS916ejI3UdnzRDzpqvjrrA2UUq1eTJf/Q5+x84KKl5x0gA3JbQ9b9F9ErPCw7fCa6tkZsuniFDiX2OE93JBcAjGYVZepTmGJ2i9Vd88CfotMbr5djPCIKYZzDs6eZLTj7c+bwy7lN4ocBmZnPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJAU0czT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJAU0czT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709601991; x=1741137991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9uEz8aaXBlaWlRnnYjqJ3bKFKh6aCjF4n8NZPpWflkM=;
  b=SJAU0czTBugttpvJEe5p2GDVtnQ7VZj2Xb4eBAiHZTHKFGyw7pe4frh4
   H+t5D0ZILeMhEeijb0Bq/iYUfQO0s+yiy9FNdoJ3+vfLBXY+7XuVZv2uU
   0pf0wGTBTTE3vwjF3gazbai1uremT9d9tnmuKXFS3jV+g1PbK8Q69arwK
   dwauV0vlsHoAJRjvTlfye8Wsn/JT+l/eVskbMuE0Z305m8sdQ2UW5/kIG
   DfwAOn7UBI4anhT+aPOVYyGUzTck015KdrRwy2wCU4hHz3KIMhl+VWXq3
   ldJ9kR7gplisKqww0vVKuFJGuXm8pHXuGpd9bWbXqRzaVDAe2g2MPj/VU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21584237"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="21584237"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 17:26:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9608801"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Mar 2024 17:26:27 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhJZY-0002tb-16;
	Tue, 05 Mar 2024 01:26:24 +0000
Date: Tue, 5 Mar 2024 09:25:38 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: htmldocs: Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst
 references a file that doesn't exist: Documentation/driver-api/ioasid.rst
Message-ID: <202403050936.WqwCvQ82-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 3a285a19d4babf1535015f25520248118ec560b6 docs: cgroup-v1: Add IOASIDs controller
date:   9 months ago
reproduce: (https://download.01.org/0day-ci/archive/20240305/202403050936.WqwCvQ82-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050936.WqwCvQ82-lkp@intel.com/

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
