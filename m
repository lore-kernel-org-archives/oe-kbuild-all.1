Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4331A9F90
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 04:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781151680; cv=none; b=BS18wCdcMC/L6hEkAhoCT8XCbMLqp68/HrXLzr4UYdJUn82WXqOx1HFZezAtM1ZZH8S29yodC0t6Waizz9BBBFgeSuFHUvXCEHGsT/1RbK9aCMMpQ/21LHSa9Q4fF2QKxVqUSaFbhcd4K6O3ryQUq/ILcmcTBSmOYIqXNySxRCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781151680; c=relaxed/simple;
	bh=/Hes0miAGYWPnEGI6eofaaJ2p4qPXZU9zsGQXxx1GPQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p5VA3tFT/nFGeNRsPkfz1EcILyKtd8y7ygYuUf2tHz5EK1HtC5DmBUgumyIwMZC7o/0rsfZS7aqeJrPXmmMAVxS+amWYJQ4FEpPCSUqKFAzrJzeTpVqwPjYKbJd/uDqv9dFO6H662EKUwgDDNFFZ2ogwgSsZO/wneKbF8rD7mdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4UFn8zR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4UFn8zR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781151678; x=1812687678;
  h=date:from:to:cc:subject:message-id;
  bh=/Hes0miAGYWPnEGI6eofaaJ2p4qPXZU9zsGQXxx1GPQ=;
  b=a4UFn8zRZP3Dxoe3Phos/J5aD0Ogiywcdcv1gHubWURCowKL2WkS5UBB
   KeP+NGZtJHcYd6s6XT9s2BLqAzmhry25/qnuYlgPHEBMMpf3x1nMoDEu+
   6+BJvCg3w7dcHAJiA5eurxmCGSQ26Jrd17aw1INYFpAcbrhQJ5LRdhT09
   FZSxxDRlETOOhUtIQoIZ8HSea0zopDA9Mae/JeXfsh+nitDQ6QbrrhYuE
   rBOpX6P9blb879XB1QjFvn4XGTP2/RQh9SFEEjlzeYwTY2psyBoUcNXTE
   TjNIegWqR9mpRzsiKogGlhy2vQFkpFR/JhMHWhQNHi1gKm7Q1QxaXQqbs
   w==;
X-CSE-ConnectionGUID: R/2F/LFWT+iThWkYVhaStQ==
X-CSE-MsgGUID: ZFXGZkO3TWmxAzgIZKkaSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93446388"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="93446388"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:21:17 -0700
X-CSE-ConnectionGUID: bGrt109xSeuZDDJBdpPdUg==
X-CSE-MsgGUID: PqA0iSf1Seiasq9oAcurRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="242219263"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jun 2026 21:21:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXWum-00000000MLS-2Ogx;
	Thu, 11 Jun 2026 04:21:12 +0000
Date: Thu, 11 Jun 2026 12:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [kbuild:kbuild-next-unstable 25/32] WARNING: modpost:
 vmlinux: section mismatch in reference:
 tcp4_net_ops.llvm.4527429266264891517+0x8 (section: .data) ->
 tcp4_proc_init_net (section: .init.text)
Message-ID: <202606111233.kM8oo8Df-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable
head:   7158c5b67e92e52c2ca9a3617a7e768a84031da1
commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 [25/32] kbuild: distributed build support for Clang ThinLTO
config: i386-randconfig-r122-20260611 (https://download.01.org/0day-ci/archive/20260611/202606111233.kM8oo8Df-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111233.kM8oo8Df-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: tcp4_net_ops.llvm.4527429266264891517+0x8 (section: .data) -> tcp4_proc_init_net (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: udp4_net_ops.llvm.17425824324074326067+0x8 (section: .data) -> udp4_proc_init_net (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: ping_v4_net_ops.llvm.5641696707737373282+0x8 (section: .data) -> ping_v4_proc_init_net (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: if6_proc_net_ops.llvm.7870945277386035298+0x8 (section: .data) -> if6_proc_net_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: ipv6_addr_label_ops.llvm.5745897517271459135+0x8 (section: .data) -> ip6addrlbl_net_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: ndisc_net_ops.llvm.8806210167060761094+0x8 (section: .data) -> ndisc_net_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: raw6_net_ops.llvm.3743523335772203324+0x8 (section: .data) -> raw6_init_net (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: igmp6_net_ops.llvm.7071106350580158050+0x8 (section: .data) -> igmp6_net_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: tcpv6_net_ops.llvm.17505177970592326146+0x8 (section: .data) -> tcpv6_net_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: ip6_flowlabel_net_ops.llvm.6051723423336054316+0x8 (section: .data) -> ip6_flowlabel_proc_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: ipv6_proc_ops.llvm.7829948594772821810+0x8 (section: .data) -> ipv6_proc_init_net (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
