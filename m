Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F96220F9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 17:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683565419; x=1715101419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ksxmaz4w+c2S4VJhzI3cbe8ho/PWsLZdhjlyJhKsYc=;
  b=Axt6OoaecqwkmIKwnA3s26zyiokTLPPKXiQt0XX7qC8o9aNmvMCEX+cf
   wBI4LyttCeU1MdTZV0j0yxIhmrS+WEy/rNucg+9Zf2BXpJWl3Sq/76J+T
   lugngXzm0b5YY5UpirMmY61XnejkQUBP509crSy9jCLxIIYv6LMu33ArP
   4NE99abGROQQYBUp8PP1V7ECIFZW+x8zQitovsy0LA1PBDw6TbCNkSoOx
   7438+Ll0A2mIAIjLAGb2dIbEC1JW0SEjJQl/dRRnp4nDAE6CIByyLAu5e
   YB3EvzMwbrLaUJfxaRAMpZAd76Bs5yXGEUktD3M0B2MSGuT8vHQBYYL7m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="377799256"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="377799256"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 10:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="763472813"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="763472813"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 May 2023 10:03:38 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pw4Gv-0001Kb-0A;
	Mon, 08 May 2023 17:03:37 +0000
Date: Tue, 9 May 2023 01:02:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 2/4] kernel/sys.c:2391:12: warning: no
 previous prototype for 'arch_prctl_mem_model_get'
Message-ID: <202305090029.OWogV806-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/220-tso
head:   38015ad2af19088e66e0c81f7efd5a8b51814026
commit: b5c6de40368b847e8c2968e260fb98ac1b7b10d2 [2/4] prctl: Introduce PR_{SET,GET}_MEM_MODEL
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230509/202305090029.OWogV806-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/AsahiLinux/linux/commit/b5c6de40368b847e8c2968e260fb98ac1b7b10d2
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/220-tso
        git checkout b5c6de40368b847e8c2968e260fb98ac1b7b10d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090029.OWogV806-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sys.c:2391:12: warning: no previous prototype for 'arch_prctl_mem_model_get' [-Wmissing-prototypes]
    2391 | int __weak arch_prctl_mem_model_get(struct task_struct *t)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sys.c:2396:12: warning: no previous prototype for 'arch_prctl_mem_model_set' [-Wmissing-prototypes]
    2396 | int __weak arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_prctl_mem_model_get +2391 kernel/sys.c

  2390	
> 2391	int __weak arch_prctl_mem_model_get(struct task_struct *t)
  2392	{
  2393		return -EINVAL;
  2394	}
  2395	
> 2396	int __weak arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
  2397	{
  2398		return -EINVAL;
  2399	}
  2400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
