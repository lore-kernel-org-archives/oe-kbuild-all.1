Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83516184540
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464527; cv=none; b=KmbkgL3cneLflKk88GQL+5yHBtlDb/Q9z5YrBn9HBR9gv8/2wmd8N8o/DTFqefcBabzMLrGTgIwL7P2zg4dxwDGa6NK+NrCNq77K+EsJ3CqddDnSpb4QtN6r3HDdQtsrWJk6mSJlItzUn7z8+eXekzWDiS3BTORsOhsQ00+nnhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464527; c=relaxed/simple;
	bh=hkQi0176mtPTTL8ri6FvVDIkYGTbPHOwRM4+qaZdUkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T9clkuLV3DWAKda9JsJSHuxxnEp4ZfF8IlAWopFWkc41YEddVrUKCVLtmJjuI0JIwkPp43R8XCMdgaxineVCGnRWNUOiwkxHFA3bVw31X5fyoueln2+kw3oKV65JxOnTXx83jupVfnzoRcxKvYKGi4fY2CPqhWql8CyI5V9puA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuCEjCH+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuCEjCH+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763464525; x=1795000525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hkQi0176mtPTTL8ri6FvVDIkYGTbPHOwRM4+qaZdUkk=;
  b=EuCEjCH+EOAxZUQOf0NzkJmocomGABHM3yhns1oyDjDi6ftGR1DPCh2z
   /Tu0PuVUkM1p5bibClx8UND2Kq+N1mkzlZElHokUQ8PzBVZMMW/WEe5XB
   4SCmCnqos0prWALUGP62DWAH7knjlydSdbxm29dIQN03LD6ICZvFmgWhI
   FCB/oGY9uYaJK032uyd9NLmmrCunxeWU0ujLE8TSjd8YW4cjbWXXLaNxJ
   EZsBW01Eu2U4DI86UsBlx6AW+UdYoC6bHGUGDLf2JylxHMjRPx+JT18aQ
   1BFRgubBYLNAAcFyT570FrwsVtrz3DmlC3pVihSL98niCDvdTUkHB7bOl
   w==;
X-CSE-ConnectionGUID: ZuPClO6aT1OpP2iM4UTYiQ==
X-CSE-MsgGUID: j/oT34NdT3+P71yP5BPl3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65363969"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65363969"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 03:15:18 -0800
X-CSE-ConnectionGUID: hPcatblmQVeWyDzXgS7OQg==
X-CSE-MsgGUID: 4A3b3Z/8QCOcHYMjIHBChQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="194844436"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Nov 2025 03:15:17 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLJg3-0001dz-0c;
	Tue, 18 Nov 2025 11:15:15 +0000
Date: Tue, 18 Nov 2025 19:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address
 space '__iomem' of expression
Message-ID: <202511181938.ctSYELwA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   9e265862b98f47e02ce26ff6430b7acbe9dcba56
commit: 41300cf10472d6ea4684acef55b350cb6bb8c292 [1/1] BACKPORT: FROMLIST: tracing: Add register read/write tracing support
config: arm64-randconfig-r131-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181938.ctSYELwA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181938.ctSYELwA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181938.ctSYELwA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/trace_readwrite.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/rwmmio.h):
>> include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:38:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:63:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:85:1: sparse: sparse: cast removes address space '__iomem' of expression
   lib/trace_readwrite.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, include/trace/events/rwmmio.h):
>> include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:38:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:63:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:85:1: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +13 include/trace/events/rwmmio.h

c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  12  
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14 @13  TRACE_EVENT(rwmmio_write,
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  14  
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  15  	TP_PROTO(unsigned long caller, u64 val, u8 width, volatile void __iomem *addr),
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  16  
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  17  	TP_ARGS(caller, val, width, addr),
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  18  
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  19  	TP_STRUCT__entry(
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  20  		__field(u64, caller)
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  21  		__field(u64, val)
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  22  		__field(u64, addr)
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  23  		__field(u8, width)
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  24  	),
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  25  
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  26  	TP_fast_assign(
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  27  		__entry->caller = caller;
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  28  		__entry->val = val;
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  29  		__entry->addr = (unsigned long)(void *)addr;
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  30  		__entry->width = width;
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  31  	),
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  32  
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  33  	TP_printk("%pS width=%d val=%#llx addr=%#llx",
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  34  		(void *)(unsigned long)__entry->caller, __entry->width,
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  35  		__entry->val, __entry->addr)
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  36  );
c7b6c40553f8ae Vamsi Krishna Lanka 2022-01-14  37  

:::::: The code at line 13 was first introduced by commit
:::::: c7b6c40553f8ae90617595cc851e19520fbd945b FROMLIST: tracing: Add register read/write tracing support

:::::: TO: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
:::::: CC: Todd Kjos <tkjos@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
