Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80531656
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 01:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBxJ+X78"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702519044; x=1734055044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aOmjg8UIdHP/xK5wmHP9nzXCcLuKVw6sqTTYxd7Byb8=;
  b=PBxJ+X78gOXgTQR7qI8tOYxwx2ambxYKB9oa6Vy37y+4SS4vSyGC5dgk
   JIZtWLImAQpIZ5dkS+y6unap6UHjQv+EZJV06wpoEy6gr1uLYnkqWq1ct
   aHmjO01qI0r/5+RykfSX9wvIoFE97pr6bmNcivtBKoh9n3c0WhJZywQoz
   WdgnmE7jmimJI0NP5OgzctWUA8ByWY2EhOjqKdODeEWhlz9ENW3vUqEr1
   1E9J32V13RH2j3ja3O7X2P2UJZrTziyZ9B1IA6p6WAzHMgJrrvGKcMFHG
   fbmjr3oLDx3yRHHdqnjtYksZ6qOi10bOTawDyr/j19KDII+W9OX1QB//l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="13750797"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="13750797"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 17:57:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="840103023"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="840103023"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 13 Dec 2023 17:57:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDayV-000LPW-2E;
	Thu, 14 Dec 2023 01:57:19 +0000
Date: Thu, 14 Dec 2023 09:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/6] block: partitions: efi: Move GPT-specific code
 to a new library
Message-ID: <202312140905.RznM7llL-lkp@intel.com>
References: <20231211151244.289349-5-romain.gantois@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211151244.289349-5-romain.gantois@bootlin.com>

Hi Romain,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on mtd/mtd/next mtd/mtd/fixes linus/master v6.7-rc5]
[cannot apply to next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Romain-Gantois/block-partitions-efi-Move-efi-h-header-to-include-linux-gpt-h/20231211-231331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20231211151244.289349-5-romain.gantois%40bootlin.com
patch subject: [RFC PATCH 4/6] block: partitions: efi: Move GPT-specific code to a new library
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231214/202312140905.RznM7llL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312140905.RznM7llL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140905.RznM7llL-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: lib/gpt.o: in function `gpt_validate_header':
>> gpt.c:(.text+0x84): undefined reference to `crc32_le'
   ld: lib/gpt.o: in function `gpt_check_pte_array_crc':
   gpt.c:(.text+0x104): undefined reference to `crc32_le'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
