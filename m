Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082DA1361
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 21:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727127069; cv=none; b=IMncz8RMsIu5h3y7m8f4UUGDq4xY5m0KCnLvITXc3STqoC7cvKocOTI7elDSbewoHe0c32TzLqEHqyE0ZmJ+mUqeTZCTy2OWCVHTq1JmJkBebHHqAt4Mt/FA1/Ak0bAi+j3SYYKMtz6RyR0u36Qd1D2vgg+VkMZIcBfrqWe/wUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727127069; c=relaxed/simple;
	bh=QTekxfaNaN8IG6PteUiDDFC8Jb8wzI+6h9p2OTkA0iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwXvfYM9/C2VAj/+7Y5XOssfbXeCuuLpuqxbu4PwQRo+QrcFxkehWMjIRX3fR4Lq5OCiSESlhuw5nSQ2XapuUUDIx8O8jDLEjE+JUumOZSMLZ8GyePuzQC7ViBBM1h9L3QR51zq4m/amGF3buz0QPJz+C4dxWZN9uPutPp/hGyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pebcmb09; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pebcmb09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727127068; x=1758663068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QTekxfaNaN8IG6PteUiDDFC8Jb8wzI+6h9p2OTkA0iE=;
  b=Pebcmb09CBhpEXJvIuOKz3v8ZN9tQpAZTNhV2Hybyivgx4y3nLQ2sbUF
   sh+Sxf/bm4iwpHO88IFjoKHXyg+X+Jnl8KXxrbB3CVHQidOJSB2WC5S1Q
   FLApdSB9sNgSpbU8MqKiBMCwbroHhRYj/8vUVGxC0F3WH3kVUEc1liHim
   rypLrdw9mJnUxIEZzK2GkJnY+LvhU2E1qMiqjtVItsaUIPMTngmPpNfSq
   iC58HlzisNLJGSnI5rfmjQD48U2tYJLH44KBDcQoApDMqJMX0GjdTAC0s
   Xotp2I5vC86ZIpRSx3QvV5FxVExHlZfX+WaQulUGHZ7C955wuXd44ivzO
   Q==;
X-CSE-ConnectionGUID: seh3Mc97SwumWK+Ya4n8XA==
X-CSE-MsgGUID: qB7lgGHFTiyj8t5SAcXZ4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37233477"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="37233477"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 14:31:08 -0700
X-CSE-ConnectionGUID: tG/6mynYT6yslR9lqNynDA==
X-CSE-MsgGUID: 4MwurWLkQs6iflw9/6WQSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="76121064"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2024 14:30:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssqdm-000HcP-1a;
	Mon, 23 Sep 2024 21:30:42 +0000
Date: Tue, 24 Sep 2024 05:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Shakeel Butt <shakeel.butt@linux.dev>, linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH 1/2] mm/madvise: introduce PR_MADV_SELF flag to
 process_madvise()
Message-ID: <202409240556.LgM8vOIF-lkp@intel.com>
References: <077be0d59cb1047870a84c87c62e7b027af1c75d.1727106751.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <077be0d59cb1047870a84c87c62e7b027af1c75d.1727106751.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on arnd-asm-generic/master soc/for-next linus/master v6.11 next-20240923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-madvise-introduce-PR_MADV_SELF-flag-to-process_madvise/20240924-000845
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/077be0d59cb1047870a84c87c62e7b027af1c75d.1727106751.git.lorenzo.stoakes%40oracle.com
patch subject: [PATCH 1/2] mm/madvise: introduce PR_MADV_SELF flag to process_madvise()
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240924/202409240556.LgM8vOIF-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240556.LgM8vOIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240556.LgM8vOIF-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/madvise.c: In function '__do_sys_process_madvise':
>> mm/madvise.c:1514:22: error: 'PR_MADV_SELF' undeclared (first use in this function)
    1514 |         if (flags & ~PR_MADV_SELF) {
         |                      ^~~~~~~~~~~~
   mm/madvise.c:1514:22: note: each undeclared identifier is reported only once for each function it appears in


vim +/PR_MADV_SELF +1514 mm/madvise.c

  1502	
  1503	SYSCALL_DEFINE5(process_madvise, int, pidfd, const struct iovec __user *, vec,
  1504			size_t, vlen, int, behavior, unsigned int, flags)
  1505	{
  1506		ssize_t ret;
  1507		struct iovec iovstack[UIO_FASTIOV];
  1508		struct iovec *iov = iovstack;
  1509		struct iov_iter iter;
  1510		struct task_struct *task;
  1511		struct mm_struct *mm;
  1512		unsigned int f_flags;
  1513	
> 1514		if (flags & ~PR_MADV_SELF) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
