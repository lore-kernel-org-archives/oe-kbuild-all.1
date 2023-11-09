Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821C421113
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 20:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUwemMBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699562428; x=1731098428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8FORsnEIgjvMd3Hr2QU14zt6L619F8fOyRQ+lIAhVqQ=;
  b=GUwemMBtOTZNlgKIbTa7WG4HOsjq7KwcWmEZ2HnUH3KYPvWtk0oguiRt
   8+4mozkY7jbJQF/+UC8go6WByiRyPDxllTW0rxnXT/5HExGUkWt14A+9P
   glBVLqGQHu8sF7Y669XGCmw5R8MA1VDWdIEktKfiGbS9DgDRn45mQE/zi
   RjY5a0nluA5eZjvbIC7PPFd/O82qUCfyTc+/hNGM2Q/pVI9iX+8q0itEi
   /gQ98Ho+Cxs2e7H3xpE+FHOaYiertHYJCADLV0A8O5JRyBkpU1Zx5c4lU
   xKYenCj9QzLI+KjktAb4g9Gs/YGmgu1D2zxeJH4Q1yKT3K/6JV7g659gc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="370278627"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="370278627"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 12:40:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="792666438"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="792666438"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Nov 2023 12:40:26 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Bp9-00098K-2z;
	Thu, 09 Nov 2023 20:40:23 +0000
Date: Fri, 10 Nov 2023 04:39:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-2e 37/37] lib/dynamic_debug.c:117:6: sparse: sparse:
 symbol 'ddebug_clear_prefix_cache' was not declared. Should it be static?
Message-ID: <202311100442.KlLvcEEL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-2e
head:   e29a79ca0888609c7442791bd8108f8323eded5f
commit: e29a79ca0888609c7442791bd8108f8323eded5f [37/37] dyndbg: cache the dynamic prefixes per callsite
config: i386-randconfig-061-20231004 (https://download.01.org/0day-ci/archive/20231110/202311100442.KlLvcEEL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100442.KlLvcEEL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100442.KlLvcEEL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/dynamic_debug.c:117:6: sparse: sparse: symbol 'ddebug_clear_prefix_cache' was not declared. Should it be static?

vim +/ddebug_clear_prefix_cache +117 lib/dynamic_debug.c

   116	
 > 117	void ddebug_clear_prefix_cache(const struct _ddebug *dp)
   118	{
   119		mtree_erase(&pr_prefixes, (unsigned long)dp);
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
