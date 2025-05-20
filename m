Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407F12063D2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 21:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776821; cv=none; b=M3S0nLzUQyrttfz52EC4dO47LDEeDGDTAfsj5fiIX3gHum2UpxveUyFJdDcwadNo40WhaQr4nNgBMqooMUIOhKOtYwXnVUby31omKULL1oq3dzf+IsHPOfLSYz+BTLO8kbKkkpx5n78jduYbz6MNR7oLsnlg9+iJ4Vrgtz93Y60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776821; c=relaxed/simple;
	bh=dODCLeElG6Wh9quRkiymv7P+AzgfkZ0MxPRAWYmYTzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OohUUkljh7dP1hNjHUoVWsvZ57+CIcc6Rjv23TLhjWpQtPAkL/r8hh7/7hf2IrVPkspHBq4iAxFD+Bl/wCcSemvKQJtcc51X631wA8qxDfSWUTlZFeWJ6XF29whoEuwcoDaoTRhQzxz60MUhDRp+UkhgNVNugXjh/XaenADqzYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0nNCTUg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0nNCTUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747776820; x=1779312820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dODCLeElG6Wh9quRkiymv7P+AzgfkZ0MxPRAWYmYTzY=;
  b=m0nNCTUgjeeJ+hcxT+zOEWm6Xx4apKMtZmy37StiTeX61rjDCbI54qV/
   U4YSxYWhlvLquQJpFF2rW4j758PknxeKYBizRqTt9IwR//gOYrRZbDHce
   fkdO2K85X6aLJWhVKChK5AHQw6pNFetl30PIN7KDJQGaGS3ovmtqjtIDu
   O09s1tPKGGYCx5ao5AcJKtSREH/PlLkWIeImW0Yr5xr3J2QJ510Xmps5f
   PrIq4ofIYFhYKNlkUW0SPpOCL5mHwvcQk3whFJ+1FR13XSLk7V2WHFME+
   v3nZ7QBGZJzlBIrVPiTfBObqP0myYbeDvqdWOLDwzQx3ooOsuSM0VccKa
   g==;
X-CSE-ConnectionGUID: HuUS1U/4S8e1paGX1wICUw==
X-CSE-MsgGUID: DeB+iXP/Rx6Qv1JZVdIY3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="75132031"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="75132031"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 14:33:39 -0700
X-CSE-ConnectionGUID: cjV6qeL6TDOXLasbStPGdA==
X-CSE-MsgGUID: +CRwhLbMRQG35Jv4HC0T7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139689120"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 May 2025 14:33:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHUab-000NaQ-0N;
	Tue, 20 May 2025 21:33:33 +0000
Date: Wed, 21 May 2025 05:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: [brauner-github:vfs-6.16.misc 50/54] fs/buffer.c:1130:30: error:
 implicit declaration of function '__find_get_block_nonatomic'; did you mean
 '__find_get_block_slow'?
Message-ID: <202505210510.d50bbMua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.16.misc
head:   d5646f1b4073e9d428264b708a42262087faf6e0
commit: f13865bcff540b64612f235534dc39663e159f5a [50/54] fs/buffer: use sleeping lookup in __getblk_slowpath()
config: x86_64-buildonly-randconfig-003-20250521 (https://download.01.org/0day-ci/archive/20250521/202505210510.d50bbMua-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210510.d50bbMua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210510.d50bbMua-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/buffer.c: In function '__getblk_slow':
>> fs/buffer.c:1130:30: error: implicit declaration of function '__find_get_block_nonatomic'; did you mean '__find_get_block_slow'? [-Werror=implicit-function-declaration]
    1130 |                         bh = __find_get_block_nonatomic(bdev, block, size);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              __find_get_block_slow
>> fs/buffer.c:1130:28: warning: assignment to 'struct buffer_head *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1130 |                         bh = __find_get_block_nonatomic(bdev, block, size);
         |                            ^
   cc1: some warnings being treated as errors


vim +1130 fs/buffer.c

  1107	
  1108	static struct buffer_head *
  1109	__getblk_slow(struct block_device *bdev, sector_t block,
  1110		     unsigned size, gfp_t gfp)
  1111	{
  1112		bool blocking = gfpflags_allow_blocking(gfp);
  1113	
  1114		/* Size must be multiple of hard sectorsize */
  1115		if (unlikely(size & (bdev_logical_block_size(bdev)-1) ||
  1116				(size < 512 || size > PAGE_SIZE))) {
  1117			printk(KERN_ERR "getblk(): invalid block size %d requested\n",
  1118						size);
  1119			printk(KERN_ERR "logical block size: %d\n",
  1120						bdev_logical_block_size(bdev));
  1121	
  1122			dump_stack();
  1123			return NULL;
  1124		}
  1125	
  1126		for (;;) {
  1127			struct buffer_head *bh;
  1128	
  1129			if (blocking)
> 1130				bh = __find_get_block_nonatomic(bdev, block, size);
  1131			else
  1132				bh = __find_get_block(bdev, block, size);
  1133			if (bh)
  1134				return bh;
  1135	
  1136			if (!grow_buffers(bdev, block, size, gfp))
  1137				return NULL;
  1138		}
  1139	}
  1140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
