Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E629134A0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJI/iLMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699610627; x=1731146627;
  h=date:from:cc:subject:message-id:mime-version;
  bh=yvZ54jCfeigaWVvjtF/CbFrJDZNYTnDkwORpuf8ANf8=;
  b=QJI/iLMHRqh+yVZUKzua8PEy2DvPT+NPHG0tU6XKYVMiW8eLRu5HFZms
   2J+2MWENvX7va+5dhzjzirkiy0Z8I7ofljeeS9fG5WF5fbpxJ7oTST+3W
   oSMspz4dogTaoMQgw+T7RwI0nHLg3B6tSyFSPb+/QjB46JZm/uvdwYd28
   szNMqe3Czub3sV2X91x4Zh3YxCm+39S+liDiGBdlcMsnf8dEe6YNnzfx2
   XpRkhxk2BSDIZ+dnhgZhhTK6s5pW99W6MoCKfal6pz+6IRDl0PUxwbdh6
   I6hWuzlJxY8PY7IOgTcFtkbAAIkvlBxqZnp/WovN5TJMc8yzf/b7Ax3Rp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="393038579"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="393038579"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 02:03:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="792823157"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="792823157"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Nov 2023 02:03:45 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1OMY-0009X0-2M;
	Fri, 10 Nov 2023 10:03:42 +0000
Date: Fri, 10 Nov 2023 18:02:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 3157/30000] security/security.c:301:5:
 sparse: sparse: symbol 'lsm_file_alloc' was not declared. Should it be
 static?
Message-ID: <202311101736.exOKJUdv-lkp@intel.com>
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
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231110/202311101736.exOKJUdv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311101736.exOKJUdv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311101736.exOKJUdv-lkp@intel.com/

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
