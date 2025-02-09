Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C27243369
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 08:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739091383; cv=none; b=p4D/80fXXLjDrtc2zczDyk7b/hNC+PenhYcORs/T7hsGDaU0ufCwDu3kEO+tKm1vXr6/JcR3Z+7UI1rYv9mc5ujRbxG+vBJQ4SQ1QjPF0i//dDADWzkqDtV1oPRx5o3ZyK61gdtj2bcvgduKDllzMJLyI/caosaXz3Vcckq2cHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739091383; c=relaxed/simple;
	bh=AYClwSFsT326mdJJnn0PPoZo6gcy5VsJ6VsgQwwT2YE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jA6CD6Z13lNpJMNDvFofCBeARoY6/SGT+IgNG7ESwu+08pq5hkexbtT9UO6piXZMxoKGF8hCsX19EWRGgT+53tgYDTTcgvD5sCsYJD6zXcS3aZlEPReSoN3gfbpwfINy/LesMJ3oHSrTf7koDenhJ9bOSYQvrm6viuth+fhTgyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMCGb569; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMCGb569"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739091382; x=1770627382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AYClwSFsT326mdJJnn0PPoZo6gcy5VsJ6VsgQwwT2YE=;
  b=NMCGb569Aob9Q3yWaKusqY3rUIdaep0THD9KqQWz6GwRGkY9q9syMBpn
   pQ3VEK/dZa692poVzDdCHml3BKilWelOU/9Aoq+vSb/Avr4Hw/dHoDkYo
   5L1BOd/x9tR/YABgim1BTrvbk3idn0jZA2qfFcU8Kf0BnV0w2TZDzrKCR
   iAAMVKKlA+ryPpxvZPraPCqsnVhq59nR7NGTak583rp6huC/3T2vHNpaU
   bBNT+VroxXVUMuh/jginptGe48U1SVEPLjXXHUZqw6p/2+jGWF3aFD2mm
   qcveSEayMBa8jJ2C3WDwLzJbMrPfKn4NAPDz6IUco2kK72zVJS7QbnuqA
   Q==;
X-CSE-ConnectionGUID: Gi327sibTBKUL5YzT9IM3A==
X-CSE-MsgGUID: xSCPMS+gQTWDs1Wanf7BTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39801966"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39801966"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 00:56:21 -0800
X-CSE-ConnectionGUID: H9K660x3Tmq6cMXpSI/QhQ==
X-CSE-MsgGUID: ibn/vsAAQuGSIjMVZm1KkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="111738964"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Feb 2025 00:56:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th36v-0011H2-27;
	Sun, 09 Feb 2025 08:56:17 +0000
Date: Sun, 9 Feb 2025 16:55:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1420/1420] mm/mem_reliable.c:126:5:
 sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it
 be static?
Message-ID: <202502091601.sH0xhPOM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   cc7cb040bd0afe96f1da94c9f21eda5a986510a5
commit: 1845e7add95773a24019fb72bbea24a0a568663b [1420/1420] mm: Add reliable memory use limit for user tasks
config: arm64-randconfig-r131-20250208 (https://download.01.org/0day-ci/archive/20250209/202502091601.sH0xhPOM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250209/202502091601.sH0xhPOM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091601.sH0xhPOM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mem_reliable.c:126:5: sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it be static?
   mm/mem_reliable.c:126:5: warning: no previous prototype for 'reliable_limit_handler' [-Wmissing-prototypes]
     126 | int reliable_limit_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~

vim +/reliable_limit_handler +126 mm/mem_reliable.c

   124	
   125	#ifdef CONFIG_SYSCTL
 > 126	int reliable_limit_handler(struct ctl_table *table, int write,
   127		void __user *buffer, size_t *length, loff_t *ppos)
   128	{
   129		unsigned long old = task_reliable_limit;
   130		int ret;
   131	
   132		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   133		if (ret == 0 && write) {
   134			if (task_reliable_limit > total_reliable_mem_sz()) {
   135				task_reliable_limit = old;
   136				return -EINVAL;
   137			}
   138		}
   139	
   140		return ret;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
