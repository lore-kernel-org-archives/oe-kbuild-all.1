Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FC3800
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 01:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695259153; x=1726795153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UX8dHJKy0P7nUs3MVyqaK2U4OV4HlWmCZdC3XxW4fNM=;
  b=BW+DaJzo1hiA1URyjvSB2J3MqBAV/unHRAwnlKd7Fx3UnBE5Q1RRFzHr
   s9v75+QlweKXSw+hopNLTPadsvgEn68EXdKjOiK6BWrP0nDTd52e3iDZM
   45nk3c64m7jRRTXc2wNVTi+5slH28qqwRLYLpR4ATLgwDHcLvIDKBHUqE
   KGyD6hNW2FwB23LJXo0ioI3Za968GIUVjLrmskgU+4MrJ3EMy06hWlLiX
   yiWlysDLjreNr8jrzCXPLd3HQBDfWdxSKv085tL5hv/4Mive4o7kkRYGZ
   c5BAbfK27CWYus21FbNmZ0KUT+w+oOmCBqwhzIBuWyTUNz4+dWLWOwS9v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="383129905"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="383129905"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 18:18:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="750171847"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="750171847"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 20 Sep 2023 18:18:47 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj8L7-0009Mm-0Q;
	Thu, 21 Sep 2023 01:18:45 +0000
Date: Thu, 21 Sep 2023 09:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: {standard input}:14: Error: symbol `__export_symbol_alpha_mv' is
 already defined
Message-ID: <202309210930.XnJajyc6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42dc814987c1feb6410904e58cfd4c36c4146150
commit: 481461f5109919babbb393d6f68002936b8e2493 linux/export.h: make <linux/export.h> independent of CONFIG_MODULES
date:   8 weeks ago
config: alpha-randconfig-r024-20230129 (https://download.01.org/0day-ci/archive/20230921/202309210930.XnJajyc6-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210930.XnJajyc6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210930.XnJajyc6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/alpha/kernel/sys_sio.c:312:1: warning: no previous prototype for 'sio_kill_arch' [-Wmissing-prototypes]
     312 | sio_kill_arch(int mode)
         | ^~~~~~~~~~~~~
   {standard input}: Assembler messages:
>> {standard input}:14: Error: symbol `__export_symbol_alpha_mv' is already defined

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
