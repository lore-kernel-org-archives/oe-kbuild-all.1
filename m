Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDC9811
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 09:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683710556; x=1715246556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+rKEDMcNyZE71mkjCK1c7w6rypDXvadejX8xL5dnh/w=;
  b=SwJbELjBMcr5pLfRWD/nEYtDwco7vlwjsc8z5acWuN7yq0s7cdZy32Sy
   RXVJYZ710F3bsIjmDfHAeVsnG6u/3mDjqsPpSmXQEynhWs6olUy73TvuO
   ZbreGsKZLEe0cJfR34010aYClGqiIsmU0DeQtr7U0f1J1gdmK3uMFYyJO
   H6tNK8bCXr0KJDI+eSlT6vL2jU2Ktkmsmlk+wA8Byuz0mC/65gM/R27z7
   e6nGnicM/tsddwD+h7jEV5fPSQXi0E3ZLyNgc4Whgl6CbwpRVKdVc3QNH
   6Wlvsek3vkdyWyxup+VC1plJ7tMBKcsZWMebe9jIPIuPZdMHXoNu0bYaI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="415742953"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="415742953"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 02:22:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="873513548"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="873513548"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 May 2023 02:22:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwg1f-00035g-0f;
	Wed, 10 May 2023 09:22:23 +0000
Date: Wed, 10 May 2023 17:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 9792/25680] fs/incfs/format.c:377:23:
 sparse: sparse: cast truncates bits from constant value (5346434e49 becomes
 46434e49)
Message-ID: <202305101722.oUSw9Xnl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   6d5e0c7837af8f05f7da31f9204e36185069c6af
commit: 4049b523f6ec9bae097355f9f22d9c8a6be12469 [9792/25680] ANDROID: Incremental fs: fix magic compatibility again
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230510/202305101722.oUSw9Xnl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android11-5.4
        git checkout 4049b523f6ec9bae097355f9f22d9c8a6be12469
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash fs/incfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305101722.oUSw9Xnl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/incfs/format.c:377:23: sparse: sparse: cast truncates bits from constant value (5346434e49 becomes 46434e49)
   fs/incfs/format.c:559:41: sparse: sparse: cast truncates bits from constant value (5346434e49 becomes 46434e49)

vim +377 fs/incfs/format.c

1be052b20ba04b Eugene Zemtsov 2019-11-18  361  
1be052b20ba04b Eugene Zemtsov 2019-11-18  362  /*
1be052b20ba04b Eugene Zemtsov 2019-11-18  363   * Write a backing file header
1be052b20ba04b Eugene Zemtsov 2019-11-18  364   * It should always be called only on empty file.
1be052b20ba04b Eugene Zemtsov 2019-11-18  365   * incfs_super_block.s_first_md_offset is 0 for now, but will be updated
1be052b20ba04b Eugene Zemtsov 2019-11-18  366   * once first metadata record is added.
1be052b20ba04b Eugene Zemtsov 2019-11-18  367   */
1be052b20ba04b Eugene Zemtsov 2019-11-18  368  int incfs_write_fh_to_backing_file(struct backing_file_context *bfc,
1be052b20ba04b Eugene Zemtsov 2019-11-18  369  				   incfs_uuid_t *uuid, u64 file_size)
1be052b20ba04b Eugene Zemtsov 2019-11-18  370  {
1be052b20ba04b Eugene Zemtsov 2019-11-18  371  	struct incfs_file_header fh = {};
1be052b20ba04b Eugene Zemtsov 2019-11-18  372  	loff_t file_pos = 0;
1be052b20ba04b Eugene Zemtsov 2019-11-18  373  
1be052b20ba04b Eugene Zemtsov 2019-11-18  374  	if (!bfc)
1be052b20ba04b Eugene Zemtsov 2019-11-18  375  		return -EFAULT;
1be052b20ba04b Eugene Zemtsov 2019-11-18  376  
1be052b20ba04b Eugene Zemtsov 2019-11-18 @377  	fh.fh_magic = cpu_to_le64(INCFS_MAGIC_NUMBER);
1be052b20ba04b Eugene Zemtsov 2019-11-18  378  	fh.fh_version = cpu_to_le64(INCFS_FORMAT_CURRENT_VER);
1be052b20ba04b Eugene Zemtsov 2019-11-18  379  	fh.fh_header_size = cpu_to_le16(sizeof(fh));
1be052b20ba04b Eugene Zemtsov 2019-11-18  380  	fh.fh_first_md_offset = cpu_to_le64(0);
1be052b20ba04b Eugene Zemtsov 2019-11-18  381  	fh.fh_data_block_size = cpu_to_le16(INCFS_DATA_FILE_BLOCK_SIZE);
1be052b20ba04b Eugene Zemtsov 2019-11-18  382  
1be052b20ba04b Eugene Zemtsov 2019-11-18  383  	fh.fh_file_size = cpu_to_le64(file_size);
1be052b20ba04b Eugene Zemtsov 2019-11-18  384  	fh.fh_uuid = *uuid;
1be052b20ba04b Eugene Zemtsov 2019-11-18  385  
1be052b20ba04b Eugene Zemtsov 2019-11-18  386  	LOCK_REQUIRED(bfc->bc_mutex);
1be052b20ba04b Eugene Zemtsov 2019-11-18  387  
1be052b20ba04b Eugene Zemtsov 2019-11-18  388  	file_pos = incfs_get_end_offset(bfc->bc_file);
1be052b20ba04b Eugene Zemtsov 2019-11-18  389  	if (file_pos != 0)
1be052b20ba04b Eugene Zemtsov 2019-11-18  390  		return -EEXIST;
1be052b20ba04b Eugene Zemtsov 2019-11-18  391  
6de64a2dca1e0b Paul Lawrence  2020-04-07  392  	return write_to_bf(bfc, &fh, sizeof(fh), file_pos);
1be052b20ba04b Eugene Zemtsov 2019-11-18  393  }
1be052b20ba04b Eugene Zemtsov 2019-11-18  394  

:::::: The code at line 377 was first introduced by commit
:::::: 1be052b20ba04b635cf87bcff80de5314697953e ANDROID: Initial commit of Incremental FS

:::::: TO: Eugene Zemtsov <ezemtsov@google.com>
:::::: CC: Paul Lawrence <paullawrence@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
