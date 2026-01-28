Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A5F16A395
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 00:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769559607; cv=none; b=gkb8c9/HKgehgtmQzR/vHoph6wc/vCFznW2QykGijV7OZTIMTbdLDqI5mgMEvx1b/qZOQa9aSALCdC0T7sdJCQVu9XD6sESgx/Ew6I/EzQhdAyYNX2PwgQxLgF68lmUNy7OerUJYp158I3JTb71FhJklydxYPFhUHGu7JpnXl+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769559607; c=relaxed/simple;
	bh=jtz7gH25jx88/F6EKifRhEKKGMh2lOkB/t0G/W5+sZQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bt8O2x61R94n4cecg4xdLL2SmJ4mCWvgJ+Ku/rf+/7o7bISO1r4NAjQaYsCVdJCZxPw5kGwI3//r6AA3e2uo5RH5JuRq9VXwubEEsMpLDY+jlhM/Dsa9kueD9iBeKqc+U3wuAerPjWiEnhZ8Pti1hPUSfnb9m5iqFqUQlhuybsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6PNy9mk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6PNy9mk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769559605; x=1801095605;
  h=date:from:to:cc:subject:message-id;
  bh=jtz7gH25jx88/F6EKifRhEKKGMh2lOkB/t0G/W5+sZQ=;
  b=K6PNy9mkASAdHqMkoE94d2THvo2UWeG3pfCzVlLr99bTcgr9vMjOyjwL
   6fmQ9B7sB5rktFtd+dWWDvBd9l8pGKYVR3Y50hTfMECwWugf5zpkgrZEV
   T53OkWjvMa9P/Qxu5RuQJrCR+cf1hKYTlQNbLCC9TN3m55mfoePFmJTVf
   WP7svc6mBwLpXwEa8+IND5yhIW0XiWcmRZEXREXFMWEpqedT7krkiZbxE
   7eJQwZ7Kf3TVwY/TP428KVwzDIjSS0xiRwUAK06eM1+C7IcUZKAZdMcUu
   lSCdcwrNsMbRRm1BBFj/TzVDnqr24Ofbdr+FwBA8LV7W/c5IiYNmDVOrO
   Q==;
X-CSE-ConnectionGUID: KidtFy0xSD2ezR93dm86dg==
X-CSE-MsgGUID: UylO1AbPT7epaprw7OcT8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70482905"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70482905"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 16:20:03 -0800
X-CSE-ConnectionGUID: kccTH0OITI+XohRHQwXSbA==
X-CSE-MsgGUID: AgQfpYDORom2t+v22DWQWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208010754"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jan 2026 16:20:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vktHr-00000000Z3m-22k2;
	Wed, 28 Jan 2026 00:19:59 +0000
Date: Wed, 28 Jan 2026 08:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>
Subject: fs/dcache.c:2788:24-43: WARNING: atomic_dec_and_test
 variation before object free at line 2789.
Message-ID: <202601280811.uLPBZWvT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f97d9dcf53649c41c33227b345a36902cbb08ad
commit: 95a4ccbbe596b45264af5e3a019cb920c05ccffd dissolve external_name.u into separate members
date:   1 year ago
config: m68k-randconfig-r064-20260128 (https://download.01.org/0day-ci/archive/20260128/202601280811.uLPBZWvT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280811.uLPBZWvT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/dcache.c:2788:24-43: WARNING: atomic_dec_and_test variation before object free at line 2789.
   fs/dcache.c:407:13-32: WARNING: atomic_dec_and_test variation before object free at line 408.
   fs/dcache.c:407:13-32: WARNING: atomic_dec_and_test variation before object free at line 416.
   fs/dcache.c:368:15-34: WARNING: atomic_dec_and_test variation before object free at line 369.

vim +2788 fs/dcache.c

  2774	
  2775	static void copy_name(struct dentry *dentry, struct dentry *target)
  2776	{
  2777		struct external_name *old_name = NULL;
  2778		if (unlikely(dname_external(dentry)))
  2779			old_name = external_name(dentry);
  2780		if (unlikely(dname_external(target))) {
  2781			atomic_inc(&external_name(target)->count);
  2782			dentry->d_name = target->d_name;
  2783		} else {
  2784			dentry->d_shortname = target->d_shortname;
  2785			dentry->d_name.name = dentry->d_shortname.string;
  2786			dentry->d_name.hash_len = target->d_name.hash_len;
  2787		}
> 2788		if (old_name && likely(atomic_dec_and_test(&old_name->count)))
> 2789			kfree_rcu(old_name, head);
  2790	}
  2791	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
