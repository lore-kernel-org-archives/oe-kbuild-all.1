Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFC3281357
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545393; cv=none; b=jkYlgmsac7D/R9YP7OPFfGaku4ZXrNEFY/gw3Rb4GiW2Jei+u5vjRSla1nJy3kujKJBOUa1VOQU3cEf2xpQvUOFDR2/qribLCrRErpz4VbghIc+Hw66SneAFq84AtEOs6zAlIfg5xw8dbB+SJl6p9zWCaMhrXVtoozt9ry39A44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545393; c=relaxed/simple;
	bh=7LfT8GNcNcWGCusTpMvd4v+fIchh3wvdmfaj/Wu0fyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UbSFxuUi1NDUXnnbKWyuit2/lKbPMwSIIivZRKm+gOD4qso365enmk5L2bxiKkuntTwM9ytC6Ry9z3rv0kTTt7+fOAQTxAVEQVdCpXDQWqtgM9rSJzcONdgSsxY7qd0xMCOFktgkmBg7AFdmOHrVm9MoR4KMEk6GvGGU0rdP5Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9Q1z8Cc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9Q1z8Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749545391; x=1781081391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7LfT8GNcNcWGCusTpMvd4v+fIchh3wvdmfaj/Wu0fyo=;
  b=V9Q1z8CcwuCVkhcZfxeyukaihfLxRBLek8IzLu284mTpKHMasqKnBfr8
   LD/5ukgrg2+DSX8KG6KhzLlANjI3Qjwc5ZFX0IP26tRqzrSHB539KuKOr
   6YvnVyHjDNiEDDPeVG4oqxpIe3n5lbqhbNDjildBuj+xrAK9bq0JWnQS9
   NoRldKwSmnY7rFr6czxrTCKYYbvYXPQ1bWZ+YXPURxhToyxN6BMVLkoIR
   oJxzvN33FIi2nB0n4McltrhRH66ubrKD0R1DsDYJ45A94C2D7h+V91X+e
   9m7BhrLi/haYjIMPZ6l2haD0QCjE+33WogpxcblHXlBoH8zYdDP8Pf4JK
   w==;
X-CSE-ConnectionGUID: MgZ6pAAvR42Llj4ksBHrFQ==
X-CSE-MsgGUID: E5pfgUm3RjyXKAmLHbTp8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="77045676"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="77045676"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 01:49:49 -0700
X-CSE-ConnectionGUID: Vw4DYjUjRN6OdeMc98DHfQ==
X-CSE-MsgGUID: 7G1Nj+92Sm20fko3BASL/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147709703"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jun 2025 01:49:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOufx-0007zz-1p;
	Tue, 10 Jun 2025 08:49:45 +0000
Date: Tue, 10 Jun 2025 16:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 mem_alloc_profiling_enabled+0x18 (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <202506101608.NmYI7eVO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
date:   5 months ago
config: xtensa-randconfig-r051-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101608.NmYI7eVO-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101608.NmYI7eVO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101608.NmYI7eVO-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: mem_alloc_profiling_enabled+0x18 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/xtensa/platforms/iss/simdisk.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
