Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD3F2AD14
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 04:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747716473; cv=none; b=EpaRbf7sp0OrpvfkmKIgdKny48ebUlm1BDv2MgP7IGmnXWH7TigLGnC5LlXEcpFS0gPhcqQr4XLjEHewEmgASgzbt0gBr7X9hnI6HgvOps+tp70/dHzIKzoP3s0FsDCGwSdZVSMxMEJ6rfTTYc3Od/0cFSI7JKFvbMzMZ4shlaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747716473; c=relaxed/simple;
	bh=IpdOx+rUjxwKo1zk1vchJr16poPFpxImMZh6xHph8jU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P4nxruFD2gXFWNbc/F5WXE+veavxINrSO1+h+oUy1oob4CRSWaDVGTvfECvKrqGxVPSReLS0nWY746nkhduJor/rZvg3Z9+zzHCyFsRpfJckTdfA9TEZ3U+gS7827SbN4tr98oWp+AUsODDKksk9gjdvPSRB/p2agh3Q5qgqOh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8KDi/Wv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8KDi/Wv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747716472; x=1779252472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IpdOx+rUjxwKo1zk1vchJr16poPFpxImMZh6xHph8jU=;
  b=Q8KDi/WviwHgkNEJ0KGP47ZiXFeIMPklJdhQGGud7YmvBeqHjTbRJ6pF
   a6D6+M1A5c9GUiVeR9dpvVpF0kHJwfKQzAphOedBsbMyWo8/8IKJlcP8m
   fXDSRlYgq/fffaqWJkPvT08GSW0uc/rlB35axKUthDjGKHDUdJI8cHXru
   gbaEK6xBBqBsOScKt3hBuRhmBarNZbqFWdkoHhJzOXNtihnKCEKpbiDZB
   KEhSS9AlWpOmoWn/k+zsVHo3JN6qAU7pmU4H8ml5L5SotQPKgsF0kjOeS
   FTvMqYmu5hR9h42LEPYSNlwun/gdBixzNE41dyvf36ByORptcmAp2MnsX
   w==;
X-CSE-ConnectionGUID: 5LzoZja/SHC2boIYHZaNfQ==
X-CSE-MsgGUID: 3HhB32sHQvCChuhbaBMM9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49733724"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49733724"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 21:47:51 -0700
X-CSE-ConnectionGUID: yhPG030wRByKOw82Fe+N0w==
X-CSE-MsgGUID: 4Uf2z/U5RraIShFSW7HGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144823518"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 May 2025 21:47:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHEtH-000MAK-0R;
	Tue, 20 May 2025 04:47:47 +0000
Date: Tue, 20 May 2025 12:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.2 10/15] include/linux/bpf_psi.h:19:41: warning:
 'struct psi_trigger' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202505201213.hFM6XOm8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.2
head:   1078570cd7bf92cc1b6d67e990786cfb9a717785
commit: 343586cf71930a20ccde8c802a02ecdcc5c78a5b [10/15] sched: psi: bpf hook to handle psi events
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250520/202505201213.hFM6XOm8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201213.hFM6XOm8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201213.hFM6XOm8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:22:
>> include/linux/bpf_psi.h:19:41: warning: 'struct psi_trigger' declared inside parameter list will not be visible outside of this definition or declaration
      19 |         void (*handle_psi_event)(struct psi_trigger *t);
         |                                         ^~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics


vim +19 include/linux/bpf_psi.h

    12	
    13	struct bpf_psi_ops {
    14		u64 cgroup_id;
    15		u32 psi_state;
    16		u32 threshold_us;
    17		u32 window_us;
    18	
  > 19		void (*handle_psi_event)(struct psi_trigger *t);
    20	
    21		/* private */
    22		struct bpf_psi *bpf_psi;
    23	};
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
