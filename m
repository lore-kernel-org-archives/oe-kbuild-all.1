Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C811E9B22
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766238420; cv=none; b=S6epy8nBwfqV0tl+tOzL1PPKnV4y45h7vtCuGh5PLCAaPFM791MnOKNP6M1rWQ+DRlQvjCHpaZoQTY5FcWqAFjZSd/3lK5RXG/V3mHrW5945dMpnTNvzLRjTsgh7iT2x5f01/r9w5OoMr0NUpZ3+pUOFAdoE7ZtQFjtR6nIIL2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766238420; c=relaxed/simple;
	bh=4gtKsjiflDmnjsAMBr22h5lYfUGvhOfY+XbQP74rsRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=da3N6c5KHntVsyJrVRjMr2dRyobpd91swwNb4knJjtMq3PtX+TFwo/RsC/sqDh6uwqOCwR40j/hlEr72dBIM+BgXC8AEsT4GNviYB0YWk8bfdZooG6eaQvcy87NZepFO0WIhNM7CYQpyU7RU/GRKOR5YtFWkei0BbiPGb571qrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQ1jQYDA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQ1jQYDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766238417; x=1797774417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4gtKsjiflDmnjsAMBr22h5lYfUGvhOfY+XbQP74rsRc=;
  b=kQ1jQYDAENK7BR1BfAnKbuMDugaf1aMcB7IsXMWQTPcn/vyPvP8p9m1p
   VreHomlDryQf0vfXn1dUHlIQeOvgQjoHB91Wb6g/1FcKTQPMKYORWHqke
   s+0dza9zpLuwmPeY9Tx1wNxGOBDkUpWzxc+E2Ow2b+uLTEZuMsYeso9u0
   c5GjATCtNxcIU+Yxx8IFaHg2NBlEID4uYUFpdlTsaATjDsciM3/nSOr6g
   uXXcKPcFcovYdMoAqhPrX2MqsINdIBkW9wB1aqcr7OPFhSAQVLg9rWWWT
   r59OBwL9oiIWvWdKifM2x9dr0fNbqse7ly4XvfxLE4QjtL0qa3iS7I4ky
   w==;
X-CSE-ConnectionGUID: wbTNC3MITsG90UwifAO98A==
X-CSE-MsgGUID: +bgriF04RQOvOcRhgUlWDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70743474"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70743474"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 05:46:56 -0800
X-CSE-ConnectionGUID: x8qqE0f0Qhq19C4GbgFP7A==
X-CSE-MsgGUID: keLe9SOvSLCo8y6RjcHzKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="229775583"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Dec 2025 05:46:55 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxIL-000000004a7-020x;
	Sat, 20 Dec 2025 13:46:53 +0000
Date: Sat, 20 Dec 2025 21:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Ruilin <liruilin4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3547/3547]
 drivers/ub/obmm/obmm_addr_check.c:53:14: warning: variable 'user' set but
 not used
Message-ID: <202512202127.FExeoFRI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: e777551b49fb8d8dbad14dd3a44c2f9b5c8fa6d4 [3547/3547] obmm: Remove log pringts of physical address and kernelspace virtual address
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202127.FExeoFRI-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202127.FExeoFRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202127.FExeoFRI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/obmm/obmm_addr_check.c:53:14: warning: variable 'user' set but not used [-Wunused-but-set-variable]
      53 |         const char *user;
         |                     ^
   1 warning generated.


vim +/user +53 drivers/ub/obmm/obmm_addr_check.c

67ffb2edb43cde9 Li Ruilin 2025-11-07  49  
67ffb2edb43cde9 Li Ruilin 2025-11-07  50  int free_pa_range(const struct obmm_pa_range *pa_range)
67ffb2edb43cde9 Li Ruilin 2025-11-07  51  {
67ffb2edb43cde9 Li Ruilin 2025-11-07  52  	int ret;
67ffb2edb43cde9 Li Ruilin 2025-11-07 @53  	const char *user;
67ffb2edb43cde9 Li Ruilin 2025-11-07  54  	void *entry;
67ffb2edb43cde9 Li Ruilin 2025-11-07  55  	unsigned long flags;
67ffb2edb43cde9 Li Ruilin 2025-11-07  56  
67ffb2edb43cde9 Li Ruilin 2025-11-07  57  	spin_lock_irqsave(&g_pa_checker.lock, flags);
67ffb2edb43cde9 Li Ruilin 2025-11-07  58  	entry = mtree_erase(&g_pa_checker.pa_ranges, (unsigned long)pa_range->start);
67ffb2edb43cde9 Li Ruilin 2025-11-07  59  	spin_unlock_irqrestore(&g_pa_checker.lock, flags);
67ffb2edb43cde9 Li Ruilin 2025-11-07  60  	if (!entry) {
e777551b49fb8d8 Li Ruilin 2025-12-15  61  		pr_err("PA range to be freed not found.\n");
67ffb2edb43cde9 Li Ruilin 2025-11-07  62  		return -EFAULT;
67ffb2edb43cde9 Li Ruilin 2025-11-07  63  	}
67ffb2edb43cde9 Li Ruilin 2025-11-07  64  	ret = 0;
67ffb2edb43cde9 Li Ruilin 2025-11-07  65  	if (!is_same_pa_range((const struct obmm_pa_range *)entry, pa_range)) {
67ffb2edb43cde9 Li Ruilin 2025-11-07  66  		/* expected to be UNREACHABLE */
e777551b49fb8d8 Li Ruilin 2025-12-15  67  		pr_err("BUG: PA range to be freed does not fully match.\n");
67ffb2edb43cde9 Li Ruilin 2025-11-07  68  		ret = -ENOTRECOVERABLE;
67ffb2edb43cde9 Li Ruilin 2025-11-07  69  	}
0f73521b11e7af9 Li Ruilin 2025-11-07  70  	user = ((struct obmm_pa_range *)entry)->info.user == OBMM_ADDR_USER_DIRECT_IMPORT ?
0f73521b11e7af9 Li Ruilin 2025-11-07  71  		       "import" : "preimport";
67ffb2edb43cde9 Li Ruilin 2025-11-07  72  	kfree(entry);
67ffb2edb43cde9 Li Ruilin 2025-11-07  73  	return ret;
67ffb2edb43cde9 Li Ruilin 2025-11-07  74  }
67ffb2edb43cde9 Li Ruilin 2025-11-07  75  

:::::: The code at line 53 was first introduced by commit
:::::: 67ffb2edb43cde96368000620a63d0f6be11820f obmm: Add address validation and checking

:::::: TO: Li Ruilin <liruilin4@huawei.com>
:::::: CC: Li Ruilin <liruilin4@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
