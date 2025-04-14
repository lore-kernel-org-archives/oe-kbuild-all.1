Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B9185260
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 23:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744673782; cv=none; b=tY2flWyIbBk1wgoum7r0K/zrUJqe7OMppA7Dx4Ee9dq8ZYg5MNxjj9V+qdgvsulW4kxoD3E6WEnSqyL69fXx+sT3SaRwEoObKiZVUhMhlc1moHp9ywXYLV+49SUoXJADL1LU3hbWLW9/Mc1LtjH+RgwjNa4FzpUDpatR/Vrlr5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744673782; c=relaxed/simple;
	bh=gc3xkf5jl4UAEZloiBTGzD8ZMfyG8T+xO2lYNcFxM/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C0K5EoBHVY4W5Lq6hbyDfe6/bXFtXps3nCWyqj5EBaZRsgnnOnIiMZ6Oeo0U8JAL3PasudN3Ayg7iwkuqs8CB+F1pn23IEBMRPADFjMNO4JWrKsTreg2m66OScjZn5Iy6JE1bH7F+PeQmHv4LT2cqL7EseBLPRxLsdvzQOpbLMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ix1HX5wr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ix1HX5wr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744673782; x=1776209782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gc3xkf5jl4UAEZloiBTGzD8ZMfyG8T+xO2lYNcFxM/g=;
  b=ix1HX5wr6/auTlszoQIC2CyKjiDuusITBBoNIVq6pkMP/ib9zttWgdOz
   9aZpExLtYLwleS0mBRnFHDMYcFceDJvnf8bLGdG+/tclbRUi5HA4WUftq
   bKBP1viWADt/TqPopMByVxX6eIrpWJhNNuJNqTD0sD7hcef7CZmVJp/Pv
   zEdLMCuWeZeO6YVUuex0Fc/RGiPncOZF0DuLIRgZZ+xlN6CHvdtn8uwyR
   PDcdRQWurRXCKz//xk8rFJuRfgCcrcoT+TbrOMS2489l9xZmhgSzz+fse
   y3ehe3aLcbS/BcqlklwS6mfIllUe7ve8+ONY6QUAzU4l+Z504qGWqd+L+
   g==;
X-CSE-ConnectionGUID: eLpZHDMNQgeMSz0uU8foRw==
X-CSE-MsgGUID: y63bamqtRKOPsZf1+0vKFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45871303"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="45871303"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 16:36:21 -0700
X-CSE-ConnectionGUID: qVES9eDSS4qlY60MNxHiKA==
X-CSE-MsgGUID: n2YMads9TGW7RQpIH9Fxog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130491764"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Apr 2025 16:36:20 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4TLd-000Epi-28;
	Mon, 14 Apr 2025 23:36:17 +0000
Date: Tue, 15 Apr 2025 07:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:stream 9/13] ld.lld: error: undefined symbol:
 bpf_prog_find_from_stack
Message-ID: <202504150713.0tOdV3w2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux stream
head:   a1aa685f70a017d3492be37e89d45d5633fc0203
commit: 1831d6e322ca5ae2738417b28733210440be19c6 [9/13] bpf: Report may_goto timeout to BPF stderr
config: arm64-randconfig-001-20250415 (https://download.01.org/0day-ci/archive/20250415/202504150713.0tOdV3w2-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504150713.0tOdV3w2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504150713.0tOdV3w2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bpf_prog_find_from_stack
   >>> referenced by core.c:3158 (kernel/bpf/core.c:3158)
   >>>               kernel/bpf/core.o:(bpf_prog_report_may_goto_violation) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: bpf_prog_stderr_printk
   >>> referenced by core.c:3163 (kernel/bpf/core.c:3163)
   >>>               kernel/bpf/core.o:(bpf_prog_report_may_goto_violation) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: bpf_prog_stderr_dump_stack
   >>> referenced by core.c:3164 (kernel/bpf/core.c:3164)
   >>>               kernel/bpf/core.o:(bpf_prog_report_may_goto_violation) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
