Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D8017745
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 21:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709932446; cv=none; b=r4Ej41lG28m3Q7drN3qGxvwNEwT7NR+1PDR938Mmwd8rE+5i0v7+lEPcUJ82oTHOELQCW7QdJs64hYUVXR5p8vuf4ghLYqVVZNH1dS1rKBYAIbZEJiWTuJNCiWD7inYupNcnqOItNFij+dQze8QAPfjexFYuyJggxS2zFBpJUus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709932446; c=relaxed/simple;
	bh=nBe2ADSq8UAFlOXc0BWtSt4ChkB0x0oxDpOrHf44f2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LvInXu2XqrIYu3Kh1nar+9+LQ+0rjS6ga0oHwiryRwLIxICM13a3p/xQ+NUo4QSxgGmxosLPzFY5Wutayc9fBSjMAY0T+Ey6Rb+2tynip5UT4TCOlK74layJqsRy67RWgKk1/GH0qWqyAv3mBldIhpzL3j5cgcNOdxk8qWWiThU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxDcCnWi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxDcCnWi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709932444; x=1741468444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nBe2ADSq8UAFlOXc0BWtSt4ChkB0x0oxDpOrHf44f2Q=;
  b=DxDcCnWiEyt3USZ3ov4fDtRIPB5519Z4fXepv4IQ9W08IRqEl2CAFcZN
   bo9w6jLkpWpjeKeNjApOvbou8uVhuD7xZkrwcu0WchBGSCFIiZ1nyvCQZ
   3g8iP79AhPdDrmgL4Z7srDbCmDg1mATPyaK2oJcwaSsp1iYvJrCyb0Mx6
   K04XgMoQxdke6pu4KyMg14nmur1HOSmvTMYjSd6qjzTf9Jemw88RFsSJV
   5R9NvEj70vzvRi0aDdGOlUQxIXXqraxiQsS3x/9C6TlbmUSL5po2vQ57t
   X1xqMmxlr8mjiyh72yElu8AWfNETTmLErQ8zC+tQjrL+9cb2xN447Bifa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="8487078"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="8487078"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 13:14:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="15069409"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Mar 2024 13:14:02 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rihXU-0006jB-0Z;
	Fri, 08 Mar 2024 21:14:00 +0000
Date: Sat, 9 Mar 2024 05:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 154/176]
 arch/arm64/kvm/hyp/nvhe/trace.c:37:1: sparse: sparse: symbol
 '__pcpu_scope_trace_rb' was not declared. Should it be static?
Message-ID: <202403090549.xhGBhCxM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e9c73e0594e0bdb3b71e4e1fbb49cf903d73c5d7
commit: 794f874404060e7e14863872950b53e6a7aa9b68 [154/176] ANDROID: KVM: arm64: Add tracing support for the nVHE hyp
config: arm64-randconfig-r122-20240307 (https://download.01.org/0day-ci/archive/20240309/202403090549.xhGBhCxM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240309/202403090549.xhGBhCxM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090549.xhGBhCxM-lkp@intel.com/

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
