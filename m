Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355842F86E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 01:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725930665; cv=none; b=BBJ0G+I2sJjrKANYdwCLzBdiZoe9YBMvBCI9coBMkTbxYzR1ndQ0uE5iy7LJNpirIClSp4dUpkn8WBXcHGBH7Ng7tsNLOLbHMDlVIEiyModdp8bLFk9lcs8Y3oClnVUj6xJyfHFzMq6p638Ug9sMRTM6/O1JGAeJ8KqGXYO1iXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725930665; c=relaxed/simple;
	bh=Ln/eZsOR5N5uXgvqkzFjUZnYweZGIjNJXndtHEX4Cjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=niornVCKdwZO5jViwl7ZaBHDrJXhhIrELL+C5sD22UsD9QWfaiB5L/vJGrCVFRS/QoaPs6gAHWviEQKFD+DHzbFAsWAyq2Xj3fjASX8iYBdqxqqWafwbYTC7qX0AHUkfaG3s6eiAdiTClAgQO16f8slhkxtasTCh2NgQpGEnsXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2QEh3YQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2QEh3YQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725930665; x=1757466665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ln/eZsOR5N5uXgvqkzFjUZnYweZGIjNJXndtHEX4Cjc=;
  b=H2QEh3YQVcktJUUIbj5vLISa4dhGd8m9z1UqFP1gj6JkPG3bNzBOthPU
   yFRnDiqXomLEJPPo4263gdV18h5J3rzhDMxC84ui40NF9NcT6dBtUhBkL
   0/fntfo5DobTeiJCkYoKG8Gnh1rBm2zQfuqmhd424RaDX9QY7FirXvJ1W
   8QaSHStPIf8ppibXsWswaE2C0PMXv++uyEZJpzpjkLMG3G2ZcqUIn6YTN
   AACGDWpYbEnZ842gEb17zkQX3HjmiKQM64pcaGrGjlIJp0WSc0utZ5RYe
   EoEiBvqYMj5thmbkUCctZnxBLKgiB6lt56TCoJ60g90OYVYM0Kmalt4cG
   Q==;
X-CSE-ConnectionGUID: CpOfm+bWSoudqvjAd60hkQ==
X-CSE-MsgGUID: rH5sGraCQIGQNjeIPAlA8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24524278"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="24524278"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 18:11:04 -0700
X-CSE-ConnectionGUID: 5HWuPg7jQGmvlHF6jCAlbw==
X-CSE-MsgGUID: /GG6tjK9Tfu40hS5dZyv5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="71462342"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Sep 2024 18:11:03 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snpPI-000FRE-2q;
	Tue, 10 Sep 2024 01:11:00 +0000
Date: Tue, 10 Sep 2024 09:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 189/258]
 fs/bcachefs/fsck.c:2165:13: warning: 'fsck_trigger' defined but not used
Message-ID: <202409100915.UI3kkUEY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 5fcd854fec2d5821b0fa82248e56fff7bfd17673 [189/258] fsck_trigger_fn
config: x86_64-buildonly-randconfig-001-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100915.UI3kkUEY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100915.UI3kkUEY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100915.UI3kkUEY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/fsck.c:2165:13: warning: 'fsck_trigger' defined but not used [-Wunused-function]
    2165 | static void fsck_trigger(struct bch_fs *c, enum btree_id btree,
         |             ^~~~~~~~~~~~


vim +/fsck_trigger +2165 fs/bcachefs/fsck.c

  2164	
> 2165	static void fsck_trigger(struct bch_fs *c, enum btree_id btree,
  2166				 struct bkey_s_c old, struct bkey_s_c new)
  2167	{
  2168	}
  2169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
