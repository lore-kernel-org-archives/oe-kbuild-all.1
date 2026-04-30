Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0BB13A3ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 03:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519239; cv=none; b=hSJxAk9NUVJ1znwIX6uXmVz9Y5gSaCrKKEbqOYyJoX6YrvwjqmpfEOy8/KfraOfLx8IukJCONJacPoxD25KP64+ihwo+R/W6J0egZBYf5U+mebBMpn8oGER0njwGVqCutOadEDDNpRTO9OUWD1fOTe7nYVBOsRbvd/tYJHygwqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519239; c=relaxed/simple;
	bh=kzMviL+L+ILBZ8kA+WBM5m4c4JUfSh2PbkZ0MH2Z8CM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SdekrWz4SU0yAlZ9EGwn+7UuwlbENWudJer99qdN0Zu43mpMBEOSQPSrlSutUTpocPv2KvcXYei0ZkIfhNLs+JbfjV//rqJqDroukx9rhSeTqhzQeZb7BxwtRu2bYL6VseCzR4XhV413rofbEXzWTeu/Lnq0upx+S4dSs2FZWwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2vZgfB9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2vZgfB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777519238; x=1809055238;
  h=date:from:to:cc:subject:message-id;
  bh=kzMviL+L+ILBZ8kA+WBM5m4c4JUfSh2PbkZ0MH2Z8CM=;
  b=l2vZgfB93NKBhf2rVe9koq1LyLbtp2fgL3f3Yb6p1VdGV8MFEEjJF4Zb
   PhgA78gX6q0/p++4TRAHrEgW6ECLsRTNZWuIw2fxJBixJriOtuQnyz0lU
   9RrN/MNMZ/qnnWeH1oZE+dnLfylazy8ceCKHZLFj6LPAN8lK2zmXRSED3
   leEoNQK8jwdcjL7JeIoOEDGx7DwEodAIInSTLAgkt5K2Pyhtgz3m6C84E
   JFObnpn3YtLusR8Qs5t+34zda8wkQ8qvGpguLn43aRI6pPDMuNIq+gYz4
   CO/Kd2e1vULnnsNxxGoprIpvSKggLnFV3WPK+0+MquszN0ps71uBu7uNn
   g==;
X-CSE-ConnectionGUID: f5exWHXoRL+dPr12nK8nKQ==
X-CSE-MsgGUID: kX0otaHESwCbQl3MkDhhSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82316451"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="82316451"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 20:20:37 -0700
X-CSE-ConnectionGUID: 9cj1/UO1SeuhyBwUUKtxnQ==
X-CSE-MsgGUID: 7sCkt6UVQ+azpW50VKzmkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="257779406"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Apr 2026 20:20:35 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIHx2-00000000Bso-3C9O;
	Thu, 30 Apr 2026 03:20:32 +0000
Date: Thu, 30 Apr 2026 11:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:rust-bpf 7/14] /tmp/cce1Zv2Z.s:4891: Error: unknown
 mnemonic `movq' -- `movq %r12,x3'
Message-ID: <202604301138.QrItH3IU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git rust-bpf
head:   1623628cc9588b205a0e913c5e62d267ef0f6d70
commit: 57b8503e842e4c2843af80176ba6fd68b478c5d0 [7/14] bpf_arena_memcmp
config: arm64-randconfig-001-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301138.QrItH3IU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301138.QrItH3IU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301138.QrItH3IU-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/cce1Zv2Z.s: Assembler messages:
>> /tmp/cce1Zv2Z.s:4891: Error: unknown mnemonic `movq' -- `movq %r12,x3'
>> /tmp/cce1Zv2Z.s:4912: Error: unknown mnemonic `movq' -- `movq %r12,x0'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
