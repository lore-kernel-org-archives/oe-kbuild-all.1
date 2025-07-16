Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971431E8331
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 14:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752676782; cv=none; b=uzxPb9HYBSa56QK3Qj/4u9T5WuEYslSdGRgMjbj2e7TYQAlyHNyUd4U3nX1DZ9nthLmHIM8CZB/6KNW0sAtOYmzVwl4lRnZ4ktcFGuYfn1nsqR0jhENcErrESIyjJZI39k4rPX4MOucfUxsN/VcAVJZrj9fYDDOvRj2YY8Op3MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752676782; c=relaxed/simple;
	bh=7F+7R+BHl0yUnu7rkVSVSNUSnx3UdUQdaVfzZ6xjwCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eSIIFtRgCdf9oqOXYEJ9RQPHHwz8/PG3+DwmsbmsscjDbKL657bH+0OzkAAYUeVlEvdcVhxAc2nrAAg3yZfUxgFX05Tkf7PvLV6ppN7IkBCARZfCSy6cgo9H2xSffHdJMdBbtltU+LG1mxP6aMjHk+7bnqUFe4jXmKcBE8QWzI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9tuqkLg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9tuqkLg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752676781; x=1784212781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7F+7R+BHl0yUnu7rkVSVSNUSnx3UdUQdaVfzZ6xjwCI=;
  b=B9tuqkLgqcnTDNn8qOZ8AmxF4S+9V9zPf0LWQYFlHQVJClppT0hpEoU+
   VPt8WINFCZ7jmj87YSxWRztr/074eIA1jIrbzgye+yx9nchae37zrO7co
   gHzAOw/gWvuM3LEWStkj+ze8wlp8ZDNp4xdmW2ul1Fzy0DYoRIWC0H5sx
   mgQHMMM3pnxOQrP6ZIKLz0nezkjqSEYKFb8naK4Fnt/gcTzpDnIb3BY9k
   Gmc8rzULVFJCDLfE5w7MjqxicUjfN9S72VVJoHnDynbkqVxTqJ8CEbZEK
   CK6uGEjWsl+5+R5puerzQW5llXaJKLIp4Cl1NIiUvbx+WvoTshqF/H1jK
   g==;
X-CSE-ConnectionGUID: 5ep5AhthSbiyIbdnYbqtQQ==
X-CSE-MsgGUID: H67D+F/gRi6kae9BohXolg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65622528"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="65622528"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 07:39:39 -0700
X-CSE-ConnectionGUID: 6kBRLhtTSDaImQDAln2GVQ==
X-CSE-MsgGUID: 7Uyrx3MSRz2C6IuKumIVUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="157188908"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jul 2025 07:39:37 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uc3IF-000CVf-2J;
	Wed, 16 Jul 2025 14:39:35 +0000
Date: Wed, 16 Jul 2025 22:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pu Lehui <pulehui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2519/2519] kernel/cgroup/ifs.c:400:6: warning:
 variable 'start' set but not used
Message-ID: <202507162216.3Q6gsro5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0a2a4d6188250982405816f6ee5b085bfb522721
commit: bc298fe613e2a09d9b804de1212c31fb0d375a47 [2519/2519] interference: Add distribution histogram support
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250716/202507162216.3Q6gsro5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507162216.3Q6gsro5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507162216.3Q6gsro5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/ifs.c:400:6: warning: variable 'start' set but not used [-Wunused-but-set-variable]
     400 |         u64 start;
         |             ^
   1 warning generated.


vim +/start +400 kernel/cgroup/ifs.c

   393	
   394	static int print_hist_count(struct cgroup_ifs *ifs, struct seq_file *seq)
   395	{
   396		struct cgroup_ifs_hist *h;
   397		struct ifs_tdesc *desc;
   398		bool is_print_title;
   399		const char *name;
 > 400		u64 start;
   401		int count;
   402		int i, j;
   403		int cpu;
   404	
   405		h = kzalloc(sizeof(struct cgroup_ifs_hist), GFP_KERNEL);
   406		if (!h)
   407			return -ENOMEM;
   408	
   409		for_each_possible_cpu(cpu) {
   410			struct cgroup_ifs_cpu *ifsc = per_cpu_ptr(ifs->pcpu, cpu);
   411	
   412			for (i = 0; i < NR_IFS_TYPES; i++) {
   413				if (!should_print(i))
   414					continue;
   415				for (j = 0; j < CGROUP_IFS_HIST_SLOTS; j++)
   416					h->counts[i][j] += ifsc->hist.counts[i][j];
   417			}
   418		}
   419	
   420		for (i = 0; i < NR_IFS_TYPES; i++) {
   421			name = ifs_type_name(i);
   422			is_print_title = false;
   423			start = 1ULL << 63;
   424	
   425			if (!should_print(i))
   426				continue;
   427	
   428			if (i == IFS_SPINLOCK || i == IFS_MUTEX)
   429				desc = &ifs_tdesc[IFS_TIMER_TSC];
   430			else
   431				desc = &ifs_tdesc[IFS_TIMER_CLK];
   432	
   433			count = 0;
   434			for (j = 0; j < CGROUP_IFS_HIST_SLOTS; j++) {
   435				if (j < desc->tdesc_num) {
   436					count += h->counts[i][j];
   437					continue;
   438				} else if (j == desc->tdesc_num) {
   439					count += h->counts[i][j];
   440				} else {
   441					count = h->counts[i][j];
   442				}
   443	
   444				if (count) {
   445					if (unlikely(!is_print_title)) {
   446						is_print_title = true;
   447						seq_printf(seq, "%s distribution\n", name);
   448					}
   449					seq_printf(seq, "%-24s: %d\n",
   450						   desc->tdesc_str[j], count);
   451				}
   452				start /= 2;
   453			}
   454	
   455			if (is_print_title)
   456				seq_puts(seq, "\n");
   457		}
   458	
   459		kfree(h);
   460		return 0;
   461	}
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
