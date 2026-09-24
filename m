Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13EB4A0926
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 15:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265213; cv=none; b=DUmf7quCUugHXH9FZsdSFRLInwpLUuBM3sk/Oi5ESpRYzgzB18Pf+NWI0Y2OX9jMXYok2fzGkM6RAisykPJnYb3bHJyNB5CnJMs+OyCRA8h3mfJeIrKYiYINfEg/OArEK/mFs8thw02VDoKhukbURE9iaFrscnR/0xNwk7ft+us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265213; c=relaxed/simple;
	bh=eStv+h3uTDusNCAxiG7qkd1dbD1nhlZRX/ogsiYNcDY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=db0tZ9N3wVVB66vLtqDJCchz6lPMcWa6PLoMuaIfUf69uEdNfMTlyMDCgfB1jL5Ys/4PEANh4lVzE4AO3B2aK496pj6jxoE+Ff5Y00fkTA+fwIgdstncvLKrrFze+HZ48SdljHir4IrUtMhv+52UCjKUyENXOnb13vHvDghDOHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNeF4YIb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNeF4YIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790265211; x=1821801211;
  h=date:from:to:cc:subject:message-id;
  bh=eStv+h3uTDusNCAxiG7qkd1dbD1nhlZRX/ogsiYNcDY=;
  b=RNeF4YIbcrm9Q0yP6IH2XmlfUoMUq+MTbG6inVmouHziYvDK01cQxJJQ
   SbYMdvrTbNVnFTzflbkIyMdy0k8yGwMR+WEZLp3QPsG7SMAFbjqWDJ0oz
   xl+53JYcyrdVZ8Z8EJ/KQHF9GpXc8cWP7aXHQFQQZFs+9bXuo+H3Qjzqs
   yoo0PzusH78zU93W1QvpBNZDRiassq675nUH6Rr7T2nfTGBP6QAUjxr4O
   yy8UarECgiuEFB+zuU34rmlKUmuct25kwGzfSfvd1A4znmWSY2B0E1TwY
   607BHDEqgOMStj/ab727pp4KMWWTz1anZQTz9Ktb7Ok0LKvBP5jcaZo2H
   g==;
X-CSE-ConnectionGUID: 6OEu1J6/Qd++HTAvAldHBw==
X-CSE-MsgGUID: mhBOSJ82RSiKWe3zuhnXzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="102401471"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="102401471"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 08:53:30 -0700
X-CSE-ConnectionGUID: 9sh/RzsvQaa13fgFXU2l6Q==
X-CSE-MsgGUID: ekQbJoBCTPWTqlnuxLteWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="273634334"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 24 Sep 2026 08:53:29 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9llG-000000000MM-35Cp;
	Thu, 24 Sep 2026 15:53:26 +0000
Date: Thu, 24 Sep 2026 17:52:28 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas Huth <thuth@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Eric Biggers <ebiggers@kernel.org>,
 Namjae Jeon <linkinjeon@kernel.org>
Subject: [linux-next:master 9052/9480] ld.lld: error: undefined
 symbol: __memset
Message-ID: <202609241716.bAuueGPP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d7783543c2646af69ad65825e810060494bea21
commit: 09eb210b7deb53eb863cadae6f9947e8312a6bbb [9052/9480] lib/crypto: sha2: Provide functions for zeroizing SHA2 hmac_sha* structures
config: x86_64-randconfig-2101-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241716.bAuueGPP-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241716.bAuueGPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241716.bAuueGPP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __memset
   >>> referenced by string.c
   >>>               arch/x86/purgatory/purgatory.ro:(__UNIQUE_ID_addressable___memset_10)
--
>> ld.lld: error: undefined symbol: __memmove
   >>> referenced by string.c
   >>>               arch/x86/purgatory/purgatory.ro:(__UNIQUE_ID_addressable___memmove_11)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
