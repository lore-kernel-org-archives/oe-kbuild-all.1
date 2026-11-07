Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053962;
	b=lX/d4EEoC42ccLO/sInktz2kfVp89TifZ0fuwalYhX+u5m91YiASOk0ITS2sm0VVV1kV
	 qpoaSuRWMjhUvy+3scnAGCtz7vZz6izrnleEQXx4OWAL+HQ80hqGwhA6eBqdgwIs0FM0I
	 Q6j9irKXaZXIIRhkHCuWfTVvQLUn9LS/OtKchs+2ZLv1kOaZ4iTkZuXmOE47AvUEV0af/
	 Bf69WNvXIEfgw3/F3/hu8x+k4JLhkQG2IqMEL3akktFkC0HSkTUgQI4Bw+Kpr7lthdOWF
	 ysZUBOLm9E4NVoPwC7lx6Ub01In4yqap+dDRcUAi/TqIzgbdeD8FQc4UnLqqR44PnKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053962;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=MfYyuQ+y6S02sIqL9ZWdGNtdzj7XULrbajvrUySZqnY=;
	b=PY0uAZcb62Iznh+s9M97Mmz1Uc+Fn3BlFqeaj7ssRQ4LKY2qfoGVsDbXebSCj8D8bQsn
	 PGpof0DaRoowpMhxdtnSsWqtnv1wxt1bNqjDCwm29+yoORoo9zZ5qgxm8eNd9aB2dDARG
	 pIU5h0QLUgRGS+EfqjXAX4nYMmHgTHqhwTCJFWE/tycZswkBu91C9tZsujxQJmHfMVsC7
	 eIXZdPjggtA6fl/dJyb+McotAc5yKkh0tkba9RdbduzqgFIHZI6fUBTKIOmqAEY2LSVi9
	 zhm+l57hGzjltUpGq/VqWO5sKFc/kf7jPtbx5rJL4V45FEGoF4erkiWoeU+jdz+ueMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m5HGsYLK;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4286A606A32C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 12:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4286A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m5HGsYLK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794053961; x=1825589961;
  h=date:from:to:cc:subject:message-id;
  bh=WXHwqbq0Elh0Seaj9x8xl+akcxxtBRYLnMVQHDEQZVQ=;
  b=m5HGsYLKpflJggXbTsNGvAXc8amyuwwwDIEobJ3GHSz/ABSr/+K/HqkP
   bY8DsHHkL3HycKLABdXM2BMBAlcz3OcXzgYVTuA+Mh77pkCqPCS0RhWFz
   /fl6n3aTtsmbhxxNIEEbGeDsjKmtuTnmV2w31cVT9JIwB/n9a7VyN72my
   dzAX+CCunZYNo578oLwgPdrsqWMOXwKm6SBJBKAuY7cq/uEhdFXvpcqWT
   khUEl/m0X7bKi47cSHgGRUWt3iFpgQZ7vfhmwDscBr3ABhVk0xwc7A/mJ
   VpwzGJbv/X+668xMf13MTNj+VoHnN053xG55MUPxu97kp/nTNnUgawZ5e
   A==;
X-CSE-ConnectionGUID: 3OiKkYkPSY+CNx5VGZCgPg==
X-CSE-MsgGUID: BMbdrvI9T1yW6NPNzxQqwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2743383"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2743383"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 04:19:20 -0800
X-CSE-ConnectionGUID: TdaS3QzeRfyH+kMelL2koA==
X-CSE-MsgGUID: ZKn1/C5OTqau40/6gnHClw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9240774"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 07 Nov 2026 04:19:18 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPfO8-00000000AeZ-0h3N;
	Sat, 07 Nov 2026 12:19:16 +0000
Date: Sat, 07 Nov 2026 13:18:31 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 54/54]
 include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address
 space '__iomem' of expression
Message-ID: <202611071336.T6NiAqKe-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   a5a9930e03c61e245e77f94ef4d0fef4d57c5092
commit: 41300cf10472d6ea4684acef55b350cb6bb8c292 [54/54] BACKPORT: FROMLIST: tracing: Add register read/write tracing support
config: arm64-randconfig-r2309-20261107 (https://download.01.org/0day-ci/archive/20261107/202611071336.T6NiAqKe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.4.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071336.T6NiAqKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071336.T6NiAqKe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/trace_readwrite.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/rwmmio.h):
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
