Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F81314A7A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 23:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769903903; cv=none; b=t3/k/A6aIZm0NCpDIj2TjA8yzFwPTBWqjihI2OsOQ28baX+s7n8EWN+ISPaZG76Vo6Ivmq8KBr/0jNQpciLvchaGeJdom1ecQuDnjosBKWYuNZAGlLDpil0pAYAIWJCN+hyI0oXafu+PNs2wI/wDfQBWRHAjUy/gb6s0R57oBnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769903903; c=relaxed/simple;
	bh=JLkINIMW7HJR/G9/kV+hiuR9rZZQo11sOc6BIqD3mm4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ppeTuVjEZq1eWnIrdKkc4HigOQGLIWxSm2HXLrixh3VEywhijiOI2GbiADRMdXUraHZHXoOu1huqYYIH/ozgvk2DYakOzVmSEpgNS90frBLY/4z6fM6xcyVNDWSUhsAUAU2HOs3dQlXiLgJpvh09vm2Y6fKMSJ3MyJLujIBwZ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROnPL5nF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROnPL5nF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769903901; x=1801439901;
  h=date:from:to:cc:subject:message-id;
  bh=JLkINIMW7HJR/G9/kV+hiuR9rZZQo11sOc6BIqD3mm4=;
  b=ROnPL5nF1nOiAPAuAe7xzSifBH9jFHMh+uks7JJBKsQfKdBRxKpCGPZV
   diUMZLteW3HmsoQ2dyUGWbfqIK4VVJIiDg73405vzmTKIT9C6nAtik4yB
   n7PVdFRoPtJDjxztq+dgR9TTSdLNJ5umCqVs5jldcgkJj6PUC83OqiyoN
   e4ZjZJfGvkXoLcLFiaBKqV8TcbETV1pQWXiWqOjPYQIRmgqSL2s2NiLiD
   fhn7qHhA4CeZ1CNl/AXkUbXRqmkMSTZ+7pV1x6nfTHrK/DSeQcOAVIQOc
   UP4wOeoN5MXLtYDI1P6/BSv9glezPcZtH9o3GNZTNcxRAr4d3zH7vMn0b
   Q==;
X-CSE-ConnectionGUID: a3n9yDtHSOuUtYOWSpzmuA==
X-CSE-MsgGUID: TR+Wi+juSyeCcaoCiV7ROA==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="81846990"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="81846990"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 15:58:21 -0800
X-CSE-ConnectionGUID: xoQ+vlsHRiGvUzeMHJaKVQ==
X-CSE-MsgGUID: 7o0TYnhNR6iZFBUCqk62aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="213652242"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 31 Jan 2026 15:58:19 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmKr3-000000002n0-3ZPI;
	Sat, 31 Jan 2026 23:58:17 +0000
Date: Sun, 01 Feb 2026 00:57:18 +0100
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: oe-kbuild-all@lists.linux.dev, Drew Fustini <fustini@kernel.org>
Subject: [linux-next:master 9833/11028]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/hdmi@ffef540000:
 failed to match any schema with compatible: ['thead,th1520-dw-hdmi']
Message-ID: <202602010059.ORZ53nZp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
commit: c4b59c6f44360ecb626fdd75b4121fe9b79832a3 [9833/11028] riscv: dts: thead: add DPU and HDMI device tree nodes
config: riscv-randconfig-2051-20260131 (https://download.01.org/0day-ci/archive/20260201/202602010059.ORZ53nZp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010059.ORZ53nZp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010059.ORZ53nZp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/hdmi@ffef540000: failed to match any schema with compatible: ['thead,th1520-dw-hdmi']
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/display@ffef600000: failed to match any schema with compatible: ['thead,th1520-dc8200', 'verisilicon,dc']
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/display@ffef600000: failed to match any schema with compatible: ['thead,th1520-dc8200', 'verisilicon,dc']
--
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/hdmi@ffef540000: failed to match any schema with compatible: ['thead,th1520-dw-hdmi']
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/display@ffef600000: failed to match any schema with compatible: ['thead,th1520-dc8200', 'verisilicon,dc']
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/display@ffef600000: failed to match any schema with compatible: ['thead,th1520-dc8200', 'verisilicon,dc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
