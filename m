Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590A34438B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 22:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721689029; cv=none; b=Egk9uw5bF1VS6/1IOgLZrypSv4eMxh94EOMDa+2YvvCLiOyQrgDMLjRa3YWq4PEjLoclrsNbQGgU+U7C8YZdWLL0bSdaFd8xwgIgjHs/RqaEzGQvSw8xObM8HjleDh0NcbupgJ8wdqTA8F9K1bVWO5gtdTLu/tfkZEFhwQfRYK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721689029; c=relaxed/simple;
	bh=hTZaaadCNgRsiyJJkgcyhjuh3rbYlwXIOezqyckecDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LhWCzTrcLzuiS6iSYApT6R7DJb7/IcGcpsgnkZYTqEWaGva0XLHvYnBd6+lSjLYoQAc42ajy7x5etZSqus04BLNVI5rZfK2va+TNRjYWbIc7cY9xfTPlpboO0U7cBeYtxpZSd5bcC47KK2AwqiBqZKNmuM8wrUBbaCDMKpWXVa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+BhV9Kt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+BhV9Kt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721689027; x=1753225027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hTZaaadCNgRsiyJJkgcyhjuh3rbYlwXIOezqyckecDI=;
  b=S+BhV9KtKle4TkO+KbsffzZxd2nwebw1qGNgmFwOp6l5JboZw4p6eaU7
   wfbFkwEZwTEbvGd5UBuPjcIdSAksDicvSLPmL24WcBjHVfyAoJoCeL6lZ
   C9Our3p5nOfPZ33ut4XA5bGSjNxWR+bBgfRSYCfd2xdN4KE97NNNKXr6I
   SSLHj9wYgCLIFxmewwrv2czAGWs//ehV52sD4Smyjlv+SDJLyt3GdYpcq
   gBsYaGfkyIHRYoEy3niF8gBy/Pv+YmKhGuExeDFm9oi8EgDTKscyWchFb
   Q3SmpbhXnirdg1WVw1pbJKEornd8xciTJ49RpHIV86lbHlTOKre7BKhme
   Q==;
X-CSE-ConnectionGUID: iX1FqgzEQH6GJSNmg5hHQA==
X-CSE-MsgGUID: ZJ4XESqyTIecCyfBcf6O1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="41812791"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="41812791"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 15:57:06 -0700
X-CSE-ConnectionGUID: 47gvh1UARmiDFyPrsb9Iow==
X-CSE-MsgGUID: PhmC24vTSkych6ZcxH22Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="56581503"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jul 2024 15:57:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW1xm-000lSm-37;
	Mon, 22 Jul 2024 22:57:02 +0000
Date: Tue, 23 Jul 2024 06:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/gup.o: warning: objtool: faultin_page_range+0x100: unreachable
 instruction
Message-ID: <202407230630.3vGhnlFB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   933069701c1b507825b514317d4edd5d3fd9d417
commit: 631426ba1d45a8672b177ee85ad4cabe760dd131 mm/madvise: make MADV_POPULATE_(READ|WRITE) handle VM_FAULT_RETRY properly
date:   3 months ago
config: loongarch-randconfig-001-20240722 (https://download.01.org/0day-ci/archive/20240723/202407230630.3vGhnlFB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407230630.3vGhnlFB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407230630.3vGhnlFB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/gup.o: warning: objtool: get_user_pages_remote+0x160: unreachable instruction
   mm/gup.o: warning: objtool: get_user_pages+0x12c: unreachable instruction
   mm/gup.o: warning: objtool: get_user_pages_unlocked+0x138: unreachable instruction
   mm/gup.o: warning: objtool: __gup_longterm_locked+0x3d8: unreachable instruction
>> mm/gup.o: warning: objtool: faultin_page_range+0x100: unreachable instruction


objdump-func vmlinux.o faultin_page_range:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
