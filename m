Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C1B1C5F1B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751100284; cv=none; b=k8/odjgvR4ZsUymwSCDIHkXu6pdMF/pLNFMmrTqSSe9dZd1ZNrG4QAOlfSVibyCtRQoB4457+tiE0LVNbEZOi80B+mE/1iQBqPNLWkpQH/bnNQb4sBEvLl3BsM77n0TmB7m1smwEgwrFlFYbdrHqFitCqXGkKEQAwjAcieivIQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751100284; c=relaxed/simple;
	bh=nlrGEI9OpG+H5s+7amgT1YtNa2lY4u4SK6aX0tw6LkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GN8+qoAIH7nC7OvAhYrxXdNmMlm+vy8+mG3ybVKaE/naqssdDApWqXMT4JYkiovisBY3q/fqksKWFojEAEhAOoZoNka/3kM4ooqT/43ep56gZX7mTYzfa+/7NqiLQaseAfWu1vSnpeD3texjgOnIrBQsoDU7hkU0ipRwib5halg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OmMcHvLY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OmMcHvLY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751100282; x=1782636282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nlrGEI9OpG+H5s+7amgT1YtNa2lY4u4SK6aX0tw6LkM=;
  b=OmMcHvLYJ4CtErckUydVU3IR1z9xpiDGYR9jvanHdfv3aeKmKxzqUPX3
   HHn3yiY8G3s197eqofibrD/95bRddjPQWEFhycz+YfJddy1pLALBGVC9O
   JpG4N/uw4+JoL4lSse2OsqMOUx8uq1I1OXnR6wcy/ZMHuXsKiyOwxoHH+
   2joGWFyCgJodeBWQ0SuZy0PJH4ofFx9TudsYbTgAYKORAKI8rqFsrwGGg
   P+Im3+ncu6cFZJizNBTBzo5MFuU+v8CiC58Ci8cnRlp1eRf7yitFYR2It
   S7cACvKa+1ih+2tuR2UCvy5F1YjASzQkyE86B1lcWWG8k5xVDokECjk1m
   g==;
X-CSE-ConnectionGUID: Rt7kjkDOT/OzJm2abf28Kg==
X-CSE-MsgGUID: SS+K2prPQHqZj/zaJJiovA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="75947242"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="75947242"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 01:44:41 -0700
X-CSE-ConnectionGUID: z0yvuWd8QNC5dhLrhpUP3Q==
X-CSE-MsgGUID: j40ghVhkS+abnqntwCSrHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="152512419"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Jun 2025 01:44:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVRAq-000Wvo-2k;
	Sat, 28 Jun 2025 08:44:36 +0000
Date: Sat, 28 Jun 2025 16:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Jesse Taube <mr.bossman075@gmail.com>
Subject: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)'
 and 'vmlinux.a(net-traces.o at 1409108)'
Message-ID: <202506281650.jluKcypL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aaf724ed69264719550ec4f194d3ab17b886af9a
commit: 2c0391b29b27f315c1b4c29ffde66f50b29fab99 riscv: Allow NOMMU kernels to access all of RAM
date:   3 months ago
config: riscv-randconfig-r131-20250627 (https://download.01.org/0day-ci/archive/20250628/202506281650.jluKcypL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250628/202506281650.jluKcypL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506281650.jluKcypL-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(trace.o at 1237988)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(mballoc.o at 1255208)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(core.o at 1357508)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(send.o at 1276448)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(slub.o at 1244588)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(skbuff.o at 1406948)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(net-traces.o at 1409108)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(inode.o at 1255088)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(volumes.o at 1275308)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(ring_buffer.o at 1237928)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(tcp.o at 1412828)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(syscall.o at 1239488)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(core.o at 1242068)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(blk-mq.o at 1287308)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(af_packet.o at 1418288)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(super.o at 1274168)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(target_core_transport.o at 1358588)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(filter.o at 1408028)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(inode.o at 1274768)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1228868)' and 'vmlinux.a(vmscan.o at 1243208)'
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
