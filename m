Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E4D269D18
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 05:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781413841; cv=none; b=i3zGyLZ4dX3FrDKkb6BPN8WYAqb22awA9rt9Xm9TLPkmAr9RMVZlNxAOhLfZYj7DUOcs+fCOv4bx3qWjfcOpzkq1a+agqdKJqJAxqPv/E07hpo6nBPjT6QvrQXG4P9HRkxST0t6e/wycWocNVGBhJXlNxt4bAoz3f8iiySxu1tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781413841; c=relaxed/simple;
	bh=csjy/nTxmiPKCxkATMqHSC7vG2SfODrLOlXouooPFEs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QXCJPbUi/NejD4VSnQeJFuJ5+ZGrRIhVgcd6iTZdbTOTrwEyqvdrEOtf0Bdjmd41KnJYJkNUJc7owZXbPbzUbJfhs0HT9jbkJy/AifA0RzLJlNFlYzaaUg0znx27nQGKvv6FuzB9eJkDudmIe4se40ouMNNQM9FsT8XB3iHD/4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+CVadv8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+CVadv8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781413839; x=1812949839;
  h=date:from:to:cc:subject:message-id;
  bh=csjy/nTxmiPKCxkATMqHSC7vG2SfODrLOlXouooPFEs=;
  b=R+CVadv8fkhZiRXmqRaZLHmv9kJpkuOreF428m7gpQx0kjOboPWPavYN
   fT9K7/gU7XHNH0sazxGD3WocsPB/KanjwmSRzxHjkwyRPd+DikG6uRnCZ
   GOKcTiDM0fjIyyAd8wNe/xBWDhmQkCTKVGhQyMilEVp6NhaUdRune350u
   yBPRvbw7X4VolGJPUOwGDrmmmsBK5TzT6m4p5OxOz7ft07zIZYgIvcHiy
   4HW0BL0dfxpKXvZN7HHeD7igkb1MJaeP8emENuEG4zyqTT3l1TOByozDQ
   GfNonCUPTAFRt29bjtRgpTto2FnjyjgUe0WP//ONf5ciZSJ5QbnE4HXAt
   Q==;
X-CSE-ConnectionGUID: 9awadJisSrepS/u1ha6qIQ==
X-CSE-MsgGUID: ZduIETP4RKuecGD/cDqgHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82228905"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="82228905"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 22:10:39 -0700
X-CSE-ConnectionGUID: DsRyRvOcT2KXkv0i+YrJSQ==
X-CSE-MsgGUID: RQdjZv/mT66EQ98dptEWZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="277373466"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jun 2026 22:10:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYd7C-00000000QZm-0VqL;
	Sun, 14 Jun 2026 05:10:34 +0000
Date: Sun, 14 Jun 2026 13:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [linux-next:master 8264/13763] WARNING: modpost: vmlinux:
 section mismatch in reference: ip6_frags_ops.llvm.9919299605129717981+0x10
 (section: .data) -> ipv6_frags_init_net (section: .init.text)
Message-ID: <202606141313.fp43r13u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 [8264/13763] kbuild: distributed build support for Clang ThinLTO
config: arm64-randconfig-r062-20260614 (https://download.01.org/0day-ci/archive/20260614/202606141313.fp43r13u-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 305faf498a4e0b52b40742c927af63ab2082e1a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141313.fp43r13u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606141313.fp43r13u-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: nf_log_net_ops.llvm.4372678671302997706+0x10 (section: .data) -> nf_log_net_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tcp4_net_ops.llvm.12096626374981102982+0x10 (section: .data) -> tcp4_proc_init_net (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: udp4_net_ops.llvm.2202567987732496129+0x10 (section: .data) -> udp4_proc_init_net (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ping_v4_net_ops.llvm.17822209729633118653+0x10 (section: .data) -> ping_v4_proc_init_net (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: if6_proc_net_ops.llvm.11311092467695679803+0x10 (section: .data) -> if6_proc_net_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ipv6_addr_label_ops.llvm.16604229018105681252+0x10 (section: .data) -> ip6addrlbl_net_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ndisc_net_ops.llvm.13996997726691147219+0x10 (section: .data) -> ndisc_net_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: raw6_net_ops.llvm.8836212432996562194+0x10 (section: .data) -> raw6_init_net (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: igmp6_net_ops.llvm.2646928289368285187+0x10 (section: .data) -> igmp6_net_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: ip6_frags_ops.llvm.9919299605129717981+0x10 (section: .data) -> ipv6_frags_init_net (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tcpv6_net_ops.llvm.8184694756276117609+0x10 (section: .data) -> tcpv6_net_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ip6_flowlabel_net_ops.llvm.9000375159511838807+0x10 (section: .data) -> ip6_flowlabel_proc_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ipv6_proc_ops.llvm.10242892293412665630+0x10 (section: .data) -> ipv6_proc_init_net (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mctp_net_ops.llvm.8744144085861257396+0x10 (section: .data) -> mctp_routes_net_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mctp_net_ops.llvm.13996325958466738211+0x10 (section: .data) -> mctp_neigh_net_init (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
