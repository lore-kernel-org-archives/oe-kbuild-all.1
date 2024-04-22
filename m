Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F1B50243
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 08:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713773968; cv=none; b=B3KWnJM9xlpVu5RbUgARDY/ZdSoKMH+0b7NK7aP0x0WOrR/fU5uz2FOlN6MszfQH/vc0OK7aDwCJeg0JznRizVkA3nbMop2KDHyyjWH1yZI3GhD5+XOPHIKwCdhsT46mx6p50H1VqXSIorR5F2qMwHzE5hA1+inwKHAop4Fzk7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713773968; c=relaxed/simple;
	bh=g2oB/gHhEIFPSwPkLXHnDlTkwam5x9Z+pexcSn8Io0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VTeEUxRDLHTPfqQWTIVNtwzMQk+UfixEEqwX4SydL5tdi+mOLoe0RJPRvGNu0jDJgAFw3+Ra7yzbv3nWwH/rnpQU0kq06OSPsNjOqlwmtlc1BBPSql0fKP3xz6rReiJspX1bg9aM1zi+alSB4irAvphziK2kcTnSTUaba4R3F3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWqIX3rx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWqIX3rx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713773967; x=1745309967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g2oB/gHhEIFPSwPkLXHnDlTkwam5x9Z+pexcSn8Io0E=;
  b=CWqIX3rxRGS+mFo5S2tTGF0Kz8ebgYsmBzdWOOxj+qTHWa1Cv/U2HBp4
   nXqXMC2gVE7DU2j6KHhGSEKPCOS/suQ13lyl7vV8upLNtjlSjiBQ7YsaF
   IaNHLm9/SxXMwjKKYzjFa4FCu2JWey4dysMpMfpuJoxNQdcd/ydt5E9FV
   QpR5xjGGPuoEDdRmn5kvq+kCARxT9i5dQ7pbnGXC0GU3YSIVmhqJgAOWT
   ZdH7fPSxrXZiI5YqGuQFPIp+yyv9Z1rxGHKlTKRgN2QupGyHDE3kT0w7V
   fd16M4mDTj46FCsRskcU6Ag65dwqi3yKEFP4BghAaO4QNj2AQk4S2pJiq
   w==;
X-CSE-ConnectionGUID: 9SqqDvzRS5m4Wn78/niYmQ==
X-CSE-MsgGUID: HBil5ltHTkGP8ZDjBMHPCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9177543"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9177543"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 01:19:27 -0700
X-CSE-ConnectionGUID: cv3QnOaZR8Wrx5aNqKpFGQ==
X-CSE-MsgGUID: nOOB2KXbQcuq8RT1z/VJvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="47239253"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Apr 2024 01:19:25 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryotX-000CP0-0T;
	Mon, 22 Apr 2024 08:19:23 +0000
Date: Mon, 22 Apr 2024 16:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 183/184] fs/bcachefs/fs.c:219:1: warning:
 no return statement in function returning non-void
Message-ID: <202404221601.RLb8P5Tf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   b6c8ce298a81e9cfd9d7ed73d3ccb1e737e4fe07
commit: 653cfdde6b4749c4162866b8d9cd858ce3a12525 [183/184] bcachefs: Clean up inode alloc
config: nios2-randconfig-002-20240422 (https://download.01.org/0day-ci/archive/20240422/202404221601.RLb8P5Tf-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404221601.RLb8P5Tf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404221601.RLb8P5Tf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/fs.c: In function 'bch2_alloc_inode':
>> fs/bcachefs/fs.c:219:1: warning: no return statement in function returning non-void [-Wreturn-type]
     219 | }
         | ^


vim +219 fs/bcachefs/fs.c

   215	
   216	static struct inode *bch2_alloc_inode(struct super_block *sb)
   217	{
   218		BUG();
 > 219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
