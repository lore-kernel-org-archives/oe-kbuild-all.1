Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C1B200113
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 20:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765657418; cv=none; b=th2WQxHKicJgcbTmDJE92uANwLzPivF3geLKVV7RmhBaku8QO2t9m+FUWyu80Ulob4nLTHpt3ifgIK4kbMLXpNw6Z+PAn9wZavmOC56wexwuZKP1xmQgo9eU4A6W2gGLM+Zn6HiMJoHu8tUEkwjUkjEwy6JFB2QJolV0W53YsLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765657418; c=relaxed/simple;
	bh=qJYS7PCzAI9IEPUjHAqJkm9oyLDpy0Z2PG0NzbRyI7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E53s0lkZCs0AWaF6ZGF/sXmCQ5G1lUEs82yK8h4vN35hoavK4CTa9XjAG6a5xX3cY86kqy4di5/R5qFA+EfwQwnaDzndKdhkcjNYPAameGRXFiebzRAxr6S3M4GcKnlWzQ12gg7YDAWMVdaJE5zN0uggkxN9kG3TeDgPnxSPFSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkEaYDde; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkEaYDde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765657417; x=1797193417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qJYS7PCzAI9IEPUjHAqJkm9oyLDpy0Z2PG0NzbRyI7s=;
  b=YkEaYDdeFeL+BqLjicWluh1HqxwND/RCvJW6bvlndITpnEbMVgnvOaaE
   BF2j40pn2Dl8p1Xnom1HVOAxQkLlclzLn64BKCsKlPHHdXYUaIOamuXtq
   tnXtAMOkTEJv8KIuhsNj3reGucnqHofgCivc55ZX7bwmZbNuRPEo6zpbF
   Csn3jx6isBCgBVk3YWfgsyD+kkLui1Fk+kqRGM1aa3JcS1s490jE0mb8z
   CxJZhoY+TbkTWwzWAP7Rp9S33jzGElPmS2yIp68QYe+/Tk1NxTz9tR20Q
   wUjamvdl8S6uMjvrplPh4RGxP/1plEN0mnfleLU/2luYD6Cb+UsvKCZD6
   g==;
X-CSE-ConnectionGUID: 8e5u7lYNQi++Sv3rYRC7ug==
X-CSE-MsgGUID: dZE7p8geT5WEnqDtQT6ThQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85214883"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="85214883"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 12:23:36 -0800
X-CSE-ConnectionGUID: zSdqOosqRUuTpWN4VlI9CA==
X-CSE-MsgGUID: 5T53qL1jS5mJMgVi0Ci4aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="220749085"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2025 12:23:35 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUW9N-000000002Ae-0zlL;
	Sat, 13 Dec 2025 20:23:33 +0000
Date: Sat, 13 Dec 2025 21:22:43 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] mm/shrinker.c:688:6: warning:
 no previous prototype for 'register_shrinker_prepared'
Message-ID: <202512132113.VYGvNTzQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: f1dadc895ed84d664e6d2d008be8225d3b051db7 [50/50] mm: shrinker: remove old APIs
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512132113.VYGvNTzQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132113.VYGvNTzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132113.VYGvNTzQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:688:6: warning: no previous prototype for 'register_shrinker_prepared' [-Wmissing-prototypes]
     688 | void register_shrinker_prepared(struct shrinker *shrinker)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/register_shrinker_prepared +688 mm/shrinker.c

314369bb029a4d Qi Zheng 2023-09-11  687  
314369bb029a4d Qi Zheng 2023-09-11 @688  void register_shrinker_prepared(struct shrinker *shrinker)
314369bb029a4d Qi Zheng 2023-09-11  689  {
314369bb029a4d Qi Zheng 2023-09-11  690  	down_write(&shrinker_rwsem);
314369bb029a4d Qi Zheng 2023-09-11  691  	list_add_tail(&shrinker->list, &shrinker_list);
314369bb029a4d Qi Zheng 2023-09-11  692  	shrinker->flags |= SHRINKER_REGISTERED;
314369bb029a4d Qi Zheng 2023-09-11  693  	shrinker_debugfs_add(shrinker);
314369bb029a4d Qi Zheng 2023-09-11  694  	up_write(&shrinker_rwsem);
314369bb029a4d Qi Zheng 2023-09-11  695  }
314369bb029a4d Qi Zheng 2023-09-11  696  

:::::: The code at line 688 was first introduced by commit
:::::: 314369bb029a4d7f5018a64217e28d549e42fb65 mm: vmscan: move shrinker-related code into a separate file

:::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
:::::: CC: winterddd <tianruidong@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
