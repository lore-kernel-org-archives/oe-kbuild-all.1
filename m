Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA3613D24D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Aug 2024 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722874589; cv=none; b=sMIspxvBMjHG3nqmR11+Uy1Fik+G8kGmQ29qBRbKf+NUHvpJalTXVNkcPuvqUmFzIIwzwGOm2v41LkxWPy7vN/uWizBVnbRNOPnfflMqIQ+DNxvejueSgvy+gLOFJHfkCkXKGtnVWlOQ4/o0ItyUfj8I+PlZs2Ypm5MPdz9J0po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722874589; c=relaxed/simple;
	bh=m0J+QhSP8T4xyFFBUJXdUIH0Zz99q9MAxL19q3oP3VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NTvfZMkhpOrCnHyl0zZthhBCJ40Xu/vavTxqQVZsUamgC7ENKzKVDyAMm99ixQREr9P9KDmGlD+XRoNKFsADptcdJbZ5Qs3nG9rn78neMkKS1u7J5EIlk7HKZat2+8WDETVbMq6eDI220VMJ3bCf2GkNpq51ufKNk+14TmK0QJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzc9Ssw1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzc9Ssw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722874587; x=1754410587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m0J+QhSP8T4xyFFBUJXdUIH0Zz99q9MAxL19q3oP3VQ=;
  b=hzc9Ssw103dllQbrKbJp0K5AfBRGv5MY4aRHFCSasDMI2iiflKJeBjFJ
   xDwBtKFRLCxPd/mHFVMWC3GXARIjc53HgmBjOkE8eOV+gCBhuuLLBzvZ3
   kBR3PW8yhBIxzo80jfwh1pD+qH09IHPGI9pSu0H9N+1JANbjiYjKr68AD
   oGyFbOZ6cE3cKYOOvQwaHJjBB3CoVrKUPEKsPHOiZSAovVirFfCnuDWhX
   ra4LCy6QZuKkkIUCItaJmtW9K0v+Yh7JgafpqlJ78q+9LhYM/pTnrcISY
   k1cg90MyHlQeIUKj+WDgV8sBUBOsjsIhLys5fiFIN4vxkJQjq33Ej4yGE
   w==;
X-CSE-ConnectionGUID: GrY4cvk+SqOBAKGULr6H+A==
X-CSE-MsgGUID: e3GdHzrHQm+VLm7/f265uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32255571"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="32255571"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 09:16:24 -0700
X-CSE-ConnectionGUID: abOyagNtR8eeFWFjN2/Q5A==
X-CSE-MsgGUID: MxpyuOz1R92SpjNyZCEVRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="60580501"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 05 Aug 2024 09:16:23 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb0Nh-00036m-19;
	Mon, 05 Aug 2024 16:16:21 +0000
Date: Tue, 6 Aug 2024 00:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 151/442] drivers/gpu/drm/drm_panic.c:681:43:
 error: 'file' undeclared
Message-ID: <202408060032.5eh3QNv5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   449894f5917ad62cb4083d1df948f4f5c92a01da
commit: 8790307566bc72d6fda9b3b49a3a075644b395fd [151/442] drm: panic: convert to read/write iterators
config: x86_64-buildonly-randconfig-005-20240805 (https://download.01.org/0day-ci/archive/20240806/202408060032.5eh3QNv5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060032.5eh3QNv5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408060032.5eh3QNv5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_panic.c: In function 'debugfs_trigger_write':
>> drivers/gpu/drm/drm_panic.c:681:43: error: 'file' undeclared (first use in this function)
     681 |                 struct drm_plane *plane = file->private_data;
         |                                           ^~~~
   drivers/gpu/drm/drm_panic.c:681:43: note: each undeclared identifier is reported only once for each function it appears in


vim +/file +681 drivers/gpu/drm/drm_panic.c

813ca3aa8fecac Jocelyn Falempe 2024-04-09  674  
8790307566bc72 Jens Axboe      2024-08-03  675  static ssize_t debugfs_trigger_write(struct kiocb *iocb, struct iov_iter *from)
813ca3aa8fecac Jocelyn Falempe 2024-04-09  676  {
8790307566bc72 Jens Axboe      2024-08-03  677  	size_t count = iov_iter_count(from);
813ca3aa8fecac Jocelyn Falempe 2024-04-09  678  	bool run;
813ca3aa8fecac Jocelyn Falempe 2024-04-09  679  
8790307566bc72 Jens Axboe      2024-08-03  680  	if (kstrtobool_from_iter(from, count, &run) == 0 && run) {
813ca3aa8fecac Jocelyn Falempe 2024-04-09 @681  		struct drm_plane *plane = file->private_data;
813ca3aa8fecac Jocelyn Falempe 2024-04-09  682  
813ca3aa8fecac Jocelyn Falempe 2024-04-09  683  		draw_panic_plane(plane);
813ca3aa8fecac Jocelyn Falempe 2024-04-09  684  	}
813ca3aa8fecac Jocelyn Falempe 2024-04-09  685  	return count;
813ca3aa8fecac Jocelyn Falempe 2024-04-09  686  }
813ca3aa8fecac Jocelyn Falempe 2024-04-09  687  

:::::: The code at line 681 was first introduced by commit
:::::: 813ca3aa8fecaca9cf81f831d2e036d997ac3ee7 drm/panic: Add debugfs entry to test without triggering panic.

:::::: TO: Jocelyn Falempe <jfalempe@redhat.com>
:::::: CC: Jocelyn Falempe <jfalempe@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
