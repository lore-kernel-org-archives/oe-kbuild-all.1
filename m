Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBCFC8C6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 23:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYb09HuC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699053133; x=1730589133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UCMXvY51c3MOY5Vq/5th0NwZxCspdooqqcW7XW3XybA=;
  b=fYb09HuCaq6bUfJ45G0fqtauO6qbnSlkViuBcLdPNgBuQvt7Ipl1esBz
   QddjX0+TB+QKntRrt1X0jdolITUT/Ku9758padYi0vtHM/UgWdsNpulwY
   eWhX1wJqCqeJMJt1R5HuI5FSNo+M6JWRrakna1zXM8F8Ty9+nBQdNbJbp
   bU25wIitFFEH4zcofftfGb7Md9KYow1BdvvxAFEaEQxMg4LOplnxbnMe0
   K7GgcVtTDBqEYXC0ZUA3v/oj1fVYErsu1FNTSzXpCCslTfIMLvKwaJwQ9
   EABL9CrYdeP5/Zz2go7CSIN2cRYw9WlzcrTooxxVNA1KNtOFn6B/0PiIM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="10575658"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="10575658"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765402772"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="765402772"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Nov 2023 16:12:12 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz3Kj-00032d-1A;
	Fri, 03 Nov 2023 23:12:09 +0000
Date: Sat, 4 Nov 2023 07:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-3c 35/36] lib/dynamic_debug.c:117:6: warning: no
 previous prototype for 'ddebug_clear_prefix_cache'
Message-ID: <202311040738.fEZGxZmz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-3c
head:   c1dcab1aabdf354c05dd26f99a68177f8f0a9566
commit: 4833d0c46baedf435940ea0eda61eba85ed3089b [35/36] dyndbg: cache the dynamically generated prefixes per callsite
config: i386-randconfig-006-20231101 (https://download.01.org/0day-ci/archive/20231104/202311040738.fEZGxZmz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040738.fEZGxZmz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040738.fEZGxZmz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:117:6: warning: no previous prototype for 'ddebug_clear_prefix_cache' [-Wmissing-prototypes]
     117 | void ddebug_clear_prefix_cache(const struct _ddebug *dp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


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
