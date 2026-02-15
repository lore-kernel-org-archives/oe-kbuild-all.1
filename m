Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA6B261388
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771161493; cv=none; b=gs+I2Gpwb4knz1LxlhlAmZs0UY11T1jhXTpfe0yIQscUS/GbKMMQUEa5z+trjQAdhoobjgOGp4QiP/DBWbQvLmnpu2aoJZJ+xvhDR+aqD+osMVyaBdmZ8sY2kNDu54mRTPgaS1SCwfOEjrvw5aR9i4vkNVjO8fO5KvsaAdUD/Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771161493; c=relaxed/simple;
	bh=rJ5ddnQdV/88we7IRy3llOBLkmsvcA4Rc6qaRk2Bb/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9yUrRxroLZX6NjwD+ixe42MStsS9WF5xkzYSp3OCyUNSSeo6+4+yMkiYnCyfxOlXUvdTdCRXynPlrrztyXcVENrvD5KhOz05QrTN/cPSTt/lIibLmKy+dEd6ZeSpWjUIw8ICdwf5Ib0tUo4wtwCHQ+MUF3ac2iz69tSOdxJuy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KyBLZOr7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KyBLZOr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771161489; x=1802697489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rJ5ddnQdV/88we7IRy3llOBLkmsvcA4Rc6qaRk2Bb/o=;
  b=KyBLZOr7n7HXmcHXBXpmGFHalhU/ihDGX+QRWWIOG4LE5EyPZbiIEJ6W
   Akec3/RupAD+UyAwFozbybatwFiKf9+6URQ3fj1+d53RBEv1Cwhuuifwg
   mY2A5G49e6Sp4wKVrXRgMG8HHaryhDymumt0WzG3nuh6AnFiEDJSyhNeh
   Mz9PZokgF5u8IkPMk4ibxMcrteZ8CDRdrQT6cGMhG8POEdyL+vtTJi8VB
   CPdkqciQtG26VZcAf4LbPSs0CMY8gXWrtlbnqfr4eWH5qVxZCcISDX2pS
   bF0FCm+qFiG7qac/MQOhCIAbFj3TECxZBtwnEkrFX4rLXDfxWhH2BlM8Y
   Q==;
X-CSE-ConnectionGUID: iNzIzhhbSgudASERVJ0KiA==
X-CSE-MsgGUID: dDCf0QSKQQyjml1D5eQlyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71982293"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="71982293"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 05:18:09 -0800
X-CSE-ConnectionGUID: K7KqVKr1ReGrkMoDjj8Sqw==
X-CSE-MsgGUID: uYJ2W9cqQJuqTiW8/x/Z9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="217905230"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Feb 2026 05:18:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrc0l-00000000yWC-29T0;
	Sun, 15 Feb 2026 13:18:07 +0000
Date: Sun, 15 Feb 2026 21:17:10 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Aring <aahringo@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v6.19] dlm: introduce dlmpfs
Message-ID: <202602152138.khGHQzqq-lkp@intel.com>
References: <20260213180014.614646-1-aahringo@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213180014.614646-1-aahringo@redhat.com>

Hi Alexander,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v6.19]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Aring/dlm-introduce-dlmpfs/20260214-020248
base:   v6.19
patch link:    https://lore.kernel.org/r/20260213180014.614646-1-aahringo%40redhat.com
patch subject: [RFC v6.19] dlm: introduce dlmpfs
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20260215/202602152138.khGHQzqq-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602152138.khGHQzqq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602152138.khGHQzqq-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/dlm/dlmpfs/inode.c: In function 'dlmpfs_alloc_inode':
>> fs/dlm/dlmpfs/inode.c:47:14: error: implicit declaration of function 'kzalloc_obj'; did you mean 'kzalloc_node'? [-Wimplicit-function-declaration]
      47 |         di = kzalloc_obj(*di, GFP_NOFS);
         |              ^~~~~~~~~~~
         |              kzalloc_node
>> fs/dlm/dlmpfs/inode.c:47:12: error: assignment to 'struct dlmpfs_inode *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      47 |         di = kzalloc_obj(*di, GFP_NOFS);
         |            ^
   fs/dlm/dlmpfs/inode.c: In function 'dlmpfs_init_fs_context':
>> fs/dlm/dlmpfs/inode.c:441:13: error: assignment to 'struct dlmpfs_fs_info *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     441 |         fsi = kzalloc_obj(*fsi, GFP_KERNEL);
         |             ^
--
   fs/dlm/dlmpfs/newdlm.c: In function 'dlmlk_alloc':
>> fs/dlm/dlmpfs/newdlm.c:137:14: error: implicit declaration of function 'kzalloc_obj'; did you mean 'kzalloc_node'? [-Wimplicit-function-declaration]
     137 |         lk = kzalloc_obj(*lk, GFP_NOFS);
         |              ^~~~~~~~~~~
         |              kzalloc_node
>> fs/dlm/dlmpfs/newdlm.c:137:12: error: assignment to 'struct dlmlk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     137 |         lk = kzalloc_obj(*lk, GFP_NOFS);
         |            ^
   fs/dlm/dlmpfs/newdlm.c: In function 'dlmls_new':
>> fs/dlm/dlmpfs/newdlm.c:216:12: error: assignment to 'struct dlmls *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     216 |         ls = kzalloc_obj(*ls, GFP_NOFS);
         |            ^
--
   fs/dlm/dlmpfs/file.c: In function 'dlmpfs_open':
>> fs/dlm/dlmpfs/file.c:23:14: error: implicit declaration of function 'kzalloc_obj'; did you mean 'kzalloc_node'? [-Wimplicit-function-declaration]
      23 |         fp = kzalloc_obj(*fp, GFP_NOFS);
         |              ^~~~~~~~~~~
         |              kzalloc_node
>> fs/dlm/dlmpfs/file.c:23:12: error: assignment to 'struct dlmpfs_file *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      23 |         fp = kzalloc_obj(*fp, GFP_NOFS);
         |            ^


vim +47 fs/dlm/dlmpfs/inode.c

    42	
    43	static struct inode *dlmpfs_alloc_inode(struct super_block *sb)
    44	{
    45		struct dlmpfs_inode *di;
    46	
  > 47		di = kzalloc_obj(*di, GFP_NOFS);
    48		if (!di)
    49			return NULL;
    50	
    51		inode_init_once(&di->inode);
    52		return &di->inode;
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
