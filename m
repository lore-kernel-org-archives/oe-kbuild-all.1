Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623EC1990A7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 18:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728854; cv=none; b=Y1gS+GVrCEfBk3clMtp5IAlqmm+XWJwCNodoOigVjz0SGKSWKGHI60EVorcrrM26hFOMji5kCVr3JpC7i7g1EJOoUb278e2m8JkSmKtgPbraEgwpfOmGQFA0MxfgFLBtfmvu4mKIFv70x32p+WWkG+tqgaknx55n6FgLGmNEdkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728854; c=relaxed/simple;
	bh=z+OH4Hix1u1hTfBauNd2rQQ9rkL4HlW6Io1I+ZdMeaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i7SYwz7/aQbmdDPM3bQOCnN6Nno6Hrhk68mVCQlZw9N6R+ppxTWQw/t/nWgsUX2Ys3DB5UGB29NIgTLICfgPLpzaoK+HHxi8bSFc2f5NBjq3UcF8ad0/kLXQEv1oITrJ9wqnZLNlwRFbw1rY2WDJFvg52wsnsT1u6s/v1TQUWMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTPYUmXU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTPYUmXU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746728853; x=1778264853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z+OH4Hix1u1hTfBauNd2rQQ9rkL4HlW6Io1I+ZdMeaI=;
  b=cTPYUmXU/ExDpy1yQRP+PtKop2jRCajyUW5IE3EdtZBUSv/cEEp4OxSj
   e2G+ZxH4mrnm/ZokI1g+dUQUUE5ZC5syi9hSqPXUaMRgHPNqIBpCvwXbN
   as7lP3qlB3teHQuZ9MnGDnOqmCYWzuWFUCOhTToYbUZHQDqWu2G7gxR+O
   4t8HSABOQVzUZYhGHikWmCLsMCEUQnX5psXVGKt3XLbeLbSWS07qvhMqG
   enfH/c9hRfPf2oTTkkXxgnWeHceFEw0jt+qIf9d4iEBhsloMXuaCBIS9e
   if/o4r5pKCzCW5CvXVISVc4DWnOFXk+pd739nEBaH2tMFaKo1cF8Mr5jF
   w==;
X-CSE-ConnectionGUID: Kj4t/qOXSA61PC0jjIyQkw==
X-CSE-MsgGUID: b8Q+M1jOTFepHjkib54fJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48544220"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48544220"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:27:32 -0700
X-CSE-ConnectionGUID: 2aRM4qelRXWfHtuPTDuT7A==
X-CSE-MsgGUID: FBdZama9Tp630ciDV6F3Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="141580936"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 May 2025 11:27:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD5xw-000BFl-16;
	Thu, 08 May 2025 18:27:28 +0000
Date: Fri, 9 May 2025 02:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/350] mm/oom_kill.c:318:14: warning: no
 previous prototype for 'bpf_oom_evaluate_task'
Message-ID: <202505090238.fChHRDLp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chuyi,

FYI, the error/warning still remains.

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: 9cffac2e6f2df386d7cf4c2cf90d5fe2c1d6b793 [0/350] bytedance: mm, oom: Introduce bpf_oom_evaluate_task
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250509/202505090238.fChHRDLp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090238.fChHRDLp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090238.fChHRDLp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:318:14: warning: no previous prototype for 'bpf_oom_evaluate_task' [-Wmissing-prototypes]
     318 | noinline int bpf_oom_evaluate_task(struct task_struct *task, struct oom_control *oc)
         |              ^~~~~~~~~~~~~~~~~~~~~


vim +/bpf_oom_evaluate_task +318 mm/oom_kill.c

   317	
 > 318	noinline int bpf_oom_evaluate_task(struct task_struct *task, struct oom_control *oc)
   319	{
   320		return NO_BPF_POLICY;
   321	}
   322	ALLOW_ERROR_INJECTION(bpf_oom_evaluate_task, ERRNO);
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
