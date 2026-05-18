Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256E31DD0EF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 00:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779065290; cv=none; b=dUTSeb30sjZS4uILpBNKYVObaXCqsYi7zSpI1T6ornB4GOm4dFlE+a5FQjxuRUfAA9qig58sddnR/n6B2Dq2djL+LAxV5/BXDiO0V5iQDNg7FBxt9JZVF+DLUaWxeAsjYUyt0a/VKWNgDju30tzcxAfgf1y5QyZuCbXXaNWcuvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779065290; c=relaxed/simple;
	bh=f3YR5ueCGvXCbQiOwjcU93oXUFfDsn4i9A3Q70hdddc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bbPHTi8MQR/kcr/nRRQ4CBfvL0j0wu+ReagMguL6WTcUoRa0wiq2Hi4t7QDsF2gn57VDHdV1x69avRYpKRtNtZNVtuDcTpkcwIGi8E8l1na88NeZlbg44+BeD31f3P+E9ZQyJxKkd8pZoR3+krmeSbWXoYjtQqtedBCO9AexkGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8U4YpNf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8U4YpNf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779065288; x=1810601288;
  h=date:from:to:cc:subject:message-id;
  bh=f3YR5ueCGvXCbQiOwjcU93oXUFfDsn4i9A3Q70hdddc=;
  b=X8U4YpNfnHKcgafa96C0PRrtUBMTozmr9BF0c0mmzvQLctzpWhQq6np8
   KBd9j5YR7hFzafhf2xxyQ/d6ymbAX76cPrhIS7a6E2wJnwiSr2oMrHxo3
   w0QikY3aGHZE4QkoSU07neYKGfW7Qhe+8cDZ0HdHVj2SkLO9tOuTHRYza
   aDvphRU/LP/VxY2bMTGOrpi53fbYsypFDXBchSqjTBIF34w6TqL8Zgrry
   CfC5Ar5+7wvh2gHzEovQcWfAmtn7ySrWjx3E8Ya6KdcTvLstOL392jzaB
   sVKKe2pDnSNzyt5U4pnheAzSpWVYTqM9g/1jWdNZCP4BLGWHWogt6YQEe
   Q==;
X-CSE-ConnectionGUID: NhwmGg/mTraKzMchQ5UJ4Q==
X-CSE-MsgGUID: jw3BrRfPQzynw8wynS9V+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="97347172"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="97347172"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 17:48:08 -0700
X-CSE-ConnectionGUID: yxRZcXWvRN+oyeVvEzv9cg==
X-CSE-MsgGUID: FIR9iJ6wTe+ZASGv+v2shw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="238392304"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 May 2026 17:48:06 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOm9L-00000000290-1D9o;
	Mon, 18 May 2026 00:48:03 +0000
Date: Mon, 18 May 2026 08:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>
Subject: [tj-sched-ext:arena-direct-v2 57/63] fault.c:undefined
 reference to `bpf_arena_handle_page_fault'
Message-ID: <202605180813.43NJ2hoP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git arena-direct-v2
head:   9a6ad465caf4abb564d5fefa575436b68e0d7d4c
commit: cc0ed57bf54a18ce6607f9a60f86bf7e264c3a4b [57/63] bpf: Recover arena kernel faults with scratch page
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260518/202605180813.43NJ2hoP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180813.43NJ2hoP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180813.43NJ2hoP-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/mm/fault.o: in function `__do_kernel_fault':
>> fault.c:(.text+0x260): undefined reference to `bpf_arena_handle_page_fault'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
