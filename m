Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B9110953
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 09:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696412975; x=1727948975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bTGmVaCbGUtsRlMooejy1mL6MHh5lsNVSpno5c9lUJU=;
  b=FDiikSTG0uBLb6zGKOarnzWNbdlPeoGXLCptM/xGmWixdbj8Niws97pm
   S4NqjA1qOq/UmjcbPo/dL1TIIyXdqDZkXFK9ks4ntB0YF2c4aiRgsT6s8
   a4BQu8+H7Gbk6MlG94vqbDGPmdS5osIxGtRz7F6kn8jw6irh2xfAUJ2a2
   RQ56PeN6Lc7RH1IFgno2nUlFU2A4gpzDGzWDPClUrqoZiS96AggD+a+i9
   XDVSIyw0ROFd5TkKB5Mng+RV8fVPuOqiTbnlzJm0ZLEivnF8BNK5HvcQb
   giQ+BXB0Et4bS779RNW9TA52d6Dglyo8NPp8B55IOVqv0myDuWHiCpS7/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="386985557"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="386985557"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 02:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="701031860"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="701031860"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Oct 2023 02:48:08 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnyU9-000GUU-2E;
	Wed, 04 Oct 2023 09:48:05 +0000
Date: Wed, 4 Oct 2023 17:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8396/9381] fs/file.c:875:22: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202310041744.d34gIv9V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33b64befb1a28bca3f5a9ed9807d2f87e976c63a
commit: af66b51563ad7e625602809a0f4c45154df063d1 [8396/9381] file: convert to SLAB_TYPESAFE_BY_RCU
config: i386-randconfig-061-20231004 (https://download.01.org/0day-ci/archive/20231004/202310041744.d34gIv9V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310041744.d34gIv9V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310041744.d34gIv9V-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/file.c:379:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **old_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:379:17: sparse:     expected struct file **old_fds
   fs/file.c:379:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:380:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **new_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:380:17: sparse:     expected struct file **new_fds
   fs/file.c:380:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:395:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/file.c:395:17: sparse:    struct file [noderef] __rcu *
   fs/file.c:395:17: sparse:    struct file *
   fs/file.c:430:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu *[assigned] __ret @@
   fs/file.c:470:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fdtable [noderef] __rcu *fdt @@     got struct fdtable * @@
   fs/file.c:646:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:841:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
>> fs/file.c:875:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
>> fs/file.c:879:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic_t [usertype] *v @@     got struct atomic_t [noderef] __rcu * @@
>> fs/file.c:882:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file_reloaded @@     got struct file * @@
>> fs/file.c:906:32: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file_reloaded @@
>> fs/file.c:908:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:1200:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *tofree @@     got struct file [noderef] __rcu * @@

vim +875 fs/file.c

   855	
   856	/**
   857	 * get_file_rcu - try go get a reference to a file under rcu
   858	 * @f: the file to get a reference on
   859	 *
   860	 * This function tries to get a reference on @f carefully verifying that
   861	 * @f hasn't been reused.
   862	 *
   863	 * This function should rarely have to be used and only by users who
   864	 * understand the implications of SLAB_TYPESAFE_BY_RCU. Try to avoid it.
   865	 *
   866	 * Return: Returns @f with the reference count increased or NULL.
   867	 */
   868	struct file *get_file_rcu(struct file __rcu **f)
   869	{
   870		for (;;) {
   871			struct file __rcu *file;
   872			struct file __rcu *file_reloaded;
   873			struct file __rcu *file_reloaded_cmp;
   874	
 > 875			file = rcu_dereference_raw(*f);
   876			if (!file)
   877				return NULL;
   878	
 > 879			if (unlikely(!atomic_long_inc_not_zero(&file->f_count)))
   880				continue;
   881	
 > 882			file_reloaded = rcu_dereference_raw(*f);
   883	
   884			/*
   885			 * Ensure that all accesses have a dependency on the
   886			 * load from rcu_dereference_raw() above so we get
   887			 * correct ordering between reuse/allocation and the
   888			 * pointer check below.
   889			 */
   890			file_reloaded_cmp = file_reloaded;
   891			OPTIMIZER_HIDE_VAR(file_reloaded_cmp);
   892	
   893			/*
   894			 * atomic_long_inc_not_zero() above provided a full
   895			 * memory barrier when we acquired a reference.
   896			 *
   897			 * This is paired with the write barrier from assigning
   898			 * to the __rcu protected file pointer so that if that
   899			 * pointer still matches the current file, we know we
   900			 * have successfully acquire a reference to it.
   901			 *
   902			 * If the pointers don't match the file has been
   903			 * reallocated by SLAB_TYPESAFE_BY_RCU.
   904			 */
   905			if (file == file_reloaded_cmp)
 > 906				return file_reloaded;
   907	
 > 908			fput(file);
   909		}
   910	}
   911	EXPORT_SYMBOL_GPL(get_file_rcu);
   912	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
