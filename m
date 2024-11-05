Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB4B21441E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 23:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730847895; cv=none; b=ONYo3y7AIgF54HYiaJxqbd1Myd1OLYBnhGbw2YTNnEASHK4XhqmwwFyEp49w99ubomhbH/7llAL/iNgP7FwgnPh75sNeQb1gGmAG4MIkljmPdMvq2GgGKqq9dFTKn11+xx1xA6y+7hHlp7WLEMDUPAGC2r+HngbiKmBj3qofSwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730847895; c=relaxed/simple;
	bh=1oqdj3tBKBYW5FvOBtC5bU1wi8ylXUHzV7oahrFapI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1cADFVNTxfh5+u6P/Yc9PGy1/0XT1fY3d20QQGmw0nzFw52S05XgL8YsAY7WvN/ObVmsQMPwXM679Z4XVjwT0x94DixREjY/J1WK28nuN+MBZVYUERH40pmJI7iPP25jOFLSEnw/qfbj+WLLfyxGwKBXoZ+GLqUUIXpzvKZ3mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9foGuAc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9foGuAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730847893; x=1762383893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1oqdj3tBKBYW5FvOBtC5bU1wi8ylXUHzV7oahrFapI0=;
  b=O9foGuAclSZDnrYW1pqjqjYZwneT5rvbCELIUjm89cegtuneaQuSiXQN
   UMV8DKV+xGV6bS6/UaSpDwciAY/jZBjQ0oEV4VTcYM/JGnr2F5ZDktByR
   Ye8SBUUjfcxjrh4+HcqScMy6VQzonwidfIToMW4a/17mn5zvXizw4SR7E
   lgtM7iOeVecpWkfWqIQNfojipJqwGiZRuHvYxXAuR1jpxOZtCRuvgAkGQ
   Ppb2WQPgzysICTtJKMfMbmjpg4/MF3jgT3CjeAUbnHirfxRzmwNHggGUV
   hqqi73UhInKHKv6BFwbdknmz75nEKd4xuZIjMG7nrx0xEuueYUBw6W/Bb
   Q==;
X-CSE-ConnectionGUID: GWdOrxYWSxikUYQSgkRKFg==
X-CSE-MsgGUID: lqvbZqteQ6Km9cSx5OZseg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42002974"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="42002974"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 15:04:52 -0800
X-CSE-ConnectionGUID: 2NMqHK+5QBGFs1bL8XnVkg==
X-CSE-MsgGUID: wZ6WcuS0QFmJmeA6RhMqCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="107531476"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2024 15:04:51 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8SbR-000mYf-0P;
	Tue, 05 Nov 2024 23:04:49 +0000
Date: Wed, 6 Nov 2024 07:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Disseldorp <ddiss@suse.de>, linux-fsdevel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	David Disseldorp <ddiss@suse.de>
Subject: Re: [PATCH v2 2/9] initramfs_test: kunit tests for initramfs
 unpacking
Message-ID: <202411060625.exdzruA8-lkp@intel.com>
References: <20241104141750.16119-3-ddiss@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104141750.16119-3-ddiss@suse.de>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on brauner-vfs/vfs.all linus/master v6.12-rc6 next-20241105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Disseldorp/init-add-initramfs_internal-h/20241104-223438
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20241104141750.16119-3-ddiss%40suse.de
patch subject: [PATCH v2 2/9] initramfs_test: kunit tests for initramfs unpacking
config: arm64-randconfig-002-20241106 (https://download.01.org/0day-ci/archive/20241106/202411060625.exdzruA8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060625.exdzruA8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060625.exdzruA8-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x0 (section: .data) -> initramfs_test_extract (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x30 (section: .data) -> initramfs_test_fname_overrun (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x60 (section: .data) -> initramfs_test_data (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x90 (section: .data) -> initramfs_test_csum (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0xc0 (section: .data) -> initramfs_test_hardlink (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0xf0 (section: .data) -> initramfs_test_many (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
