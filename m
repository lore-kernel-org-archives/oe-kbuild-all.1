Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEE63E92A7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151326; cv=none; b=Q5cZBy88SNnxAn6O21PS2rrt21ddFJaEPJEXChvz7yGo8z/3igK47CDQJbo9c8RDObydlBHKGSOYNIhl8a6KwORCIAa8sPbrBGYO7jE+pby28fJuhZ1YOHpb7trdeFR02Bdhrj7XFlc7oA3VGpRnUByv3QpzAvqSEgLMaQelzno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151326; c=relaxed/simple;
	bh=w5jKl0sQVJO6Df+qFr2nJ99Kzk1g21+iTSAIp5LlRMY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MIc5m9Aj1LhbTYzVTdi4qCSydDX1QgQ1gPEiKBBKusEm9QUXvR0noReanV3NHfOM91FkcKQYwMgcFFX6AmHKPW9drxOUoV/nxUV1SHMmHWzzltRuhUznnSgSoRlPlW6U9svK1dJ4ADveqVDswjt/1CON5pB/z29iv3+Rd5lUstA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FirheccI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FirheccI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778151323; x=1809687323;
  h=date:from:to:cc:subject:message-id;
  bh=w5jKl0sQVJO6Df+qFr2nJ99Kzk1g21+iTSAIp5LlRMY=;
  b=FirheccID+cuZzYI4O7LjmMfZZAtpla3KLfBj1cBcvfBXsYfI0MXMM+h
   0WcHPxKVfXP6cODW6kKlL32gjL8yyZ+1CkHO2rqcU7ocH7jRdPdECtHxg
   gN7a/HWhFeEE7JdQ/nYq3wg1li+WVBkIaODO7SKk1YfR5NjF53mudMVhc
   OQLJFdwTD2LN9y4QN10UP7gwB8upblW95WYQ7h7WoEmaUke+u8mSaUL71
   d80xTnzAAfgEDNjerfH6m+SRlpNEvGYgE94LNkoXI6j5Zm5NGxfi8jajr
   8ZknWJOTk9tFBfEoOj+aapIAXj3RyT8yxCYvKzc3yvpnaOUbFf5Kg2u+L
   g==;
X-CSE-ConnectionGUID: Mz50O+RaQ0iQ6WFOppEUYQ==
X-CSE-MsgGUID: dsy651xORRCVV1rOcR1VHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90199807"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="90199807"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 03:55:11 -0700
X-CSE-ConnectionGUID: V4o7LqIkS0qMRg1Zm4K4Lw==
X-CSE-MsgGUID: B3fj29R4RIiDQgUqhhKz9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="233766838"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 May 2026 03:55:09 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKwNm-000000000C1-0zWP;
	Thu, 07 May 2026 10:55:06 +0000
Date: Thu, 07 May 2026 18:54:34 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: fs/file_table.c:241:13: sparse: sparse: cast truncates bits
 from constant value (123456789abcdef becomes 89abcdef)
Message-ID: <202605071805.Ho9VwgNW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc
commit: 1f1651d6dc2ac282d07043358824273c15a1cac4 fs: hide file and bfile caches behind runtime const machinery
date:   5 weeks ago
config: i386-randconfig-061-20260507 (https://download.01.org/0day-ci/archive/20260507/202605071805.Ho9VwgNW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071805.Ho9VwgNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1f1651d6dc2a ("fs: hide file and bfile caches behind runtime const machinery")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071805.Ho9VwgNW-lkp@intel.com/

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
