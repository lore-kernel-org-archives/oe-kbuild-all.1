Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA8E13099
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 08:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688718958; x=1720254958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YTD2b1tKQeRe4HN1ARJp9Mj+pCZ1Jre2lgVxpYNsYP4=;
  b=jVLyFGH6/YzQPfrbg2Ic1zcCXDBbzKIMKHn3d+q6tPHc6WNwG1oO3bO1
   fnmOeofHHdbnINTegSxHyKS0xzmIV5uzmxq2b6JdfT7UH4NVQmAECbRdf
   0eoU8JHdm7EhaP+U5+lS2bTHw8Jp/In5tzVMiIHUZEDg5Eh2zGH7pCSnS
   ez/Ra7ydOHzaB66AVwHC6szuIb0MOK2IbZUOVLtJPU7AyxJ/AytfVD2Pq
   tAPWWGFj/BmUrUjjp7+zXyqO/Gz6JFH19KFnnzYt7PMTQquqS2pdu4Fcj
   4xPFCbqvqz8r28xy1wCbdsUFRzOEVkF5yDaPg6SheythyRBieeFnEQpPJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="361310027"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="361310027"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 01:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="697155308"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="697155308"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Jul 2023 01:35:55 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHgwU-0001u0-2T;
	Fri, 07 Jul 2023 08:35:54 +0000
Date: Fri, 7 Jul 2023 16:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 57/266] include/linux/proc_fs.h:123:25:
 error: called object 'pde_data' is not a function or function pointer
Message-ID: <202307071648.K83gs33s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   b4323aff06a7923128031fc9af5b8e33e8fef08a
commit: 9b5703666922d517f32d853a60e7b5a26eefa464 [57/266] fs: proc: store PDE()->data into inode->i_private
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230707/202307071648.K83gs33s-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071648.K83gs33s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071648.K83gs33s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nubus/proc.c:24:
   drivers/nubus/proc.c: In function 'nubus_proc_rsrc_show':
>> include/linux/proc_fs.h:123:25: error: called object 'pde_data' is not a function or function pointer
     123 | #define PDE_DATA(i)     pde_data(i)
         |                         ^~~~~~~~
   drivers/nubus/proc.c:112:20: note: in expansion of macro 'PDE_DATA'
     112 |         pde_data = PDE_DATA(inode);
         |                    ^~~~~~~~
   drivers/nubus/proc.c:110:37: note: declared here
     110 |         struct nubus_proc_pde_data *pde_data;
         |                                     ^~~~~~~~


vim +/pde_data +123 include/linux/proc_fs.h

   122	
 > 123	#define PDE_DATA(i)	pde_data(i)
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
