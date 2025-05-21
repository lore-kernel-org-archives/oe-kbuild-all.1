Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCB8129E6E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 09:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818584; cv=none; b=kkX7c8SY84jXNzgFbVuc1qVXu5hVRvmEax/0ywdMnJjVBEN70KAGPZb/Q7Z1WabpHhkCtRgrTjSUSLwkvj9sIxYbstEEKiu4vc2JzGSnGc5qlsCnDyZehiK1quZgNaaFQTZ4qpgKzyUEfKl1nFxXeLfzgxNhZur2szItrQDWUgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818584; c=relaxed/simple;
	bh=uhEDuoPd4DMc+zdllvQa2M3gbuoz6ANevkBCxVuI4ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mZkAKsieo/OMF/9g7mehFClYZPvOUx1O5P0ATiyoitC0zm8LkzWpZwrqSpDLh0BpgagZDEvuMC7EM4GWUFG9N+e+1BwqsZ+uk6pyEIjxP4DXpQqkKz8fselJueBxyeWsgUXJDtZ74aUtdg0zzng1wszUoneA3oMJ3T/Nl6825Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRZJs5rN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRZJs5rN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747818582; x=1779354582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uhEDuoPd4DMc+zdllvQa2M3gbuoz6ANevkBCxVuI4ZE=;
  b=XRZJs5rNpg5MSF7wMYqZFE3w+kID/XQa7fPC0RMBLK3YXSeRFAHyBp8Y
   K04zuUAR2kxj15mEde+tvJxrMPkdovdg4EiLxBvhSYygG70O/Vwfg3c7b
   9NdXbI4BYNjFWuWhwAvKdjD2dHG1v9tQ5UDg6lunr0MaW+tc5L+0RINdI
   fUKYO5alnYrqcVc1KNO+oo+IGo4bWdHEF+oyY9GVr4TM648YWy7QyMkP+
   LoaVkY1rIGpnHWy0I6MKvDBLhAG0dflW3rsEyL5NsFeGka6mxv3fQ8qtB
   OOwpRpjHb+x9xKq/tmR+a17fMoiM8drXvgZRsZSGKNb487yBh4SQmnyLJ
   Q==;
X-CSE-ConnectionGUID: E8B4QE/dQtKbljUPSrHqPw==
X-CSE-MsgGUID: k14iBGJSQCGDrvFcHqSTCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="67342642"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="67342642"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:09:41 -0700
X-CSE-ConnectionGUID: PJbSDItdSvmQNj4ZoKgRmA==
X-CSE-MsgGUID: koY4WXNvSrmbFHK2i9Q5mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144712534"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2025 02:09:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHfSD-000O56-1Q;
	Wed, 21 May 2025 09:09:37 +0000
Date: Wed, 21 May 2025 17:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 7/7] fs/f2fs/file.c:41:9: warning: unused
 variable 'end'
Message-ID: <202505211721.OmaFETdC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   df2d0ce86be9c1b24b0c0f3b5baa68cc3df8ca0e
commit: df2d0ce86be9c1b24b0c0f3b5baa68cc3df8ca0e [7/7] f2fs: fix to zero post-eof page
config: arc-randconfig-001-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211721.OmaFETdC-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211721.OmaFETdC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211721.OmaFETdC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/file.c: In function 'f2fs_zero_post_eof_page':
>> fs/f2fs/file.c:41:9: warning: unused variable 'end' [-Wunused-variable]
      41 |  loff_t end;
         |         ^~~


vim +/end +41 fs/f2fs/file.c

    37	
    38	static void f2fs_zero_post_eof_page(struct inode *inode, loff_t new_size)
    39	{
    40		loff_t old_size = i_size_read(inode);
  > 41		loff_t end;
    42	
    43		if (old_size > new_size)
    44			return;
    45	
    46		/* only zero or drop pages in range of [old_size, new_size] */
    47		truncate_pagecache(inode, old_size);
    48	}
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
