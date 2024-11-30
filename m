Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D239F1990A7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 13:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732974430; cv=none; b=DB5cr8+hduvK6HyRZjriaLpTqH/E2EfqVvxOmTRMEh1rpBSHQeCuV/ld4sxaCNxv9/KiOu2wrzJPcw7wRz2wxXNn+J9dO4RhR+kcZnx4wNzgBBgWCKwgvjt9CjZ+6l0Re1YH3+RRHi1wBHrRAkKPaoN3YlTT98TtncGxoF+iy4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732974430; c=relaxed/simple;
	bh=H+rY7/Fl+jf+eafxrQuwkRyzbnyJTaL3h3ycW0bXtfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=heXiIlAI8uCxs0My19zSnnoDeX2cn9Z4bACFp9mvayoVkBWqieTb5yxMMMhFOdVEnweK3mqU58lgHeOIjsDlJwPdx7rKdLHturU5ZMrO9eBEXcjgAVug8XpmkkKskHvgGqUfN9CONt+a8904ae7C4vpW3Q9n03nZi9GAkrOjp2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpxh3f9J; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpxh3f9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732974427; x=1764510427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H+rY7/Fl+jf+eafxrQuwkRyzbnyJTaL3h3ycW0bXtfA=;
  b=bpxh3f9JjBHs2+JFl4GDcAsDh88mqEyHnlWmiKTNxU7o59cI/njcWuzK
   P4znWr9tCJqevHhqTvbV9VDxHEhXPg1Hk65mY0gwMnjcQtCDsu4yI/gVv
   WxrRyDXfB7dTjlC34OeZKjhkRjuUTqq/9mKeJyfcWE7R4grkpxCGehKcy
   fzXvD8pnlZAIdA4cFADggASQPk1hoWKU4HY+PIG0lLuzDb5AbgXa5a36B
   kA2F+6OSR3EWS+ay4eNu2Rwj3DushiiyVgUxqvt7tXzgUOVxrZoEkjcsR
   9fcH46kpfb3uDgpBQoLBssW5rMnQYIpkIMWhtJMA3ykGRanWxvv//yRl/
   g==;
X-CSE-ConnectionGUID: xEmJ508MTAOdq0iTEqs3Eg==
X-CSE-MsgGUID: keoxWkAFRSyrqyoNz2YVQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="43670989"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="43670989"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 05:47:07 -0800
X-CSE-ConnectionGUID: cnpqhUhKQ/mGMC1FnifZMw==
X-CSE-MsgGUID: SJfzvVO5QwasiPLeWoltgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="92503985"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Nov 2024 05:47:06 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHNoN-0000hn-2w;
	Sat, 30 Nov 2024 13:47:03 +0000
Date: Sat, 30 Nov 2024 21:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Manana <fdmanana@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>
Subject: WARNING: modpost: "cmpxchg8b_emu" [fs/btrfs/btrfs.ko] has no CRC!
Message-ID: <202411302109.AIAUz8Er-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2ba9f676d0a2e408aef14d679984c26373bf37b7
commit: 1020443840569535f6025a855958f07ea3eebf71 btrfs: make the extent map shrinker run asynchronously as a work queue job
date:   3 weeks ago
config: um-randconfig-r053-20241130 (https://download.01.org/0day-ci/archive/20241130/202411302109.AIAUz8Er-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411302109.AIAUz8Er-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411302109.AIAUz8Er-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "cmpxchg8b_emu" [vmlinux] version generation failed, symbol will not be versioned.
Is "cmpxchg8b_emu" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "csum_partial" [vmlinux] version generation failed, symbol will not be versioned.
Is "csum_partial" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "csum_partial_copy_generic" [vmlinux] version generation failed, symbol will not be versioned.
Is "csum_partial_copy_generic" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: "cmpxchg8b_emu" [fs/btrfs/btrfs.ko] has no CRC!
WARNING: modpost: "cmpxchg8b_emu" [lib/test_lockup.ko] has no CRC!
WARNING: modpost: "csum_partial" [net/batman-adv/batman-adv.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
