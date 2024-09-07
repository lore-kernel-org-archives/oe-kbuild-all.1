Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B8B381BA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 09:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725700873; cv=none; b=Qv4T4ogDrFs/rJFg9/f3I/hkvkRjjJxf0AY5jlnq6SXwJbndd2ZlowtPEybFD+aYwWo73SB+by6cNzniwleV8ZRZxtf8tccYeOswSXG1lPDxVsF8hvdlsk4VahIP6xn9Ni7pnhoLgE2avX05NBv82K0Ma8p2ofnoi58FidG8ETg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725700873; c=relaxed/simple;
	bh=6pzWAMIU7duGhEKH3cATIcFgkenpPPY00y2C7YfUZ2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T88TGsHEyMEfKdYvOc17KgMJVqbuWMcuuQuYMWUJjcojgol/6Z706rN2XxjLF7v497WX3X28kSJUzP8IZT59SMaC4QbHThs77SjvcWPj9qVksUv/jvaX7uMAXX0nJVLCUieGz8dpHFS95Dr9wBunAkh0AzkSZMUKK1/ElreLJ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFxq7rfI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFxq7rfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725700870; x=1757236870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6pzWAMIU7duGhEKH3cATIcFgkenpPPY00y2C7YfUZ2M=;
  b=CFxq7rfI51SoJxKXvID4FS6CCq6bpWJNxN4f1YkYP5kAXUUqhjU4n7iL
   6uHCCJf3g9NfiQn9ByEmGYVbi/EYQeZ7K2f6mYalCuWtD29+fPJa0EQCa
   g9ffM6Yzm7zDuEsZabcy7OVaxIue+J4b4XXVMrqBfSNzYUlfVrCISj+ba
   XH/co0Y27b+ZQezNHjj2G7HcAVEqsmNJi+PkrU11CETs50DJLO7VcDdLN
   IQE/jAdiLNJIn28P0qT0di8aT6O7egnAm8MwC/nktToZ85WU1ga8MWPjL
   buvvL2ngAlmBPxVfMYHIyrpTApTIsd/XUEA1AQEwYWvkNKfY6v9mgpSZ1
   A==;
X-CSE-ConnectionGUID: RvxHvVS3SnClb+o4ipGbYw==
X-CSE-MsgGUID: JnZGMGBJSUqR6NRLs6gdDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24009977"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="24009977"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 02:21:10 -0700
X-CSE-ConnectionGUID: VAWdsfl8QdG5AtCurYHUMA==
X-CSE-MsgGUID: 6Lp1nKfNQsGbBkZ2UDkhjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="70302710"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Sep 2024 02:21:09 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smrcx-000CNE-0a;
	Sat, 07 Sep 2024 09:21:07 +0000
Date: Sat, 7 Sep 2024 17:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 3/4] error: unknown unstable
 option: `patchable-function-entry`
Message-ID: <202409071754.PjELxpkg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   7bbe49880682fd4373cbbd23e2494fe1befb3a79
commit: a990684f4e7d91c68c19f64ab1cd776b5af04b0e [3/4] ANDROID: Update kcfi patchset to v2
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240907/202409071754.PjELxpkg-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071754.PjELxpkg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071754.PjELxpkg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: unknown unstable option: `patchable-function-entry`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
