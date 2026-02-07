Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4CB1A9FA7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 10:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770461683; cv=none; b=ThL+Ri4Jj17TMT060YC96dR7vba8kSgQAafiDY2STTT5h+rOOqK4akDYQbtpH3DZaZDybAOrAa9XM4dLNCoxwtzEphgtvvDvpWYmUbkVmu/rVKWeImpjDUfFSiS40MD6vFxY9qSA279GlQja0+OJUbp5Sv7dfSrzElULe7RlS8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770461683; c=relaxed/simple;
	bh=UKUij57MUql8/qTYspcOdOz1av6QKZuDhO/+vXShYLs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CbuCkjigYZyUood9ipAVVwBaVSOFza2tlGpy2am3xNcc7OUSQA6tx9Hqf0O0HERGjSjAIVelZy5iKbA0aP2ta9iJ+0DoruhQ+1nx/V0PF7E9OLbMPanHvmvsrfE8hqSCi3QlgNo9ybnENDWwXEA9vbDHpgHY64ADm5DrVRuR7E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfdcJuwS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfdcJuwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770461683; x=1801997683;
  h=date:from:to:cc:subject:message-id;
  bh=UKUij57MUql8/qTYspcOdOz1av6QKZuDhO/+vXShYLs=;
  b=LfdcJuwSMtIM6DJKhSMUWPeMotK/1WzWJ8s4Y+Ss8sbHnZY3lBSMCWX/
   Pu6a91NKQT/UbHqbgKhMDuIUwuWEgNk5Ic4wafe0kgmbRhU+bPGBGhum+
   REh8RI47USedICS87ZGxdpDFYd/kHqv7FboEdpct0lO6kdmkrx6Yiy8mh
   as1usOV8BAmVDr7wysUHxPEbNdqo9VoTphyykBB7tGAs82RVfhIJEkquV
   /Xm4+Wxlm/LgL9/Q2naWkc4DhIjvZ27XeAsR6RI0FlP49c8ubw3hJ/qve
   VWD/YiBSccsH6H/NQbo5/wlEQ9DEeI4tw8qIcsq+Iul/ZQMAqvHqFuOAw
   w==;
X-CSE-ConnectionGUID: CDb1n1eKTlK/PSnDHCcRjA==
X-CSE-MsgGUID: CEfREYvrTeSiWes9l5nrAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="89229682"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="89229682"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 02:54:42 -0800
X-CSE-ConnectionGUID: FNEW3nWURWOBMVNxH8t7+w==
X-CSE-MsgGUID: Q48+0c/pTTSIH06cLxWU3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210194716"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Feb 2026 02:54:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vofxW-00000000lau-17Lo;
	Sat, 07 Feb 2026 10:54:38 +0000
Date: Sat, 07 Feb 2026 18:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 342/347] fs/bcachefs/util/util.c:476:1:
 warning: the frame size of 1036 bytes is larger than 1024 bytes
Message-ID: <202602071855.ZANqdJjk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   805636effec53f8729424c23a39685a76744c81f
commit: 901bbf17808704205ff7ed14810b2a2c602c63af [342/347] bcachefs: Add bch2_time_stats_json_to_text() printbuf wrapper
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260207/202602071855.ZANqdJjk-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071855.ZANqdJjk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071855.ZANqdJjk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/util/util.c: In function 'bch2_time_stats_json_to_text':
>> fs/bcachefs/util/util.c:476:1: warning: the frame size of 1036 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     476 | }
         | ^


vim +476 fs/bcachefs/util/util.c

   466	
   467	void bch2_time_stats_json_to_text(struct printbuf *out, struct bch2_time_stats *stats,
   468					  const char *epoch_name, unsigned int flags)
   469	{
   470		char buf[1024];
   471		struct seq_buf seq;
   472	
   473		seq_buf_init(&seq, buf, sizeof(buf));
   474		bch2_time_stats_to_json(&seq, stats, epoch_name, flags);
   475		prt_bytes(out, buf, seq_buf_used(&seq));
 > 476	}
   477	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
