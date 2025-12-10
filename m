Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD70D274670
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 06:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765347622; cv=none; b=DJmwMJvHUyVbhp3oM2o3guON7fIcA64/jiOi/cHbwqmzvgejOgG0X+aPyXGU8tapsw0amKkgj6IuOXpMA7BjmQt6DLnKnpA9wRNfFxAsd6qkj7DpwTM2vgRhtmZdK7aQKpxpfD1RerT/arpM7R25IrdZj8VxKup0t194mHItI0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765347622; c=relaxed/simple;
	bh=2OPWdFxwfg3o7kTWWMbQ/a+AYEolYRe5v9CA0ZSYURE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KRou6/4A/7n0Z7MRIBwdk1Keo3lMVaWq4uKUBmvmZLhRMsxSTuQQ2inMbiBc1KHnWnz8IPo1OceBG4wWgyWgcsPOd8oWIF6jI4HLVpf8BAE3v67Bz6eJ0mNhKgfq0+RLSW7xq8Mw+LAvAaiYCLZS7GsHcxg26FmKE7A4J741t/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGVPdMvB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGVPdMvB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765347621; x=1796883621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2OPWdFxwfg3o7kTWWMbQ/a+AYEolYRe5v9CA0ZSYURE=;
  b=ZGVPdMvBTd4P46CC7LOxsJOax7mFhH6yL2m/YZBDe8efQQTM7Rcc+OG5
   v6tnh9QXwQ943qUwLk+iNuKhBnjll8mOTfKjaOGrTKPNlAn2Tcr8z+vmd
   myOx00S02iQFVm3vBmvDeAMXvu2faNVQkGnkYTRK3rZtOtqNg4lhPxRDT
   Rnu89s8j7vzAt/LOveOGP3z9rInVOAjClV/C/+cptvtr1GKsjXdkjLlpn
   ynhN2Rx835iOc1MvpSBYLsh52RsJeHT9HzMKE/9U2Ui2yHWaV9Rx1bQ0t
   MHSKmsClNkn5D4O3E4Gw4O9by/Y5NJhEE7+Rj12BPEmbI9BZUUwCWJfUn
   w==;
X-CSE-ConnectionGUID: NTt2UKC2Th+5QLG93Tewpw==
X-CSE-MsgGUID: ALT6dkbZT/+Z46bhrA+xGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="70932721"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="70932721"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 22:20:20 -0800
X-CSE-ConnectionGUID: SX8dtTjQQVqxpnC6odxn5Q==
X-CSE-MsgGUID: 9gEiotFfQyWnocU1eZd/JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="200853418"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 09 Dec 2025 22:20:19 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTDYe-000000000VQ-3bcz;
	Wed, 10 Dec 2025 06:20:16 +0000
Date: Wed, 10 Dec 2025 07:20:04 +0100
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20251201 10/21]
 kernel/bpf/core.c:2608:29: warning: comparison of distinct pointer types
 lacks a cast
Message-ID: <202512100734.AwVYxrr5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20251201
head:   2c162acfacfa32b76ad4176574a222a0e47f9df4
commit: a74d9213de5acaa81c034ea3836265a5f406e30b [10/21] treewide_some: fix multiple -Wfamnae warnings that must be audited separately
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251210/202512100734.AwVYxrr5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512100734.AwVYxrr5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100734.AwVYxrr5-lkp@intel.com/

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
