Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBAA20D4E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739437992; cv=none; b=WuzyCU/O0RsyzVSyS/y4sLlLi5IY7kbfqQQYQBKoNK47RE4C9TjFX278NohRCE1YSJGedpoA8hgTfW4+gkvnorXaZJLpXtMLObEg4AaRPS/MOEaRsMUwANsRwrp6es649hhrxKYVV/Of18oisVEZBs5R0CRl/IInr1HTxgjxhKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739437992; c=relaxed/simple;
	bh=GmemZNO0pUs0INKzpf9LWDvHGbEVPh2npdguzELWG/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+c0tZlLRdeWx1l5p9jF/+tvfS/qrPIprybTCLbSm7kRC8s2WvVV9Xe028sp7RFWfHqxdtbZIjlQRHWJdo84bfQ6uXDqLOzTJPVW0m3IAGPuZIKgFrLbNZ7aeMlai29MWAI1u4pPNyk80YEdzqMMROuttSvyWfyNrkHbMA65rkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2E1PR8z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2E1PR8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739437990; x=1770973990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GmemZNO0pUs0INKzpf9LWDvHGbEVPh2npdguzELWG/k=;
  b=N2E1PR8zPy+x7PHOhdQaMD5wFFfnDTY9vyokovbP+AY/4KpmlV5ewIDK
   IwiCrE7m5bvcNcMGkW+ffvFyPMF6KEaApEsmM1GhaM4oknn15ULt8dKG9
   zG+qAjKc9U2sg+L2pkAzSBLhvcdzIladH1VZRFmGsdUkYohPeuaQphZsT
   6e+IHmSTuUjp1k8ZPnRk8KSyS7gx+QrHrtpQy9nVOoFEErTbThqfTF7J+
   RmNtomnlO55Rl5uBALlDtbhUIUHRTV5XNEIeM/t4MoSHOggM36Yw7clSn
   8Xdi85XS0mlXEgSk+bsaQ9y1o9ojYDwEqDHGVjNiRD6RUu/J4YNKcilsm
   A==;
X-CSE-ConnectionGUID: R4RRDsnNTJe07jYByodvBQ==
X-CSE-MsgGUID: EWvaNnlXTliK1zy2DYImOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="57532407"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="57532407"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 01:13:09 -0800
X-CSE-ConnectionGUID: 0RABsBLeQOK0ZZb62p4/yA==
X-CSE-MsgGUID: /HwqXcnARb+wcTKJC2ISjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113071557"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2025 01:13:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiVHN-0016rD-19;
	Thu, 13 Feb 2025 09:13:05 +0000
Date: Thu, 13 Feb 2025 17:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Gregory Price <gourry@gourry.net>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>
Subject: [linux-next:master 2995/3437] mm/mempolicy.c:207:undefined reference
 to `__udivdi3'
Message-ID: <202502131750.RyXsm23v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7b7a883c7f4de1ee5040bd1c32aabaafde54d209
commit: aab5f6eb05fd382835c042853bb0a44198aba71f [2995/3437] mm/mempolicy: Weighted Interleave Auto-tuning
config: sh-randconfig-r051-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131750.RyXsm23v-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131750.RyXsm23v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131750.RyXsm23v-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: kernel/sched/build_utility.o: in function `housekeeping_any_cpu':
   kernel/sched/isolation.c:56:(.text+0x5ac): undefined reference to `sched_numa_find_closest'
   sh4-linux-ld: mm/mempolicy.o: in function `reduce_interleave_weights':
>> mm/mempolicy.c:207:(.text+0x460): undefined reference to `__udivdi3'


vim +207 mm/mempolicy.c

   166	
   167	/*
   168	 * Convert bandwidth values into weighted interleave weights.
   169	 * Call with iw_table_lock.
   170	 */
   171	static void reduce_interleave_weights(uint64_t *bw, u8 *new_iw)
   172	{
   173		uint64_t sum_bw = 0, sum_iw = 0;
   174		uint64_t scaling_factor = 1, iw_gcd = 1;
   175		unsigned int i = 0;
   176	
   177		/* Recalculate the bandwidth distribution given the new info */
   178		for (i = 0; i < nr_node_ids; i++)
   179			sum_bw += bw[i];
   180	
   181		/* If node is not set or has < 1% of total bw, use minimum value of 1 */
   182		for (i = 0; i < nr_node_ids; i++) {
   183			if (bw[i]) {
   184				scaling_factor = 100 * bw[i];
   185				new_iw[i] = max(scaling_factor / sum_bw, 1);
   186			} else {
   187				new_iw[i] = 1;
   188			}
   189			sum_iw += new_iw[i];
   190		}
   191	
   192		/*
   193		 * Scale each node's share of the total bandwidth from percentages
   194		 * to whole numbers in the range [1, weightiness]
   195		 */
   196		for (i = 0; i < nr_node_ids; i++) {
   197			scaling_factor = weightiness * new_iw[i];
   198			new_iw[i] = max(scaling_factor / sum_iw, 1);
   199			if (i == 0)
   200				iw_gcd = new_iw[0];
   201			iw_gcd = gcd(iw_gcd, new_iw[i]);
   202		}
   203	
   204		/* 1:2 is strictly better than 16:32. Reduce by the weights' GCD. */
   205		for (i = 0; i < nr_node_ids; i++)
   206			new_iw[i] /= iw_gcd;
 > 207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
