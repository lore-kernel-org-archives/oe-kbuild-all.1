Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD5D44839D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 06:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786082879; cv=none; b=tJWhAv/PKupEpR/d8cUZY5iFLR5CCcLXgSUtOyN4pd/NbxCw+UcJwAwurU23R/t3xtL37RCeZSA/5JcJbVbb3JG8EhMUD0d/KswnhfPRobtGz1k0xSHjEpym7XOcgjO9e+NAsvuIIgeOCWaEdHoC6ybri+sVjJB+2XYJeAPvy58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786082879; c=relaxed/simple;
	bh=nVA8QV3LN9O3iWeMCvYcGIcf7DkFQ1Oa3+jPvJcGAM0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T+sH1PMJP71HLDfgurgjPU1XXNdcwUW9q3JqXqy7KeI5saBUVvDyyq2Z5zj9qf1iws+oeFn3H/BPOqVrFf/EF2ox4ftFxow4iRGgUbWHeC31Npz4Vcq/T+Q8oNXN4FD+Yek9q0EJjMLmtgh0dk81RvYZs9GrgFSz8hbtaCQhUAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K8D12524; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K8D12524"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786082878; x=1817618878;
  h=date:from:to:cc:subject:message-id;
  bh=nVA8QV3LN9O3iWeMCvYcGIcf7DkFQ1Oa3+jPvJcGAM0=;
  b=K8D12524kyUtOCf0yGvweEc1iMZSwIgYqQWoR64CDKZH7DqUmciIXc6d
   znCM7bzpG9E98DuD8j491WpO9gAQCtg036ZeCQHAPNrQxXANzUh21qxc9
   kcP8HzCnEmtuVcsUR6Xqe1gNz/X2TOCPa+056J8R1Ffh0kF3+fClrHOlU
   SQ5TY5/V9Kc7X0ZHWgrOyUTWITCjKtlDn2geBVCBpDEQHcuDWywqcj3nN
   rpJ5knaWOXBqho0FJ8ET44ssyVzmCuliyIoWTo8oxs5hvA66VZy5mOILu
   YX6zoqZ0+2hN0TF0/bffiTa+BIPrGi7I8uRFwqZMNugypX1APDMggewuu
   w==;
X-CSE-ConnectionGUID: 06s7L3p2QhC5MwrKKhcvUw==
X-CSE-MsgGUID: Bb+NkYZqT+adRtaSjOfXog==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97840390"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="97840390"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 23:07:57 -0700
X-CSE-ConnectionGUID: v9dVk8dvTEy3PoFHBqbSnw==
X-CSE-MsgGUID: qKe4HLKRTb2eKW4oZlImkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="285688401"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Aug 2026 23:07:55 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsDkG-00000000HLj-1uOp;
	Fri, 07 Aug 2026 06:07:52 +0000
Date: Fri, 07 Aug 2026 14:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>
Subject: [linux-next:master 8357/13479] WARNING: modpost: vmlinux:
 section mismatch in reference: test_perf_kallsyms_lookup_name+0x60 (section:
 .text.unlikely) -> initcall_level_names (section: .init.data)
Message-ID: <202608071305.o2Nd8WgJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ea2bff00da89d7767d677bb68470130ba96f4928
commit: efdcfd9b4f4f07aa70663ee02a79dbdf980bf582 [8357/13479] tracing: Use seq_buf for string concatenation
config: xtensa-randconfig-001-20260807 (https://download.01.org/0day-ci/archive/20260807/202608071305.o2Nd8WgJ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608071305.o2Nd8WgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608071305.o2Nd8WgJ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: trace_initcall_level+0x5c (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: test_perf_kallsyms_lookup_name+0x60 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
