Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AC2238C07
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 22:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754346887; cv=none; b=mBvGiUPZDgW2ho4HuHCvk7eNiIqtCj8Fim/hxK2o+fKy7ugclUTuPU/N3erxHNhqsBhUP3ku7XyeIpFJI02lC2WYJeHBM4hAULxkcGE/0fLmJnKbi4H8snwijynZV7VTKnXayM0Lq6hjYx+QAXVW7CFTIOqWaGra7Vt8LAtjxg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754346887; c=relaxed/simple;
	bh=NX7PgdxCCHgSZ7i7QX+T+UeWz3kdhjA5Ce4W2qTUzMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nvysxPqOUt4Kr9Kii/WXGXpgQ3y6oyxh3ePElvGf2O8jmWJ+8vM5vLrsGRx8L1QrxBTA8CCoW0d3Ek+LtT4vgUXIZQmHjMxvupM2PyrBAJUu43yosE8FEM6PBJcxPqmouFpRjRM4PSu8I6FWuQF9N7O/78d0zb69U5mD5C3pAco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOogXZRC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOogXZRC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754346885; x=1785882885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NX7PgdxCCHgSZ7i7QX+T+UeWz3kdhjA5Ce4W2qTUzMI=;
  b=aOogXZRCmLPbIBu977ytqw0SKKRB8v9DByy+vB8Fy76kuxN//TuGeLQ1
   hdhyVoATDa30chj98TbP5RbzV1JXBgrp3//eSWbzghjkjEAoj/PWDh/FO
   VBIH2K7H9M7oxEGl92VyA6TljPpWJU2evprMYTmNfrEawtdAlIxDWXva+
   grmgfxFx5bkapWeTKTQsTrThkn4gH6eWcTqcvgP5HWuq2OLxR8fi2DKBC
   uEfE+1VJfCvNK4Nu5bvO+tcFTKIhjYdf3Ag9wmd0ABfAOkNjilcw2C4Xx
   EXeIGEqzDpuuxjt2PVjkb2Wv9w4DxFK0AF5ToFg1TtCik4aeMq091qd/U
   w==;
X-CSE-ConnectionGUID: 53vgl2UTSOuAzvnoFzk7Kw==
X-CSE-MsgGUID: vl8N2DIBTzaSVADdMgA0lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="44219916"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="44219916"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 15:34:44 -0700
X-CSE-ConnectionGUID: 8wAxHTnnRx+CgWDDGpJlsA==
X-CSE-MsgGUID: dEf40nJGSkiyEHtPttggnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="195217767"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 04 Aug 2025 15:34:43 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uj3lQ-0001rb-1d;
	Mon, 04 Aug 2025 22:34:40 +0000
Date: Tue, 5 Aug 2025 00:34:17 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743] fs/proc/vmcore.c:183:1:
 warning: no previous prototype for 'copy_oldmem_page_encrypted'
Message-ID: <202508050002.tGJgi27V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ba07135cf74b1424e2f7f0c60e59c5b206ab320c
commit: e4590de4701ee3ee748058abf7b4e9492fa2b4a9 [1743/1743] proc/vmcore: Fix i386 build error of missing copy_oldmem_page_encrypted()
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250805/202508050002.tGJgi27V-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508050002.tGJgi27V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508050002.tGJgi27V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/vmcore.c:183:1: warning: no previous prototype for 'copy_oldmem_page_encrypted' [-Wmissing-prototypes]
     183 | copy_oldmem_page_encrypted(unsigned long pfn, char *buf, size_t csize,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/proc/vmcore.c:441: warning: Function parameter or member 'size' not described in 'vmcore_alloc_buf'
   fs/proc/vmcore.c:441: warning: Excess function parameter 'sizez' description in 'vmcore_alloc_buf'


vim +/copy_oldmem_page_encrypted +183 fs/proc/vmcore.c

   178	
   179	/*
   180	 * Architectures which support memory encryption override this.
   181	 */
   182	ssize_t __weak
 > 183	copy_oldmem_page_encrypted(unsigned long pfn, char *buf, size_t csize,
   184				   unsigned long offset, int userbuf)
   185	{
   186		return copy_oldmem_page(pfn, buf, csize, offset, userbuf);
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
