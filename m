Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AE4DDDA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lvj/u52x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699541350; x=1731077350;
  h=date:from:cc:subject:message-id:mime-version;
  bh=S+ym5BZdXPCsSQZIGeRXjT6VVdIImuhEGGRrurh0rMI=;
  b=Lvj/u52xYBqU9YkOtnu1PrT5arttgDvyjDVr7kz1bxVoMVzjjOGYFmxw
   J7bwYic8oOvvU4ThzpT8HitSGvm8dmxKgMrs9ZlIeC8OXTJgbjQ6iJUPk
   s0DgE1WBk8eJjuU6iRvxZiKLk8XYY30CEBi+nKRBntcVJE/gkw/LtHJKb
   +ampqshOTb3ZmFQpvRGUDzM6doryb+Wd6UB9XgnNkuiiXoyhDQrzpGuFK
   igIXnMaAmxkMsmGEmAe1aIBfPyA/ZlJLOf8zTxzQnS76Xqn5ZTcPUsI9m
   OtZINz6WB5/Nhv3WCS+Nn8/wTEIoWJ5nZm3fGAVYWIBI/vXxzWTQelTm2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="392865077"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="392865077"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 06:49:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="798332225"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="798332225"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Nov 2023 06:49:08 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r16LC-0008oZ-22;
	Thu, 09 Nov 2023 14:49:06 +0000
Date: Thu, 9 Nov 2023 22:48:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 3157/30000] security/security.c:301:5:
 sparse: sparse: symbol 'lsm_file_alloc' was not declared. Should it be
 static?
Message-ID: <202311092254.Ee1X7GPO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: d082cff47912b94848d4e470a40449bf84b7536f [3157/30000] LSM: Infrastructure management of the file security blob
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231109/202311092254.Ee1X7GPO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092254.Ee1X7GPO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092254.Ee1X7GPO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/security.c:301:5: sparse: sparse: symbol 'lsm_file_alloc' was not declared. Should it be static?
   security/security.c:301:5: warning: no previous prototype for 'lsm_file_alloc' [-Wmissing-prototypes]
     301 | int lsm_file_alloc(struct file *file)
         |     ^~~~~~~~~~~~~~

vim +/lsm_file_alloc +301 security/security.c

   292	
   293	/**
   294	 * lsm_file_alloc - allocate a composite file blob
   295	 * @file: the file that needs a blob
   296	 *
   297	 * Allocate the file blob for all the modules
   298	 *
   299	 * Returns 0, or -ENOMEM if memory can't be allocated.
   300	 */
 > 301	int lsm_file_alloc(struct file *file)
   302	{
   303		if (!lsm_file_cache) {
   304			file->f_security = NULL;
   305			return 0;
   306		}
   307	
   308		file->f_security = kmem_cache_zalloc(lsm_file_cache, GFP_KERNEL);
   309		if (file->f_security == NULL)
   310			return -ENOMEM;
   311		return 0;
   312	}
   313	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
