Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91C4299AA3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 21:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764796476; cv=none; b=tZmTU958HefLC8MHGW/+UKVOynjEjvBdVVv4lI7eUnHjyRn5Jbi/fqfq0MfvzVeSwF3lUW/pT+PTBYWW0ynVq8w00U+izjPuGT6cAn3HedFG7UO5GXgprwZvvz2nVXqccBMAyztaJ95fzKMvH9dKGm7twZorO10gfe7EhpBwpgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764796476; c=relaxed/simple;
	bh=7nANWvMhoQ0Tw0Mu0ThLJBUXqzIZPswu/ad1EgnaOhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DK/DnCjyekawgg/g5Pc8/cuW+c01CR0vR0wt/NdiAhhEHQkfejbg9UV39fDPiA/7aU3iPMJrTmN0PlU4r624+A3HD4OaFNdOpr5RcgSWN5bdiWAS3XNddfsFy7fYlbGiuLAo2HzS0Ta9PfQ9vSETdlvRdGGCj3tmHOONKYNu5JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mdk2QOJx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mdk2QOJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764796474; x=1796332474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7nANWvMhoQ0Tw0Mu0ThLJBUXqzIZPswu/ad1EgnaOhU=;
  b=Mdk2QOJx8VEDFTEa2840tCN5RvtArAurr/lvM7UAlMjBmjBzr5lhtmhI
   hi0NLopoNdgE8jk25GgVvO/24xUNghwo8jsTYsHjx3Hw1Aqa9mYGiij7n
   VOsABrLU6klzA2hnIxIG4IEBZ1PxN8098eN5xjeDvXNSJrdpovlFI6ulK
   MK4IMa6sxLFMc5Idx1+k+XERJsmovEz/xHDJ21Jmgpgb+KbPVNBuZ+Gsa
   T+N0Qyqgb1uomFdxw2iYaCcX7kqThIpnbscP8CohrS4jmBuANMb3jLYyd
   KKbNMseGfUsKreG3h2I8OyO0uNMwNXC93sEQPWEubEigsQD+WwNdmf31n
   A==;
X-CSE-ConnectionGUID: QuAya+U8RjekT+1b/Mn3zQ==
X-CSE-MsgGUID: nq9Ic04KQ4ykCtK5+OCQ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78157276"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="78157276"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 13:14:34 -0800
X-CSE-ConnectionGUID: kf/mLU2NQeagk4+QYn/NLQ==
X-CSE-MsgGUID: BTZzAfhmQPGIFPwkzjsNGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="194835705"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2025 13:14:33 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQuBC-00000000D9A-36SC;
	Wed, 03 Dec 2025 21:14:30 +0000
Date: Thu, 4 Dec 2025 05:13:39 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.18/bbr3 1/1] tcp_bbr.c:undefined reference to `__udivdi3'
Message-ID: <202512040510.pvBAgU1E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.18/bbr3
head:   739ff9ba5889a90bc38308e00e3babe4cfd65bf3
commit: 739ff9ba5889a90bc38308e00e3babe4cfd65bf3 [1/1] tcp/bbr3: add BBRv3 congestion control
config: riscv-randconfig-001-20251203 (https://download.01.org/0day-ci/archive/20251204/202512040510.pvBAgU1E-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040510.pvBAgU1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040510.pvBAgU1E-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: net/ipv4/tcp_bbr.o: in function `bbr_tso_segs_generic':
>> tcp_bbr.c:(.text+0x1cc): undefined reference to `__udivdi3'
   riscv32-linux-ld: net/ipv4/tcp_bbr.o: in function `bbr_tso_segs':
   tcp_bbr.c:(.text+0x118a): undefined reference to `__udivdi3'
   riscv32-linux-ld: net/ipv4/tcp_bbr.o: in function `bbr_inflight.constprop.0':
   tcp_bbr.c:(.text+0x12dc): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
