Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F81712B6C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724431778; cv=none; b=kJHxNpNIjqZmMaq8J8Py0Qrlb/wiTAbeZ+/PB9m16TjNxyH1ruU3JZoL3igVSYTUqjEa8B0ud/c+748LGwhwObXRcHOuPe//wSEKqAj5Y+c2DBPnj/nXtn92AxiHpICOk6Isu86hQNQr3FtpsH+/emoq5By1S1SaKzUD4HEtfRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724431778; c=relaxed/simple;
	bh=6j/+aLIe3siQqSfefhtyK25HbTwsbg46i9WsxRP61lk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aKI6egWvqKOStFv7mMR8spnK/qSosU5gMrIVD/WEM7FW21Tk1zVjbsFtguoaJVyLztkDvL3KhohxYefv7IT3G8H9sy0QM7IZypHqVuQz5M9r4DOnyKFNDJgxIQgzhtBP89PLsQhKaGtjIi/09z7BN8OrabNcwJRIucg/Zc4lxXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=muXkr4Pf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="muXkr4Pf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724431777; x=1755967777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6j/+aLIe3siQqSfefhtyK25HbTwsbg46i9WsxRP61lk=;
  b=muXkr4Pf7YbCDVOp5tmv6JBoEe7rSU+bAwnfHEOP4DLCTNqUYnrfRnFJ
   +7vSeDyXMLjnoU+zuXBbwB75jkwyv6isBP/FOGpAgApTXAV7PCasYxSZ6
   UCHpBhakyVfxrB7jGJDhCop8uFN98cYg7vSTMZWht2cV24xu0Nq8Zo8kR
   96NWdVV84yrPbUs2iz8C+BQejjL8TxIKJsu7ziFMrdCKA4TY+ZZLjtoV4
   67+kVrMSgN0l0WkpZOpOm0qTVfab1kXUIY/Ein/tHZy0S2dWTNdO4eYYL
   HeX/JGbTIfGQ4O1rdS5Nf/yCK1xJRkeY7ARJ4iewgG2acaNw7Cfjc1QVd
   A==;
X-CSE-ConnectionGUID: ao9NC7asRvyjfrwR57ZEQw==
X-CSE-MsgGUID: //syGjJmT4Cg2AdwKb+scw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26707596"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="26707596"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 09:49:36 -0700
X-CSE-ConnectionGUID: 31jpHmZUTZeElkABI2YuiQ==
X-CSE-MsgGUID: XgbIJ9H+RlyWDmrCIaIoHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="66165412"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Aug 2024 09:49:34 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shXTg-000DtQ-1c;
	Fri, 23 Aug 2024 16:49:32 +0000
Date: Sat, 24 Aug 2024 00:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/14]
 include/trace/hooks/madvise.h:10:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202408240043.v7Ri7Bp1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   8da6283ef36c5c684bcfdd59631aba622c11749c
commit: c9b85866c78e7e00085c89ee4fd3b93f54659682 [2/14] ANDROID: madvise: add vendor hook to bypass process madvise
config: x86_64-randconfig-122-20240823 (https://download.01.org/0day-ci/archive/20240824/202408240043.v7Ri7Bp1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408240043.v7Ri7Bp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408240043.v7Ri7Bp1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/madvise.c: note: in included file:
   include/trace/hooks/madvise.h:21:31: sparse: sparse: no newline at end of file
   mm/madvise.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:817:9: sparse: sparse: context imbalance in 'madvise_cold_or_pageout_pte_range' - unexpected unlock
   include/linux/rcupdate.h:817:9: sparse: sparse: context imbalance in 'madvise_free_pte_range' - unexpected unlock
   mm/madvise.c: note: in included file:
>> include/trace/hooks/madvise.h:10:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/madvise.h:10:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/madvise.h:10:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +10 include/trace/hooks/madvise.h

     9	
  > 10	DECLARE_RESTRICTED_HOOK(android_rvh_process_madvise_bypass,
    11		TP_PROTO(int pidfd, const struct iovec __user *vec, size_t vlen,
    12			int behavior, unsigned int flags, ssize_t *ret, bool *bypass),
    13		TP_ARGS(pidfd, vec, vlen, behavior, flags, ret, bypass), 1);
    14	struct vm_area_struct;
    15	DECLARE_HOOK(android_vh_update_vma_flags,
    16		TP_PROTO(struct vm_area_struct *vma),
    17		TP_ARGS(vma));
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
