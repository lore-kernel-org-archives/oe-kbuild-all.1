Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286DB3EBF3F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 20:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770929344; cv=none; b=KCt5b2eNfLq7ytuHnfCshErwAD710ESwl7u6Rv4pX7p6xQCAiGMsYHAz8xfcbgdHWJ+y45RRAmt/3AVD9ZxLW6zziJtNw17IYb/SllUtr7hBunYfCwKyToj7hNz+qbA+oqTVQegjAi0jlrZ51QaKLL17wYxHrdDlqnlUxt6BR5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770929344; c=relaxed/simple;
	bh=VIAWXqtnxcOow/XeE2x8Q6JSb+UkVb8oH4AhNiBigjk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RP5inRkwzjrWwlx+qKWePmpqeHFBgNijZ2xw1X7J/41xnrYpSQ6kCREG+6kpY0gebzcIC/doBuTtOh7mhmp3GsWEuK9KC9uPZcLAcXGm5iz20qk3FpteGFlLOjBlQw7EPsTDtmnsb7HwsW0drlIMk5PrkIoBALfWFzmKlCHK5HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ig9ZbbhI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ig9ZbbhI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770929343; x=1802465343;
  h=date:from:to:cc:subject:message-id;
  bh=VIAWXqtnxcOow/XeE2x8Q6JSb+UkVb8oH4AhNiBigjk=;
  b=Ig9ZbbhIGo1K2t/3tJu96TgAhOoqNLk9rDzNYOjO6T+PV+SQHm+3NtJ/
   ryzPZdCmlTa26DS68wRdo/+hZYo6O2fPtZ/WzhNL4ZdBgpmc5/rxGxAdg
   UF/r0raVNfeK0RvTI8MGgnSgTB8YpdIRV0MJOI2g0lA0UODGU4i/aahnx
   0OPGY3K1wlUHaldDvCIBJOH+sLxyfRF4gQZ+bewygL1J+37gx9DFJSiw/
   +jhOsEbYQzNU/r0zptdN30DmhSNJAZTg8qucSW80l0FYrjC2td3XS6wft
   lWdn/Qji62C+8LoBvtCGxoGqt1uhHF+Xu/rn67q1sCs2wPMGM/TAmfofu
   A==;
X-CSE-ConnectionGUID: reG/30i6R4u/k192PArwxw==
X-CSE-MsgGUID: 25x8v9nTQoiOgBtXIeRRRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="59684665"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="59684665"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 12:49:02 -0800
X-CSE-ConnectionGUID: 2hgsQFjuTTyF4aYfPleLOg==
X-CSE-MsgGUID: wTJvQs7+R5eMEQzel6nOaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="217683857"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Feb 2026 12:49:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqdcQ-00000000tHo-2DXt;
	Thu, 12 Feb 2026 20:48:58 +0000
Date: Fri, 13 Feb 2026 04:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yishai Hadas <yishaih@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
 Edward Srouji <edwards@nvidia.com>
Subject: [linux-next:master 11907/12684] ERROR: modpost:
 "dma_resv_wait_timeout" [drivers/infiniband/core/ib_core.ko] undefined!
Message-ID: <202602130454.1KQkBpgg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   af98e93c5c39e6d0b87b42f0a32dd3066f795718
commit: 0ac6f4056c4a257f4b230b910e3e6fee6c6fc9b9 [11907/12684] RDMA/uverbs: Add DMABUF object type and operations
config: powerpc-ppc64e_defconfig (https://download.01.org/0day-ci/archive/20260213/202602130454.1KQkBpgg-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130454.1KQkBpgg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130454.1KQkBpgg-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dma_resv_wait_timeout" [drivers/infiniband/core/ib_core.ko] undefined!
>> ERROR: modpost: "dma_buf_move_notify" [drivers/infiniband/core/ib_core.ko] undefined!
>> ERROR: modpost: "dma_resv_reset_max_fences" [drivers/infiniband/core/ib_core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
