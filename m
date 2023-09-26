Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEE74A546
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 21:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695764140; x=1727300140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sNIQQoPXFz9/unln0aPLazbwLhSPq0FlECnfTY+VeeY=;
  b=jBLsCtkHyA03hh6xYX6zui+K2SSXwQOJygA1v6zmmURxsBozJi/mJF0f
   heUDC4PMz4jE+aB4ysDBjVLpcM6gnV83SwBaLsd4bNdgTQQqGQmsZUSgc
   Ui6iroUA+aXvvcLugm/LTRz707ErVVgWaacJx0d5GaWdwanyRxBdk3IoT
   /oq8LE6CD7qPZqmXrigTe3kw0Rq6Dgh6K+9eeMkRSTEUDNJ7bVKfusu4R
   FH6MfAYJDdqcCzeyiyqE1Z25SHhW6KWzRnj4SQpYxWp4kS01yM+exETwf
   z2vSdM+W0x3MDN29OLXf7gIZfRVA3aZSC/G8ETgC3TVtpAeFYzQigjVGt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="467960365"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="467960365"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 14:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="784101632"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="784101632"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Sep 2023 14:35:35 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlFiP-0003O3-05;
	Tue, 26 Sep 2023 21:35:33 +0000
Date: Wed, 27 Sep 2023 05:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: cem@kernel.org, linux-fsdevel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, hughd@google.com, brauner@kernel.org,
	jack@suse.cz
Subject: Re: [PATCH 3/3] tmpfs: Add project quota interface support for
 get/set attr
Message-ID: <202309270552.A4zwjPrB-lkp@intel.com>
References: <20230925130028.1244740-4-cem@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925130028.1244740-4-cem@kernel.org>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.6-rc3 next-20230926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cem-kernel-org/tmpfs-add-project-ID-support/20230925-210238
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230925130028.1244740-4-cem%40kernel.org
patch subject: [PATCH 3/3] tmpfs: Add project quota interface support for get/set attr
config: arc-randconfig-001-20230926 (https://download.01.org/0day-ci/archive/20230927/202309270552.A4zwjPrB-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270552.A4zwjPrB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270552.A4zwjPrB-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/shmem.c: In function 'shmem_fileattr_get':
>> mm/shmem.c:3574:63: error: 'struct shmem_inode_info' has no member named 'i_projid'
    3574 |         fa->fsx_projid = (u32)from_kprojid(&init_user_ns, info->i_projid);
         |                                                               ^~
   mm/shmem.c: In function 'shmem_set_project':
   mm/shmem.c:3583:46: error: 'struct shmem_inode_info' has no member named 'i_projid'
    3583 |         if (projid_eq(kprojid, SHMEM_I(inode)->i_projid))
         |                                              ^~
   mm/shmem.c:3590:23: error: 'struct shmem_inode_info' has no member named 'i_projid'
    3590 |         SHMEM_I(inode)->i_projid = kprojid;
         |                       ^~


vim +3574 mm/shmem.c

  3567	
  3568	static int shmem_fileattr_get(struct dentry *dentry, struct fileattr *fa)
  3569	{
  3570		struct shmem_inode_info *info = SHMEM_I(d_inode(dentry));
  3571	
  3572		fileattr_fill_flags(fa, info->fsflags & SHMEM_FL_USER_VISIBLE);
  3573	
> 3574		fa->fsx_projid = (u32)from_kprojid(&init_user_ns, info->i_projid);
  3575		return 0;
  3576	}
  3577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
