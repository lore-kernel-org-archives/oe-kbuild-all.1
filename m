Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0922537475B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 21:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787260359; cv=none; b=RfGJy0Y4wTYlOjWgzKRNHKAvld3WfXINfu9gV9EpgA2dAk4Bn2iqzJIM3UPCORPdj0acWkNfcJqTP3afhHL02ZsXN+eteDl6n8gRBnByX90h6QEnEyBTpI4acsnMMTSbUhgbwRDZn9/cYNfjYR/3gotVrZbT7c9n5dEKffMskHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787260359; c=relaxed/simple;
	bh=GS6DUq+AvSmGKs+DkFauD4jdltL4TyF6DS3wjE16t+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HYUNhslxNevYcL5buXHhiU1fqvbf6DDcSZDSzHj4U0xMXjFJW1lEn2bvF+QaBiCa1JMNEr7YTsQOUVZZxLn0/WMiuCq0lL34lWNi12TQ7X81aJDkRV5z+f7i4LV+Ypsb/o/U0VLT1ou72TfiAdmTkXfYU/uFRoxrgHitX4APYfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVQY2fVN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVQY2fVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787260357; x=1818796357;
  h=date:from:to:cc:subject:message-id;
  bh=GS6DUq+AvSmGKs+DkFauD4jdltL4TyF6DS3wjE16t+I=;
  b=jVQY2fVNzEUzDZk1NX7PunSxHKyoHbWlVdhvPQktPUdm6P8HY+KjXgYL
   Kt/sADx/Yz2DJc0x/cIGhVSp8D6MQd9Dx0NOA5/dX0PAPTPw3qYRfm2JN
   4fUklmaraaigrq+JE1pZ/I0G/YLRlHOcrSP978JvinMX/TrANSMfq8ZEI
   HnlK2D/SB2sGxPQtzfZQNxivOFN3ABLiDJOELDfqcwPcoYOgAvUi3EvaP
   uPRDp5Z3fr5eq1LezH/DqJHWkvYnosAJMvW6iSgbbTp4LzWQ4kBm0DjLN
   3+iuvvMOBQzkeokRNuBdsPow3VuWfZ7H28Sb4LoRVrCXMdceDfl5G6Kua
   g==;
X-CSE-ConnectionGUID: y7wjbEJTREGL2vVAcQUkwA==
X-CSE-MsgGUID: 9aJpaZ+QSVeFcFteZkgXAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87933137"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="87933137"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 14:12:36 -0700
X-CSE-ConnectionGUID: mRtTyl2cTuWrF/U83UqRbw==
X-CSE-MsgGUID: XNQWvmrRSdypS52MvP3RQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="269623393"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Aug 2026 14:12:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxA3s-00000000ngl-32nM;
	Thu, 20 Aug 2026 21:12:32 +0000
Date: Fri, 21 Aug 2026 05:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/cache 2/13] fs/f2fs/cache.c:167:5-24: WARNING:
 atomic_dec_and_test variation before object free at line 168.
Message-ID: <202608210559.AZqJQkKU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/cache
head:   f5af6f6f61922c3233196de6f4ff119760b86258
commit: b803186a2293df7ecc9c0e16e51dc01c2c4f8730 [2/13] f2fs: cache: implement metadata cache
config: csky-randconfig-r064-20260821 (https://download.01.org/0day-ci/archive/20260821/202608210559.AZqJQkKU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608210559.AZqJQkKU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/f2fs/cache.c:167:5-24: WARNING: atomic_dec_and_test variation before object free at line 168.

vim +167 fs/f2fs/cache.c

   163	
   164	static bool f2fs_cache_put(struct f2fs_cached_block *entry)
   165	{
   166		WARN_ON_ONCE(!f2fs_cache_refcount(entry));
 > 167		if (atomic_dec_and_test(&entry->refcount)) {
 > 168			f2fs_free_cache(entry);
   169			return true;
   170		}
   171		return false;
   172	}
   173	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
