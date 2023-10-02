Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE842612E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 12:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696248232; x=1727784232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BFaJc3hBLepjSKcqVcO/B1MxWjP1E2YAWN0wlGhM1Zo=;
  b=T9IPiuCRSn/9Fb+Beolw2x88iIXva4s8/E0NHHkVMNjbkL+CGHbKrLmU
   uzG5Rpg90i8iXABo78dD8zImDmzP0tQbMOHNkmf19XGvkXGY6+n6pnr+d
   RPK7a4McjBQ1uZClBFtf5JqNYLJ0d6A/IVOD0vE9WtP9OmdvFQO7wumzm
   UyqShhjy2oTdgqxdOM5hz8KLjQeeZ3KKTv9NAFIcMdcFj3jfpne+BlKB4
   +x0jsVrPZIAv/F+9E1+62iE6PR4OEfnksF7vgmlOgH5HqbbueBal3J9Vx
   /8Egpx9Hf6jq89S2SIiiGhlLuCcpd+8buAOG8gbWKYE83Q1HBEP8Zh1J+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="381511931"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="381511931"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 05:03:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="754033385"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="754033385"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 02 Oct 2023 05:03:50 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnHeO-000627-2G;
	Mon, 02 Oct 2023 12:03:48 +0000
Date: Mon, 2 Oct 2023 20:02:51 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 19/34] fs/9p/vfs_addr.c:88:35: error:
 'fscache_begin_cache_operation' undeclared here (not in a function)
Message-ID: <202310021937.ZqdxjoGz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   8b08a7e2d3217f7054808246fc559c867f54a524
commit: 2ac1f293cf524a1f35bea64bf84d56562e8ac131 [19/34] fscache: Add a function to begin an cache op from a netfslib request
config: powerpc64-randconfig-002-20231002 (https://download.01.org/0day-ci/archive/20231002/202310021937.ZqdxjoGz-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310021937.ZqdxjoGz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310021937.ZqdxjoGz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/9p/vfs_addr.c:88:35: error: 'fscache_begin_cache_operation' undeclared here (not in a function)
      88 |         .begin_cache_operation  = fscache_begin_cache_operation,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fscache_begin_cache_operation +88 fs/9p/vfs_addr.c

    84	
    85	const struct netfs_request_ops v9fs_req_ops = {
    86		.init_request		= v9fs_init_request,
    87		.free_request		= v9fs_free_request,
  > 88		.begin_cache_operation	= fscache_begin_cache_operation,
    89		.issue_read		= v9fs_issue_read,
    90	};
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
