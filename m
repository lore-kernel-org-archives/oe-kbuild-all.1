Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEEE17C5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 05:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FgBRUSwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698990459; x=1730526459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SvI0gsCLde9VBcSWw9KWsGJRkxy1k+YErvOsA8semxA=;
  b=FgBRUSwEVr8Ix0O8gOLWahvq4V63WmXMkzL0jPaw6EvztUoeKlxht/BN
   MHjcIpU4/guWMY1X2fnhEVBNcGmxjCnGmwMe0IsDAZz52v+KdQ/Fq44tS
   1sDdTfibTjZH9Ya2icai9OIPVXH29hTPOwreASGKYy+GShu8M7G1QRcrn
   oOkcDsETYRHrnJV73nve7CMatL/V2Aa4/kB3ItHgUZrpkXkgBoHzNR2FM
   DXaKAcMKq5UqZ/rRZJwBD3B3b1jZIRcguWMDgy/A95i593vgdOGAC+GEH
   V+6I1Uk6LYkEpzjiMVZ080EDLIzrkKJUtL2TVJr63lV4d6Rx1hsH+V7ew
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="455373303"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="455373303"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 22:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="905237565"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="905237565"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2023 22:47:36 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyn1q-0002GF-1s;
	Fri, 03 Nov 2023 05:47:34 +0000
Date: Fri, 3 Nov 2023 13:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 15652/16110] fs/bcachefs/sb-members.c:422:30:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202311031313.UUxwfuQJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e27090b1413ff236ca1aec26d6b022149115de2c
commit: 3075aca3c30cf4554dfa67c02113aaf8220348e5 [15652/16110] bcachefs: Add IO error counts to bch_member
config: i386-randconfig-061-20231102 (https://download.01.org/0day-ci/archive/20231103/202311031313.UUxwfuQJ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031313.UUxwfuQJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031313.UUxwfuQJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/sb-members.c: note: in included file:
   fs/bcachefs/bcachefs.h:958:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/sb-members.c:422:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] errors_reset_time @@     got signed long long @@
   fs/bcachefs/sb-members.c:422:30: sparse:     expected restricted __le64 [usertype] errors_reset_time
   fs/bcachefs/sb-members.c:422:30: sparse:     got signed long long

vim +422 fs/bcachefs/sb-members.c

   412	
   413	void bch2_dev_errors_reset(struct bch_dev *ca)
   414	{
   415		struct bch_fs *c = ca->fs;
   416		struct bch_member *m;
   417	
   418		mutex_lock(&c->sb_lock);
   419		m = bch2_members_v2_get_mut(c->disk_sb.sb, ca->dev_idx);
   420		for (unsigned i = 0; i < ARRAY_SIZE(m->errors_at_reset); i++)
   421			m->errors_at_reset[i] = cpu_to_le64(atomic64_read(&ca->errors[i]));
 > 422		m->errors_reset_time = ktime_get_real_seconds();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
