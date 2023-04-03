Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CB66FAA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Apr 2023 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680532337; x=1712068337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DtoY6cP52YP2Cu2+OF1/+fMaIeXSxtRw1d6XEdQKqaI=;
  b=eGrWo+3dwH833FbnL/aJOJom6Y8QDmCihnjSsSEnIFdzedtDZTdn/Y5b
   chvRaXlH8RcOvBSZQ6ypHr3V1mUfZ2iDTur4dUHltKQPikroCohRrW/ur
   ip5kExUNz9h4vCjnACSNir4HMF9UHHxoE41QGfqQAJW3dRCDPBSGgro6O
   AMhS2YHt5B9GWhNkcNQbujFTfcWkOCxgmtBqhi6NhhaIFPEkM7xzxRKrS
   kxw8seOYRXPMquny+PbYNmS+kOmaBi25ec5Vem/Oe5yFgmtgbDKDZFBRw
   RI2INVdQ9gRvM6XJqb8Z0amWqi5AFIiL2OCSW4PY1EMn/r8LaP0tQJlyS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322309313"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="322309313"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 07:32:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="860225308"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="860225308"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Apr 2023 07:32:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjLEC-000OPj-2m;
	Mon, 03 Apr 2023 14:32:12 +0000
Date: Mon, 3 Apr 2023 22:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: cem@kernel.org, hughd@google.com
Cc: oe-kbuild-all@lists.linux.dev, jack@suse.cz, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH 5/6] shmem: quota support
Message-ID: <202304032216.0SXl7l2X-lkp@intel.com>
References: <20230403084759.884681-6-cem@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403084759.884681-6-cem@kernel.org>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc5]
[cannot apply to akpm-mm/mm-everything next-20230403]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cem-kernel-org/shmem-make-shmem_inode_acct_block-return-error/20230403-165022
patch link:    https://lore.kernel.org/r/20230403084759.884681-6-cem%40kernel.org
patch subject: [PATCH 5/6] shmem: quota support
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20230403/202304032216.0SXl7l2X-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/e060b9e86fd92d5e87f5b0c447e4bc610a3d3bbe
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review cem-kernel-org/shmem-make-shmem_inode_acct_block-return-error/20230403-165022
        git checkout e060b9e86fd92d5e87f5b0c447e4bc610a3d3bbe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304032216.0SXl7l2X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/shmem.c: In function 'shmem_init':
>> mm/shmem.c:4252:1: warning: label 'out3' defined but not used [-Wunused-label]
    4252 | out3:
         | ^~~~


vim +/out3 +4252 mm/shmem.c

  4224	
  4225		error = register_filesystem(&shmem_fs_type);
  4226		if (error) {
  4227			pr_err("Could not register tmpfs\n");
  4228			goto out2;
  4229		}
  4230	
  4231		shm_mnt = kern_mount(&shmem_fs_type);
  4232		if (IS_ERR(shm_mnt)) {
  4233			error = PTR_ERR(shm_mnt);
  4234			pr_err("Could not kern_mount tmpfs\n");
  4235			goto out1;
  4236		}
  4237	
  4238	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  4239		if (has_transparent_hugepage() && shmem_huge > SHMEM_HUGE_DENY)
  4240			SHMEM_SB(shm_mnt->mnt_sb)->huge = shmem_huge;
  4241		else
  4242			shmem_huge = SHMEM_HUGE_NEVER; /* just in case it was patched */
  4243	#endif
  4244		return;
  4245	
  4246	out1:
  4247		unregister_filesystem(&shmem_fs_type);
  4248	out2:
  4249	#ifdef CONFIG_TMPFS_QUOTA
  4250		unregister_quota_format(&shmem_quota_format);
  4251	#endif
> 4252	out3:
  4253		shmem_destroy_inodecache();
  4254		shm_mnt = ERR_PTR(error);
  4255	}
  4256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
