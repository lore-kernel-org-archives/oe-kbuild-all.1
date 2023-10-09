Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996A53D982
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 20:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiAS4yV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696882119; x=1728418119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AlVu9JDMlLVAr2Pbx5ABb87AaOtONiSwSMBtA88qD1Y=;
  b=LiAS4yV4NpU+kFO26wkvP8Pr09Fx1IG2IrqcWUHkb4kQyTgtjjgAo0PR
   wOerEXeglH4Lt5qILXjTBGuEr2n/bbfmZyvlFXPHigYg+o9nRGvnt2vJ6
   q4oMW0RU+a7z6tSODccCMoruZ/Tf61DVW37dzrvLLY3xeDxvZTlwTnDR1
   nzR2jXFUbgj+F/vRbOEEo5AI/4vZdH4xPFcdepmwFWGCrt2JuzCWbYbDf
   YzW8mXc0d96JsCIYqbPllnhrh8Wk+7dM5guMyr0Nhc6tpP58Nro53tncn
   VFQ2X5i2Xzyv3DxLifplXaI9zblIAclWKiY5KzweZZM+uX8iwlMXhhvLg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="415224281"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="415224281"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 13:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="788286289"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="788286289"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 09 Oct 2023 13:07:40 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpwXR-0000cU-2t;
	Mon, 09 Oct 2023 20:07:37 +0000
Date: Tue, 10 Oct 2023 04:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 10184/10591] mm/gup.c:3446 pin_user_pages_fd()
 warn: unsigned 'start' is never less than zero.
Message-ID: <202310100409.LrBAYpmk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2a860505b617cf8fda4ebff6cf05d3f774145440
commit: ad999eeb01ea4bd5c667d80e5c2cea4ef9c47e3e [10184/10591] mm/gup: introduce pin_user_pages_fd() for pinning shmem/hugetlbfs file pages
config: i386-randconfig-141-20231008 (https://download.01.org/0day-ci/archive/20231010/202310100409.LrBAYpmk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231010/202310100409.LrBAYpmk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100409.LrBAYpmk-lkp@intel.com/

smatch warnings:
mm/gup.c:3446 pin_user_pages_fd() warn: unsigned 'start' is never less than zero.

vim +/start +3446 mm/gup.c

  3413	
  3414	/**
  3415	 * pin_user_pages_fd() - pin user pages associated with a file
  3416	 * @fd:         the fd whose pages are to be pinned
  3417	 * @start:      starting file offset
  3418	 * @nr_pages:   number of pages from start to pin
  3419	 * @gup_flags:  flags modifying pin behaviour
  3420	 * @pages:      array that receives pointers to the pages pinned.
  3421	 *              Should be at least nr_pages long.
  3422	 *
  3423	 * Attempt to pin (and migrate) pages associated with a file belonging to
  3424	 * either shmem or hugetlbfs. An error is returned if pages associated with
  3425	 * hugetlbfs files are not present in the page cache. However, shmem pages
  3426	 * are swapped in or allocated if they are not present in the page cache.
  3427	 *
  3428	 * Returns number of pages pinned. This would be equal to the number of
  3429	 * pages requested.
  3430	 * If nr_pages is 0 or negative, returns 0. If no pages were pinned, returns
  3431	 * -errno.
  3432	 */
  3433	long pin_user_pages_fd(int fd, pgoff_t start, unsigned long nr_pages,
  3434			       unsigned int gup_flags, struct page **pages)
  3435	{
  3436		struct page *page;
  3437		struct file *filep;
  3438		unsigned int flags, i;
  3439		long ret;
  3440	
  3441		if (nr_pages <= 0)
  3442			return 0;
  3443		if (!is_valid_gup_args(pages, NULL, &gup_flags, FOLL_PIN))
  3444			return 0;
  3445	
> 3446		if (start < 0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
