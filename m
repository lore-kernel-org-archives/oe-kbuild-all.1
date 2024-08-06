Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978C910F1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 00:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722904144; cv=none; b=MyZF76MU5JzbdFpPuK6WM7Lx+pfE3GwwwzITGqpS1/ktu50yincx2AKn9ZOFJWO5UZWRAZb825fta+nkYv5IiT3m6N2rC/T4QSdrl4gmEcygJQ8x5cJOtCzCBSDK9Ju5Z0VfjtPUP4VrWd5eE3eoJSSEHqSLb07ChWqQo69kpds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722904144; c=relaxed/simple;
	bh=mqcnfysI80yvd7AX9P8hFxCW93JT1mT0kS3G03RxbdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lF/zNsM9NPs3H1HoOpnT1yEtTjq/tiNaD8+12mhqq7+2BRVDuBWuIiqFhm6g3aMa1x7b1IslQp80KDXEyFJqVYcQ7+RujyjsYDSe5ZSWyEMAazeUY279vzbDYVlnSXaX40WgiO2oJyjfDziItEKhFDavs2tseadnBxp6sL30wyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpG0ncqf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpG0ncqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722904143; x=1754440143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mqcnfysI80yvd7AX9P8hFxCW93JT1mT0kS3G03RxbdA=;
  b=SpG0ncqfYdUF9JxR1qH5VFZYbXLQH1mtVixg55cdMHGDIAXSwzdbBC3e
   3xIxTGYcuch+uBfeVeA/gdwZIB7aAmNhnGNs7AMgDbam3jHXSZrCQeuIS
   AOpnMfpV5J6Ujjs2PgFcu8BDyv4vCaVrNL+wrI+PUKd+ntTzLY7KTGM+o
   dLXPhan5RN45rVCEWBGPYXELdTbvVs9Md9yd5dBSXfdxBQqn6Ypm4+o4e
   KxFhHVt6j30QbvXMeMyiYXkMNMLPBcFHviXBnxjkDE+Myk15tm3Q3MMg/
   2pJloH/2wG2F49RCP4mZtReIqwQnli/e9Al0eQgcIv5FDBuFYTb89SIC0
   A==;
X-CSE-ConnectionGUID: mPc8qwQDQI6+9TuHH7K0pw==
X-CSE-MsgGUID: 9T3EnRdMQea1BzAELDDFcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32277102"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="32277102"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 17:29:02 -0700
X-CSE-ConnectionGUID: oRJW9g3sQdO6v8IelQJZ2w==
X-CSE-MsgGUID: pvHTrEsfR+q8lCOjdr8zxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="55998946"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 05 Aug 2024 17:29:01 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb84Q-0003yA-2j;
	Tue, 06 Aug 2024 00:28:58 +0000
Date: Tue, 6 Aug 2024 08:28:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/14] mm/memblock.c:2327:28: warning:
 cast to pointer from integer of different size
Message-ID: <202408060805.nFu3wAHQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   1e3be49d68df84f8e0aad1b29e7c756b4ff9a13e
commit: 3368d09174c6e8f3759bd201dbe6ca20ed0cd0e0 [1/14] FROMLIST: memblock: introduce memsize showing reserved memory
config: arm-randconfig-002-20240806 (https://download.01.org/0day-ci/archive/20240806/202408060805.nFu3wAHQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060805.nFu3wAHQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408060805.nFu3wAHQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memblock.c: In function 'memblock_memsize_show':
>> mm/memblock.c:2327:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2327 |                            (void *)base, (void *)end,
         |                            ^
   mm/memblock.c:2327:42: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2327 |                            (void *)base, (void *)end,
         |                                          ^


vim +2327 mm/memblock.c

  2308	
  2309	static int memblock_memsize_show(struct seq_file *m, void *private)
  2310	{
  2311		int i;
  2312		struct memsize_rgn_struct *rgn;
  2313		unsigned long reserved = 0, reusable = 0;
  2314	
  2315		sort(memsize_rgn, memsize_rgn_count,
  2316		     sizeof(memsize_rgn[0]), memsize_rgn_cmp, NULL);
  2317		for (i = 0; i < memsize_rgn_count; i++) {
  2318			phys_addr_t base, end;
  2319			long size;
  2320	
  2321			rgn = &memsize_rgn[i];
  2322			base = rgn->base;
  2323			size = rgn->size;
  2324			end = base + size;
  2325	
  2326			seq_printf(m, "0x%pK-0x%pK 0x%08lx ( %7lu KB ) %s %s %s\n",
> 2327				   (void *)base, (void *)end,
  2328				   size, DIV_ROUND_UP(size, SZ_1K),
  2329				   rgn->nomap ? "nomap" : "  map",
  2330				   rgn->reusable ? "reusable" : "unusable",
  2331				   rgn->name);
  2332			if (rgn->reusable)
  2333				reusable += (unsigned long)rgn->size;
  2334			else
  2335				reserved += (unsigned long)rgn->size;
  2336		}
  2337	
  2338		seq_puts(m, "\n");
  2339		seq_printf(m, " .unusable  : %7lu KB\n",
  2340			   DIV_ROUND_UP(reserved, SZ_1K));
  2341		seq_printf(m, " .reusable  : %7lu KB\n",
  2342			   DIV_ROUND_UP(reusable, SZ_1K));
  2343		return 0;
  2344	}
  2345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
