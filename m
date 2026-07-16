Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD293D9542
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 09:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784193260; cv=none; b=LR+tO5YysHyD31XjcLgMINVQW26l6brV1LVu1F76vv5IBEmB5S3L7QuDYQ1HhecQueyJz0gS/e8I4V1KA9C8iP+hUhpAjXJCePXtyi3+5nII4s/aXQw0SyrYLIbZnm6dTVgLAoF9SXJrgKOMiPPFfRp+54j4KIxFsOOkP6aN7uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784193260; c=relaxed/simple;
	bh=GQ8jDPgyKNPrGubZ0EMx/dy7Tq0WbHxjY1jE+mhI56M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ul9sQNgoTpTfDFzPmJlRR5A542Poxn2Y7DQY+Hl2S7E3J/zBhSSHe9mCzChapAWy7pnU6nuTetM14VDUFeVuNBiup7+mEB4UnJE07BSc2k4w1V979pQ93I2jjTRc3eo325XG9kVUm5h0oI76LqTColpKCBeswt8egXVGLmYYK9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTir+9jT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTir+9jT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784193256; x=1815729256;
  h=date:from:to:cc:subject:message-id;
  bh=GQ8jDPgyKNPrGubZ0EMx/dy7Tq0WbHxjY1jE+mhI56M=;
  b=cTir+9jTyV7cKM6p64ojT54p86uOHIb3lOf1GFjw5b2FosArxXY7+7UF
   OXtavkLVO2YT9bAPTJTbHvOUpsw0OnPINUQpM+6OHMTUqDtCEKKk2XPXv
   EazQpJ66Mt0AYJKy4q6XlbUIow1esdt2U+lF773Q3rgiurLyNRsA4zv0S
   JigFMOysUoleg6DrJXIPEtRkwQTJYNhYgkgkoEHfHxVKtLWfzftqkU6a6
   ICb8oJXwOXBQDvv6FbIXZ8f7yTdMAaqgRZCU5ryDos9AQZlNYZA8tgYbF
   E7OSXvwSVY0fVE7m2eEEnghayvRE7ybPojsz/I0xWr/6lMWefzlow5mWI
   g==;
X-CSE-ConnectionGUID: YWTdUNCHTlmo0SQ1jvJ0mg==
X-CSE-MsgGUID: EOcBKWrvSnuphOzLxntE3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95199992"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="95199992"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 02:14:14 -0700
X-CSE-ConnectionGUID: 85hoQRIcRKuQci18GKJKeA==
X-CSE-MsgGUID: vskIANmWTQyay670/OzFEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="256489997"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Jul 2026 02:14:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkIAT-00000000Ocg-3WY6;
	Thu, 16 Jul 2026 09:14:09 +0000
Date: Thu, 16 Jul 2026 17:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: fs/file_table.c:241:13: sparse: sparse: cast truncates bits
 from constant value (123456789abcdef becomes 89abcdef)
Message-ID: <202607161708.OwceDeuL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58717b2a1365d06c8c64b72aa948541b53fe31eb
commit: 1f1651d6dc2ac282d07043358824273c15a1cac4 fs: hide file and bfile caches behind runtime const machinery
date:   4 months ago
config: i386-randconfig-061-20260716 (https://download.01.org/0day-ci/archive/20260716/202607161708.OwceDeuL-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161708.OwceDeuL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1f1651d6dc2a ("fs: hide file and bfile caches behind runtime const machinery")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161708.OwceDeuL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/file_table.c:241:13: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
>> fs/file_table.c:241:13: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   fs/file_table.c:247:33: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   fs/file_table.c:275:13: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   fs/file_table.c:275:13: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   fs/file_table.c:281:33: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   fs/file_table.c:302:14: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   fs/file_table.c:302:14: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   fs/file_table.c:308:33: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   fs/file_table.c:81:33: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   fs/file_table.c:83:33: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)

vim +241 fs/file_table.c

   211	
   212	/* Find an unused file structure and return a pointer to it.
   213	 * Returns an error pointer if some error happend e.g. we over file
   214	 * structures limit, run out of memory or operation is not permitted.
   215	 *
   216	 * Be very careful using this.  You are responsible for
   217	 * getting write access to any mount that you might assign
   218	 * to this filp, if it is opened for write.  If this is not
   219	 * done, you will imbalance int the mount's writer count
   220	 * and a warning at __fput() time.
   221	 */
   222	struct file *alloc_empty_file(int flags, const struct cred *cred)
   223	{
   224		static long old_max;
   225		struct file *f;
   226		int error;
   227	
   228		/*
   229		 * Privileged users can go above max_files
   230		 */
   231		if (unlikely(get_nr_files() >= files_stat.max_files) &&
   232		    !capable(CAP_SYS_ADMIN)) {
   233			/*
   234			 * percpu_counters are inaccurate.  Do an expensive check before
   235			 * we go and fail.
   236			 */
   237			if (percpu_counter_sum_positive(&nr_files) >= files_stat.max_files)
   238				goto over;
   239		}
   240	
 > 241		f = kmem_cache_alloc(filp_cache, GFP_KERNEL);
   242		if (unlikely(!f))
   243			return ERR_PTR(-ENOMEM);
   244	
   245		error = init_file(f, flags, cred);
   246		if (unlikely(error)) {
   247			kmem_cache_free(filp_cache, f);
   248			return ERR_PTR(error);
   249		}
   250	
   251		percpu_counter_inc(&nr_files);
   252	
   253		return f;
   254	
   255	over:
   256		/* Ran out of filps - report that */
   257		if (get_nr_files() > old_max) {
   258			pr_info("VFS: file-max limit %lu reached\n", get_max_files());
   259			old_max = get_nr_files();
   260		}
   261		return ERR_PTR(-ENFILE);
   262	}
   263	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
