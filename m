Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562421531E2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 19:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823236; cv=none; b=WyylCLy8ZunoYQTTkVno0iaOvg824wpI42FC2PSx/3CO5zGOegMe1cKW0pOdemSTtf17ZRSe+81ARF7w+ilhwPN/J9MgL0JzBYTPhMetgUuNi6A+CW1CuMHXr53mkLjQYwaCn+ebigfjroSdVZFPffJ2i6nDydcgs1yjcgNug+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823236; c=relaxed/simple;
	bh=IqVqtulqOm3RPrszcxy1F/HSMTGcv/pz96dMX2zuXG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jfcew2An2u2MTR/yB1HXWi0feTYMigMcDcYp+x+9Yb5KLBFc2kD648rt0+lScDfw2G4r2lpdk5N9krnNPiyX127ceXK9bIRdwDkV/0S/ZOXrvEpwAhJpdaHcMNgYPOLxG6kogLci+TXsKYLECo+OLGydQMMxA6RPJdZLbg1pMdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jg9U2HZG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jg9U2HZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725823234; x=1757359234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IqVqtulqOm3RPrszcxy1F/HSMTGcv/pz96dMX2zuXG0=;
  b=Jg9U2HZG988fE8Cq+tG89CxHD3+llJ8WvcjXLCJspE5yZE5XGW61qq+J
   Bll327StfCFTG9T7zblcE8B7qcZZ1hlQ0ZVojBywZpAgCfxX7C25qfOlD
   35qxZH5uy00j3JsYkrlhFRiTGGtnLkw4IYnt4bDZR6+K04UG9HMAzW977
   FdS/TPBV3dVZcYhJrW/ocqjWqvX3aKoClwWJnth3mCpIOw7w0UTcSvese
   hz2BqmAxhEqC0zZU8JRkxcAQP4RrcbtvqMI2YxUuQmvf8JFSDd3vMzsjT
   IM13Iy0NxWMeS2qhs5iP11GOetpI5ZHn8P9DyEGRuCAQO4iGcnBg3wJqN
   w==;
X-CSE-ConnectionGUID: kxIiPxNlTTmHjAAuiI26yA==
X-CSE-MsgGUID: eGYTQkQVTt+bZ+ZfAqDj9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24619883"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="24619883"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 12:20:34 -0700
X-CSE-ConnectionGUID: G/ZmrhwJR/SfkQzDgk8/Ig==
X-CSE-MsgGUID: OLYvyBg2Sc+YCRwqXLAtuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="71415861"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Sep 2024 12:20:33 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snNSY-000DsR-1N;
	Sun, 08 Sep 2024 19:20:30 +0000
Date: Mon, 9 Sep 2024 03:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Jeff Layton <jlayton@kernel.org>
Subject: fs/proc/base.c:3920:22: warning: cast from pointer to integer of
 different size
Message-ID: <202409090338.DE3cSsPU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
head:   2f3f66fba07c9835a85a0a8676744283b64a39f7
commit: d62e931c84d44992d27223beb6bdc4e077bf1a5e proc: store cookie in private data
date:   12 hours ago
config: mips-loongson1c_defconfig (https://download.01.org/0day-ci/archive/20240909/202409090338.DE3cSsPU-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090338.DE3cSsPU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090338.DE3cSsPU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/proc/base.c: In function 'proc_dir_llseek':
>> fs/proc/base.c:3920:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    3920 |         u64 cookie = (u64)file->private_data;
         |                      ^
>> fs/proc/base.c:3924:30: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    3924 |         file->private_data = (void *)cookie; /* serialized by f_pos_lock */
         |                              ^


vim +3920 fs/proc/base.c

  3917	
  3918	static loff_t proc_dir_llseek(struct file *file, loff_t offset, int whence)
  3919	{
> 3920		u64 cookie = (u64)file->private_data;
  3921		loff_t off;
  3922	
  3923		off = generic_llseek_cookie(file, offset, whence, &cookie);
> 3924		file->private_data = (void *)cookie; /* serialized by f_pos_lock */
  3925		return off;
  3926	}
  3927	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
