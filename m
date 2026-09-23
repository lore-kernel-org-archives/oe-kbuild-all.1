Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5714279DC3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 02:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132256; cv=none; b=eU7y1dIKQBx8HI2By+wicfEW092p0YvLJG59X6ag1ux+Q9uGHLSiyY7K0XDdddYmuBw/zl8i3locLVxuoy2glfWugJF00eafROcWcJmPAEbPtf1fniZ53zuLPINpwLT9LTXceuyAb9AnY7aCME1A7vq62BDa9rSrr2Fux3ALGjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132256; c=relaxed/simple;
	bh=sO8xBsCeXkqYf6gpc1vQXMLfiz5YfnlaYS2QT/fk9D0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XlTKA/UXFQ0q4ecjNw4/JsQZMnGZpS4lWDTzl/L0J5sFgoJxIbbd+xEHD5ie/CO54GP2uW36eAcmT5CUd67FJ/6v6JdEV0GrqAwb4rJ5llkZq/cKx6Hb8NK2uqujN7SAiAaO8ItkN2Z9rlQGcL896Rls8fu1WNRknCbkvAHQQXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K04QeY9k; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K04QeY9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790132254; x=1821668254;
  h=date:from:to:cc:subject:message-id;
  bh=sO8xBsCeXkqYf6gpc1vQXMLfiz5YfnlaYS2QT/fk9D0=;
  b=K04QeY9kZ4dLACKUwBHuMtQskI3yq1E+5weeKNh4jNKCE73wf4SbDJCn
   ZgBwbcGczUz0AVMg2GEtytWGDpEe58jHYclHYBIJO6izmeMYwdKBCAkq2
   QR1Xk9vbDJicrrVksvslOEqtudz1dlPthuVLcaOhPm9xaaCugoaWwJ7o8
   XxVHntYVL3ANrQBZ1D0517TxS4gbzZo2lykvie/h3rqyW8Dr65eXdsMIT
   IdF2bQYEE4iVYjdMItPTEgf8103J7hHpARV4Q4Z9myis83I/aAeKk7U9q
   VqlKswORaFY65VlK4uxZHNzlESvd2+yYJpLqgNfUCq3DUDv3XbhbU/oDU
   A==;
X-CSE-ConnectionGUID: Zi7WkvhtRXu3YEZ3D6u0Nw==
X-CSE-MsgGUID: KZC2sM3yTCWCJAV6Ls3q2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1294782"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="1294782"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 19:57:33 -0700
X-CSE-ConnectionGUID: ZUhIMuTLSauCY2xpM5+9fQ==
X-CSE-MsgGUID: BoCXLL+/S+uN2YgwElufbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="278165658"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2026 19:57:32 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9DAo-000000000RL-0Zab;
	Wed, 23 Sep 2026 02:57:30 +0000
Date: Wed, 23 Sep 2026 04:57:19 +0200
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/subpage_gcache_lfolio 13/41]
 fs/f2fs/cache.c:149:5-24: WARNING: atomic_dec_and_test variation before
 object free at line 150.
Message-ID: <202609230446.s7bSxkDS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/subpage_gcache_lfolio
head:   85e9b85e94464a410d9809d9743aea8f7c49ddc5
commit: ec9281a9d7bb7b46d8a921f9f1c6a4a17f4c3817 [13/41] f2fs: cache: implement metadata cache
config: parisc-randconfig-r2103-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230446.s7bSxkDS-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230446.s7bSxkDS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/f2fs/cache.c:149:5-24: WARNING: atomic_dec_and_test variation before object free at line 150.

vim +149 fs/f2fs/cache.c

   145	
   146	static bool f2fs_cache_put(struct f2fs_cached_block *entry)
   147	{
   148		WARN_ON_ONCE(!f2fs_cache_refcount(entry));
 > 149		if (atomic_dec_and_test(&entry->refcount)) {
 > 150			f2fs_free_cache(entry);
   151			return true;
   152		}
   153		return false;
   154	}
   155	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
