Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A6B31987A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755246768; cv=none; b=QUZrti8VSX4NgBpMxSZizNlW/yNzqyhdC6U+rIYHJvuVVjejT9jTrjSsy786xQvPr+2k1FZqp7fJkaX5EgxQ0iCb0zmLBpfZXwnZXEjUnzG/cOPBcp+xxkxmDOfos5lYvvQ2F7qhZmEV7NsV9XvGYi/AV1p/VakqIlz5YvFSJUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755246768; c=relaxed/simple;
	bh=oXAeh46nQyF+O9QAmJuIQ6knhhC5mRRSyhEp9Q0015w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fapxWrfOj7eB1IW7jtGWDexm2F4UVy8OlsH0DX5t1TE/MjsBa+FDI/c2fjukfhDcc1R7knJjGhG6/vdeTm52uefrDJA+rFyWlae5MTXsmVhx6lExAmI6ZNeesz2ijA1ocMA3FH7OtjSdTOXWyLfFs/VmLDF9wMLH6ChXtHefsEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1dmTVJL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1dmTVJL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755246767; x=1786782767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oXAeh46nQyF+O9QAmJuIQ6knhhC5mRRSyhEp9Q0015w=;
  b=b1dmTVJLd4/J8cS1XP3bj+cKWgU613+JX9Iq6WxQy27i28B1PSjszH4R
   YMlmEo3Zw3nn2FJ5qYqu3+FvtDkhva3QfKgh45pN+pc3Zu+ppJTFI8V0R
   KdF7CMt3RcmeDhDSn1U+fStVH7zPDy/8b3/7IyvmJQTqh68z8EkigPfxn
   Wmr+AbAHHlYNoBGxC8z1om5s36AA6hFMfrzp4QUebcJ2xMZExFzWZGBW2
   8FeNR/Sq2OIoz/Shf8K90Fh4oCiAU1s3Dk0AB4jdOs2fuWFLjqGZMH0LS
   kvzzdgrDsCm52Kxbhl6c72GFErxqSPdkWuIArIkDBNRMs6SUyeT3+ho6x
   A==;
X-CSE-ConnectionGUID: 12qw8qAlQ92kw6TBVi1bRg==
X-CSE-MsgGUID: RbCyk2spSeGMdg8Y+BxTZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57720735"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57720735"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 01:32:47 -0700
X-CSE-ConnectionGUID: jBRK/hWvRsyLtEB8SugCeg==
X-CSE-MsgGUID: 7nUe3rx/RJ2A3FcBn7+PmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171215483"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Aug 2025 01:32:45 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umprf-000BkC-0c;
	Fri, 15 Aug 2025 08:32:43 +0000
Date: Fri, 15 Aug 2025 16:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bharata B Rao <bharata@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 3/7] mm: Hot page tracking and promotion
Message-ID: <202508151653.4BlyXjCU-lkp@intel.com>
References: <20250814134826.154003-4-bharata@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814134826.154003-4-bharata@amd.com>

Hi Bharata,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.17-rc1]
[cannot apply to akpm-mm/mm-everything tip/x86/core tip/x86/mm next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharata-B-Rao/mm-migrate-Allow-misplaced-migration-without-VMA-too/20250814-215419
base:   linus/master
patch link:    https://lore.kernel.org/r/20250814134826.154003-4-bharata%40amd.com
patch subject: [RFC PATCH v1 3/7] mm: Hot page tracking and promotion
config: arm64-randconfig-004-20250815 (https://download.01.org/0day-ci/archive/20250815/202508151653.4BlyXjCU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151653.4BlyXjCU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151653.4BlyXjCU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'mm/kpromoted.o', needed by 'mm/built-in.a'.
   make[4]: Target 'mm/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
