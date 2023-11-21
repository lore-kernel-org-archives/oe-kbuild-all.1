Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E1563C0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 01:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1q4Lv1T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700529820; x=1732065820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m9sh16tt4uUMgVtIPZHi0IOiUwrPHXv4jK84aMXzY7A=;
  b=b1q4Lv1TqejhDFHcwWcsSbaOFXpj5hJvlJwuFuZwx9cOAPuauHcF0rsF
   Q5i6JqE09hCqjBkGJySRi1cTAHatAM9S8nan4skZlURwLfmwVqqiNAcQ1
   d6gPkdQSoL5YypG5/yETo2QFXH7/ryvYpAr2FetuHiS9NTyUy+3kCeyub
   HS29VDt5tZVMEz6oX/xq5+hw9MGlUxPubjMF2eHy5vNGh8FDUtmd6YpEY
   iNGYiiSBgjD3zb7iPY1qGts1fN4paKKLDo9z0hPtu41NOKicI9ogaZyDJ
   GfoXt7d96vxAZy4IJaR9tOrEnuZaDmF2Eki87UB7m0c/cp50tXLAAp+i/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371081596"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="371081596"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:23:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="890099058"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="890099058"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 20 Nov 2023 17:23:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5FU2-00078k-1S;
	Tue, 21 Nov 2023 01:23:29 +0000
Date: Tue, 21 Nov 2023 09:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:fraction_bits 1/1]
 drivers/media/v4l2-core/v4l2-ctrls-core.c:275: undefined reference to
 `__divdi3'
Message-ID: <202311210837.3cHUdC7s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git fraction_bits
head:   d25f61730ea9fb92d79ae3fcd562b33553dd9133
commit: d25f61730ea9fb92d79ae3fcd562b33553dd9133 [1/1] media: v4l2-ctrls: add support for fraction_bits
config: i386-randconfig-002-20231121 (https://download.01.org/0day-ci/archive/20231121/202311210837.3cHUdC7s-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311210837.3cHUdC7s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311210837.3cHUdC7s-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/v4l2-core/v4l2-ctrls-core.o: in function `v4l2_ctrl_log_fp':
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:275: undefined reference to `__divdi3'


vim +275 drivers/media/v4l2-core/v4l2-ctrls-core.c

   254	
   255	static void v4l2_ctrl_log_fp(s64 v, unsigned int fraction_bits)
   256	{
   257		s64 i, f, mask;
   258	
   259		if (!fraction_bits) {
   260			pr_cont("%lld", v);
   261			return;
   262		}
   263	
   264		mask = (1ULL << fraction_bits) - 1;
   265	
   266		/*
   267		 * Note: this function does not support fixed point u64 with
   268		 * fraction_bits set to 64. At the moment there is no U64
   269		 * control type, but if that is added, then this code will have
   270		 * to add support for it.
   271		 */
   272		if (fraction_bits >= 63)
   273			i = v < 0 ? -1 : 0;
   274		else
 > 275			i = v / (1LL << fraction_bits);
   276	
   277		f = v < 0 ? -((-v) & mask) : (v & mask);
   278	
   279		if (!f) {
   280			pr_cont("%lld", i);
   281		} else if (fraction_bits < 20) {
   282			u64 div = 1ULL << fraction_bits;
   283	
   284			if (!i && f < 0)
   285				pr_cont("-%lld/%llu", -f, div);
   286			else if (!i)
   287				pr_cont("%lld/%llu", f, div);
   288			else if (i < 0 || f < 0)
   289				pr_cont("-%lld-%llu/%llu", -i, -f, div);
   290			else
   291				pr_cont("%lld+%llu/%llu", i, f, div);
   292		} else {
   293			if (!i && f < 0)
   294				pr_cont("-%lld/(2^%u)", -f, fraction_bits);
   295			else if (!i)
   296				pr_cont("%lld/(2^%u)", f, fraction_bits);
   297			else if (i < 0 || f < 0)
   298				pr_cont("-%lld-%llu/(2^%u)", -i, -f, fraction_bits);
   299			else
   300				pr_cont("%lld+%llu/(2^%u)", i, f, fraction_bits);
   301		}
   302	}
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
