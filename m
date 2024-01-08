Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F6879C2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jan 2024 06:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0pgyadE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704695390; x=1736231390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wkpQlkl/MUP/X+7b/RbgwCkLW0nnFy2P0aw66oL9Ids=;
  b=n0pgyadEhgXb/qlSkXyHhLKgxd0Te3E7Ks2EXBGuZn20vN9A3FTMyikj
   691YGWsE2i65gFZkAk3OdWaEI76D5RlkMdKpdT9JYaBstVMNMhxmeXNDG
   +rtmFbWnEO6xZEw2LPWJ2iGNnvDjoGdrAYtHaWiGZ24HWd4C0q1sD61sI
   uCYeSclm5kL+jdIqvEsbbDKkbJDBxYwZ979U+MRDzQEq1Yx6h7RJHIGrt
   Shg++5SsKYJAqLv782boYqWagmxSjtYtsrleND3aROuNlykphTpguQ2cu
   mYFRjtfn41XDdUety+vwd6sD4Rii/15Vamxc4ugxxhc1s/+BNUBbSdU69
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="483986959"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="483986959"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 22:29:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="781321971"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="781321971"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 07 Jan 2024 22:29:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMj8r-0004UY-2Y;
	Mon, 08 Jan 2024 06:29:45 +0000
Date: Mon, 8 Jan 2024 14:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] platform/x86: Lenovo sub directory
Message-ID: <202401081426.rEIcWOLW-lkp@intel.com>
References: <20240104003726.21277-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104003726.21277-1-mpearson-lenovo@squebb.ca>

Hi Mark,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7 next-20240105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Pearson/platform-x86-Lenovo-sub-directory/20240104-084032
base:   linus/master
patch link:    https://lore.kernel.org/r/20240104003726.21277-1-mpearson-lenovo%40squebb.ca
patch subject: [PATCH RFC] platform/x86: Lenovo sub directory
config: i386-buildonly-randconfig-002-20240106 (https://download.01.org/0day-ci/archive/20240108/202401081426.rEIcWOLW-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401081426.rEIcWOLW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401081426.rEIcWOLW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[7]: *** No rule to make target 'drivers/platform/x86/lenovo/ibm_rtl.o', needed by 'drivers/platform/x86/lenovo/built-in.a'.
   make[7]: Target 'drivers/platform/x86/lenovo/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
