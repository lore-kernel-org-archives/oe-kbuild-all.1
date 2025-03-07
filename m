Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B7519CC02
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 03:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741318829; cv=none; b=MZCv0xyu3qGm6bFLOprqd9HHx0wTtP86pVt4iznO6M4njxe+1phDv//P+SZQxxgOAxwk/3iJJSwo7sFtrCnfIonI+4NLYxjvokB5xpx+DBivd9Bh6beWdI/q+39IxpLcZFsZIGW1uqqI5m8kHSFzHjVW243lxcxZkWZK3UD4xTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741318829; c=relaxed/simple;
	bh=MRsk/l0aFWgKR89VufrIQzo9StYudknFfUl6EkIgsDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HO0JnUJMznQol5orfyqPoj3mTzgJ4bn6ipAtdXoHs0lUtSFfakMi7/WyX+tOQjvs8EMup/NL3/1PFXnkwnU5jPgZMPmWssbUBkVs10ubAmfAh4hEo8IQJZOcyhqfm6u6fC6kw02g/4TfJIwo2UF8rpIDqn0D6gmU0WTlvyNPUqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g1TaKkEY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g1TaKkEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741318829; x=1772854829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MRsk/l0aFWgKR89VufrIQzo9StYudknFfUl6EkIgsDU=;
  b=g1TaKkEYcOZlBoqsabXdF3DYwdAL8Mkef4hqGsPCRoENqlahm3/VbHs1
   026Y8VEecdl80Dn9kKL7RMWrt4coRgInyRD44NpsOnRDXoy0MzZm4Y7c7
   zvP/0nK5tHCAScfgo4KdwiJ+92IHv7XLCE1pahVLaiz6u6iVThSICXo1N
   oeDHdGEu1MKR3d6YmmPlBmmniHu6dnYk2n7RQbx8ldGnTo8/3LHcMieeB
   ioCGvCprny/cuxFovay+ZeaUy8tdBSJW+qBvc2+zMCx+eWf6e8D0Rh8wc
   NLm+EU6PvmzGBjrwGqg5L61axOroee83fBnRe7ufRritdGtc1evXTbsfz
   w==;
X-CSE-ConnectionGUID: WX4jSUpKT4CCo7MzmD/0Ew==
X-CSE-MsgGUID: eofp8mbARfGqM10M51VH0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53757062"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="53757062"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 19:40:28 -0800
X-CSE-ConnectionGUID: QViiW2XgSKGT/EWzWUFntw==
X-CSE-MsgGUID: O2VjZUcERv+NloassDDWpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="124139570"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2025 19:40:26 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqOZP-000OEZ-2P;
	Fri, 07 Mar 2025 03:40:21 +0000
Date: Fri, 7 Mar 2025 11:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:for-6.15/io_uring-reg-vec 4/12] io_uring/rsrc.h:
 linux/io_uring_types.h is included more than once.
Message-ID: <202503071108.x1BVh4ny-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.15/io_uring-reg-vec
head:   dbc5b236b665e61bc206055f8a6d45766fbec974
commit: 9058bd3a9a1f720d6d851603e2e0523475597638 [4/12] io_uring: introduce struct iou_vec
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071108.x1BVh4ny-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> io_uring/rsrc.h: linux/io_uring_types.h is included more than once.

vim +5 io_uring/rsrc.h

     4	
   > 5	#include <linux/io_uring_types.h>
     6	#include <linux/lockdep.h>
   > 7	#include <linux/io_uring_types.h>
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
