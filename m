Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0DE134AB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 15:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758986495; cv=none; b=pIhncUfRlugxFS5XPUKKG1pEltM3m1rd7DiS9J8HF9UDR/V95tO6DPoQk9395CCs6DFLrex1BkQ/UdHOQDGdRLGKjGnk7PzeUdKaTHwnPPPH9I51Y0ZGPkmphPp2CvKZdhyWcAFdShX/tg2jq1hMTMXof0NXgBVq18iIrOLt0N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758986495; c=relaxed/simple;
	bh=q5wYSUTUM3x1mz0GiV95TFHoDTA8E0UaL2eF8bWzqg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r80ecRcMP7pstaeNNkf70BLWQuZzel4quI3h51NGSr1ZlvfV2yMu7w9CjJs4Io7wgluDypU5hiup5TA5baJYddHTivwTkYC/E/SRGnckGH54SL/0IuN+LUIG8agK6Kl/XQXWnGdFKYWslEly+DlNVEWzF8DygAZc0aKJjXVk1rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfeKPffB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfeKPffB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758986494; x=1790522494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q5wYSUTUM3x1mz0GiV95TFHoDTA8E0UaL2eF8bWzqg4=;
  b=LfeKPffBXK32Zpp6UxPgsurfjEMawGKnM+n4Z1hnXEpQtp51ZMvkj/Bg
   pkIig1HGHCP0dE4E7CVMJSsq3cmoJ/0RHSU4nw9MYh541gdUGghAvXUnV
   4BM2hGMQt0k3sAGe0YHsUQPO9OqYcZpq56P3Lv8VOhDD5OJZsxms1fAGo
   +DTznumKGIAcTNVZDzgGWjEKmqrST9cHe3BMfKiq+HblfkKkHROy6gDQZ
   ecA6ugRrHEBgc/9PuEf7g7KqB8LUboJ/xG6SDVKyDeS9GGIYaDaRfdLV8
   B8kGU0iKf1oetDBwTDKqoVEw6RfSYO1mSJC6LGiVx0PLQuqrsVTABIOIs
   Q==;
X-CSE-ConnectionGUID: BhOsdGJJTE6odzsfH5Eziw==
X-CSE-MsgGUID: PeTQ1wIaQFa+G8w9wuEgmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="61462072"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="61462072"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 08:21:34 -0700
X-CSE-ConnectionGUID: K5jzQ2rwSCqZvwFr6iMgEA==
X-CSE-MsgGUID: cn31IclgTSSnrdfrWrv/rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="177897137"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Sep 2025 08:21:33 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2Wjq-00078l-1k;
	Sat, 27 Sep 2025 15:21:30 +0000
Date: Sat, 27 Sep 2025 23:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC bpf-next 2/3] x86,bpf: use
 bpf_prog_report_probe_violation for x86
Message-ID: <202509272329.Scu7nl6d-lkp@intel.com>
References: <20250927061210.194502-3-menglong.dong@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927061210.194502-3-menglong.dong@linux.dev>

Hi Menglong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/bpf-report-probe-fault-to-BPF-stderr/20250927-141345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250927061210.194502-3-menglong.dong%40linux.dev
patch subject: [PATCH RFC bpf-next 2/3] x86,bpf: use bpf_prog_report_probe_violation for x86
config: x86_64-buildonly-randconfig-004-20250927 (https://download.01.org/0day-ci/archive/20250927/202509272329.Scu7nl6d-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272329.Scu7nl6d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509272329.Scu7nl6d-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/net/bpf_jit_comp.o: in function `ex_handler_bpf':
>> arch/x86/net/bpf_jit_comp.c:1474:(.text+0x870a): undefined reference to `bpf_prog_report_probe_violation'


vim +1474 arch/x86/net/bpf_jit_comp.c

  1457	
  1458	bool ex_handler_bpf(const struct exception_table_entry *x, struct pt_regs *regs)
  1459	{
  1460		u32 reg = FIELD_GET(FIXUP_REG_MASK, x->fixup);
  1461		u32 insn_len = FIELD_GET(FIXUP_INSN_LEN_MASK, x->fixup);
  1462		bool is_arena = !!(x->fixup & FIXUP_ARENA_ACCESS);
  1463		bool is_write = (reg == DONT_CLEAR);
  1464		unsigned long addr;
  1465		s16 off;
  1466		u32 arena_reg;
  1467	
  1468		if (is_arena) {
  1469			arena_reg = FIELD_GET(FIXUP_ARENA_REG_MASK, x->fixup);
  1470			off = FIELD_GET(DATA_ARENA_OFFSET_MASK, x->data);
  1471			addr = *(unsigned long *)((void *)regs + arena_reg) + off;
  1472			bpf_prog_report_arena_violation(is_write, addr, regs->ip);
  1473		} else {
> 1474			bpf_prog_report_probe_violation(is_write, regs->ip);
  1475		}
  1476	
  1477		/* jump over faulting load and clear dest register */
  1478		if (reg != DONT_CLEAR)
  1479			*(unsigned long *)((void *)regs + reg) = 0;
  1480		regs->ip += insn_len;
  1481	
  1482		return true;
  1483	}
  1484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
