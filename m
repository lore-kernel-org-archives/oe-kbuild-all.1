Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DE1632
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 23:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767137564; cv=none; b=TKm4hDbsizHsbY35BsMoElsCbFSJpIlrekka4mqW4xfZCY6S1WvghrHCX9TE9csjsI6XTkzWoymmcjeZdH7l0WEzlmz0AymlchCJm693tr6dPJXO0/H5tMf2W6JWaF+L7wGKpf8uk7YPFdCokIlGjzVuPhdMBBuQftMyenMdv8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767137564; c=relaxed/simple;
	bh=SrsE0T3MrUdj4Vh2tNUeMda7G/BRteDtddFsrmK+dFc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mwQoLA74ce1XM2aiRWLWLhYYFiJGyims1v6pQiPpELQxsvpc9FrQ+zXhdhg+XYKs9QUQagsis/wbyg7Hg32aEDPxdoJXlO3OCGwbQR1cAcTc1pvowGUuXcF/XVU1jKzge8EXZF7zkRJsKHvkyjtV61lRkYSBEbNBHlLtMR1mWNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIm+DK/y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIm+DK/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767137562; x=1798673562;
  h=date:from:to:cc:subject:message-id;
  bh=SrsE0T3MrUdj4Vh2tNUeMda7G/BRteDtddFsrmK+dFc=;
  b=hIm+DK/y0OdSJTKUATznifmXq9pgsTLUptxmjc9ShoyqxWgfJBlf9UEg
   vAx+icm77L8n03M/Ln3NZihIihAmGvuSBtPS3lvuR5tZHkPV9hjkUZDfE
   ycU9/rxK7J8gd7Lxkw8AW+uJGZhHRxCLDHLX67UXRzTMH8kj4W8cqrOdi
   spFZCcF1xgyaUBmup5BbpPHZXh1HzLpPuali6+9AE97CHPFKo96qvwHIW
   sEBr6IIIcJ33jq0j0kiEIT9x3s4XEReNtK02/JxEO6++A8TwEG6H31/oW
   UWIAH2bpXhaDoDawyW7bukV2zsgQQkQs/i+LNEtIDxXj1beWWvzXaIVzE
   w==;
X-CSE-ConnectionGUID: xugQaK9WQdedmV1hMiOpJA==
X-CSE-MsgGUID: 5qECnWQVSlm67D4GA34rGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="80170549"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="80170549"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 15:32:42 -0800
X-CSE-ConnectionGUID: +dM65nNAQvu6EMhoamyACQ==
X-CSE-MsgGUID: hKiRPjBiSIK0sH7L3b/vPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="202267511"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Dec 2025 15:32:40 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vajCg-000000000lp-0ukl;
	Tue, 30 Dec 2025 23:32:38 +0000
Date: Wed, 31 Dec 2025 07:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.6 5/16] kernel/bpf/cgroup.c:2781:5-8:
 Unneeded variable: "ret". Return "0" on line 2786
Message-ID: <202512310735.biT21cCJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.6
head:   d16fa0113ece3fae58e5105dbed6b0dbe1c28c21
commit: 139148647969dcf54237b1ceb50a89e39b0b5186 [5/16] bpf: Allow attaching struct_ops to cgroups
config: x86_64-randconfig-r064-20251230 (https://download.01.org/0day-ci/archive/20251231/202512310735.biT21cCJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512310735.biT21cCJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/cgroup.c:2781:5-8: Unneeded variable: "ret". Return "0" on line 2786

vim +2781 kernel/bpf/cgroup.c

  2777	
  2778	int cgroup_bpf_attach_struct_ops(struct cgroup *cgrp,
  2779					 struct bpf_struct_ops_link *link)
  2780	{
> 2781		int ret = 0;
  2782	
  2783		cgroup_lock();
  2784		list_add_tail(&link->list, &cgrp->bpf.struct_ops_links);
  2785		cgroup_unlock();
> 2786		return ret;
  2787	}
  2788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
