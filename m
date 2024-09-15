Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BD91B85C1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 17:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726420496; cv=none; b=Uh+vnc0flShea8SDmtiILYmn6QmLAvwFa+LCcwWhF3h8K1zCZlO6m0l9nhYtAI+s84uE0s+KAjBg5wWEh4E+BdtuJuvswarVgauJoOlNUOgjwFDGyBOgKdt57QhYLJVh8C7bV8+0SR0scfzfc4lh3F/vokXJw/lqLVRqFJQv2gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726420496; c=relaxed/simple;
	bh=FGbc3NXmMKBmWZvnWxUCmqPQ4nTeZjFpDIFJWqLoiLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LEoEivW6rgN+v/2IpNdS6I3jdaeesdFA4qhyax40QMJFzlTjZSCJeNT9VxrzEI7hySNnUDrUg6+R52I/PeUGzuTXJu5+Jk/ay3F6cZZjNmnCYipaCOefwhb9tK4olY6uAZ2NiXfykytxRR/1LTr3F1wn/UuxPuNvLkmoJVb6jss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hd9S5vsU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hd9S5vsU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726420494; x=1757956494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FGbc3NXmMKBmWZvnWxUCmqPQ4nTeZjFpDIFJWqLoiLw=;
  b=Hd9S5vsUKl4XOg1jaCUkdxTZ4/jce9yAjU4B1rbyH88L/i9J98U3o76O
   VrbD8x+mwBTkkrGh75a0vd1oLStpsjdo9bwlHjtBK+vD7p5fb2f6duwdw
   kqWT+740S/az77/uphIb4aEWrUbGfvdkQSaLug7wRmoNHOVFA+zrJxlrs
   4cC6eWBkwyjJ1P0hbFCoJ4CCXWffdnO2K3gRpwu2iDcu6/+HRKBoFTeVa
   J4twWAiubC14oGmsRRaJVidjezNtHZitxrLDjUUSaaJjwICt447rrfnvS
   0jB5MPjQpYOiTElMbUhYBIEaq3rHlzhbK1Ly8Mpoo1edgmfoJl7OSo1fh
   g==;
X-CSE-ConnectionGUID: 7tbO08nbSuahZwA734dGlQ==
X-CSE-MsgGUID: 8Y5BUrWZQaK+P+vdamka+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25419674"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="25419674"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 10:14:53 -0700
X-CSE-ConnectionGUID: SrM/DU8yR/m/R6Fur4aquw==
X-CSE-MsgGUID: 9ZcBBxduSQOceoLrDpYLLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="68902393"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Sep 2024 10:14:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spspm-0008s2-1K;
	Sun, 15 Sep 2024 17:14:50 +0000
Date: Mon, 16 Sep 2024 01:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 154/176]
 arch/arm64/kvm/hyp/nvhe/trace.c:37:1: sparse: sparse: symbol
 '__pcpu_scope_trace_rb' was not declared. Should it be static?
Message-ID: <202409160129.BZk2LOEx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   1fa94a14074632ecff57ab73a2c9677521b7524f
commit: 794f874404060e7e14863872950b53e6a7aa9b68 [154/176] ANDROID: KVM: arm64: Add tracing support for the nVHE hyp
config: arm64-randconfig-r122-20240915 (https://download.01.org/0day-ci/archive/20240916/202409160129.BZk2LOEx-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20240916/202409160129.BZk2LOEx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160129.BZk2LOEx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/trace.c:37:1: sparse: sparse: symbol '__pcpu_scope_trace_rb' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/trace.c:38:1: sparse: sparse: symbol 'trace_rb_lock' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/trace.c:174:15: sparse: sparse: symbol 'rb_event_size' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/trace.c:333:30: sparse: sparse: Using plain integer as NULL pointer

vim +/__pcpu_scope_trace_rb +37 arch/arm64/kvm/hyp/nvhe/trace.c

    35	
    36	static struct hyp_buffer_pages_backing hyp_buffer_pages_backing;
  > 37	DEFINE_PER_CPU(struct hyp_rb_per_cpu, trace_rb);
    38	DEFINE_HYP_SPINLOCK(trace_rb_lock);
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
