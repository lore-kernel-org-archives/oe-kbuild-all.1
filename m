Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE37E291A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 23:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693438071; x=1724974071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GlZjijx2wj4iJwaAtdXGEcu27M06pIVhIc4ObEhEZ3A=;
  b=QrSjlu2KzhUbiENXjXlZ7LifVBJYh6NwYe6I2wbJfvznoXlNYZhIU7NZ
   cxg9zlz5GaDZsuFzSGiYagcWOfCJqwgg+3EJz6SvFVi54UELXLzH5yEIk
   /WeC7p5TBSPYp6uMYTUmJzM3Mg+G/AMf6ALoJXV9VO++lVfe0b0QHXmHP
   9ZcOOI1CaxHK8TEzuBeKmEeiN5Q3o03hxyszgWJ3Nt3Jh+spKkVE/OtCQ
   dYIYxKRoaWEVXP08C52nU5vIUDZcgSEdcbEmSS0B83C4mQjEwsfMPOW0Z
   lkaXSftGHbwGN96BVAzp0grrPBHkLS9ZziwXP6/bfBuneSVnN07v/kWsV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="375724584"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="375724584"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 16:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="768577701"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="768577701"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Aug 2023 16:27:49 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbUbE-000ALB-1B;
	Wed, 30 Aug 2023 23:27:48 +0000
Date: Thu, 31 Aug 2023 07:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctl-next 3/5] include/linux/sysctl.h:176:56: error:
 dereferencing pointer to incomplete type 'struct file'
Message-ID: <202308310707.blpt0Bdq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctl-next
head:   5db649a3f876dee97af2da8462e4314424a04675
commit: 6055635008ed77b08ba85ebaba87e9e3548a7a3a [3/5] ipc: Convert ipc_sysctls to static array
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230831/202308310707.blpt0Bdq-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310707.blpt0Bdq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310707.blpt0Bdq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/umh.h:9:0,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from ipc/ipc_sysctl.c:8:
   ipc/ipc_sysctl.c: In function 'proc_write_intvec_orphans':
>> include/linux/sysctl.h:176:56: error: dereferencing pointer to incomplete type 'struct file'
    #define SYSCTL_CTX(filep) ((struct ctl_context *)(filep->private_data))
                                                           ^
   ipc/ipc_sysctl.c:25:28: note: in expansion of macro 'SYSCTL_CTX'
     struct ctl_context *ctx = SYSCTL_CTX(file);
                               ^~~~~~~~~~


vim +176 include/linux/sysctl.h

b3d9978143d4fa Alexey Gladkov 2022-05-16  175  
b3d9978143d4fa Alexey Gladkov 2022-05-16 @176  #define SYSCTL_CTX(filep) ((struct ctl_context *)(filep->private_data))
b3d9978143d4fa Alexey Gladkov 2022-05-16  177  

:::::: The code at line 176 was first introduced by commit
:::::: b3d9978143d4fa8d26fb6efee0a4e615ad987715 sysctl: API extension for handling sysctl

:::::: TO: Alexey Gladkov <legion@kernel.org>
:::::: CC: Alexey Gladkov <legion@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
