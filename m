Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D5C847B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Apr 2025 18:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744570549; cv=none; b=M0zbgo9c3gd87+3dA99H6kI0XUuY0GrpKtdMyIFbPib2MH6mWRZRCI6cVZMAZ7BaYLE1XDHpizDYMCNpxXjvMYOFSKYxr4Q3FyXaq6YwOYNbaUVGTN1eFX19FgVv5LNgYg2EWAeBAv0H1Afps8ZlyXR5zelnB9JvB1Br6ELBw5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744570549; c=relaxed/simple;
	bh=47iSHJuWHHdYLpMm7l0viE8OYJitU45Qd5YDzb0Tb6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WUyDesuBVolySBZ8SeNygUfLm1ZLS/Klnq7qXM/bSBWRsJbwVJJSjEjwNypOGtYA2tQAiipWhjfkZPRrknyQVGgx/oCUJ6YzlKX3SjaYCmFNdqWLWo9AMCPrIChKTqS+vmi6hB4IjBJIB87cLWgejSabSXtLu1EanQvPeZmtVjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtBP1ct0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtBP1ct0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744570547; x=1776106547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=47iSHJuWHHdYLpMm7l0viE8OYJitU45Qd5YDzb0Tb6Y=;
  b=KtBP1ct0UpvCobEgXV05q8JUEj5GLyHbxB3orRpr3N8UjbJmhKMCrPyK
   pBNIjhswvQVfJY/pvXrBKATxTTDszu+rcAl3E9JruKflNUU8QM0cqNqVS
   Js+111sZ+1bFQC2TygYICydLg4UDl0pEf3TJ8ipqUPkDa7AT0WWe8VfQk
   toCEk8JOEbmIZe5GITCnUS4XUmwmG3ayZyUpSTFzHNwacP7ApiGbZvEwy
   R4/FTweooCanP7LIMEPfEe97rU7Gj6oPPhsg8B1tyvne3l8y6+CU2NuZv
   U6vvIc0O8m1if6ZqbRBVNS4Ht/uRf1ZQNkJwkDgjDVURAVxT241pxqqEC
   A==;
X-CSE-ConnectionGUID: HYm+RAvjRXGsSMSJRCBjxw==
X-CSE-MsgGUID: ilAQS7QXQqOId0dHfDryHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="71425919"
X-IronPort-AV: E=Sophos;i="6.15,210,1739865600"; 
   d="scan'208";a="71425919"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 11:55:47 -0700
X-CSE-ConnectionGUID: pOl1CgnpTHGrKtIy3oG05g==
X-CSE-MsgGUID: o3mElD+fSzS8MKJWHgJZOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,210,1739865600"; 
   d="scan'208";a="134792287"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Apr 2025 11:55:46 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u42UZ-000Coo-2d;
	Sun, 13 Apr 2025 18:55:43 +0000
Date: Mon, 14 Apr 2025 02:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:reftrack-dbgfs 6/6] ERROR: modpost:
 "ref_tracker_debugfs_create" [drivers/gpu/drm/display/drm_display_helper.ko]
 undefined!
Message-ID: <202504140239.8tFQ5OJu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git reftrack-dbgfs
head:   401a57bf3f51268e83dfcd6a333036a0615ed7c3
commit: 401a57bf3f51268e83dfcd6a333036a0615ed7c3 [6/6] ref_tracker: register a file in debugfs for each ref_tracker_dir
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250414/202504140239.8tFQ5OJu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504140239.8tFQ5OJu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504140239.8tFQ5OJu-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__umoddi3" [fs/bcachefs/bcachefs.ko] undefined!
ERROR: modpost: "ref_tracker_debugfs_create" [lib/test_ref_tracker.ko] undefined!
>> ERROR: modpost: "ref_tracker_debugfs_create" [drivers/gpu/drm/display/drm_display_helper.ko] undefined!
>> ERROR: modpost: "ref_tracker_debugfs_create" [drivers/gpu/drm/i915/i915.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
