Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21972189F43
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 21:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732312528; cv=none; b=D+ALzEeYAfCznWRAcbqITQ4kbbV1jdps7ASukc6V0i+snrVYRkH5qGgy075i4nnkuh2aaeph9I3rxAkiIQ3Mr0eWFwET7ZwMNbMAMITGvdLsxm6Bc8j8xEbNuQAkAku0WmgXRJ8NTWQfcNkMGetO0aj4x+ykJammIal+W5HXDX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732312528; c=relaxed/simple;
	bh=hH08hCGDYadug5v5pkms3SGhVbqu3ZrxQ2Xjy+5wcH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZKfyK5iW82yI04o0swiAP/5oE9EzZDiHmI+Dvh2xeZqLNSx/4MJ3ezbMIouX4EBVcFToyZVa+yF+vPiAH0RyL3LKmxtyHuLfKp2k7ryzAvFt+Ng5B0TUu033yPrUDYNrh3PAiZUzcR5mhG4DXQnCARwpJTqB/3EoB5JEPkZvF3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/v8v534; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/v8v534"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732312527; x=1763848527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hH08hCGDYadug5v5pkms3SGhVbqu3ZrxQ2Xjy+5wcH0=;
  b=H/v8v534DD9ZlDDgHyvPu5AZI9owAbRrDEZAZpyCsrG6RyI6MbY0OMgt
   lKCGAHmBfIP/RUDEnPluPqd6P5M0/2cxsKOjfFTE8f1N4wRvXhzNwKmJA
   DayA1ORwHCN7M/uvGwZoDhT5g0KhABtK+plttkbZG+TZVwbBaikwglM6T
   0qSc45BOzPGwp45MQFM0DF/bMZwu5McZKsONzz4HcORQQvHfakQrXyq3C
   zCE8N/xZ/ydm8hsEYnhE/+VdacYmdg48lmkuSumf7jbtKPBoHGshgqKC8
   kuNl0VVCf4jeB2kUD/r4AXo6QeXAu40fahubSI9e50lN2tsO8tb2i81+M
   w==;
X-CSE-ConnectionGUID: 41coJWHVTqWc5Pa2KZRMqA==
X-CSE-MsgGUID: uWMQrfyYSZ+fY4z3bCakBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32420628"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="32420628"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 13:55:24 -0800
X-CSE-ConnectionGUID: a0K/EVlNRYa8NY3SbCjoAA==
X-CSE-MsgGUID: HjeHPqEwTouIy6XpDRpw+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="90872722"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Nov 2024 13:55:23 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEbcX-0004Er-0k;
	Fri, 22 Nov 2024 21:55:21 +0000
Date: Sat, 23 Nov 2024 05:54:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-defer-tw 4/7] io_uring/slist.h:91:14: warning:
 variable 'ret' set but not used
Message-ID: <202411230514.Xlg0UVsy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-defer-tw
head:   4bf8001fb3399ea7a60349019db094f263aa42b9
commit: f79f607979c1ae9ed6373838a62a7f7427e8b93a [4/7] io_uring/slist: add list-to-list list splice helper
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241123/202411230514.Xlg0UVsy-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230514.Xlg0UVsy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230514.Xlg0UVsy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.h:12,
                    from io_uring/io_uring.c:82:
   io_uring/slist.h: In function 'wq_list_splice_list':
>> io_uring/slist.h:91:14: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      91 |         bool ret = false;
         |              ^~~


vim +/ret +91 io_uring/slist.h

    87	
    88	static inline bool wq_list_splice_list(struct io_wq_work_list *src,
    89					       struct io_wq_work_list *dst)
    90	{
  > 91		bool ret = false;
    92	
    93		if (wq_list_empty(dst)) {
    94			*dst = *src;
    95		} else {
    96			dst->last->next = src->first;
    97			dst->last = src->last;
    98			ret = true;
    99		}
   100		INIT_WQ_LIST(src);
   101		return false;
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
