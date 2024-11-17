Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72663209
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 01:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731807572; cv=none; b=Rh4vze2W3Rxw9DOR6LyO284qZCQ/gB0R1wN2hiRWR4MJH5No95JT1mgFGBits4M8zLa1gWLHtXLF+ne72D4KEogEQ/Vds5A1fjeJ4odABhEoujwxmkC2X7uV0lt7aP58bf9BqTh5lDT94k2wOzrAZuET/ETlW63IN33LRo1P49w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731807572; c=relaxed/simple;
	bh=7iXnUdrE/WWbX2f5RmIbaii8k71BZN5cdloJ5wkYKfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DAREKcn+PoVBiLBVW86sdPeZ384U5vGCE3BecONiGsWuzOvWUn/L3Dqt4/rqWtdCfYYVvwfmAwUVOP3mrpL0X1n+2SY564v6ixyOJXohNW12VJlSOgFs8lVRy52aTuOwZcPQ0ywKjnD4UUx7qLYIEYzYhlmFVLcvnOHVmA6lzw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwaNVtDV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwaNVtDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731807571; x=1763343571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7iXnUdrE/WWbX2f5RmIbaii8k71BZN5cdloJ5wkYKfw=;
  b=lwaNVtDV3hjZAGsDrSRpWVJp8l/m1qMuZn2eTdcfXG3cTa75Suv37qHY
   fspab+5RicVtzJftlpv3kax6Q1gKwkY3yiGgQ9xa/2vEXwLfDeQC33H6z
   +hJDMnVER1NpvMy3KUbTWPHIVolm6mSi9iR5sMt+rf+oGSkaDMj3mTyOf
   X7pi981uVNnnmQpr/5cQ7Eyo29vslX2gO85BVZ7FUOh8s0m95N0lVIbiD
   dnQqF7fkPMEmaX4UFLGDWyk3WGNS9vZpJjL0ejOKhAwGxcln0Vj2SxKRF
   p//AEZFcd6FhPIy2IKwv71FZlqmja5byuDblf7mBFQ+fzkSQmsb4/7X2F
   g==;
X-CSE-ConnectionGUID: qzBIXjcyTVauqa3nJp1KPA==
X-CSE-MsgGUID: 79/js7e9R06hYOHd9a53sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="35463179"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="35463179"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 17:39:30 -0800
X-CSE-ConnectionGUID: S8RRQ2bOTZOwf+8a+MmXnA==
X-CSE-MsgGUID: +eN89Cc1QCeE165gWdWDPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="119741584"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Nov 2024 17:39:29 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCUG6-0001DP-28;
	Sun, 17 Nov 2024 01:39:26 +0000
Date: Sun, 17 Nov 2024 09:38:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:module/namespace 8/8] ERROR: modpost: module kvmgt
 uses symbol kvm_write_track_add_gfn from namespace
 MODULE_kvm,kvm-intel,kvm-amd, but does not import it.
Message-ID: <202411170952.NczwQqJK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git module/namespace
head:   eddf030901699351844504fd2232ae7ea6d1e787
commit: eddf030901699351844504fd2232ae7ea6d1e787 [8/8] x86/kvm: Testing...
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241117/202411170952.NczwQqJK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170952.NczwQqJK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170952.NczwQqJK-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module kvmgt uses symbol kvm_write_track_add_gfn from namespace MODULE_kvm,kvm-intel,kvm-amd, but does not import it.
>> ERROR: modpost: module kvmgt uses symbol kvm_write_track_remove_gfn from namespace MODULE_kvm,kvm-intel,kvm-amd, but does not import it.
>> ERROR: modpost: module kvmgt uses symbol kvm_page_track_register_notifier from namespace MODULE_kvm,kvm-intel,kvm-amd, but does not import it.
>> ERROR: modpost: module kvmgt uses symbol kvm_page_track_unregister_notifier from namespace MODULE_kvm,kvm-intel,kvm-amd, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
