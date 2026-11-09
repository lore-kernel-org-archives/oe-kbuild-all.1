Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200434;
	b=UHnw/3MRSvAtvuOCmzWEQlVgxwQG1uDZBqV7p39FkV1bbonG+cuIW/znnJfKG5kkPQ72
	 Mao8Cci2y4XJsg3xY8FumMX47Mlje2xvy6ufn9OJVtl23F/X+piv/kKcMbOn8u+ROrKmx
	 sWjBwdgu1blYZvDwcFX58ejUMdTfBd2P3c4OLd7LDNigjnuCv9ID7yd+3lYIjDlSSAPBd
	 gLS3OJUN48fuwFk3Am/rKtcpNpBRbY9IYBKqTF6Dj/uszXV1P7mdifkRQNnqUfqYvhoDn
	 ZbOlncJvAaO2l5T0O/owETOD6L0Dtu5km278RWgzJH8L8rZN9zL7ArP8VnT3lcHItaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200434;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LQqh/iJFfqUCReySK5NdKRTuSMm/ufNeZAeU0KSC9vQ=;
	b=SDOYqbSogLVZDlLpnJgj972lc0f1P1uvrjs+Q8klenWYOaldK+pSG56nvLs/RwAsRwCC
	 ZnEqxgaVj+Q9aymNtKWn7bmB/OvHbyM5bJ+KM5dzkeIQU5n5/nNyD3971nzSbgDJH2drD
	 LQtZJFp5jekLRbUfpfAJOPUsGmbAexSAUgT1WkDwbMnm9RSmIIJLIzWRpPrg5hOYjc9EZ
	 FGIVxZSWWr96Wibs/goOf+FeGd3KAHVRSLyYXPAoo0LStIDwOqdP2qVKTlmISEhNTDGea
	 R/TmB7f7/h2JhT473KxbvJZgt3WHQ1Lc+cB4NrbF2dcLhINBTt/iJVnp4L3h77tlAHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VwI8d2Cw;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5D1606A330
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 05:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C5D1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VwI8d2Cw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794200432; x=1825736432;
  h=date:from:to:cc:subject:message-id;
  bh=dVOs+oG6C3IHFO8PUeglq6o1vpUL0e4SZVuW4sl9aUI=;
  b=VwI8d2CwaFfJKoH3WJBBx0AX4/y9YunFW4oZ4pKq9G0ad/DjBOW4VdNl
   blGOkKqpSLIt37zXoIz1Fo2Ya96X3DdLnHA4aM0VQFKrREztEs8Q4NmrQ
   wPSPzJvvyQBVFzXMv0AdvJxQ79JwhuNSgw7nuSP3YNs5aLpB23oo4yRfT
   7LfsDvAiFrqOqYVXQNzWNvmLvx3XzpEb9T8j9SKTRlHMPr90nWF5f2JU3
   zd+xHyAeC4A6nZhMXPkV6QZVabjYvunYRjtHZLCtgbDZ8MnA+kfTsC+J9
   LSQjS+tZPfDTxv3f0IXy2qpjV9HRQQIZdWFyR9iG0e0FfpKggLiEqKZxa
   w==;
X-CSE-ConnectionGUID: 74Yec0XkQJeM9pYSiAYDPA==
X-CSE-MsgGUID: gM63l8QDTmOKI3WVFISDrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2914094"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2914094"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 21:00:31 -0800
X-CSE-ConnectionGUID: Gr8SFHQzSNOTlK9LG+tnrQ==
X-CSE-MsgGUID: qXh0ufcCTkqGkcD2nIb4uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7962419"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Nov 2026 21:00:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQHUa-00000000tv5-0JdX;
	Mon, 09 Nov 2026 05:00:28 +0000
Date: Mon, 09 Nov 2026 12:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bpf-next:master 17/89] hppa-linux-ld:
 fs/xfs/xfs_trace.o(.text+0x3ffcc): cannot reach
 000029f9_trace_event_buffer_commit+0, recompile with -ffunction-sections
Message-ID: <202611091257.i3tTvqIH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   bd75869299f1d4ff6e9f45117cce28f8badee1cd
commit: a784eb58f12b1a20afa3412d04faa290b79c82c3 [17/89] bpf: Enter and leave loops in the main pass, build flow.c
config: parisc-randconfig-1001-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091257.i3tTvqIH-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091257.i3tTvqIH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091257.i3tTvqIH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffcc): cannot reach 000029f9_trace_event_buffer_commit+0, recompile with -ffunction-sections
>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffcc): cannot handle R_PARISC_PCREL17F for trace_event_buffer_commit
   hppa-linux-ld: final link failed: bad value

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
