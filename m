Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA33D4219E4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 18:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779819578; cv=none; b=Q0LuSTO/pxOWnsq5RnKnar0xPRXsUTvZIFognqyiBmqLxHGjDaMlz2c7y/Oe4DyB712F5drofFHAemfKA/d6ZZxcNX3cOfzv0ZUSflpZkr+3o6HTfRsbN7rUeVhNnh/MK9HNU2AoohNs2AI//7gBdRBRcO/7rhFdZ/lL8PbULAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779819578; c=relaxed/simple;
	bh=5oSCHfkjuWoA23PeiFQoVyYCkItVf146v5gLnJoPPNw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NiyBe/+DQ00yrEzzf/bw8lBZ4avuaAT50632PQuaySGO68jSrbCK6iJswHUkp9SIVn0GgCANw4fsVrFRulFGemcZsNFOq/VP4ih0DO9Q9pWa1kRGMqiFBopCNNX9FZTXKlf9uVsXfMH31AG8FMm/mNko22cuj+zJY1AkfLLLmiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cw4yYG8x; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cw4yYG8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779819576; x=1811355576;
  h=date:from:to:cc:subject:message-id;
  bh=5oSCHfkjuWoA23PeiFQoVyYCkItVf146v5gLnJoPPNw=;
  b=cw4yYG8xjhYhLwcRptdR8EzoSFcCcpUl7vlv1pk9P//hF15iu9vwzZFd
   TDpJ9R4greGx3vuhNcUeoJIB45LFdD0yHk30s/FQBXAWWSSk+Jm8B1lGF
   /ahqAY415Z8GTWobhNMtDct3V/IMErxaaOPJIVJPupK68Vv9NZjbZVNa1
   wXxlMB8O8GvzpUAmJPSEiGrgZWbCssyI5Wk8qVGr8x6waN5OJzr4lTW0U
   B66txXib6LWHQ+YXM3L4b4T3Cif0g/fmfpqcM5eUZ+7PeBDDycEOpIjwE
   Nq4w7gqB8LATgc39Gr4LfaOx2MbmhrMU63Tr9khSX+ti3CqTYrF/JVnD8
   w==;
X-CSE-ConnectionGUID: OJYSRGgxTvCFYTFTHlVamw==
X-CSE-MsgGUID: uqyPHEzQQ9y4+ZvXK4MWLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="84267466"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="84267466"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 11:19:36 -0700
X-CSE-ConnectionGUID: cGvbxDWbQ0WqSp0v55qJeg==
X-CSE-MsgGUID: AB/gmwQcR22HEguwGDYNew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="246256187"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 26 May 2026 11:19:35 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRwNJ-00000000CSz-07Wv;
	Tue, 26 May 2026 18:19:33 +0000
Date: Tue, 26 May 2026 20:19:03 +0200
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 16/23] <stdin>:1636:2: warning:
 #warning syscall rootns_kill not implemented
Message-ID: <202605262052.TfBfQI8D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   e5a6a778f0cd5584723651f07f5e46f765b4b2f5
commit: da83f86c3cc6d1e45d3612acc20e200409a7f196 [16/23] rootns: Implement rootns_kill()
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260526/202605262052.TfBfQI8D-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605262052.TfBfQI8D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605262052.TfBfQI8D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1630:2: warning: #warning syscall rootns_create not implemented [-Wcpp]
   <stdin>:1633:2: warning: #warning syscall rootns_wait not implemented [-Wcpp]
>> <stdin>:1636:2: warning: #warning syscall rootns_kill not implemented [-Wcpp]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
