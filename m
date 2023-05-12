Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461C22261B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 23:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683935701; x=1715471701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tfkT9pbinl9VOg2Cx8ECNQ+j8QQpfvquxKRRqjJODqM=;
  b=AzxtlLT76xMjWShILZ1yEh3HvNTcuG0C44uwKafawccSyTL8NdNv6T8q
   VoHuZ+0Dv6jmTZ5LuzmGR39ZfeZwydC9CVFvqHeKQi2jkB1f7rUvGg5Fl
   2uHAnOHH7Z9Vri4MnS7KgZWLFElKlNhsnm4SgIttWrwrXKh3vOwmODX80
   CZjbJn4ZT4THv11oeqiPjJ1EsdZtdUqJaLC6DH6qMijWNI98QTWLDvMfw
   v6G8cRBC9pZ9q0ReaCYvtohclxlE/L2MWBQQi3PYLNpfiDOslj5/GhPu0
   khv3AgJzOtIYO8EkuHoWgbz0UTEE/1X3oxnwiiULXTRNhmVfLNpBkjiR6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="353164004"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="353164004"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 16:55:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="733222311"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="733222311"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 May 2023 16:54:59 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxcbD-0005BQ-01;
	Fri, 12 May 2023 23:54:59 +0000
Date: Sat, 13 May 2023 07:54:55 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/6] fs: unify locking semantics for fs freeze / thaw
Message-ID: <202305130705.w81PkYdS-lkp@intel.com>
References: <20230508011717.4034511-2-mcgrof@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508011717.4034511-2-mcgrof@kernel.org>

Hi Luis,

kernel test robot noticed the following build errors:

[auto build test ERROR on gfs2/for-next]
[also build test ERROR on axboe-block/for-next jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev linus/master v6.4-rc1 next-20230512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Chamberlain/fs-unify-locking-semantics-for-fs-freeze-thaw/20230508-092008
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
patch link:    https://lore.kernel.org/r/20230508011717.4034511-2-mcgrof%40kernel.org
patch subject: [PATCH 1/6] fs: unify locking semantics for fs freeze / thaw
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230513/202305130705.w81PkYdS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/f277836573b983c2aa96f25337a36a13e56382f5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Luis-Chamberlain/fs-unify-locking-semantics-for-fs-freeze-thaw/20230508-092008
        git checkout f277836573b983c2aa96f25337a36a13e56382f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130705.w81PkYdS-lkp@intel.com/

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
