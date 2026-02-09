Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD1430AACA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 19:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770664503; cv=none; b=AbqkQ3wQdLaOf78Cw1DfVo5eSs7f/yyIxVUp6UdiU9w4ULFayv7FVyTi+Hxw9Wcvof+U8Jepr0UAJOEvoOANVSDtGCc+llRCvcN20OvG1+st/TjEoeA3bMZL9BQ+GH/qLB6eF79Ax0DHUQOQLnCVDKx8qwq4HwPUSkxoNnVY47c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770664503; c=relaxed/simple;
	bh=lzQcsdTdetnsucr4ycX0Qck/zCfbI9/u+gS8781kISE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FStfe9zPNW6E3Fvd5Wg2AEPnc+7ZP8VtXOqW14iwXo9gAz/wADWyoH7uvZQsPMYpW0Uv/eZm3Bmj6x2ubdkTULFn84Fh8qqULI3t/u0W1lCI/rdOXIx1UT4+8XmHiLqYHZivNEqxm4B7bz6pEuf2HcAuKOeqTxj4VLpvDLrHBV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8w8RIw0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8w8RIw0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770664503; x=1802200503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lzQcsdTdetnsucr4ycX0Qck/zCfbI9/u+gS8781kISE=;
  b=V8w8RIw0nSplspA53CwN4840mCxZ/TOMy7Tk/TAV7JZqKcpByW9BAeDW
   s7tbVFkhe70ZMXz4kYwNtXsf0ZpRwPQY1SL44+HOTomzdP99dB1qKgO8i
   cDIMktkUzvg3/ypB/DjmN2nRMUc+OmH22NwXSN2F8axsYD6+rn+Z64lrb
   AOo3PTkH6Jr7nXHSiUdlwDGbUFFSZ5iCHgOCd6MO24B/YdHXpsWzJxBEA
   YBCTgZxXRRXaQfIF9m49RZi9U2DMybqGQG7064s29mn5mNITW/zTRBEN2
   vZiHxUNQEBixxaelO4wkUxUj8NCEWUUjGZhU6E/rEOqK+jO5nveX8qckC
   g==;
X-CSE-ConnectionGUID: /lj8FstPRE6p0X6PMjPdxQ==
X-CSE-MsgGUID: +BqrtTwVRj22eVOSY5DCsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71885921"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71885921"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 11:15:02 -0800
X-CSE-ConnectionGUID: c0mfFH5NQNCm/7LI8dQzIQ==
X-CSE-MsgGUID: QCUn69YPSHKpYn1+YrdtTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211495565"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 09 Feb 2026 11:14:57 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpWij-000000000Lp-3gKu;
	Mon, 09 Feb 2026 19:14:53 +0000
Date: Mon, 9 Feb 2026 20:14:15 +0100
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	akpm@linux-foundation.org, bhe@redhat.com, vgoyal@redhat.com,
	dyoung@redhat.com, rdunlap@infradead.org, pmladek@suse.com,
	feng.tang@linux.alibaba.com, pawan.kumar.gupta@linux.intel.com,
	kees@kernel.org, elver@google.com, arnd@arndb.de,
	lirongqing@baidu.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
Message-ID: <202602092024.ZvbFIwzR-lkp@intel.com>
References: <20260209095931.2813152-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209095931.2813152-2-ruanjinjie@huawei.com>

Hi Jinjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes arm64/for-next/core tip/x86/core linus/master v6.19 next-20260209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/crash-Exclude-crash-kernel-memory-in-crash-core/20260209-180157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260209095931.2813152-2-ruanjinjie%40huawei.com
patch subject: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260209/202602092024.ZvbFIwzR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602092024.ZvbFIwzR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092024.ZvbFIwzR-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: arch_get_crash_memory_ranges.isra.0+0x9a (section: .text) -> memblock (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: arch_get_crash_memory_ranges.isra.0+0x1a8 (section: .text) -> memblock (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
