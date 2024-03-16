Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0112C6FC6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 05:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710568420; cv=none; b=nhmJz5AAjSDTmpCsvgwiw1szWb58MnSzmoa+zJDaHPqlYp/JaM/oBHhFeZgt1ZsE1xeIn/s9ZC1TB9w3N4wfipOh4SsD3Vei0B/EXQsCm5YO7/39n9pY1bSHBRlSPYUz5CyHJvRIjvlJML1aJ2kA9ytG7F/L1LsvoWFQyaZOlqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710568420; c=relaxed/simple;
	bh=TpMPzpetWT5Osi3ZoXa0ct7yH1XxxqfHg8UQ5luXYC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FCkw8mTkbr4QgyJ1MbvsZv0nloL2DE5ZW4t+tEd7i6u+i4l70WYe7xNarcKxL2n2rOU3S7RTU5yyim6b60veY2xbGDgYtOap3gMr5QKP1C+MMHr0lYoZ1v3el/27aCLUakANsTsZyyX8brTqQzL49KN/X8bkpLkn/dM7BEyVcxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LgoTtvsM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LgoTtvsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710568417; x=1742104417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TpMPzpetWT5Osi3ZoXa0ct7yH1XxxqfHg8UQ5luXYC0=;
  b=LgoTtvsMkCHbvPu+Jwar0KA65iAy37zzY1ozjgh9Lt4OYv2V8EJb2R9t
   kY/462QHwvF8pGIR/sVftXgsH9LFc1ljM6x5hQxYd6CDY1uqfPH/5Il4S
   rWdfALqNhWB1JqmCdv693Ljd6gpaba/bTniQQ18tGPKfu8+6Ht1L8yFU2
   e6hlkzELPL20YDolHro3hvClN4WcIL7sen9ESh0JIJ+uwI6vkED/dMStB
   KKbO7VuAxyMJQDldIrpefXNohxg/rPVjJg0ytGFiwIZICHFyu/XKNRT4k
   hH+4W/rKdwcbNH7SH3DjkpH5jJ5eK+bndj+jSYYxwSN/RUK0L18ULwn2j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5292001"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5292001"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 22:53:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="12965652"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Mar 2024 22:53:35 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlMz6-000F6N-2p;
	Sat, 16 Mar 2024 05:53:32 +0000
Date: Sat, 16 Mar 2024 13:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-ring-map 8/12] io_uring.c:undefined reference
 to `vm_insert_pages'
Message-ID: <202403161314.zoGizT0Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-ring-map
head:   bab1fffac7db96b93bf5f9a2b554e89a0f2dd1c3
commit: d2103d9be0b75cdbd1e90b8728e9c64b001575be [8/12] io_uring: get rid of remap_pfn_range() for mapping rings/sqes
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20240316/202403161314.zoGizT0Z-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161314.zoGizT0Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161314.zoGizT0Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: io_uring/io_uring.o: in function `io_uring_mmap_pages':
>> io_uring.c:(.text+0x48fa): undefined reference to `vm_insert_pages'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
