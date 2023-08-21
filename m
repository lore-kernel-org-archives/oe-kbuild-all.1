Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE04747C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692625158; x=1724161158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mtkr0xt2MhFkJ5d7dNaZm7a1Qhp94xygjRsXXb0qPSE=;
  b=NNuBoamea0GRbufs7RAxsKDdFWrP5Y3ZtJnTq85Qap9wSqkoEYlyTSdZ
   gG0rtisb2iB7CTJx58GIZPRYnJO/FOd+OEthIiyMWRl+gszHpM1vNKX6R
   snGMcU0NGtg9NpwIf5UQ+zuy5rY0/Q43eVp/1P1pw3bkrl/M53+pl+ccN
   WVt8TquJOfVbQapt2VCPgCFLZoDTBTpyvDgri+2jMKSalaK+fkVO3ze5H
   7DPdzkbQT/JrtXFjLy8p3Nq+kK3R2YgI9du/qwprybC0x0eFtYE5/M6qu
   FgFOixzsLl174LoyneTznkdJRbVQxngO33knR2WNdP9UpKgQulQpmTm6U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437520458"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="437520458"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 06:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="685655295"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="685655295"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Aug 2023 06:39:07 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY57b-0000WW-1T;
	Mon, 21 Aug 2023 13:39:07 +0000
Date: Mon, 21 Aug 2023 21:39:02 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9545/11453] fs/fuse/dir.c:353:6: warning: no
 previous declaration for 'fuse_valid_size'
Message-ID: <202308212158.iJZNPBun-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
commit: 2850358b2ce3a01109f30fbb9389cc483448894d [9545/11453] fuse: implement statx
config: i386-randconfig-012-20230821 (https://download.01.org/0day-ci/archive/20230821/202308212158.iJZNPBun-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212158.iJZNPBun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308212158.iJZNPBun-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/dir.c:353:6: warning: no previous declaration for 'fuse_valid_size' [-Wmissing-declarations]
    bool fuse_valid_size(u64 size)
         ^~~~~~~~~~~~~~~


vim +/fuse_valid_size +353 fs/fuse/dir.c

   352	
 > 353	bool fuse_valid_size(u64 size)
   354	{
   355		return size <= LLONG_MAX;
   356	}
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
