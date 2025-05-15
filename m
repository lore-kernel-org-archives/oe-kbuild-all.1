Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E99182B4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747340122; cv=none; b=ZCRAJc66C93zelANneDEkdWEiY9eZND/qP3+VEj2sj2n12AWbSoy8QGHvu5MJB/5SAyEOEErdZMCCIaavIhVGEw2V948Atq8QduaQZGHgFlbHX8X5bfPpdmMgYflMXfnLBu5N6JOcPRJcaCaQ6leeLEQmRl0p6uAcPQJgDSzyMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747340122; c=relaxed/simple;
	bh=u+dvVN5JqB9pw3rdw/rWQ+ScBFWQIQxa57gtZVFMUg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PNG7kYlmvIS9m9Hi+VwnhD52uyGLhcHEsmB8C3rZogre4u4zkjbo60EevXBBdagbFFSj6bwhj1vWwPsrJUWCSYsBW8wqdoSA+PyWLgtmntaQ0R6gKNyy563G6XLPPOmceoFfIE+hSxnWxWcC9OtiAbSoWcWM+mwU1sjWAeWp0eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=El51v9BK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="El51v9BK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747340121; x=1778876121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u+dvVN5JqB9pw3rdw/rWQ+ScBFWQIQxa57gtZVFMUg8=;
  b=El51v9BKqb75gqFXqtwQOXqztXUOLtiJMoFbF8VNpta1iJmK40/tzK9i
   I1TzK9Lu3nPpuVwD/HZbHQRKTLq1FGznBc4qya+qAz5+RpE+L/P5dsGpW
   1pG6OKJeEGYY+Mi0aBFTqt4DSourphuaebkVDx4wt//kkIR/HtRZIxafw
   ddVcfUqzdFhTDs7Xa27lm2V7u6wJ7PHN1x7GgxOeA05Hng/h1BBzDhZNM
   YRmf5S/kTz6w78YwxO8TXpFIFh5IDxrAKO1taobfV2Fe5CXa1Fr2RUOzI
   w4X/XzyUrsM1PkW0iF8o/gSVjUM6a1PdRycGw0uapFf9WH2vDtjmkV5Sg
   w==;
X-CSE-ConnectionGUID: 5Ko1gteMSvW3kw/pg326Yg==
X-CSE-MsgGUID: haR3M5KQQ+2EH3dGwPioyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48992765"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="48992765"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 13:15:21 -0700
X-CSE-ConnectionGUID: +c9KzhBrTdaQpUMacAhMtA==
X-CSE-MsgGUID: RYniFtP+Rj+uy2GtvRSXqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="175601887"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 May 2025 13:15:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFez7-000Iil-15;
	Thu, 15 May 2025 20:15:17 +0000
Date: Fri, 16 May 2025 04:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mykyta Yatsenko <yatsenko@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>
Subject: [bpf-next:master 2/4] kernel/trace/bpf_trace.c:3619:52: sparse:
 sparse: cast removes address space '__user' of expression
Message-ID: <202505160426.4odfmpXg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   9325d53fe9adff354b6a93fda5f38c165947da0f
commit: a498ee7576de24b4b0916ce56cf2686e261a29f7 [2/4] bpf: Implement dynptr copy kfuncs
config: x86_64-randconfig-123-20250515 (https://download.01.org/0day-ci/archive/20250516/202505160426.4odfmpXg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160426.4odfmpXg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160426.4odfmpXg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/bpf_trace.c:835:41: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *[addressable] [assigned] [usertype] sival_ptr @@     got void * @@
   kernel/trace/bpf_trace.c:835:41: sparse:     expected void [noderef] __user *[addressable] [assigned] [usertype] sival_ptr
   kernel/trace/bpf_trace.c:835:41: sparse:     got void *
>> kernel/trace/bpf_trace.c:3619:52: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3633:56: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3647:52: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3654:56: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3662:52: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3670:56: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:871:25: sparse: sparse: context imbalance in 'uprobe_prog_run' - unexpected unlock

vim +/__user +3619 kernel/trace/bpf_trace.c

  3615	
  3616	__bpf_kfunc int bpf_probe_read_user_dynptr(struct bpf_dynptr *dptr, u32 off,
  3617						   u32 size, const void __user *unsafe_ptr__ign)
  3618	{
> 3619		return __bpf_dynptr_copy(dptr, off, size, (const void *)unsafe_ptr__ign,
  3620					 copy_user_data_nofault, NULL);
  3621	}
  3622	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
