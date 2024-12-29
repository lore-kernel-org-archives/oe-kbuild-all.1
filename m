Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D031E22301
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 06:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735453859; cv=none; b=ujuIPlSHgFjhmw18HfHjZ44NPF7yg9HgFPBBWZV+4DRjF8XbBorfw4P5r5a7I/e3bkbfKSWGq+9NfX6pWHJkz8aYM6luurfL8Erj7GLHRihwcz18d3SuCngWIYHJZiqjuxE1mz+Vui8c8OdskAsRV/hst/vKGh407WgbQfOeGqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735453859; c=relaxed/simple;
	bh=GetK10lOf/hUCIYTpf8LSpTdPUGrfSEedfy4foLp0mU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J3fsOoyLVCFUFB002VOnQkLe2jA2pNkey+oL4QR/HZfgCIC78aTT6a9iD+aSW6K9Rc3euGzuIfvbbRYRDyDn2iUeU13qoZxUXv5erv2cBgdfs+cdeu2veqU+NaKQNQGmSatYYC5Dw0+iCtKxcUrxQJS2mwNBf/VrmXa2j9QiUks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvoUN64t; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvoUN64t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735453858; x=1766989858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GetK10lOf/hUCIYTpf8LSpTdPUGrfSEedfy4foLp0mU=;
  b=SvoUN64t3Gr5OIOEfvojsaoyUuaOgudfvSoFFqof8WJPgKgcVVH0xZ+v
   sAtobdSoG8EWdlax0N4fbnXwm69tynYgg/E5rjZPJ1wbr00a6H9FGTv4i
   7goMn/JlSyZM8Qk0u0Fn8UpCAV9nkaxOq+qUfFzslx07YD851t20TNkPa
   GX94AdD2ts2EFFfpqxlYwy9Ims4wjH6Vk2xka2Usb5aT1YoZMj9qYwFSV
   CWkFbwelhTedjkpctqjKW250V98t5i8zwSXoVqxrGN++RS75/YbbNr/+5
   0SQGqUeBkVzJsW8uS2KaF+DgbWPEUkvP5LY+/SUpvuzTiGDK71oC0WwMC
   Q==;
X-CSE-ConnectionGUID: 8XptENUfTWa1uXAwx0fnJQ==
X-CSE-MsgGUID: hw8CbQWfQjiZfIsJENxLXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35806485"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="35806485"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 22:30:57 -0800
X-CSE-ConnectionGUID: iwlTdTkxTtSy4NHMy+b5gg==
X-CSE-MsgGUID: qPC9WJAbS5i2HRjetrT2Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100678219"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Dec 2024 22:30:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRmpB-0004Wg-36;
	Sun, 29 Dec 2024 06:30:53 +0000
Date: Sun, 29 Dec 2024 14:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.debugfs 20/20] include/linux/debugfs.h:366:16: error:
 returning 'void *' from a function with return type 'int' makes integer from
 pointer without a cast
Message-ID: <202412291401.hdkqgI9s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.debugfs
head:   b41a25033d7a1783290826fb565d082a0c7a55c4
commit: b41a25033d7a1783290826fb565d082a0c7a55c4 [20/20] saner replacement for debugfs_rename()
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20241229/202412291401.hdkqgI9s-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291401.hdkqgI9s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291401.hdkqgI9s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/panic.c:35:
   include/linux/debugfs.h: In function 'debugfs_change_name':
>> include/linux/debugfs.h:366:16: error: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     366 |         return ERR_PTR(-ENODEV);
         |                ^~~~~~~~~~~~~~~~


vim +366 include/linux/debugfs.h

c6468808149032 Nicolai Stange 2016-03-22  362  
b41a25033d7a17 Al Viro        2024-12-28  363  static inline int __printf(2, 3) debugfs_change_name(struct dentry *dentry,
b41a25033d7a17 Al Viro        2024-12-28  364  					const char *fmt, ...)
cfc94cdf8e0f14 Jan Kara       2007-05-09  365  {
cfc94cdf8e0f14 Jan Kara       2007-05-09 @366  	return ERR_PTR(-ENODEV);
cfc94cdf8e0f14 Jan Kara       2007-05-09  367  }
cfc94cdf8e0f14 Jan Kara       2007-05-09  368  

:::::: The code at line 366 was first introduced by commit
:::::: cfc94cdf8e0f14e692a5a40ef3cc10f464b2511b debugfs: add rename for debugfs files

:::::: TO: Jan Kara <jack@suse.cz>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
