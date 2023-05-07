Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7937C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 08:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683449732; x=1714985732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PfziRKSkfuDKzrxNGJlgXDoZpp4c4w/3dZKKzkccNV4=;
  b=Yz2EdqEhkzP2jtO7YZLnRxT3BQsSrokKTYAd7lCNL8hU+aOlpnoD6hgm
   lBHBSkBzyxXU/uIp3J+f0scqym4n4BAmLvo7llC4wVHNAzIX4kRJFJymZ
   16phBdwVG1s0Lyx7K+SJ/asO0q4e4L8qjdEcG469/VQykHdslA3oFrfFt
   2B4k4jJvo4Op9ygFaHUeAqgP3ljzQogUI5it5H0PNSDq7vfVtRhGXmVUu
   VjCrmjoh36HuMqJQI+4Rylvy93izi3w/ht85B2GokNNl7iOUPDhnXXcCc
   07CWdpw0nYZ1FUojUu+Uk4i25eTTE+f9s1Gl7I0k5os9Cb+NNWeC24IuL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="338683191"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="338683191"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 01:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="701073754"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="701073754"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 May 2023 01:55:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvaB0-0000he-0i;
	Sun, 07 May 2023 08:55:30 +0000
Date: Sun, 7 May 2023 16:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof-next:20230506-fs-freeze 1/6] fs/gfs2/sys.c:167:31: error:
 'sb' undeclared; did you mean 's8'?
Message-ID: <202305071612.dVnL10lt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git 20230506-fs-freeze
head:   f89cf429edea2c04c26d2bd2bf2f16268ba2b181
commit: 61958780e6d30f6e846f14a5cf2c29250310520a [1/6] fs: unify locking semantics for fs freeze / thaw
config: arc-buildonly-randconfig-r003-20230507 (https://download.01.org/0day-ci/archive/20230507/202305071612.dVnL10lt-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=61958780e6d30f6e846f14a5cf2c29250310520a
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next 20230506-fs-freeze
        git checkout 61958780e6d30f6e846f14a5cf2c29250310520a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash fs/gfs2/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305071612.dVnL10lt-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/gfs2/sys.c: In function 'freeze_store':
>> fs/gfs2/sys.c:167:31: error: 'sb' undeclared (first use in this function); did you mean 's8'?
     167 |         if (!get_active_super(sb->s_bdev))
         |                               ^~
         |                               s8
   fs/gfs2/sys.c:167:31: note: each undeclared identifier is reported only once for each function it appears in
--
   fs/gfs2/util.c: In function 'gfs2_withdraw':
>> fs/gfs2/util.c:348:39: error: 'sb' undeclared (first use in this function); did you mean 's8'?
     348 |                 if (!get_active_super(sb->s_bdev)) {
         |                                       ^~
         |                                       s8
   fs/gfs2/util.c:348:39: note: each undeclared identifier is reported only once for each function it appears in


vim +167 fs/gfs2/sys.c

   155	
   156	static ssize_t freeze_store(struct gfs2_sbd *sdp, const char *buf, size_t len)
   157	{
   158		int error, n;
   159	
   160		error = kstrtoint(buf, 0, &n);
   161		if (error)
   162			return error;
   163	
   164		if (!capable(CAP_SYS_ADMIN))
   165			return -EPERM;
   166	
 > 167		if (!get_active_super(sb->s_bdev))
   168			return -ENOTTY;
   169	
   170		switch (n) {
   171		case 0:
   172			error = thaw_super(sdp->sd_vfs);
   173			break;
   174		case 1:
   175			error = freeze_super(sdp->sd_vfs);
   176			break;
   177		default:
   178			deactivate_locked_super(sb);
   179			return -EINVAL;
   180		}
   181	
   182		deactivate_locked_super(sb);
   183	
   184		if (error) {
   185			fs_warn(sdp, "freeze %d error %d\n", n, error);
   186			return error;
   187		}
   188	
   189		return len;
   190	}
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
