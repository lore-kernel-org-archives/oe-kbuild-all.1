Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D259A214A7F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 07:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603895; cv=none; b=n7ZwowEXMTu3SH+jZmU593S3PBCcE+tY/YnjHLb0WnTGFkVcStzYoaVuCpEQAHaYOMcJ2ZSB+WVQ6rV8AZUCP1mIcgjegAyVM14r053SJcTNfSuGZPVm6wn+TXxUFb2SjB0KGfxKELkMyQOZyazhAweMJ4rdyd1QKvW4x3HYVTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603895; c=relaxed/simple;
	bh=cQs/NehzG45f7DDa0wSPq7m5Oj2IMk6PXpb1/R5/eUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=if9KYsMVGdqfF7qMsbG3C/eH+LWseGebUKl2TWTbjrj4+5oJV1oe4daKzpecBMGwHZf4A1MNYLK2UXtGt/qDqEUweifhZFf+jWWl3QVzAoYgOtmE9CRLBaDxPu6PUJ/Zit+TRjTGzsPoGFwd3GPjPqpwr/QVFbkmhfhEGj6RER8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDEe+/oL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDEe+/oL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746603894; x=1778139894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQs/NehzG45f7DDa0wSPq7m5Oj2IMk6PXpb1/R5/eUo=;
  b=TDEe+/oL6FCcTwQl13G2DfVqLYeNjCwfQksGJ73OgQJZEyhgdC6Q3Y9+
   6DoPt9zhHtR/5hBPyxkPyOWaiavgYUVh7cK5rWtExK5r0f6R6n4VeUwBB
   PEoky9Cv1N4nd5uSLxVdHpuYkVAq+D2yMmERGU3L20WqCSCNyw16fHl2W
   DuFzjxXrsdpMYp7ve7dJt5DgvNMP5PbB1309TU45Ybp1xLO+JYODyvrzY
   Q23U/qMLnIzKibFu6jZUP2cs85g0hNb8E8EmlKJ28cnCHoknkoclf+DaB
   L3WKrWwlxt7ZbtnAzK8jmSna+YRn3zNzLuOErvjVKZps+gdYFuWhsCPGV
   Q==;
X-CSE-ConnectionGUID: Ru5MwyjsQQ6ZQy6CqL+R6g==
X-CSE-MsgGUID: d8hm3Sa5TnGso7e26og66g==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52133177"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="52133177"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:44:53 -0700
X-CSE-ConnectionGUID: GVKazIv9R2WSpvSD2xu1bA==
X-CSE-MsgGUID: jGxPJYpiSv6GJ/f3poiF7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135875080"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 00:44:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZSU-0007LX-0B;
	Wed, 07 May 2025 07:44:50 +0000
Date: Wed, 7 May 2025 15:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Subject: [jlayton:reftrack-dbgfs 5/8] lib/ref_tracker.c:98:30: warning:
 'pr_ostream_seq' defined but not used
Message-ID: <202505071525.7IHtWgYQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git reftrack-dbgfs
head:   1c49f3ad833f720bc692137505882e0fbdabb7e4
commit: 026d9637a656795b9badeb0ec1895bb18e2632e8 [5/8] ref_tracker: allow pr_ostream() to print directly to a seq_file
config: openrisc-randconfig-r122-20250426 (https://download.01.org/0day-ci/archive/20250507/202505071525.7IHtWgYQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071525.7IHtWgYQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071525.7IHtWgYQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/ref_tracker.c:98:30: warning: 'pr_ostream_seq' defined but not used [-Wunused-function]
      98 | static void __ostream_printf pr_ostream_seq(struct ostream *stream, char *fmt, ...)
         |                              ^~~~~~~~~~~~~~
   lib/ref_tracker.c:16:23: warning: 'ref_tracker_debug_dir' defined but not used [-Wunused-variable]
      16 | static struct dentry *ref_tracker_debug_dir = (struct dentry *)-ENOENT;
         |                       ^~~~~~~~~~~~~~~~~~~~~


vim +/pr_ostream_seq +98 lib/ref_tracker.c

    97	
  > 98	static void __ostream_printf pr_ostream_seq(struct ostream *stream, char *fmt, ...)
    99	{
   100		va_list args;
   101	
   102		va_start(args, fmt);
   103		seq_vprintf(stream->seq, fmt, args);
   104		va_end(args);
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
