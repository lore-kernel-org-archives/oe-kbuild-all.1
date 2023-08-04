Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7323A19883
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 16:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691165444; x=1722701444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pKqt3yTiVWmygzstYdGS8dTIvh0HSKRKtAuG16ERhyk=;
  b=eppTPeYCqkPF9mN4ajzBrNKe+UYhmNa5w7xwM0S+v7MZp2j8dWTzb9Ub
   hHdemmVPppdhzlEbxiwuKdhdKJ/rcv3XDKYAl0LmL19jK1kmQ9t0hUDSA
   exSECOFRZf6gT+NbMLGIvlsbMBhKlwEQi1JwKXOpx+VqvrQxABIWM2HIX
   S/S+PtIKjCAYoPXZeDv8WvZlAsB9hMRXwdMRonUJOHD28OuVM29xDToqJ
   8/+POy8r7cPEnYg0YEcKVU5JSoetAkgNc3zcbz7g2HKuNvkZbbb0Mz5Oj
   JLxhJe2Qe1uB/Q+jlpxZoaGJh4uUAH9EgOkBYFIx4KaBYq+Gh1uwsBJuS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="360245088"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="360245088"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 09:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="873448216"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Aug 2023 09:10:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRxNx-0002y2-0Y;
	Fri, 04 Aug 2023 16:10:41 +0000
Date: Sat, 5 Aug 2023 00:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Babrou <ivan@cloudflare.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [driver-core:driver-core-testing 2/16] fs/kernfs/mount.c:50:5:
 warning: no previous prototype for 'kernfs_statfs'
Message-ID: <202308050015.9sPPUyjf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-testing
head:   67774d43301f40dc02bab6399c7c02e987389106
commit: 26dd6e284e277f80468f48b4ff8ebfb0e9ca7369 [2/16] kernfs: attach uuid for every kernfs and report it in fsid
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230805/202308050015.9sPPUyjf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050015.9sPPUyjf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050015.9sPPUyjf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/kernfs/mount.c:50:5: warning: no previous prototype for 'kernfs_statfs' [-Wmissing-prototypes]
      50 | int kernfs_statfs(struct dentry *dentry, struct kstatfs *buf)
         |     ^~~~~~~~~~~~~


vim +/kernfs_statfs +50 fs/kernfs/mount.c

    49	
  > 50	int kernfs_statfs(struct dentry *dentry, struct kstatfs *buf)
    51	{
    52		simple_statfs(dentry, buf);
    53		buf->f_fsid = uuid_to_fsid(dentry->d_sb->s_uuid.b);
    54		return 0;
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
