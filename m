Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E797B4949EB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 15:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082021; cv=none; b=JCqFfzq1x49YTwZtz08qTvzRPHfx35mX7Wrf2Q/qR08KGvoBKx0FckAn0Je1rP6YGOliZlfMh7w8CRGEtQBMe5Gwu6nU1h1M/ZApwnlr7aja/IBkIVFFHwz48Rs2hgm+V9lMkry0WRzHoN97rvx8aP98x1tTRiXt9dMiUVGnfho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082021; c=relaxed/simple;
	bh=sBQvTe+Vj8HUIjrVulhJGKLK/C+XmtQWvHlT12+DuNQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=psdK7RJ3TE1r9TQ6aUFT9RExsySJciQFe51G0WPv3er9DMDZdJoDzpGhMYtjKl8xb2bUmGEtT3cnhi76KdMLv2fbHZWdAicA7kXCWz73h8NYjX78peKhZXXbMJw5CPBch/Uf3rb+DuODgRLjjqfvy7IT9PE9BysW9/ytlcu5F9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwrAJvkm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwrAJvkm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778082016; x=1809618016;
  h=date:from:to:cc:subject:message-id;
  bh=sBQvTe+Vj8HUIjrVulhJGKLK/C+XmtQWvHlT12+DuNQ=;
  b=CwrAJvkmlgOlFWuIvO4cVWH3a4rMWsQ4L0w5Hb6wK09lRFQvO3fgSkXt
   MYuaRc08haca2lLa3aBybDu8xLLXMj0hXJs8qZ1eZ3dEK+MQ7GWZl9bDJ
   L+Vdz9DKW1dSDzHsC8myYW+ylZm0BF9BiEBLmDGWEf/1Ge7MawQhqZwyk
   u0qRF9pptTrBItJCneFzsA9zkYJ0xIAAVKINjKgPjpH0YNLsylpkIwvXY
   ni+cOx4ooiJ8+l4BiI/shYlrzzr2DCiRERpolyJnm9BG0p6H3l2gUv/9M
   8rGMBa3SUka43F+vjgeG+6zJB1IA8EnQjB4NWgLFlYrdyQs/1B9wzwDcd
   A==;
X-CSE-ConnectionGUID: YOTwcPRkQ7CphKQSCAk2Xg==
X-CSE-MsgGUID: sC6QrrL+R4+a9dYzbGEUCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="89604325"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="89604325"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 08:40:12 -0700
X-CSE-ConnectionGUID: 9MtCc1U7QXeVcrsLGxzzvg==
X-CSE-MsgGUID: RpbjiVZkQRuCdInWFaPQlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="240161523"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 May 2026 08:40:11 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKeM4-0000000011T-1qKI;
	Wed, 06 May 2026 15:40:08 +0000
Date: Wed, 06 May 2026 23:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [song:fanotify-bpf 2/3]
 samples/fanotify/filter-user.c:78:26: warning: cast from pointer to integer
 of different size
Message-ID: <202605062315.z1Auhppm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/song/linux.git fanotify-bpf
head:   d2202d928a9b4a190058b1bc4731b72477a10c8e
commit: ea0d644c4688cd598d2ccc164a3fa6322dff642c [2/3] samples/fanotify: Add a sample fanotify fiter
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260506/202605062315.z1Auhppm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605062315.z1Auhppm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605062315.z1Auhppm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   samples/fanotify/filter-user.c: In function 'main':
>> samples/fanotify/filter-user.c:78:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      78 |         args.init_args = (__u64)&init_args;
         |                          ^


vim +78 samples/fanotify/filter-user.c

    46	
    47	int main(int argc, char **argv)
    48	{
    49		struct fanotify_filter_args args = {
    50			.name = "monitor-subtree",
    51		};
    52		struct fan_filter_sample_args init_args;
    53		int fanotify_fd, subtree_fd;
    54		char buffer[BUFSIZ];
    55		const char *msg;
    56		__u64 mask;
    57		int flags;
    58	
    59		if (argc < 3) {
    60			printf("Usage:\n"
    61			       "\t %s <mount point> <subtree to monitor>\n",
    62				argv[0]);
    63			return 1;
    64		}
    65	
    66		subtree_fd = open(argv[2], O_RDONLY | O_CLOEXEC);
    67	
    68		if (subtree_fd < 0)
    69			errx(1, "open subtree_fd");
    70	
    71		init_args.subtree_fd = subtree_fd;
    72	
    73		if (argc == 4 && strcmp(argv[3], "block") == 0)
    74			init_args.mode = FAN_FILTER_SAMPLE_MODE_BLOCK;
    75		else
    76			init_args.mode = FAN_FILTER_SAMPLE_MODE_FILTER;
    77	
  > 78		args.init_args = (__u64)&init_args;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
