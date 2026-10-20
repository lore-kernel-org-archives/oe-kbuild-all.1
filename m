Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486431;
	b=NZ3yZHtyawULlVTQE8yKho5oz+eT9pKExffNH6juuYL7PIs4tbVakdba+9/HHZ64D26x
	 BvuodKm6hhmCDVzu5EJ/dersqTSXaZWdyMQeTf3yMgRRzzMuqEP9cNroUBLk9sojBwrZ3
	 xjKFqZzMxqJZFVVO1KWodeeXvwCLONbq+zkjxwtj1YfcWQ7lzMqC4OKL0uPGr2SSojAvg
	 o2tvqmUSUIdGRRYtU5xU+d6dUNOebI9+iUap7gDTZoN2PEErBeEBgRvBwVjqw7ZhLFCa7
	 2Vtl/bh5M9IdN4CGjHhevl9WuZJ418ghwOmqMYWTD+jmuaU0TPD3SYcZqIk4dP3jWMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486431;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=MlcmOUP+/8bvLDJ0r4XZJqi2pPEaPYppfYiFJi0xSTw=;
	b=owKfIE1RYE/eXUlxPW7qUXIDnTbk5XnDwwDPxfgQfzeaCIXlzNE6fkPVaULYFNyP4VZ1
	 bHs2J6wQzo8I9IF2WhL2COfutoP+1BlN9GLPHocjbLDvvsRGktFdx+Smnf7qLIx/QIHh+
	 jkPYMDwTSG56UyPpEzuPk2b+0NXeOmBhgem9DpoJ5jISvQbo/+Q+DoQ/yibr4xr67isz5
	 mYpaJ/2A3/vFFeDfuowv3u+EsCHLCwaADEX+eJ3MyqJbd+GDpJH1qH8/5cL+nKdZwVFIu
	 Xe0O1RIUSepb/OTGlEW6BK8CaRuAf4XqUySjk8to64vRg/Ta/03xwhLqZAXVGExQ0zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=muFBVt9P;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92518606A319
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 08:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92518606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=muFBVt9P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792486431; x=1824022431;
  h=date:from:to:cc:subject:message-id;
  bh=ngrhKXHG0BGDO7Q9q9snRdCwu9t14wYBPeH5I7J7pSg=;
  b=muFBVt9P2JcHKbG/4cqGCYwTRrCmfcN6WDsPbBfuSgW4vH6Wxg/5oTG6
   6H9ezjPxepgvGfDweJdl8x24Cwyp3VexcwUkhl867HNTX09etgRheXuXc
   YW5uAutWEauEK+aNIF3j16K2b480XrPCzbuAgdA6qXcyZReJnE7HVdvZ7
   s2fWER053vSxiTQs9QXCmKixSbZEh33m/jAXUXZGdW87uvtT+8vSFOkRW
   Zl9TUtk4Rw7RFCCiq5ntKhNuPzVmcitjtIy75OHdMONR2c4P+H5JnG0k3
   TJXnLjDnsKdpcHT03MUElgPmvx8L17bWsAbaRYLay4Px5fTJw+sof8Kok
   w==;
X-CSE-ConnectionGUID: xGOD9DXkSbK8fXQHOgR5BQ==
X-CSE-MsgGUID: TtuH/+x4Rx+LkCkgC4CL0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1195624"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1195624"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:53:50 -0700
X-CSE-ConnectionGUID: 2NBa2D+4Qu6viE0n6dEYEA==
X-CSE-MsgGUID: +1BlbcbOQ5+GoXykvwVnaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2745842"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 20 Oct 2026 01:53:49 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ5bO-000000006CX-49i0;
	Tue, 20 Oct 2026 08:53:46 +0000
Date: Tue, 20 Oct 2026 10:53:15 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations 17/40] fdesc.c:undefined reference
 to `bpf_sk_release_proto'
Message-ID: <202610201015.93iBidH8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux cancellations
head:   d3a43c8a05ca2e56ecb592c265a238386f3f1ff3
commit: d5b5e8f94c6af8caf3e43d13671a6bf25dee3759 [17/40] bpf: Release frame descriptor resources from bpf_throw_unwind()
config: arm64-randconfig-2001-20261020 (https://download.01.org/0day-ci/archive/20261020/202610201015.93iBidH8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201015.93iBidH8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610201015.93iBidH8-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: kernel/bpf/fdesc.o: in function `bpf_fdesc_release':
>> fdesc.c:(.text+0xfd0): undefined reference to `bpf_sk_release_proto'
   aarch64-linux-ld: kernel/bpf/fdesc.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `bpf_sk_release_proto' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> fdesc.c:(.text+0xfd0): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: fdesc.c:(.text+0xfd4): undefined reference to `bpf_sk_release_proto'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
