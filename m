Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDDE72618
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784363602; cv=none; b=abeJzuqlE+vwRliS7mcjXeguPvCGXL8sgvtJuwsv8tFA+mFLbOrOAzm23bhSFRya1BV7gaQEU7/3sH8JllTLYbGmV8ad/EyRh2X8bFKp087aaB1E21jGgoXUFey0+TGn3TF27FSmequP2gFYOlXRWMdBAz14yW6s3qR28vAK5qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784363602; c=relaxed/simple;
	bh=GhN4ax4x3Cqra4yRz7MuDgzlUnmFDTDV6iv41TY3rcI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a16IROAIxo66LBr5jBUQgGRQuwJgxaLUWC6Nn7VnRmdB7n40RtDCXpIlnpP25+23CeGIIRkxnbva6Aeo9pnucqCyFtOvExTSwLsFgVgUdVysYzx3hiCHf+4lfAD2NGMwIS0NgH3JudcXlyYQ32Cbwm+uDaQ6N6oaaYqm2ZJtQog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAxYZxIT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAxYZxIT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784363600; x=1815899600;
  h=date:from:to:cc:subject:message-id;
  bh=GhN4ax4x3Cqra4yRz7MuDgzlUnmFDTDV6iv41TY3rcI=;
  b=FAxYZxITR2y6bHZvI5wrIfJUG8YNtsOMJdtYHHR7C9X9DWCU+OqdPXwK
   ZUPl+Ng/glAu7sQii8D821QpyeT4D7yB5IibSgfOLXmuPlU3UP/3WDgJC
   LvEi7m63znr7xuvKRy1Wc+CVs5/foDGIsF8uzmEGIQanKTPuVOVzBk3ni
   aMER4uM2nmRinHYfSSlYwcUpk/lmckhwIAiqoMqbkr6UTZWhAwhgPWL01
   k6Mwx94ndaiPtXgPW2cDVVB0tyAwFtuF3BHH8CrjN0DCEATb41daSgJGY
   bAQdUpMPmlUO0afJvFBa5y1a5wO+UFEwq9xJ5PKKDsCeZlCBwgab0bilF
   Q==;
X-CSE-ConnectionGUID: 6aK6j4m3RrK2twLdXZm07A==
X-CSE-MsgGUID: ZV1SvnHURJqpqxb/w7FTGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85221806"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="85221806"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 01:33:20 -0700
X-CSE-ConnectionGUID: o6MtCqR5StG59Pc8fcLVXA==
X-CSE-MsgGUID: 8ijFt9nfTNCp20MJiuiSGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="287047185"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 18 Jul 2026 01:33:19 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl0Tz-000000005kj-26wX;
	Sat, 18 Jul 2026 08:33:15 +0000
Date: Sat, 18 Jul 2026 10:32:33 +0200
From: kernel test robot <lkp@intel.com>
To: Terry Bowman <terry.bowman@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Dan Williams <djbw@kernel.org>
Subject: Warning: drivers/pci/pcie/aer_cxl_vh.c:172 function
 parameter 'wd' not described in 'for_each_cxl_proto_err'
Message-ID: <202607181054.0FLVfvSc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Terry,

First bad commit (maybe != root cause):

tree:   https://github.com/intel-lab-lkp/linux/commits/Terry-Bowman/cxl-ras-Fix-cxl_rch_get_aer_severity-wrong-severity-register/20260718-063140
head:   b690e48c644301b364eded646b27e0df0cf0d1e2
commit: 1af36d74a23c78f1be7749cf8cc46b6fd6413c82 PCI/AER: Introduce AER-CXL protocol error kfifo
date:   10 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260718/202607181054.0FLVfvSc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181054.0FLVfvSc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181054.0FLVfvSc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/pcie/aer_cxl_vh.c:172 function parameter 'wd' not described in 'for_each_cxl_proto_err'
>> Warning: drivers/pci/pcie/aer_cxl_vh.c:172 function parameter 'fn' not described in 'for_each_cxl_proto_err'
>> Warning: drivers/pci/pcie/aer_cxl_vh.c:172 function parameter 'wd' not described in 'for_each_cxl_proto_err'
>> Warning: drivers/pci/pcie/aer_cxl_vh.c:172 function parameter 'fn' not described in 'for_each_cxl_proto_err'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
