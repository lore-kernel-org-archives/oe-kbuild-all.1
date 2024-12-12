Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B68510F2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 10:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733999435; cv=none; b=bJTNd+7fZOc2RVbLGJMKTcNoiEGTDnLStpgTAgeSJ6Kt1ZRvIRnX8eAdO8UAFJHU1+Qwq+pffitKP0hqRiWFzs6tGKJuSQ2IW8ZV/pTbBCYruHoskHXOMLqrBJZmv/qQVbhg8Nu/4MdTDZXusvKe26dj9V/6xGeT6o6gOxIiWqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733999435; c=relaxed/simple;
	bh=dABIS4z/cuf6nI6QXWWxqe4nv6Z1p+LVYiqCkGNArs4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=chraHvHbZjZ9QuPd/bELypF6JN/acMpIJjx5U+HdT3fk2ygdihhp7mnOJt4bryCjwXPXPQ5QkyqRnVUHOkRj79Z2dwSOsgbAqFKd25n6DA3BkDCk+196CNAB9tyCj6UyBdE7TZ10APysxK9KnX3zo/bwhb+qn+sgGQl6PF4ooi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aERCabw8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aERCabw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733999433; x=1765535433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dABIS4z/cuf6nI6QXWWxqe4nv6Z1p+LVYiqCkGNArs4=;
  b=aERCabw82Fw0wxZzkIFakDaKLha0EqxV7RJZZ9U50yJFub65ph37XXyD
   INS8D8HKPPzie79TvXxWJYRE7QKXElSVk0mM+d9UjhnJOORNNdtR4xKpe
   ENDMzgThfK3oXqPe8gYai1crbcGG0EnLm5YfyNcW4wPaF1OrZeiCOikS1
   F9v8Humbxu9Q1HHfU5hpNuRO9zxdEC6pheRoGGqsBzGyaS/i82KrkwDHd
   +6T2hCa6R2ljhptxl+Lfqe0qUrr8T6A0XHihC6pXkO5yNN+nbNnLd0riG
   cC3ZdxMJxklTXzzmYEc01nT/dDbcb7Tao+Scw19SMLKqVvS3ABiFsL6bM
   A==;
X-CSE-ConnectionGUID: yESMS1oSRHKCJQ8d9uiDzw==
X-CSE-MsgGUID: JN/YniGBS1S/tah5+Jst3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="56883066"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="56883066"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 02:30:32 -0800
X-CSE-ConnectionGUID: WbtahjgiTmeRcpQBVrSOdQ==
X-CSE-MsgGUID: kpfEHxYSQAKqs0wES6w40w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96642076"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Dec 2024 02:30:31 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLgSi-0007jF-2P;
	Thu, 12 Dec 2024 10:30:28 +0000
Date: Thu, 12 Dec 2024 18:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Erin Shepherd <erin.shepherd@e43.eu>,
	Amir Goldstein <amir73il@gmail.com>
Subject: [brauner-vfs:vfs.all 113/133] fs/pidfs.c:587:27: error:
 'EXPORT_OP_LOCAL_FILE_HANDLE' undeclared here (not in a function)
Message-ID: <202412121815.IdzSrie2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
head:   c9b1291c42918a3c60b5ca6c48d69eb298817075
commit: ccb189ccdd283cf522b5112f7e5eab2817f48546 [113/133] pidfs: implement file handle support
config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121815.IdzSrie2-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121815.IdzSrie2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121815.IdzSrie2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/pidfs.c:587:27: error: 'EXPORT_OP_LOCAL_FILE_HANDLE' undeclared here (not in a function)
     587 |         .flags          = EXPORT_OP_LOCAL_FILE_HANDLE,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/EXPORT_OP_LOCAL_FILE_HANDLE +587 fs/pidfs.c

   581	
   582	static const struct export_operations pidfs_export_operations = {
   583		.encode_fh	= pidfs_encode_fh,
   584		.fh_to_dentry	= pidfs_fh_to_dentry,
   585		.open		= pidfs_export_open,
   586		.permission	= pidfs_export_permission,
 > 587		.flags		= EXPORT_OP_LOCAL_FILE_HANDLE,
   588	};
   589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
