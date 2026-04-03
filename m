Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2E543147
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206022; cv=none; b=ONgmQJL+1MxRceDS+sp0AFSgXx0zhFjtH1h3q6LqSYqT5Kjej5k3tLbsrUMNJUDVnWDWOdKEqLzrnuaIEvrMNcrgnKI5YofrFdMkENXS2Pl1pOWuX1Hy5v23iPna+Px3MSu3x4nsCgCj2FjcPHiNl4yTw3+kRhDYV6vNlXprFlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206022; c=relaxed/simple;
	bh=uonrBXXzf7GvO8JwvUcBBa12zMxhiBXlpsrUcVvLdD0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J6uJ7TZhMeKbUPG/XuPcpd7u1xVwNAf1O2bHujYMU6rQpDgL82LKq/YEBddz8uCqb8S32OJyMEqZBSL0CSkUD5Rp8RRv+ttbxg4UFiXVjOGREfru5pLNr/hxUXtzwKEGwpRShpfGo4j/UMXAVC0fcs9H5FWZgFZyGbeKWzzl8SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnJ3qS46; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnJ3qS46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206021; x=1806742021;
  h=date:from:to:cc:subject:message-id;
  bh=uonrBXXzf7GvO8JwvUcBBa12zMxhiBXlpsrUcVvLdD0=;
  b=VnJ3qS469ardJjjlR7+PTg7HaTah0JiHA4Zz/EQcm874vwcREi84BMFx
   wEJu++o7DCJJylRMPgEW7tsl/Ars/++qbnIWtvML2jZuxEiuKTT9uGksh
   BC7uuXnaNFuJfc9AOTI+Q1AltrS/QAzM9guTDrXZVaH49VCaOw/YwK9C4
   bSbyEM1/+TmmYI9pzyn6uh40tDuVQfoTkf+OWOcj1Wj3c6hW3x+yqatp9
   eX9NlxXwfL0tTtRRS3nPxt3+xAE/9wsbhO6zcviZQJzx5iBRyTbDXKzUo
   bHzCwoB/Okgvr0CbklmUJOmlyLr2lbgnXSBF9VHYVhtq86Xr5zgj0gB+a
   w==;
X-CSE-ConnectionGUID: fwqNzrrAR2WniP0QQvewwA==
X-CSE-MsgGUID: xG8H+GcsThq+rPUFpDDxHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75312092"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75312092"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:47:00 -0700
X-CSE-ConnectionGUID: azFzrZ22TVekLSvxUQFRSg==
X-CSE-MsgGUID: tKxxeU34TQiBJJr+RodsuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250287300"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:46:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aB6-0000000016u-43Hx;
	Fri, 03 Apr 2026 08:46:56 +0000
Date: Fri, 03 Apr 2026 16:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 69/69] ld: discard.c:undefined
 reference to `__udivdi3'
Message-ID: <202604031327.JVgQOUnN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   a62fe8d9039a9f2f2741f0f3d905da41fb9f7936
commit: 11995b82f6c965c0723f5d6bca54cb170b2e7211 [69/69] bcachefs: opts.journal_rewind_discard_buffer_percent
config: i386-buildonly-randconfig-006-20260403 (https://download.01.org/0day-ci/archive/20260403/202604031327.JVgQOUnN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031327.JVgQOUnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031327.JVgQOUnN-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/bcachefs/alloc/backpointers.o: in function `bch2_bp_scan_iter_peek':
   backpointers.c:(.text+0x5d6a): undefined reference to `__udivdi3'
   ld: fs/bcachefs/alloc/discard.o: in function `discard_sectors_to_release':
   discard.c:(.text+0xef0): undefined reference to `__udivdi3'
>> ld: discard.c:(.text+0x112a): undefined reference to `__udivdi3'
   ld: fs/bcachefs/data/io_misc.o: in function `bch2_extent_fallocate':
   io_misc.c:(.text+0xcdf): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
