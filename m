Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371C43C0C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 03:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hst+uS9H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702869072; x=1734405072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tnL0fBH7A6d1LTLucYZQcfKFDdTbanRmEdpNgHY/GpY=;
  b=Hst+uS9HbDSqNfLxbXpTL1vbEtZU8ecxMX3T/Fmh3YU08v+E2K9mewpW
   v9TNxX2rt0Ndic4sDJAQTMwTS/8mk70p4Ztqcrh5o1Nm0+mDBhgq7aw8F
   SRstUF+et57CDwYjMI2JE+ludjfhyMIyvHW+cNnlXxNmC8D6LRtkzMRJ7
   sMN1YiNRsIPrIsfpYwXhmHyYYjO0QKYgls2Pb0lhvSAdbIdUbSkie4w/l
   TP//MtRMeRCaPRhbqchQshYKj60SfNMfIQqkhle8zIdiyEdidQG3gNDio
   aL76xzeRwLBz4YTeSVHqkmJniRQUc9N+TMoigHnDi4wMxT4VWabeZywFj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="392618885"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="392618885"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 19:11:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="898814015"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="898814015"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Dec 2023 19:10:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF41H-0003hb-1Z;
	Mon, 18 Dec 2023 03:10:15 +0000
Date: Mon, 18 Dec 2023 11:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 44/50]
 drivers/media/test-drivers/vidtv/vidtv_pes.c:191:15: error: implicit
 declaration of function 'div64_u64_rem'
Message-ID: <202312181146.Wy798jZV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   e2087b77c1c5fda2d35ed9f14d1978f009776172
commit: c753106d98ed51f8087b408b70950477fd676661 [44/50] restart_block: Trim includes
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231218/202312181146.Wy798jZV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312181146.Wy798jZV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312181146.Wy798jZV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/test-drivers/vidtv/vidtv_pes.c: In function 'vidtv_pes_write_pcr_bits':
>> drivers/media/test-drivers/vidtv/vidtv_pes.c:191:15: error: implicit declaration of function 'div64_u64_rem' [-Werror=implicit-function-declaration]
     191 |         div = div64_u64_rem(pcr, 300, &rem);
         |               ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/div64_u64_rem +191 drivers/media/test-drivers/vidtv/vidtv_pes.c

f90cf6079bf679 Daniel W. S. Almeida  2020-08-21  181  
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  182  static u32 vidtv_pes_write_pcr_bits(u8 *to, u32 to_offset, u64 pcr)
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  183  {
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  184  	/* Exact same from ffmpeg. PCR is a counter driven by a 27Mhz clock */
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  185  	u64 div;
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  186  	u64 rem;
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  187  	u8 *buf = to + to_offset;
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  188  	u64 pcr_low;
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  189  	u64 pcr_high;
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  190  
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21 @191  	div = div64_u64_rem(pcr, 300, &rem);
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  192  
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  193  	pcr_low = rem; /* pcr_low = pcr % 300 */
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  194  	pcr_high = div; /* pcr_high = pcr / 300 */
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  195  
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  196  	*buf++ = pcr_high >> 25;
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  197  	*buf++ = pcr_high >> 17;
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  198  	*buf++ = pcr_high >>  9;
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  199  	*buf++ = pcr_high >>  1;
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  200  	*buf++ = pcr_high <<  7 | pcr_low >> 8 | 0x7e;
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  201  	*buf++ = pcr_low;
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  202  
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  203  	return 6;
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  204  }
a61d7d19a3715e Mauro Carvalho Chehab 2020-09-21  205  

:::::: The code at line 191 was first introduced by commit
:::::: a61d7d19a3715e8e4faf8275ac9ace8599b2c97c media: vidtv: rewrite the adaption field logic

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
