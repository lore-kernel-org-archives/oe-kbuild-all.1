Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C57D2C028B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766487282; cv=none; b=K87drJk2k/mNeMQShhHU8SPESCuGUdPyR+sZKQ/CsQ26gS4cGIbixCiwXXzbxrix8my3sQx12gs6mxtZmhRQp+fs5lPEeSBPW3BVyWbsJUcz9DJ/DW21OGnvr648eODmm8glweqNg9/JToGUnyUMMS7pm9Kvsjcpu1Ki1pRqDwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766487282; c=relaxed/simple;
	bh=nHvWC7PJ+Z17+k++Gp0/6qCwn14htyiabhaKtJyiMds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iEAJQMBKpx7ZU0j7JXjE71DSqhqeqhAdy3usOV/kFTTERfWvNOAgVvn5r2JW60Nk0GpZw3yA8Zt+clGNoURwFJBFTbZuCkbJPFAn7d8PRWhgG2YO1gfcZ6PcmUPr6aHDJhNm5nd2ZumVXWoqgk2poehosfFn6stozIcbX9ohVi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KExj0yLY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KExj0yLY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766487281; x=1798023281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nHvWC7PJ+Z17+k++Gp0/6qCwn14htyiabhaKtJyiMds=;
  b=KExj0yLYHcUHrGXrN0Ks30mdhf8cF++GikdK8+H8CpC7GvAjSoJswwgt
   dvn+AMWtjpbG5WNoBu/2ofdRvWybYmePonVEO0Niq3y+HnZ5BafbGp0gq
   Q1kE6EpcS3WH42BGO3/GTDm980Kmcj5KLbUVbu5MeyQ544JZavyEvVe9F
   VGCGPbuX9hAQUBpGTpzp+J2xF2P9CFbgnyIBJhWIteqozTuAM+TYbH+lq
   PxAwer1L/6vOpA2eqBqfWNvvTTnR9FDBsFkvqZ9iDNnukliIVr72J0hLd
   yp1oIT1cjU9EaSZ5zbs/L269cV6pAyp83sDIJOsQZwRRPZ4leWp4B9YSQ
   g==;
X-CSE-ConnectionGUID: 2DdwiK6wRnOz1t0oDBk8pA==
X-CSE-MsgGUID: 3eFVYvcNRima3TtLfOkP3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68380031"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68380031"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 02:54:41 -0800
X-CSE-ConnectionGUID: MZAVUf80TBqu1GCdIMSU+Q==
X-CSE-MsgGUID: vofuD1JKQKSFSN8ZMhv9ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199421263"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 23 Dec 2025 02:54:39 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY02H-000000005uW-1PRe;
	Tue, 23 Dec 2025 10:54:37 +0000
Date: Tue, 23 Dec 2025 11:54:30 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 458/458]
 arch/x86/entry/entry_64.o: warning: objtool: .entry.text+0x181: stack state
 mismatch: cfa1=7+56 cfa2=7+40
Message-ID: <202512231102.9ByiKklS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   8cc11e1aa30fd981a8d5bd390a4352c37dfe543e
commit: 03b19c7fa14bffca9ab1438760c457f4e359b4de [458/458] x86/speculation: Support intra-function call validation
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251223/202512231102.9ByiKklS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231102.9ByiKklS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231102.9ByiKklS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/entry/entry_64.o: warning: objtool: .entry.text+0x181: stack state mismatch: cfa1=7+56 cfa2=7+40

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
