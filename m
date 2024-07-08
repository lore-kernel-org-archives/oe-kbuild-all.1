Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077205674E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 22:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720476816; cv=none; b=W9+ugQVKOrssG/LvmTj/H45oR/62sstYDfsp3gHo5gaBzZth6Fxt/EfJ5lnYVVASOySybT2iesSD+m8oHNZAs5lPeIzMNE9tNq2KnO0HJsLcaWlv4aiwD3eYg6ZSs+xOAsbdnMmL0ot0tWpZ/njE0b0eyl1KOfUl+pkq5chhRUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720476816; c=relaxed/simple;
	bh=DC1LlKEm1w/fgZ5XPSPBySuVhFHJDQTj+rDfpvB5IkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RonA0n4oruVXQrN6vwIVn6I4iOK2Nai8fRnQYcpq45oArNLaO901hsxMGEixqLaqHMnNGVYjuj8gkutC/ZXxd/3dZfyGJ2D41CyoIYDo8GSbr/XPsURZhzAZSOvPJMPa1Dj9h85VpH/XrkEPVEdTEVvgOnSj3rpvcbNNKo/z1ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKxLyBY1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKxLyBY1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720476815; x=1752012815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DC1LlKEm1w/fgZ5XPSPBySuVhFHJDQTj+rDfpvB5IkM=;
  b=nKxLyBY1AlbkBj1YcMZT4pRvWf/7QCp7PkU/QaxgCwUEk23Ous06K4Jx
   B1fpc6bMPTZepczKr8UIbTjzj63N/dmm3Tj4LUdUgcNOtJgANmiv8YDs0
   NzlCYAW2ZnSoMW2lvyMBMIDb7gEfx8gXdrsihjAfYN/7WBK+wFbZizFwv
   nkQVeBuL+Q7VMMQrTmmqkGZ0jg4O2UhG9mlkR98Rg6nfqHXfaG/6YGrIW
   HraPFaIQvxP4x+LwVvZ31hv/MVpFAPOuVtH9Hf0oPHfWC/XxgAQ9bBVgz
   IoHTAa8qQb4kcS5fj8IJN4tHesCsTfwcNQuRJABUER/ro5JTUopRkr0NS
   w==;
X-CSE-ConnectionGUID: +2r29RcGQ6eybtAs0+2kwg==
X-CSE-MsgGUID: 9c9GVIFdQSm7Unv/q4LkQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17838405"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="17838405"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 15:13:34 -0700
X-CSE-ConnectionGUID: v5l4vE8VTBq8584fL3wZqg==
X-CSE-MsgGUID: 62LySIIERn+SGYdHH6Gf6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="47560606"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Jul 2024 15:13:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQwby-000W4w-0L;
	Mon, 08 Jul 2024 22:13:30 +0000
Date: Tue, 9 Jul 2024 06:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Kees Cook <keescook@chromium.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 alloc_tag_save+0x24 (section: .text.unlikely) -> initcall_level_names
 (section: .init.data)
Message-ID: <202407090645.ruIapj8y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   256abd8e550ce977b728be79a74e1729438b4948
commit: b951aaff503502a7fe066eeed2744ba8a6413c89 mm: enable page allocation tagging
date:   2 months ago
config: xtensa-randconfig-r132-20240707 (https://download.01.org/0day-ci/archive/20240709/202407090645.ruIapj8y-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240709/202407090645.ruIapj8y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407090645.ruIapj8y-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: alloc_tag_save+0x24 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: bitmap_copy_clear_tail+0x5c (section: .text.unlikely) -> __setup_str_initcall_blacklist (section: .init.rodata)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
