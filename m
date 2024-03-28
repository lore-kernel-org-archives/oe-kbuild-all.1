Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841C14CB30
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 04:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711601276; cv=none; b=I3Teq+uIXoiGnmA+45QXawt89iPyel22nDCm0gBa7E40p7ZHvy66vcQF8VJing1GxYKq8Lb0Jt4781hcFZD/yVKLx1vipWz8wMsIluiSdtkTGdrS0PyG9VfVfWk629fJsRw0C1+ePbq89A5R3sYWCW5Secg8FCpLSVORwiNYF4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711601276; c=relaxed/simple;
	bh=UW0uuZFuYbHiU+SIDIwtcdx4NqKHK7aGhMK8wSIafCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PoExy25km+FXlHcAvwPYHdVDP7utgrX8WJM2tuzMLdUWpcc7lH7GUbsRHoEE8dFYS8V/AXaMqjq1xiZ9IcOk73DKdDHFYpR9XlQLnBWlWf3i+9L+g4UCQIMD4NtGhznL8Nw4W/m9Ia6HPbGORBNeCwibvmS2/rMOSiFKQO3upMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9nIlHOB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9nIlHOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711601275; x=1743137275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UW0uuZFuYbHiU+SIDIwtcdx4NqKHK7aGhMK8wSIafCU=;
  b=F9nIlHOB10FIrcqypbs7qGDqU1P8MC17ThF2tcJbScEHIz63EWK6GrFk
   X6yIWZtB00wFFSQ/Y5CgAPJ+V2wVsoQ0tlnpFdOjyFzs1or3ZgQQQlKI0
   e9jlONUNLgexg1F2VVyloNr2Lgi99mkE1yvCU+1jP0OipkIJxcZ/UoW3D
   imOg6kTi3ReUxIJOvKk5mAl2doz8O5qyeVL1wIxWNy5j/IhL2La9D1tRn
   mPVa1z73YPCQ9t8W/f43gcGR9tvI+wBh+Ys+62jI8b0Z7XAaPaeP/G0Tv
   5a90VybEx00u+uWpZuKpRcpj7ZXiwjwc8LTyvlJ7JFba1E6oSMB4t4qp8
   g==;
X-CSE-ConnectionGUID: R9wu+UnjQJK1mDKjNBQEww==
X-CSE-MsgGUID: gMOAOI9FQNm/cHCinEt/QQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6673173"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6673173"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 21:47:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="39644659"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Mar 2024 21:47:53 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rphg6-0001nu-36;
	Thu, 28 Mar 2024 04:47:50 +0000
Date: Thu, 28 Mar 2024 12:46:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-ring-map 12/12] io_uring/memmap.c:328:1:
 warning: control reaches end of non-void function
Message-ID: <202403281234.DO6mlIaL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-ring-map
head:   3b4304514621e1f4af1a826c969fa2f2aea19c31
commit: 3b4304514621e1f4af1a826c969fa2f2aea19c31 [12/12] io_uring: move mapping/allocation helpers to a separate file
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20240328/202403281234.DO6mlIaL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403281234.DO6mlIaL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403281234.DO6mlIaL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/memmap.c: In function 'io_uring_get_unmapped_area':
>> io_uring/memmap.c:328:1: warning: control reaches end of non-void function [-Wreturn-type]
     328 | }
         | ^


vim +328 io_uring/memmap.c

   317	
   318	unsigned long io_uring_get_unmapped_area(struct file *file, unsigned long addr,
   319						 unsigned long len, unsigned long pgoff,
   320						 unsigned long flags)
   321	{
   322		void *ptr;
   323	
   324		ptr = io_uring_validate_mmap_request(file, pgoff, len);
   325		if (IS_ERR(ptr))
   326	
   327		return (unsigned long) ptr;
 > 328	}
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
