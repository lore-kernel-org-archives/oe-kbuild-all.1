Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ACA472F83
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 23:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453323; cv=none; b=XJYs6rJ2TBh/c2FZt+yUd/BsbtTTAaVr/acroLxJHtjK+n99R918vMxp5BERV32zI762/3guGl4J/diSs8R3AUyu7u8AbG4d2zQCX9h3jOvI8IwXebVlDcW4cImcvIqXqaFmGxk92jsP7Zq42N2Zgfwit4/4BqFWc1jMbSUtFK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453323; c=relaxed/simple;
	bh=Ik3cdG3shkLGttzVhIjM73QDHQ2FqI936UZmTXVT3xk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dG7WT0TINtsd3nLvVCsQAtUdM0QX3k03EjEq5xGHMOcaakgMLBD2Sk+7GZYj4atmteU+7pDcCJo7tr0iqA/ThHa3PCERXec01/gN+6i/kD07oSJwfmaDEGh8cMlhExwLk0lE/LM7OkMuzgF+C1QBchXGb8s18KyMmLAoAe4e/Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0aJeCqG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0aJeCqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785453323; x=1816989323;
  h=date:from:to:cc:subject:message-id;
  bh=Ik3cdG3shkLGttzVhIjM73QDHQ2FqI936UZmTXVT3xk=;
  b=R0aJeCqGjgzrH4mMvcZGpSZXwTppbf9XgAV14sJrorojxAhGay492InJ
   igKuxcfKGWudJEnK9JCjtcxAQZSxwx47+6wrKUDgKqAQos2RrFFESCMLO
   wtDODwEY/LxmFhykvPlamHB1dwPCrkaA5/3RvfcjtYgPXAW6RgO8Nhn5B
   lJ3qhBh7spKuVS+wQ9xzbRO2P7scySa2nhAit5TKqrwMjk4Vxd9QtWX3f
   iufFCQv86q8+Qwmv0F/F4EfWIkFUKh753skbfhvG9vxB06GP9YSBbo7JB
   K5ZAZoNAA3D2enBAQaia0fz9ZBFQckAFc90P5nHgATZAAkhxJnfWY0Kcj
   Q==;
X-CSE-ConnectionGUID: /Sy+3tZRRbm1crHT3IQRnw==
X-CSE-MsgGUID: mIFPh69AT5acb9mNpFxEIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86031791"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="86031791"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 16:15:21 -0700
X-CSE-ConnectionGUID: Z+M2ixVEQ1ieI+qea+Oxuw==
X-CSE-MsgGUID: CygZOHsRRM26jNalciuItg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="257074682"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jul 2026 16:15:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpZy8-00000000hhE-2cU8;
	Thu, 30 Jul 2026 23:15:16 +0000
Date: Fri, 31 Jul 2026 07:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Subject: [linux-next:master 6459/10444] fs/crypto/block.c:350:17:
 sparse: sparse: cast from restricted blk_status_t
Message-ID: <202607310736.H4YbRvup-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   78bc8af4affb9a732504eb22eeac7d1e50883853
commit: 1944540c405083a966f898e9096c36888887a49e [6459/10444] fscrypt: Merge bio.c and inline_crypt.c into block.c
config: mips-randconfig-r112-20260731 (https://download.01.org/0day-ci/archive/20260731/202607310736.H4YbRvup-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310736.H4YbRvup-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310736.H4YbRvup-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/crypto/block.c:350:17: sparse: sparse: cast from restricted blk_status_t
>> fs/crypto/block.c:350:17: sparse: sparse: cast from restricted blk_status_t
>> fs/crypto/block.c:350:17: sparse: sparse: cast to restricted blk_status_t

vim +350 fs/crypto/block.c

   344	
   345	static void fscrypt_zeroout_range_end_io(struct bio *bio)
   346	{
   347		struct fscrypt_zero_done *done = bio->bi_private;
   348	
   349		if (bio->bi_status)
 > 350			cmpxchg(&done->status, 0, bio->bi_status);
   351		fscrypt_zeroout_range_done(done);
   352		bio_put(bio);
   353	}
   354	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
