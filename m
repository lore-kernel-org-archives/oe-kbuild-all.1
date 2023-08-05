Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B283622
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 00:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691195700; x=1722731700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cH6TbG2MF/VkhYmDddH1ePvOWOavECQtZ88abGjNbaA=;
  b=HtCZR6p40N3ARKzNaJNfKDLmIzjNUvGEYpVpgr3sm1aepudYZ1P5Jvny
   Afw5/vvF9WxubglLYV+yrPrA5x7cZf637kjldccx7bIMBEk7Ng/D4cSi0
   b4FbOTphlwJiMkDZ0HOZUbnHcwwl6rM0E/EU+3VU1/hI8ZE0HeLHGbYdU
   q/uuFUmMjYZhhBRLx9ig0jFv0xp+gh6qWJQota6eNNc2WYqw6AAAPr59o
   SyWTnC9UTsJKF/bhrQTYStBAvW4Xf7b0kkOcOacXZ2OJdHMEO2KUgLrEH
   lB+aApdK49IYM80cOhfG4AcGc/ZjrIG0M+a9CMnyWHge9SLqkCs++AxnC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="369171153"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="369171153"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 17:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="873594262"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Aug 2023 17:35:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS5Fx-0003DX-0l;
	Sat, 05 Aug 2023 00:34:57 +0000
Date: Sat, 5 Aug 2023 08:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Babrou <ivan@cloudflare.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [driver-core:driver-core-testing 2/16] fs/kernfs/mount.c:50:5:
 sparse: sparse: symbol 'kernfs_statfs' was not declared. Should it be
 static?
Message-ID: <202308050845.FUZE4KvF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-testing
head:   b84388be432d001b3baa782fa047eddb0f375233
commit: 26dd6e284e277f80468f48b4ff8ebfb0e9ca7369 [2/16] kernfs: attach uuid for every kernfs and report it in fsid
config: s390-randconfig-r072-20230730 (https://download.01.org/0day-ci/archive/20230805/202308050845.FUZE4KvF-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050845.FUZE4KvF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050845.FUZE4KvF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/kernfs/mount.c:50:5: sparse: sparse: symbol 'kernfs_statfs' was not declared. Should it be static?

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
