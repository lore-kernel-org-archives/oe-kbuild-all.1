Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68CB1D6195
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 17:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758907087; cv=none; b=iqwqsyYDwrJG8RIj2YL7UKptOTzoQMYoOqxOmjzhj2EQaH7TAMwLUt+qrhXuWiFN81JjSPFDtwuNhSI7EhVNlweE4pev2fR27YVCWgVdQ/P4YTetRGlVhh+UOm/1Cc/KWaivtcYpwJGNjW4IEbXO1aZvJmaUwG0v8WcH2VCyOX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758907087; c=relaxed/simple;
	bh=twsiJ2qakSUahgfw3UafpVybSK1kHf5zT13jX0k1knI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWk4fKBlQL8LXVm10HfqBoaIVfhooSbZvpW4GImV5RFBiIeHD8JvLq06mCRugo+HcQTcXB5ct3701UzrIQzQYjrWGegAe1mPl2Tx8wxHdsdsRPwPsn3tnCoj4Q32R8VpOGFJTgFo4+gHQdpbRjLApj+cv8NmVgd98uBbeDhd7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRVYif3b; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRVYif3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758907086; x=1790443086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=twsiJ2qakSUahgfw3UafpVybSK1kHf5zT13jX0k1knI=;
  b=SRVYif3bfBwAdRGk5Aw3pUnTYr4+IlJI1mmfQOy/OSBMYMPJiF2AznPn
   DEskhxAQPlTGLAjVNCGgIBjb3jHPSVvdqCNk2l+32gwA5+dgoqgnCb538
   0XH/0qmdkE6I6d9ffkm8bcFqnMkLLP1Iy971L3l3g7WDyo1nQv61Ekd6E
   xxyjSf/cBho5q20jn/PGYkWs3VrwsJUiFlF/ysSgP19PBP9eXNhndmIP0
   W646h94HGM86OWZ8YUl8Nu9yx4X/S9m35pNPc/xRxvCSbaMJKsexLPE5Y
   8gHOCCwzF80p2gzQWPzAlQn0BPC7cjlnd6kRlNMveAkfceaeuWNXSV2xY
   A==;
X-CSE-ConnectionGUID: 2kBVqfQsR021XcBhOsa+MA==
X-CSE-MsgGUID: EZz6VHuiQH+YsfnUzteCVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="86688825"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="86688825"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 10:18:05 -0700
X-CSE-ConnectionGUID: T7ilq8D8R3e2X6iZgxzwFg==
X-CSE-MsgGUID: Toex+4s5TAm/oJqPr9lAlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="177511108"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Sep 2025 10:18:03 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2C52-0006St-18;
	Fri, 26 Sep 2025 17:18:00 +0000
Date: Sat, 27 Sep 2025 01:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@ownmail.net>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 09/11] VFS/ovl/smb: introduce start_renaming_dentry()
Message-ID: <202509270016.YwqJ8gSc-lkp@intel.com>
References: <20250926025015.1747294-10-neilb@ownmail.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926025015.1747294-10-neilb@ownmail.net>

Hi NeilBrown,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on next-20250926]
[cannot apply to driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus viro-vfs/for-next linus/master v6.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/debugfs-rename-end_creating-to-debugfs_end_creating/20250926-105302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250926025015.1747294-10-neilb%40ownmail.net
patch subject: [PATCH 09/11] VFS/ovl/smb: introduce start_renaming_dentry()
config: x86_64-buildonly-randconfig-005-20250926 (https://download.01.org/0day-ci/archive/20250927/202509270016.YwqJ8gSc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509270016.YwqJ8gSc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509270016.YwqJ8gSc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "start_renaming_dentry" [fs/overlayfs/overlay.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
