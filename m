Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF187FBAC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547151; cv=none; b=knWcKKtOskhZ/SZJwmHDcAFvxOoBFQgJ1uEMENPkBgm7+vjTHdynAyaQExBmcta9MVYxiZ/rV3hdrmrRZ+PS8DoAa24yfN/Cx+bq//VUIiKcXq7DN3Rp9rMiSJbN/CnGAI3kNOyEMyRCAkYt3cO0S/HwQXcF5Lk2BdoiyOs0w8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547151; c=relaxed/simple;
	bh=UT94bjLceURMDPIaniCA5KNCK8CdJCoo02JjLg2X44Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ol1f/l5NLjP6Vpg8sBCr4cgMpxzP1QvosaUIWO9FFComYjPfp27KfCmb/xtEuZzwvlBC8btI3JDtgEl2ahsN9KaUcHB6y2gzJ+l+1ZKWtjeTbwrhyHXD5P7ZjCFtqpvc9rnVBmXosHqX9NcIN2xg2WfYaDLJjVq2x/KB7N+ehJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxtNK3F9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxtNK3F9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725547150; x=1757083150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UT94bjLceURMDPIaniCA5KNCK8CdJCoo02JjLg2X44Y=;
  b=QxtNK3F9U6KGidACguJ4hk+ViU0hRdZ6VwBjo9jIpjL5W0SiD7H6SeW6
   78si4PykRSTKPCnu3hCgXYcLRIkWf4m+2+CihOOtKqiZu7NJ9//C7j1CM
   5BSVphelbsGvyzcK5TxzeI5heoKjiVwPKdmLiOJn7TwcXE64mtwMxtTHk
   kvUTlEJAaMWy9hfEx2jF8Us4eEz12T+aD5X30bHJBLXxSB6TitI38GAGD
   hRktvwqCefWEUOmtMF0W5S5btJELkPFYsp3aTlh131YHZZuRh8WE7Ymzs
   avxnaPmfGgbBcmnQafZgmtSoVE7eyAOGaQu9mixYqJIs+0Yb5duhlUO7b
   A==;
X-CSE-ConnectionGUID: ttSlPAY6RwSIdxq/l9o+Qg==
X-CSE-MsgGUID: 1SPRzWbARVq0OPvfFWPlkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35654001"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="35654001"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:39:09 -0700
X-CSE-ConnectionGUID: tBaeguwzScGB0MRv0Xuvzw==
X-CSE-MsgGUID: 4I4eOSlwTJ2xJKHwZuMkCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="70572996"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Sep 2024 07:39:07 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smDdZ-000A0R-1A;
	Thu, 05 Sep 2024 14:39:05 +0000
Date: Thu, 5 Sep 2024 22:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: Hongzhen Luo <hongzhen@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v4 4/4] erofs: introduce .fadvise for page cache share
Message-ID: <202409052207.kaXiDkH0-lkp@intel.com>
References: <20240902110620.2202586-5-hongzhen@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902110620.2202586-5-hongzhen@linux.alibaba.com>

Hi Hongzhen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on xiang-erofs/fixes]
[also build test WARNING on linus/master v6.11-rc6]
[cannot apply to xiang-erofs/dev-test xiang-erofs/dev next-20240905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongzhen-Luo/erofs-move-struct-erofs_anon_fs_type-to-super-c/20240902-204137
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git fixes
patch link:    https://lore.kernel.org/r/20240902110620.2202586-5-hongzhen%40linux.alibaba.com
patch subject: [PATCH RFC v4 4/4] erofs: introduce .fadvise for page cache share
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240905/202409052207.kaXiDkH0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409052207.kaXiDkH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409052207.kaXiDkH0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/limits.h:7,
                    from include/linux/overflow.h:6,
                    from include/linux/string.h:12,
                    from include/linux/seq_file.h:6,
                    from fs/erofs/super.c:8:
   fs/erofs/super.c: In function 'erofs_free_inode':
>> include/vdso/limits.h:14:25: warning: unsigned conversion from 'long long int' to 'long unsigned int' changes value from '9223372036854775807' to '4294967295' [-Woverflow]
      14 | #define LLONG_MAX       ((long long)(~0ULL >> 1))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/super.c:114:54: note: in expansion of macro 'LLONG_MAX'
     114 |         seg = interval_tree_iter_first(&vi->segs, 0, LLONG_MAX);
         |                                                      ^~~~~~~~~
>> include/vdso/limits.h:14:25: warning: unsigned conversion from 'long long int' to 'long unsigned int' changes value from '9223372036854775807' to '4294967295' [-Woverflow]
      14 | #define LLONG_MAX       ((long long)(~0ULL >> 1))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/super.c:116:60: note: in expansion of macro 'LLONG_MAX'
     116 |                 next_seg = interval_tree_iter_next(seg, 0, LLONG_MAX);
         |                                                            ^~~~~~~~~


vim +14 include/vdso/limits.h

3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   4  
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   5  #define USHRT_MAX	((unsigned short)~0U)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   6  #define SHRT_MAX	((short)(USHRT_MAX >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   7  #define SHRT_MIN	((short)(-SHRT_MAX - 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   8  #define INT_MAX		((int)(~0U >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   9  #define INT_MIN		(-INT_MAX - 1)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  10  #define UINT_MAX	(~0U)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  11  #define LONG_MAX	((long)(~0UL >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  12  #define LONG_MIN	(-LONG_MAX - 1)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  13  #define ULONG_MAX	(~0UL)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20 @14  #define LLONG_MAX	((long long)(~0ULL >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  15  #define LLONG_MIN	(-LLONG_MAX - 1)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  16  #define ULLONG_MAX	(~0ULL)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  17  #define UINTPTR_MAX	ULONG_MAX
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  18  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
