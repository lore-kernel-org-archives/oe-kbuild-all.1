Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF7A26ACC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 08:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712823676; cv=none; b=pNZFxq8cGWXrzIqIgDIiduGhAJK/Zp1j0siM+/Dy0/dedDhZ+1PqIv8SA2ow7NdofzWG6S8xYQTY7/R1BSvtSEW/HHLkwL1ZV8EdYXsi4uIfJBXjmrXHOW4ynhWC53Lrk8qar0vTufeMfqNAx6BBwqWzgfwjjS1HroCtXERbRSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712823676; c=relaxed/simple;
	bh=dKTwCiolqNkuWdw2HKo24o00on2S5OP6rIsz7P+gyRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GoJThnFs+LZvDauuWG0tX4HiZXjYS6ems4oJg0MYPBijKkXadW8P9l4tvF8MNTSe0wHjAejKxhBXr/9BnJcY0vY45XiTe4q/ZuPFK2V5dXXc7P4A4zYSdwN/4NX9rwetN6z6GH05qUMCjrOfQeFwOIB704ZQbNNO6rnPml/KByM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncTD48+J; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncTD48+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712823674; x=1744359674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dKTwCiolqNkuWdw2HKo24o00on2S5OP6rIsz7P+gyRM=;
  b=ncTD48+JQs7TcvPor7q6Nqs3GJCn5ht5xQFoKtVJLKC50Q9AZQl45ho9
   xbDO4r75xES0LqOZgy9jL3EjRqVngD3iCpNsMInxaBjuBYkqCzTKp7zWI
   jE3h1zZb1gjhmfP+6yUW/eXbgDqaY/zC4LJGHIY1poa8Z7gmsOgYCIrWH
   yX47ycCK4iz1faOJ2X2x7Yd/RcUYqArIaO+6i7rpOxRaHufoBFWVV7BRE
   JKa6mcYlP8Os4P3BgP/0GXWuyZyQfhB0RKnJQbdRPrWTC8GGiDzwASnko
   tAeJW24g2VUWBdX3UHnim0PSBAxxHcZ8lZ9/FTsQbKdQKucXXkeCjOj58
   w==;
X-CSE-ConnectionGUID: 1duVM4IETy+p5i1PznqIfQ==
X-CSE-MsgGUID: s+WFSojmTzKvv2Cgum5/1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8073244"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8073244"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 01:21:14 -0700
X-CSE-ConnectionGUID: Adoxq+40RLCuEgRcHR/iUQ==
X-CSE-MsgGUID: 3TVhRmmKT3W6HwzD5rA4Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="20732786"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Apr 2024 01:21:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rupgE-0008Or-2r;
	Thu, 11 Apr 2024 08:21:10 +0000
Date: Thu, 11 Apr 2024 16:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/v4+x86-rox /23] execmem.c:undefined reference to
 `find_vm_area'
Message-ID: <202404111636.7O8vojQB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/v4+x86-rox
head:   98afa1d7e1d9deaee05261840ca6939daf8b6245
commit: 16503a5762764f63a0ab1d009de6d9cb41af5d4a [/23] execmem: add support for cache of large ROX pages
config: sh-randconfig-001-20240411 (https://download.01.org/0day-ci/archive/20240411/202404111636.7O8vojQB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111636.7O8vojQB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111636.7O8vojQB-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: mm/execmem.o: in function `execmem_alloc':
>> execmem.c:(.text+0x2ec): undefined reference to `find_vm_area'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
