Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84AB145B24
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711906058; cv=none; b=K2AdYuiGQEzuEh60JwkxX1ED04KWMhsFB5RP1YuQ3r+ET3QN2WYNLWYYxN/tncdn8JMXTH80g5GQ7XOcmNwsYUALIlYZBQOneJfR/8k+oScIFww6gM+Rkbvt2BnhW0YLNtlq1v8Ygi4Bq8VOGJMafZBRRFE3E5rUpJ2DWznSbaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711906058; c=relaxed/simple;
	bh=RqBJACmBdn3rOZQKRHjN63RmiQKnJx90/WumaQEhvRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KA0zNl1AEV1E6wSv4cgp6kPu6SlZ+WVNN5WbTyIkERb7jqMc4eoJHFUqbQAvA/wOAok+Xx+4YVk8iyuETmIQgSxwtpycY4dFvurWzLRq298D3qlmvchZXjkdh7HWVlZBXKdpDvsRc5r3GDMGY4j6JQV+iX9LJcwxUIW4sZjWqY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGzETtI+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGzETtI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711906056; x=1743442056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RqBJACmBdn3rOZQKRHjN63RmiQKnJx90/WumaQEhvRM=;
  b=TGzETtI+q8ubx6AmslDFF/1ah+DYkzU4kNCVeE81oy5mOyq8qDj/9oJN
   ysb8KJTu4GZrH/urcDGbmOWjFpp/37bIDF+VTy/T2Rz4p5T9fzjClJWy/
   Sf1ufwpx09AWKxKjbSviX1S0KRu1GgVSBt9Tdgrr8VkNEMcRYSYgYgBeZ
   1LQSVgd68mdXvIhFPOG/9K/s+5XJstPfMEVLHNbLGulXFvTP+OMBV2T+r
   GIZPzV4fIijBgL0NpsvfJ1Y182rWawIVkwug0/B7h7FtvE8SIS1lASofq
   g5xdZrI/8PwnmKHvz0A9q7IVU8v44QZcAHehoU2TvQbxCIu5tWf4kFybD
   A==;
X-CSE-ConnectionGUID: Rk2tS97JSc2RxOZkAn+Xzw==
X-CSE-MsgGUID: D5QSrhVoSBuC0zDdqTxX1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="10858615"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="10858615"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 10:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="48697976"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Mar 2024 10:27:34 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqyxv-0001Ic-17;
	Sun, 31 Mar 2024 17:27:31 +0000
Date: Mon, 1 Apr 2024 01:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 36/38] fs/bcachefs/recovery_passes.c:120:16:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202404010140.vvxpncUw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   a097468ffe82f16528ddb9ed6ae95baacf633858
commit: c298bc7b038f31ad189069bb146e8f935c508500 [36/38] bcachefs: bch2_run_explicit_recovery_pass_persistent()
config: x86_64-randconfig-121-20240331 (https://download.01.org/0day-ci/archive/20240401/202404010140.vvxpncUw-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404010140.vvxpncUw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010140.vvxpncUw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/recovery_passes.c: note: in included file:
   fs/bcachefs/bcachefs.h:1023:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/recovery_passes.c:120:16: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] s @@     got restricted __le64 [usertype] @@
   fs/bcachefs/recovery_passes.c:120:16: sparse:     expected unsigned long long [usertype] s
   fs/bcachefs/recovery_passes.c:120:16: sparse:     got restricted __le64 [usertype]
>> fs/bcachefs/recovery_passes.c:125:44: sparse: sparse: restricted __le64 degrades to integer
>> fs/bcachefs/recovery_passes.c:126:50: sparse: sparse: invalid assignment: |=
   fs/bcachefs/recovery_passes.c:126:50: sparse:    left side has type restricted __le64
   fs/bcachefs/recovery_passes.c:126:50: sparse:    right side has type unsigned long long
   fs/bcachefs/recovery_passes.c:43:9: sparse: sparse: self-comparison always evaluates to false

vim +120 fs/bcachefs/recovery_passes.c

   116	
   117	int bch2_run_explicit_recovery_pass_persistent(struct bch_fs *c,
   118						       enum bch_recovery_pass pass)
   119	{
 > 120		u64 s =cpu_to_le64(bch2_recovery_passes_to_stable(BIT_ULL(pass)));
   121	
   122		mutex_lock(&c->sb_lock);
   123		struct bch_sb_field_ext *ext = bch2_sb_field_get(c->disk_sb.sb, ext);
   124	
 > 125		if (!(ext->recovery_passes_required[0] & s)) {
 > 126			ext->recovery_passes_required[0] |= s;
   127			bch2_write_super(c);
   128		}
   129		mutex_unlock(&c->sb_lock);
   130	
   131		return bch2_run_explicit_recovery_pass(c, pass);
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
