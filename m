Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C9B239573
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 12:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597122; cv=none; b=XV4/meJF25e7TMAJ1GKlw5VafqNRAREyL/85Rjn+U8dFn1v0GRUBZIhlFJ+MDQGjwQzH7Q1vJ3PrrRWo1UcxxAXVlOkYcAUAhcxqewgxA5G0nBZqXoTtgb8GdzYqDPXuFIal1UyZuJRUR4jcjQRfBLG6K0zuENlWWSCaeHwl7Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597122; c=relaxed/simple;
	bh=/ceoTbklO2x058ZXZWNg+6uHuHpwdA9Rt4YNSPQNdf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ktbf/AyNa+L/kr2UXB78lgRscRHFLaRSWDbuPb6g9OK1V43R65SFdgpkTRJ3HbjPWlYwSGWDQJ15zB1j6PHWnDy6+fN1U/MSMmqsvtA4LInSqkZZlgxkYtmudw+sg55nBJnvOCc6vC+uhVzzEpSXb1PyxyxSZp/tbyD3XDHXZEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mg20VVfw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mg20VVfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743597121; x=1775133121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ceoTbklO2x058ZXZWNg+6uHuHpwdA9Rt4YNSPQNdf8=;
  b=mg20VVfwvoEyHEkdTLzXWBpHQdcCPl3GmTAcPNpU49152Z1lufcmD5xT
   6gPEb0/2dNdarjfYWZSp91bdBQR7oclCVEq3Cl9lH7u1yTVplboKHHdMa
   0wyhwjIL1xIiQ9+oJkvP6OhxxZHeHRREyvfTuVZ+FF5kEq2ez/7FaM90+
   Kd5Meh3OPG3oGAMCT9JSKo9HmqLNEK1D+kEmUoaQff+2EU8myIEIUr6re
   fFwpjQfz4YDeXA+jVUBc2AGbhIoMOS9At1qVW3tCWGCzHMLDu1o6PicpA
   3isU6pRjlWeroT3w2Igj4m8HvIJUllntUbaam55ajJJG6MqfctEIUzpl1
   g==;
X-CSE-ConnectionGUID: JfqE23enTE2Sdy3g232SkQ==
X-CSE-MsgGUID: KYk3Y0uLQ0KXsqlIJpboFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="45129025"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="45129025"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:32:00 -0700
X-CSE-ConnectionGUID: GvHLrQ3XSq2lJwHWmbtcFA==
X-CSE-MsgGUID: FTjmlPkIQEybHvUl5PYUSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="126944732"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Apr 2025 05:31:59 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzxG9-000Ags-0l;
	Wed, 02 Apr 2025 12:31:57 +0000
Date: Wed, 2 Apr 2025 20:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:keys-graveyard 16/16] security/keys/gc.c:209:41:
 error: use of undeclared identifier 'flags'
Message-ID: <202504022000.znN5aKuJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git keys-graveyard
head:   ca5b76e45c384d9a7e84116d2c4524642eda3273
commit: ca5b76e45c384d9a7e84116d2c4524642eda3273 [16/16] KEYS: Add a list for unreferenced keys
config: hexagon-randconfig-001-20250402 (https://download.01.org/0day-ci/archive/20250402/202504022000.znN5aKuJ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504022000.znN5aKuJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504022000.znN5aKuJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/keys/gc.c:209:41: error: use of undeclared identifier 'flags'
     209 |         spin_lock_irqsave(&key_graveyard_lock, flags);
         |                                                ^
>> security/keys/gc.c:209:41: error: use of undeclared identifier 'flags'
   security/keys/gc.c:211:46: error: use of undeclared identifier 'flags'
     211 |         spin_unlock_irqrestore(&key_graveyard_lock, flags);
         |                                                     ^
   3 errors generated.


vim +/flags +209 security/keys/gc.c

   188	
   189		struct rb_node *cursor;
   190		struct key *key;
   191		time64_t new_timer, limit, expiry;
   192	
   193		kenter("[%lx,%x]", key_gc_flags, gc_state);
   194	
   195		limit = ktime_get_real_seconds();
   196	
   197		/* Work out what we're going to be doing in this pass */
   198		gc_state &= KEY_GC_REAPING_DEAD_1 | KEY_GC_REAPING_DEAD_2;
   199		gc_state <<= 1;
   200		if (test_and_clear_bit(KEY_GC_KEY_EXPIRED, &key_gc_flags))
   201			gc_state |= KEY_GC_REAPING_LINKS;
   202	
   203		if (test_and_clear_bit(KEY_GC_REAP_KEYTYPE, &key_gc_flags))
   204			gc_state |= KEY_GC_REAPING_DEAD_1;
   205		kdebug("new pass %x", gc_state);
   206	
   207		new_timer = TIME64_MAX;
   208	
 > 209		spin_lock_irqsave(&key_graveyard_lock, flags);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
