Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52369286413
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 12:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759494309; cv=none; b=oh5MWvrnX8QuoVd6TC6Ms5T6FY7oOPa2R6Y8dJPiTAbXzztytSWfPiwLVUk2oR9e4UJGgHD83qNFsTudDsSgVrDsZG/WqmppgKDYr6Hfol0Hep0khC+xWkYc4GW5s0KTMXMBM7xbM8nBwrz++eAO5A3mdFb3TdFwmeiWsLBSfhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759494309; c=relaxed/simple;
	bh=ew0QFqPkAjDFfKfIi57cT4lxbTo+lfZIKq1UzSZ7OzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YVfWSCyjBuDPs1yPBRx22FAboKooV3/xzLGa5XoDmGrsE0Y8Pc47tGuyuVFOBkYAhe2K2PE7XT0Af1M6/qAOjQH7h8InJTAu/qz/sx4FFPFbGnjJZX1t+nbN/e/Ya25hYHHf3LmYPLBCbFsH56aRSxi40bf2qUgJZffGqv/d8hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlDUKmgz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlDUKmgz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759494307; x=1791030307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ew0QFqPkAjDFfKfIi57cT4lxbTo+lfZIKq1UzSZ7OzM=;
  b=jlDUKmgzryJr7NjtmnAoGoFlx6d6uliCpDh9FErXBZc7eL3mFwJED1X/
   xheoZ9zc4G/ZgS3C2YerJog9HWTz3LKWr0rqXxV8ZpjQMA7uOZ4MUdiAA
   PQ/5gV7xvrsp/cvosPWJHeHEHFYcSrHAZcW+/vKssB4zqi2G1KL9xo1xl
   q4l1+Rvfyu96FUifJAwwLpOydDqn+1rkaI0+2vhLNtSThcxzaN0wHsWRn
   cnK48CW10g2wrCkllRRG9PFovO7DM2ErflxODAX5JauqHfF9XbA6oATN+
   c2zNKp9nY1OxQy0dlbd6kKF95pdKZhcaxrRkh6mm2DA+DBgz4hyhegDkB
   g==;
X-CSE-ConnectionGUID: Q3VvWUv6QS6uVxLBMsUu0g==
X-CSE-MsgGUID: ppDa2HH6QEaY0q2lL6D9jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61822261"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="61822261"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 05:25:06 -0700
X-CSE-ConnectionGUID: YF0fsgBhS6ajDNB0k3kocQ==
X-CSE-MsgGUID: 2KKjB5Q5RqG3HEAKslSgnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="178919782"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Oct 2025 05:25:05 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4eqN-0004Wx-1U;
	Fri, 03 Oct 2025 12:25:03 +0000
Date: Fri, 3 Oct 2025 20:24:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 462/470] fs/bcachefs/extents.o: warning:
 objtool: bch2_bkey_ptrs_validate+0x3ba: ignoring unreachables due to jump
 table quirk
Message-ID: <202510032011.Ijh3JUIM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   e8aac71cdf09d575bf858ec1d31eeb85d258a2d4
commit: 6b5a32ce9d297742a07435d24f1765e782f1100f [462/470] bcachefs: bch2_extent_rebalance_validate()
config: x86_64-buildonly-randconfig-002-20251003 (https://download.01.org/0day-ci/archive/20251003/202510032011.Ijh3JUIM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510032011.Ijh3JUIM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510032011.Ijh3JUIM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/extents.o: warning: objtool: bch2_bkey_ptrs_validate+0x3ba: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
