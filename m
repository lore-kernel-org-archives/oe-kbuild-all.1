Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FEA2EC0A4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463319; cv=none; b=HQ7bd7aBj+2eH3sNiDd37tq8OFq9LTO0bxp24OtOajO+mjLnO/rlm7qyzbjqssOTuxVQV67Mme9SxX51+hCE3g3N+n2n9bOr3QEKXh+HmVnulywOgPbQ6IkeQOQiYOp5n5zCC6bBzXceRA69rw/mroROvhr1jOtRFPQONwF9VM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463319; c=relaxed/simple;
	bh=qGf6kiaRUoxkZ1Eo9DoyfQFxE6mluz8Rhwb0fNtudvw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=paQ9EPUxp38s5HqWaHqhZKTgRWqKVZp/6HzN5EkFC29pjgwlsUjreqIfV3uKiPcRXhlQNcTrkneioii9c3w49aJXsC9OP1KATgYz+aqOVzeFeXaHhU2957j9kq8Dqn8p3DcMHakj6G1xL4JgWHR3pEFgTl8ComMUyb2v/xUfJXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gue2ytF8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gue2ytF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789463318; x=1820999318;
  h=date:from:to:cc:subject:message-id;
  bh=qGf6kiaRUoxkZ1Eo9DoyfQFxE6mluz8Rhwb0fNtudvw=;
  b=Gue2ytF8w6Etm9CkCshgLUty59Gkh9VCzELW90jtUSF75GICDodQX4hH
   uBUE/tCok2r6VcNuYu2zcqsa2oXympOaUSxwjmX4zKhpZQaNQqZpyau/n
   B2Tblhn25KDlxb8weacwqStgEVw53a5YiTMGR0R+JfMPjii7sPj3LSffZ
   w/JGtJKOLFJaK4Yoe8NHS7jfVVQ7EaOeuf7UfHyt5Mj+0SPghC78aAGEy
   NShptkgFLbXX27SSajUmNf8dScYTtVNKgoVSee4DMwTaHHmjxfm2JlJtu
   F4tX6LG6OusbdIYbCMyAsQYZZ1ZS3NjZjLzXjFU/WnYB4dm2YjHuOc+zd
   Q==;
X-CSE-ConnectionGUID: 7DEJuezJQ0iOWAoPYM1zVg==
X-CSE-MsgGUID: +3VTygqrQlinVqZxp9XFnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100975436"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100975436"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 02:08:37 -0700
X-CSE-ConnectionGUID: 4Ou9IQ2TTEaqEsak2GLV9Q==
X-CSE-MsgGUID: Qg6jiJKITuSzbmbXd7yn6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269628583"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Sep 2026 02:08:36 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6P9V-000000004I1-1Ek8;
	Tue, 15 Sep 2026 09:08:33 +0000
Date: Tue, 15 Sep 2026 17:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 325/799]
 fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to
 integer
Message-ID: <202609151725.dEukTjki-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 70a2c761c8b41d30ae891c3b8367364b4c4738f3 [325/799] bcachefs: Print sb_field_errors sorted by datetime
config: openrisc-randconfig-r112-20260915 (https://download.01.org/0day-ci/archive/20260915/202609151725.dEukTjki-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609151725.dEukTjki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151725.dEukTjki-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to integer
>> fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to integer
>> fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to integer
>> fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to integer

vim +62 fs/bcachefs/sb-errors.c

    56	
    57	static int error_entry_cmp(const void *_l, const void *_r)
    58	{
    59		const struct bch_sb_field_error_entry *l = _l;
    60		const struct bch_sb_field_error_entry *r = _r;
    61	
  > 62		return -cmp_int(l->last_error_time, r->last_error_time);
    63	}
    64	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
