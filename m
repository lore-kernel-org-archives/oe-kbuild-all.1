Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223FF2D1905
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 04:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765426475; cv=none; b=M9Ymh93Z0ukBTgPK7wUrixANFVUI/KeEY8zmG5Q2t/o+Zpc4fDEeoeUosnMOcOKKhM6BRbp3xfaH/+gcGWem0lBeDzibgvf/OkHIG+tRfg7EIQO8s87ZMtkKRGaJSHfOJ2zARObiAoUsPf4oX0cxQ+cexSWGepsAbPZo4tHq0uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765426475; c=relaxed/simple;
	bh=k3MAIFZDfk0pOv142x0PWxRFETg6esAOPqHduWf6z4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iy3aG5HZPCGLqlPYYqn/N/uqQ7UKrNJPXZ37JEJl93KR/jv2r5i6xAu8V2Yb1X9ZbkTy77m96KbirC9fp+9UNC9D8k+aewDuvvWT+ei6VUlX8CPaVaVpPUDgSEFbBUsdtBimaWI0oGOGBb62FQFbUYsCO+oDOa8oJGHPQ6W9T9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M86uSj3i; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M86uSj3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765426475; x=1796962475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k3MAIFZDfk0pOv142x0PWxRFETg6esAOPqHduWf6z4w=;
  b=M86uSj3i8p7OnNSlj1b89Uc5hvNZC/6YI81TlGfV1tGlOYFM61kBfDzo
   uBn0ghsme4P4jCq0VquzEChkJC35JB96SqzlAcN98+sXxrE5H7OtjKMgm
   klE18SnygNxnnIPLGAYA6PhcyDGUkbDyBoZ3J3UAMZ71ARvfBjVnZvWkr
   3n0n/AsyAZm8H/mzijg9noTuSbMofN0twS8ox8PMVLJFC/6W3Tq6C6z8d
   md6gBaV+GypkvhmIeX49/3lQ3k7F6+QYJm8ZoAkfKmdUcA7sDAcVpg3Hd
   DmLBipmi8ae2rhAle6SjWPXMuzuMsM1WSbFOSnYLoHklSoLTqHq+Ti0Ek
   A==;
X-CSE-ConnectionGUID: qSnQueZoQWCXm+O6C+CEpA==
X-CSE-MsgGUID: sAmVVXIMToyVsDKX29VmgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="90052402"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="90052402"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 20:14:34 -0800
X-CSE-ConnectionGUID: zPGOPR/jRQK3eygvAdvTWQ==
X-CSE-MsgGUID: 61rRtoRdRCeCid9QlQNQPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="234111974"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Dec 2025 20:14:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTY4T-0000000048X-44xN;
	Thu, 11 Dec 2025 04:14:29 +0000
Date: Thu, 11 Dec 2025 12:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20251210 10/20]
 kernel/bpf/core.c:2608:29: warning: comparison of distinct pointer types
 lacks a cast
Message-ID: <202512111202.bHVmpyyk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20251210
head:   ea71f4781aeb04a51e64f521bd95b80be09c14ae
commit: 69cad6a5b5543737a73e8a9dcd366cbf2fbef9ff [10/20] treewide_some: fix multiple -Wfamnae warnings that must be audited separately
config: i386-buildonly-randconfig-002-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111202.bHVmpyyk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111202.bHVmpyyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111202.bHVmpyyk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/core.c: In function 'bpf_prog_array_free_sleepable':
>> kernel/bpf/core.c:2608:29: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
    2608 |         if (!progs || progs == &bpf_empty_prog_array.hdr)
         |                             ^~


vim +2608 kernel/bpf/core.c

8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2605  
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2606  void bpf_prog_array_free_sleepable(struct bpf_prog_array *progs)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2607  {
8c7dcb84e3b744 Delyan Kratunov 2022-06-14 @2608  	if (!progs || progs == &bpf_empty_prog_array.hdr)
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2609  		return;
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2610  	call_rcu_tasks_trace(&progs->rcu, __bpf_prog_array_free_sleepable_cb);
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2611  }
8c7dcb84e3b744 Delyan Kratunov 2022-06-14  2612  

:::::: The code at line 2608 was first introduced by commit
:::::: 8c7dcb84e3b744b2b70baa7a44a9b1881c33a9c9 bpf: implement sleepable uprobes by chaining gps

:::::: TO: Delyan Kratunov <delyank@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
