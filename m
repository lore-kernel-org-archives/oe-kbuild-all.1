Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F64AD532
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 20:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685391403; x=1716927403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ep+dlxQSPKpBCb0J1beJBYeUhNZ+oRFFm7lIVHYxo9g=;
  b=Fa9tFfjjmjknkZPEawEIhfpnjh00rxVWMueG0ucMCnUQnSkHKGUuIL0I
   +RCOm52oPWgI3geNfjIaVRpXnYVWypURYd3ihU+QqqLbdjzZL70u79OFt
   XnBuPA8EcHUuYN78k8cnenOYwo44E/iqEs2dsXDiysB9NaFnCKPeIft6O
   KlmXs/6YwBRFJiK1tr9q7y38GCkIeKaf3LRoPZffvNp7TuU6JMELn8dyw
   R2G8cCeE3uGc1rEBgOCB16Uyn8Hs+5mox3IWHlpMe2GX5iIAGaicCJ+sZ
   hpMbw7y4JqutANCsK9cxcqLbdDQapsEoxWniWAm/R8nUf50wVj+Ov+12W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="353606281"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="353606281"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 13:16:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="739257875"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="739257875"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 May 2023 13:16:41 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3jIG-000L7C-2p;
	Mon, 29 May 2023 20:16:40 +0000
Date: Tue, 30 May 2023 04:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:topic-shmem-stable-dir-cookies 1/3] fs/libfs.c:348:27: warning:
 cast from pointer to integer of different size
Message-ID: <202305300417.0aObZm6n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-shmem-stable-dir-cookies
head:   e8e704527450bc5b7773191ff2c6d10a6c901eba
commit: 1827add947a203ef559bdde486604a26ce8f8a33 [1/3] libfs: Add directory operations for stable cookies
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230530/202305300417.0aObZm6n-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=1827add947a203ef559bdde486604a26ce8f8a33
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-shmem-stable-dir-cookies
        git checkout 1827add947a203ef559bdde486604a26ce8f8a33
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305300417.0aObZm6n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/libfs.c: In function 'stable_dir_emit':
>> fs/libfs.c:348:27: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     348 |                           (loff_t)dentry->d_fsdata, inode->i_ino,
         |                           ^


vim +348 fs/libfs.c

   342	
   343	static bool stable_dir_emit(struct dir_context *ctx, struct dentry *dentry)
   344	{
   345		struct inode *inode = d_inode(dentry);
   346	
   347		return ctx->actor(ctx, dentry->d_name.name, dentry->d_name.len,
 > 348				  (loff_t)dentry->d_fsdata, inode->i_ino,
   349				  fs_umode_to_dtype(inode->i_mode));
   350	}
   351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
