Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84567221F0E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 22:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752879136; cv=none; b=nB+Yi0BptSWSvw84Qb69Nowwgd7ODAMpbYkA+yv6auTHK5yiB6EaD8K4TvF73vcHk7PAt/R2Vob6614aBQdZj8oP7GHCVVUCDEj7i/iVLrlnolVzHjD6ZE9qjq7VkMt2FZcITYloCQzIjKG0wN9Qdxrsoruun8X53ixGO2ZvEzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752879136; c=relaxed/simple;
	bh=cQRl8PoDH+9El0Ka8JBGMD10t/MuHALkIAqxO7j5hdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpIRa0rCslgceO3RWRH1NdrQX2IvA6vYuWIPZ2OaXoAihzeZOABamwNqMv34fYmELo1h9CHPRrxzw20LZ2kk5Ltc2VvXFuDZtWIE233v+rctOVec8WOT2ShkyYAD1kQWlOWFSDWNqwJ8/6HJiY6Xyr/8e914mlS+KAU0iR1MKJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzlYaV4q; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzlYaV4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752879135; x=1784415135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cQRl8PoDH+9El0Ka8JBGMD10t/MuHALkIAqxO7j5hdc=;
  b=kzlYaV4qLEpSjcHoGuUDQzVZ+mne257hcXTuUqIdPZMU3WtDPmXlFiMR
   WTN0fTJLn3Ub1GjB7+WjanO43F5soSRVGZcu79NMSLscKgYrxraLj0gBx
   gFcUn6awiuqYTSP6YHNWqpDVAnp+Od4sjES1mqBZg9nFQQFExnvEkWNv5
   +hKBvTXvcmnhBpTwklLXmJs/ch35rTx8LvRbJJe6Ts57I6kFxeJftglE9
   klPtIIdP7BkhJhzm6LX9W9rBgKkyZ8+Ul3rUs/C0wEzxnjWGRAGLkDxlv
   mDP3JyDAFMeyLOYqi/xZQ70T3VHv+7m6MZx8eJV7Sn9kqZ5nqprWdJMcP
   g==;
X-CSE-ConnectionGUID: E33jRy/tR16DF0Zk7nSzOw==
X-CSE-MsgGUID: BZ+y8m+jT9+H/43bS6ZmVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54895103"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="54895103"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 15:52:07 -0700
X-CSE-ConnectionGUID: kDRssnuCRdSprWmZeOCt7w==
X-CSE-MsgGUID: WoYOFW+rQTmeCxBYBfmcJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="159023407"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jul 2025 15:52:05 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uctvu-000F6l-2U;
	Fri, 18 Jul 2025 22:52:02 +0000
Date: Sat, 19 Jul 2025 06:51:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 10/13] init.h: Disable sanitizer coverage for __init
 and __head
Message-ID: <202507190636.B7ZLh6PL-lkp@intel.com>
References: <20250717232519.2984886-10-kees@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717232519.2984886-10-kees@kernel.org>

Hi Kees,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/hardening]
[also build test WARNING on tip/x86/core arm64/for-next/core s390/features linus/master v6.16-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/stackleak-Rename-STACKLEAK-to-KSTACK_ERASE/20250718-072844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20250717232519.2984886-10-kees%40kernel.org
patch subject: [PATCH v3 10/13] init.h: Disable sanitizer coverage for __init and __head
config: arm64-randconfig-003-20250719 (https://download.01.org/0day-ci/archive/20250719/202507190636.B7ZLh6PL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190636.B7ZLh6PL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190636.B7ZLh6PL-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: do_trace_initcall_finish.isra.0+0x3c (section: .text.unlikely) -> trace_initcall_finish_cb.constprop.0 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: do_trace_initcall_start.isra.0+0x3c (section: .text.unlikely) -> trace_initcall_start_cb.constprop.0 (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
