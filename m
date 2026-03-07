Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB511EB5E1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 00:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772843480; cv=none; b=KPn7zsfymT8zSFSGmDcXm+/De+gJlzwJ0tm/TbJp9QBTZ9WVWIfYe01jsp8DJ/a7KXui5vdMKNtLK2y6O/blHyRmudCkh+fMYVjO1k8sEkUe8DZsRlomu0kfCy60ZcNnzyMB3bQVUFPtGzAtb57weHp65K9dL42+AB6LTb2/Y78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772843480; c=relaxed/simple;
	bh=IjbGYhlXlAm7HrjrQ+wFs3XBygBavd34ViB+y6lXe+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YiS5eg54jA75kU6lWt6REu+SR6Saj5py+aNkL85HnaCmfAro9Mek7Pxgn1ITkDhozTrrovPspCzQGYCshsor2GOSnjaK6x80ukGLyPNqJFPbgt5yPNuN9lki0jzzVvIQHsG9KJN5Izro09I1cAE7JLC0Xz5sYjTzzNQFgDhg1Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3VNy6hF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3VNy6hF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772843478; x=1804379478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IjbGYhlXlAm7HrjrQ+wFs3XBygBavd34ViB+y6lXe+o=;
  b=k3VNy6hFKOPRisZGPhHT8edPkTGDdhy29c37aEnDZjPdjnZrh2UmUCNd
   /C/QrFEljg+Be7zF1xKzqcxNDE1Wk77H2Z7dw1KKKpvaZ7uZxApP0U7XO
   g8m75JDjDJT4GMgJ54EmGsTtwAvuIvik7P5Z13xKPr7J9IuuXZAc6bQgU
   IRkmeUXl3t1Js2afI0Nv0YYiBfjHrTdDDC2eQ7YD/H2tQj/pv4Bbaif6M
   Z8PE1fJdSiX3yO09pq/Zg9cKF8GjqxkNW3UxWDA+c9tfX0xTHrPO/+WTg
   hZuS8q/9ATTvbi4TeZuHiF5rDic13sYpRKrccWiP/LT8FHVvFrGNIl8te
   A==;
X-CSE-ConnectionGUID: x28WvRYhTTKTBkZiMa5B1A==
X-CSE-MsgGUID: dZLoE/2ATcitKqpucWBjCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77805832"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="77805832"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 16:31:18 -0800
X-CSE-ConnectionGUID: RPBTfaIfTbG1BgOSXaRH6A==
X-CSE-MsgGUID: U4NZl4l8QVaDa1INw7FHmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="217346116"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2026 16:31:16 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyfZZ-000000001WD-2PIo;
	Sat, 07 Mar 2026 00:31:13 +0000
Date: Sat, 7 Mar 2026 08:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] mutex: Remove the list_head from struct mutex
Message-ID: <202603070817.Ce5296iz-lkp@intel.com>
References: <20260305195545.3707590-4-willy@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305195545.3707590-4-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v7.0-rc2 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/rwsem-Remove-the-list_head-from-struct-rw_semaphore/20260306-085403
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20260305195545.3707590-4-willy%40infradead.org
patch subject: [PATCH 3/3] mutex: Remove the list_head from struct mutex
config: powerpc64-randconfig-r061-20260307 (https://download.01.org/0day-ci/archive/20260307/202603070817.Ce5296iz-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070817.Ce5296iz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070817.Ce5296iz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/seqlock.h:20,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/char/nvram.c:34:
>> drivers/char/nvram.c:56:21: warning: 'nvram_mutex' defined but not used [-Wunused-variable]
      56 | static DEFINE_MUTEX(nvram_mutex);
         |                     ^~~~~~~~~~~
   include/linux/mutex.h:87:22: note: in definition of macro 'DEFINE_MUTEX'
      87 |         struct mutex mutexname = __MUTEX_INITIALIZER(mutexname)
         |                      ^~~~~~~~~


vim +/nvram_mutex +56 drivers/char/nvram.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  55  
613655fa39ff69 Arnd Bergmann  2010-06-02 @56  static DEFINE_MUTEX(nvram_mutex);
^1da177e4c3f41 Linus Torvalds 2005-04-16  57  static DEFINE_SPINLOCK(nvram_state_lock);
^1da177e4c3f41 Linus Torvalds 2005-04-16  58  static int nvram_open_cnt;	/* #times opened */
^1da177e4c3f41 Linus Torvalds 2005-04-16  59  static int nvram_open_mode;	/* special open modes */
d5bbb5021ce8d9 Finn Thain     2019-01-15  60  static ssize_t nvram_size;
^1da177e4c3f41 Linus Torvalds 2005-04-16  61  #define NVRAM_WRITE		1 /* opened for writing (exclusive) */
^1da177e4c3f41 Linus Torvalds 2005-04-16  62  #define NVRAM_EXCL		2 /* opened with O_EXCL */
^1da177e4c3f41 Linus Torvalds 2005-04-16  63  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
