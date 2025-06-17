Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E836194A65
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 03:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750130740; cv=none; b=o4LFJEJ4GNmQu02nB5oMbjh5jBfz09UfVYQwc8Kg5DYDecLCCK5pMAKhH7CGA4COUiUkrTgmOZCfBLh+Cyo8wEUdmFUC1bYpUKrcV+l/aV7U2g0bbJcZseukM2Af9/7bB1rY1hjhjwJottvlHzws97cKq0frdfDTmWVJ9C826L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750130740; c=relaxed/simple;
	bh=Bbgc3dZF6K4Utg+K90lbwljg8xyS+5Xoqr/q07aYpBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+bqi/siNsQDYN+o339qnU3zKXtmrH68u7Y5mwFXpzUY0C83/iUvb+flx2VZo+W/U7MZV273/AJNqDkX+NUBmibyr8kLsA75iRXW9OMwbHjcmpzHYHNSzcVjrsJNNOJZHYFtGuibwigUdivU8U/Rykn/oj7Pt4c+ucxVn5+Iijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHCkWOsN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHCkWOsN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750130739; x=1781666739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bbgc3dZF6K4Utg+K90lbwljg8xyS+5Xoqr/q07aYpBA=;
  b=nHCkWOsNVjBj4FX2DRagY1JYJe2QMrSU2o5Qh/fR5ycewOm6pC72XYfX
   d65thuNlgWZwpseJ066dDU1xYjFUXnEUI4ncHK9tSEhB60AcueOi1OjYJ
   UWN1eRHTamm1yJj6+vPMmsX/CxNwHXZ7Zyrw3AWO87EBjHwZQrXQWgFV4
   84ugRmU/wJhRg2YW+TUOx6K/34FcfusGrDQ1Ei9Xgpy8EYW4QpfMDn2yq
   BjvmiBOGodsPXkBxTf9U1OxH3aQBrMAUQMAicLOp9hBYR6Ijskv7WfZnn
   oMwAqBYDd4nIr8ErNT7g3/Yr+LprKilUCYdoJQW+QhpD4KyHbdAPJKr1s
   g==;
X-CSE-ConnectionGUID: SFY0x/RzTOK3LC/SlWHpqg==
X-CSE-MsgGUID: iG+xEsmGQEayIYloRrMvlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52432959"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="52432959"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 20:25:37 -0700
X-CSE-ConnectionGUID: PwIaa6wATJKACllZygbB5A==
X-CSE-MsgGUID: xadUdjXhQ5C/4wEAtTmUcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="185903762"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Jun 2025 20:25:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRMx4-000FXm-0m;
	Tue, 17 Jun 2025 03:25:34 +0000
Date: Tue, 17 Jun 2025 11:25:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-defer-tw.3 3/6] io_uring/slist.h:91:14:
 warning: variable 'ret' set but not used
Message-ID: <202506171129.rb5I7qAX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-defer-tw.3
head:   72dca7c06951833c040a26f09385b0d936e29bcc
commit: 58c3232303dbaff6b28b1a050a176017e9f04c59 [3/6] io_uring/slist: add list-to-list list splice helper
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250617/202506171129.rb5I7qAX-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171129.rb5I7qAX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171129.rb5I7qAX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.h:13,
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
