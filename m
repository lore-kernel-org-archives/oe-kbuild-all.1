Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28087305E1D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996611; cv=none; b=Fg4YnxJZw8C7RhkiGewGZQ4gsChwRNuvES4dSgmOz0cMLwWsuyr3hqNtJdozmknTt57E/2wjYOPheWzAIhYibR2fwolE2u9uL2VSOWROuIwgHzzWo3CkUnciuMa8h1trgz7Glj+4LoFgkgDjhGWrbC5Pg7DwuPo0/ZdNZT6YuJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996611; c=relaxed/simple;
	bh=BbmtFMk/t1fpGMcndYi63/2YiU3NRn0HhN7fcE+3gYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mHBvjItHTPrwMrYCfgXRe5tTvYC5HtDrpCfk6AQNjhIo5Z/WFkP2jUgPCZVCpQpR2eYHfpKoWeqnr6d2bdlm60OddUwG2cLiX4lvRx03VXdedNftDIIHzIm5mynGcfjcsWKUnsxAt4ARzL/XIpgoAb3nL4d/m2ruqEFO8xaM97A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hE1m20Ec; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hE1m20Ec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756996609; x=1788532609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BbmtFMk/t1fpGMcndYi63/2YiU3NRn0HhN7fcE+3gYA=;
  b=hE1m20Ec4VowafQiP7vP7xnUC8NjagTB6wRyW3bsKF7KIopPmauLaumf
   kYMDN3Gs2pvtumj3ikIInX0qZnLlaIktVEYvoodKSTbNH+Ug8PJZqa4ai
   qVBIWRvUVpnVVEr27nkkwvYyQO1RkawW1jjUuiY3kH6RqfGuib/nywIhV
   GbRKdFth32mskhrGmbq7w0YN9P2u8hYqHduvs6hXOXmNBMwFyK/1NUOiW
   19oJKvPAPl9xEddJbNKTCwHYrlEK2cH/I4Xe2/nktE+hXm8bQqWlVmxFw
   TLAZtDebNhWBdUPXY+gzDo+oNji9RoJgmnZvxufevZOcR0kspS6K++G4P
   w==;
X-CSE-ConnectionGUID: a9MgE7OSTMqdeqmThtAQmQ==
X-CSE-MsgGUID: FrIIuW8pTAqrTDMnEqj+ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70713186"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="70713186"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 07:36:48 -0700
X-CSE-ConnectionGUID: dAHIH8k+RMKc15OIR4hf2g==
X-CSE-MsgGUID: GCet62hsR7SSWMyiF2UJrg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 04 Sep 2025 07:36:48 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuB4v-0003m3-2X;
	Thu, 04 Sep 2025 14:36:45 +0000
Date: Thu, 4 Sep 2025 16:36:38 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 7/7] htmldocs:
 ./include/trace/events/block.h:431: warning: Function parameter or struct
 member 'rq' not described in 'trace_blk_zone_append_update_request_bio'
Message-ID: <202509041625.ubcRmu4h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3a1f856821c247c445603e23d3fc7e1db8e1c029
commit: 5731f24e052e414c731f00bec0388eadcc7a455b [7/7] BACKPORT: UPSTREAM: block: add tracepoint for blk_zone_update_request_bio
reproduce: (https://download.01.org/0day-ci/archive/20250904/202509041625.ubcRmu4h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509041625.ubcRmu4h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/mm.h
   Error: Cannot open file ./include/linux/page_ref.h
   Error: Cannot open file ./include/linux/mmzone.h
   Error: Cannot open file ./include/linux/padata.h
   Error: Cannot open file ./include/linux/printk.h
>> ./include/trace/events/block.h:431: warning: Function parameter or struct member 'rq' not described in 'trace_blk_zone_append_update_request_bio'
>> ./include/trace/events/block.h:431: warning: expecting prototype for trace_block_zone_update_request_bio(). Prototype was for trace_blk_zone_append_update_request_bio() instead
   Error: Cannot open file ./include/linux/workqueue.h
   Error: Cannot open file ./include/linux/xarray.h
   Error: Cannot open file ./include/linux/crypto.h
   Error: Cannot open file ./include/linux/crypto.h
   Error: Cannot open file ./include/linux/kcsan-checks.h


vim +431 ./include/trace/events/block.h

   421	
   422	/**
   423	 * block_zone_update_request_bio - update the bio sector after a zone append
   424	 * @bio: the completed block IO operation
   425	 *
   426	 * Update the bio's bi_sector after a zone append command has been completed.
   427	 */
   428	DEFINE_EVENT(block_rq, blk_zone_append_update_request_bio,
   429		     TP_PROTO(struct request *rq),
   430		     TP_ARGS(rq)
 > 431	);
   432	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
