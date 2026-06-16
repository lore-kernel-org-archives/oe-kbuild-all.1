Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF1330C142
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 01:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781573048; cv=none; b=iTnS+ntUBB7cG+HpeByZC24Oog797++9t2NN0VzeS7JiqiTvdGZuozxKTcnHnM1LiqKghuJfSglNOteEupwNBNUAim6smwm+ZOS3HPYc709lgDodHa+z5x8LxW/R+J1c760A7+sgvUP1NexCcV4Lr0LKKLIDQGLvMVe/ED5oTYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781573048; c=relaxed/simple;
	bh=K/IwqA4bb8oRNytTf0dzfSb5JsDRGXaEqofNhTPoI7Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AvlTN/3/DuPJlH2Q0T6flpSV65Scc901B1rIJNP9l5t2ogkyoqiRi4lDtMudXjTD2Um9KDY0fqXH9sL2UGOi6xc1m+zr26vAI/dY1JMo1Q7C1gGVTsKN7r9Arm4NmQN6IWpl+rp1TUkT2bdfsRKEvFOAbbFnUuxxjiCQAgtpqik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYvLUsGV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYvLUsGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781573045; x=1813109045;
  h=date:from:to:cc:subject:message-id;
  bh=K/IwqA4bb8oRNytTf0dzfSb5JsDRGXaEqofNhTPoI7Y=;
  b=AYvLUsGVMHPNzwnwMguypHSTOxYN5a9adsjjRO+3hin3dfQSK8Z3gllk
   Y0XR6qi3uq6YRBnEIqOwQ0DwuglVGzVRhtP/qzCZswdJVO89gd2yUU52e
   hbeeDD0yYZ+x74cTdnEIJG5yRNiIUqnySC3lQRvuw8quasZEpkgWsVzDC
   Sg30OkG8BEQQisxhqJHm5vLcLJtTvX5dF6OHO0DVJmuW3PPYAenA9RESU
   zLbr/SmV2TogqnI7T+737IeTph/ersogU2OMXfiv6oI/o6zX309EPyPXq
   PGr5tnqeLInQa9paV5IPBEBoHu/P5EF2CVZWHeWRazDwldir/2V2k0HuF
   g==;
X-CSE-ConnectionGUID: 2TdyenjmQ4qp962Lwrt1RQ==
X-CSE-MsgGUID: 3mbec2PGQfuhZPSCfUumnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81338545"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="81338545"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 18:24:05 -0700
X-CSE-ConnectionGUID: BQgs/8uQQXmRck8OIRBiIQ==
X-CSE-MsgGUID: zdmGMeV0TQOhQ264ovpl7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="243260214"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Jun 2026 18:24:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZIX3-00000000Sas-1EaL;
	Tue, 16 Jun 2026 01:24:01 +0000
Date: Tue, 16 Jun 2026 09:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: <command-line>: warning: missing terminating " character
Message-ID: <202606160921.SRxfT9CO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ihor,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e0611827f3349d0a2ac121c023a6d3260dcecdb
commit: 600605853f87a4b1c3530a63f78a3541633402b0 scripts/gen-btf.sh: Fix .btf.o generation when compiling for RISCV
date:   6 months ago
config: csky-randconfig-001-20260616 (https://download.01.org/0day-ci/archive/20260616/202606160921.SRxfT9CO-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606160921.SRxfT9CO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 600605853f87 ("scripts/gen-btf.sh: Fix .btf.o generation when compiling for RISCV")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606160921.SRxfT9CO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARN: resolve_btfids: unresolved symbol bpf_arena_free_pages
   WARN: resolve_btfids: unresolved symbol bpf_arena_alloc_pages
>> <command-line>: warning: missing terminating " character

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=m]
   Selected by [m]:
   - CAN [=m] && NET [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
