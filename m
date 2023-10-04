Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4371C15
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 05:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696397894; x=1727933894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EWqCyEBx0sNk/JijGb4eoG1J5T9zofFIYrv37ggXMmQ=;
  b=BJuNxBonxMzkObO32PI7ZIhlJUSIhZTQVMx18TvDXiXUkzftctbsToll
   gU+sm62lYbO6dWs5UuIlvykSmByQk9sko+YEfgeGkCRIfwXwQZ5DEi9Kv
   W8XL86bJP7T7OH1dnw8f2X7oJmvBzQfd1ygQVKtFDHd6N3UwR1ip6ZNY1
   po+WE1mtBW8/YUaSa41xDWMJy5me6VpEc+Qzdq6J+GlYfvPMdGZ0cMACf
   INq3vGiuyddQPKr1YKo1CFOYtZl9B1w9EAsBAaUN2lTngmFJmPAxVsSOo
   3cQCoPCd4KbM3AHhRdVr69QkIICmwMKO8nsWV/yFRviIJhbFoTqZgrY7M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="413983386"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="413983386"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 22:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1082334045"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="1082334045"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 03 Oct 2023 22:38:12 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnuaI-000Ccm-0w;
	Wed, 04 Oct 2023 05:38:10 +0000
Date: Wed, 4 Oct 2023 13:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-2e 37/37] lib/dynamic_debug.c:117:6: warning: no
 previous declaration for 'ddebug_clear_prefix_cache'
Message-ID: <202310041344.2EV38Ktw-lkp@intel.com>
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
config: x86_64-randconfig-002-20231004 (https://download.01.org/0day-ci/archive/20231004/202310041344.2EV38Ktw-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310041344.2EV38Ktw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310041344.2EV38Ktw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:117:6: warning: no previous declaration for 'ddebug_clear_prefix_cache' [-Wmissing-declarations]
    void ddebug_clear_prefix_cache(const struct _ddebug *dp)
         ^~~~~~~~~~~~~~~~~~~~~~~~~


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
