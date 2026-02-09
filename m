Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2126D423A8E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 19:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770665703; cv=none; b=GMHt0mdFPN1U6q1RnLDt7rMLKPk6MKKye4B4eJ2JbeGCDgsQLkp9ycv9RxeaHS1UxngBU1+wO4fCR9/Dn5fXjYfEcUyuMmKjqvxXxrhcEJZ3x383GL+0cbJ1zzGenij9KB+3flXb+8Sv74abJ5R0jQJD1NOZg4ERVceZCynkOp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770665703; c=relaxed/simple;
	bh=V21WeSQh+jYsyRnQ2KRTTFyu1Ulwtfy9nsOTY1b2xYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrWhU3MAfimUsGWg/W94Si5Zauwq5zsDP3h+IGZpSLKWgQsBPTXmdA2Iy9N+Dxwjxph5sIUQNmbCfmHgcJxztyBZhvKvD5OcpPeArFZ7nbRPojzBpxkR7TXp5nnFh3uhucAXH1ZzCn1IbDwrAw9ChWb8Iqc/1OaYn8Mfd0uNWnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FK05DrQK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FK05DrQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770665703; x=1802201703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V21WeSQh+jYsyRnQ2KRTTFyu1Ulwtfy9nsOTY1b2xYE=;
  b=FK05DrQKRSCOu6T71v+0ZxgyvShKLbMQOg0bfyS9e6jH4Y5JvxmLaf0x
   ypQ0Bp8V3Y8A9YzD7pP8VOtSxcR3BsPJWFOc9/x0arQtSiJd5e5Kbqszh
   X1ZGMP6levHZkC9j1d4/CRxTrfMguWLGfP6kZJX9pGqmhlu+A/ish5TkT
   +ETWXRO/znkE6UIO4gCm3AytJM6IkspUlzeBFbHFQESgV3qiJIIxKKYYd
   G6kUN/df2rhjhiDjOK8wWXaIT4olQamLiAld9E235q0VxmYEypwaxYkXG
   PL2AatfJYXBeRExKp0xLyLmyd/CFSd1GbeY+h9GWoXM6pmWlIfqggOAPT
   Q==;
X-CSE-ConnectionGUID: SX7dX2qAT6KOU0x6oXkZgw==
X-CSE-MsgGUID: gN2fkvIjS1ub8/L7kxU7BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82427238"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="82427238"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 11:35:02 -0800
X-CSE-ConnectionGUID: zZUGfgsqR92izDQ6RRlklw==
X-CSE-MsgGUID: auX6acEnToKyv6UjSWIBbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="210983586"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Feb 2026 11:34:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpX24-00000000oGu-3fWc;
	Mon, 09 Feb 2026 19:34:52 +0000
Date: Tue, 10 Feb 2026 03:34:17 +0800
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
Message-ID: <202602100305.4xhuKBjO-lkp@intel.com>
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
config: powerpc-ps3_defconfig (https://download.01.org/0day-ci/archive/20260210/202602100305.4xhuKBjO-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100305.4xhuKBjO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100305.4xhuKBjO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/kexec.h:126,
                    from include/linux/kexec.h:38,
                    from init/initramfs.c:604:
>> arch/powerpc/include/asm/kexec_ranges.h:7:32: warning: 'struct crash_mem' declared inside parameter list will not be visible outside of this definition or declaration
       7 | void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
         |                                ^~~~~~~~~
--
   In file included from arch/powerpc/include/asm/kexec.h:126,
                    from include/linux/kexec.h:38,
                    from arch/powerpc/kexec/ranges.c:20:
>> arch/powerpc/include/asm/kexec_ranges.h:7:32: warning: 'struct crash_mem' declared inside parameter list will not be visible outside of this definition or declaration
       7 | void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
         |                                ^~~~~~~~~
   arch/powerpc/kexec/ranges.c:146:6: error: conflicting types for 'sort_memory_ranges'; have 'void(struct crash_mem *, bool)' {aka 'void(struct crash_mem *, _Bool)'}
     146 | void sort_memory_ranges(struct crash_mem *mem_rngs, bool merge)
         |      ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kexec_ranges.h:7:6: note: previous declaration of 'sort_memory_ranges' with type 'void(struct crash_mem *, bool)' {aka 'void(struct crash_mem *, _Bool)'}
       7 | void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
         |      ^~~~~~~~~~~~~~~~~~


vim +7 arch/powerpc/include/asm/kexec_ranges.h

180adfc532a83c Hari Bathini 2020-07-29  6  
180adfc532a83c Hari Bathini 2020-07-29 @7  void sort_memory_ranges(struct crash_mem *mrngs, bool merge);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
