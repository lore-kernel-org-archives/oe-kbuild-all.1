Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E884732693A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486625; cv=none; b=jlEUTJcJj1Q7ICEj+Nzp8R5t0YKDXwdfBOUvLnY7BjOyLvJPmrDIA6xiOGyFVFT4e91VTizZNrfFmjhN6YW7IDXontjaSRFUOZwotIZkDsyCc5z/GabCVQFo4A7uesR4JIEk9S9mNrEyXM/+rhh99a52Ctg3jrKCynyVBIwS1iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486625; c=relaxed/simple;
	bh=noB742D9wwR2mhB8mw4vvJrwhMDyV0splK9ylPn9+iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gh/jo8hdFCrkBPDKasuq2XeMGjlJKnKfPBqGwdipKb3iOvhTv+AtjmolFvQ5ibxmqBUweExdRLQO7TGo66agVTpChe2sVrGeO4uq+5n0+F3Q7mGEcudDyMLuHhDg9CGCwhB/Et0fC4oh7gJ5InCPnVNF2+Qd4tnHtV1mc9nDYZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XqDNDC5J; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XqDNDC5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766486624; x=1798022624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=noB742D9wwR2mhB8mw4vvJrwhMDyV0splK9ylPn9+iA=;
  b=XqDNDC5JbybwE2HP6W36rnvxLDgUAOMTrx0E4Ci3ygLCaxNDAtqegaha
   vLecVu1cs0euroP8voHLD6hB52avK31UezAaJfERBev+tmviI8gKMETmq
   EabJSFYcJXr2oh7+0Mr+u5LWWbWwakbRuGmaMU4T+vokvmoNLbmBGkxjz
   I5FwjbeTwkFagN2a/qnMkEBt+/pbfQgvdYLOjBLxmwq/b+3qin0DV1IAq
   cExsgTZLih/Szt53//ZyfJQQyG/q+Sw9V2YBm0YbENBzal3bTh313we+N
   ULCDSarlq6itowdpOqUuWDu0lQ59pUoFaTSmmnPjxRBIUD+GZuRSethl6
   g==;
X-CSE-ConnectionGUID: m/YumxVZQFK2s7fY8Ys0bA==
X-CSE-MsgGUID: NwxUnGEQTLWRvp10KKM1kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68408234"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68408234"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 02:43:43 -0800
X-CSE-ConnectionGUID: Wc0Wwt1NTL+yWVcHITEJWg==
X-CSE-MsgGUID: aHzwUedMTsGBbUArW8HMeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199516356"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 23 Dec 2025 02:43:40 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXzrd-000000005uO-0yZv;
	Tue, 23 Dec 2025 10:43:37 +0000
Date: Tue, 23 Dec 2025 11:43:35 +0100
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: oe-kbuild-all@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH] x86/apic: Inline __x2apic_send_IPI_dest()
Message-ID: <202512231144.eXwZX0OP-lkp@intel.com>
References: <20251222092208.770136-1-edumazet@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222092208.770136-1-edumazet@google.com>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on tip/x86/core linus/master v6.19-rc2 next-20251219]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/x86-apic-Inline-__x2apic_send_IPI_dest/20251222-172515
base:   tip/master
patch link:    https://lore.kernel.org/r/20251222092208.770136-1-edumazet%40google.com
patch subject: [PATCH] x86/apic: Inline __x2apic_send_IPI_dest()
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251223/202512231144.eXwZX0OP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231144.eXwZX0OP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231144.eXwZX0OP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/apic/apic.c:71:
>> arch/x86/kernel/apic/local.h:48:2: error: call to undeclared function 'native_x2apic_icr_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      48 |         native_x2apic_icr_write(cfg, apicid);
         |         ^
   arch/x86/kernel/apic/local.h:48:2: note: did you mean 'native_apic_icr_write'?
   ./arch/x86/include/asm/apic.h:116:13: note: 'native_apic_icr_write' declared here
     116 | extern void native_apic_icr_write(u32 low, u32 id);
         |             ^
   1 error generated.


vim +/native_x2apic_icr_write +48 arch/x86/kernel/apic/local.h

    43	
    44	static inline void __x2apic_send_IPI_dest(unsigned int apicid, int vector,
    45						  unsigned int dest)
    46	{
    47		unsigned long cfg = __prepare_ICR(0, vector, dest);
  > 48		native_x2apic_icr_write(cfg, apicid);
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
