Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9594523C9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 01:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736384538; cv=none; b=aIINJOD6sjeWbGV4qmu0J6wRx9U/fLdiMmgu3TBDp1Uw+wetBFoDg/pLxey3ZJjQaK6mwCeYf/HgaF4aPAmAurkZOVZ5+HXKX85P58U5RmjY2ZtsNomjQyYvl59jdfzUkNh4LS93LAnc2+HSLZqfN9uEh3D8eENxqvg7KXywG68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736384538; c=relaxed/simple;
	bh=xh1QadAMNNazKyKAE0fExaYpapkvJ3f8aULIVd1mkBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kzS0GUdLK9J8pNzUppbPjICWeugywRDVeNXdtjY8DNkE3WTipfM7ZsqgOxEiYeaa7xUN9WTglkamoSvG3xdStgtANEimqVr7x76MfGFVPGKBoGWRAWF7GqRJrtlSd3Xcg6acXD86xyXN9N7cQtO9Sl0v1MMdLoPbDsSTajgOluk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqWETUZw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqWETUZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736384536; x=1767920536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xh1QadAMNNazKyKAE0fExaYpapkvJ3f8aULIVd1mkBw=;
  b=ZqWETUZwOWF0mfOgmWPQ6wTkwQzr7soZWhVGnFqDiiVCKBJQs7tY2HAF
   rqP6ieP0kfeyNVHdKGzuKZp1H2GXVaz4YvmpuKt9y3MlH3wXddfw2tR5N
   QWmPo7nO60i1IdvpegqkW94Tzv6rN+ro5YoxzKym0poUBE6I4KgxL8ah0
   yjdJ9iEk0hxRztrkxOPQtU3GPFeIjyycL7GM0C6yrOZUMEF0ol5a1KWWR
   DqC8HksB0DWG4oHsxYbCSgZ3K2YO892GXTGFmpOHWVHkCdrtYoD0yaO/l
   Mc3RPZU6rcFchu7WIostEGx+3CdJvs/gQ20ku40tHPXI2zYgCzi4yu2dC
   Q==;
X-CSE-ConnectionGUID: sC8uPkCcQkO9rt1dFMrSxQ==
X-CSE-MsgGUID: JiUUGa1XS8K/XJZMoBPqpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="54175950"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="54175950"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 17:02:16 -0800
X-CSE-ConnectionGUID: vgRnDltzQTmHvJfgfNIh1Q==
X-CSE-MsgGUID: FAUd8u2IRg6NmIX1zZo6LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107300782"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jan 2025 17:02:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVgw9-000GsB-10;
	Thu, 09 Jan 2025 01:02:13 +0000
Date: Thu, 9 Jan 2025 09:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 12/20] warning: unescaped backtick
Message-ID: <202501090839.KVNqHNxf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   497d0dab0af034c34b987f1b37db1df4c45a1b7e
commit: 1ad2d1286e124e1c15e7e5fba2383d26f3f77618 [12/20] rust: Extend cpufreq bindings for driver registration
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250109/202501090839.KVNqHNxf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090839.KVNqHNxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501090839.KVNqHNxf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unescaped backtick
   --> rust/kernel/cpufreq.rs:786:34
   |
   786 |     /// Instead the `Registration` is owned by devres and will be revoked / dropped, once the
   |                                  ^
   |
   = note: requested on the command line with `-W rustdoc::unescaped-backticks`
   help: the opening backtick of a previous inline code may be missing
   |
   785 |     /// Same as [`Registration::new`], but does not return a `Registration` instance.
   |                  +
   help: if you meant to use a literal backtick, escape it
   |
   786 |     /// Instead the `Registration` is owned by devres and will be revoked / dropped, once the
   |                                  +

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
