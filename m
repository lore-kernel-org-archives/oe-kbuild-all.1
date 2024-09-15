Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B7F1B85CD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 20:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726432522; cv=none; b=nepSIbIwcf1JIjQTZ5pbepZ+ukaP51rby1QP8pfyuloxgkiJI5crj/67/wMgJk1ZDTFlKh2zTdclRO0V2m6w7ViQZo0VJ/oLHqw5ISrK3MeSgQCSkV6KrneuqApjxdmhPBUOXR4jk47ZINuyWgJ73hwZjJZBzrgVmOh4yhxgl7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726432522; c=relaxed/simple;
	bh=lFcgXYr4Cfa3E99WXd/X+JZPoJD1gxvzDpqH57r2Azo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HnHaUyasrcOsEM9z04dXjQawjZUBwpfrBfwT80fXX1ZPzJVqdWQq+fqv02lkHay+h+4OagvB4zeR0JvrF8uJH/0NuB7Ukst73BTMFlQe5QbL+x+yoTqK2V2EHkJK4Zir/v5Or/FiY8Dj+q4A0FXs7F08JSoueTeCJlZJ5LDFZOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZZx9jOd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZZx9jOd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726432520; x=1757968520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lFcgXYr4Cfa3E99WXd/X+JZPoJD1gxvzDpqH57r2Azo=;
  b=nZZx9jOdzlpVn7NoykiY7HBndtw4v+YVCWT02P37wk8RutJD7hdfxt9S
   MyGVLjv74AsB62hy9ujNW4n9TE0RTJRV4JlVnPLd8xbx8pIiXdFA0dnIl
   CWkqrdZlAJvgTkzAgBzSF4t1qZRPeW3DipHSpJPsDOChNXkpd2rCClFKh
   NniOKTkUeufdA8jGfV139udMc6Kt4LKzL9vXLkBuHmje70dK95wXRYZpZ
   ihcTTwnJJxkaayTMD8zs4QCqVqyw/fxT1sNpt0kt5nwFOSg9v8877aG1D
   3rWUZBYgWSNg+CWSx/GPJl3nHzsVKbXcQHmouWqKt1VqeW2D9Get+IqxH
   g==;
X-CSE-ConnectionGUID: Us5vCR9cQe6ahEncpHgljw==
X-CSE-MsgGUID: GUGezTzSQMOcUratxJmBrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24753197"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="24753197"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 13:35:19 -0700
X-CSE-ConnectionGUID: VA3AzX0tSg+87wIXgSKqQw==
X-CSE-MsgGUID: mvZqJtU/RFaatOx48NBSDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="68555192"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Sep 2024 13:35:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spvxk-00091u-1r;
	Sun, 15 Sep 2024 20:35:16 +0000
Date: Mon, 16 Sep 2024 04:34:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 56/64]
 arch/arm64/kvm/hyp/nvhe/modules.c:128:10: sparse: sparse: symbol
 'num_dynamic_hcalls' was not declared. Should it be static?
Message-ID: <202409160411.hi2ve5rC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Quentin,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   1fa94a14074632ecff57ab73a2c9677521b7524f
commit: 081625b0457739645b1982b908e449e54f6037dd [56/64] ANDROID: KVM: arm64: Rework pKVM module locking
config: arm64-randconfig-r122-20240915 (https://download.01.org/0day-ci/archive/20240916/202409160411.hi2ve5rC-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20240916/202409160411.hi2ve5rC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160411.hi2ve5rC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/modules.c:128:10: sparse: sparse: symbol 'num_dynamic_hcalls' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/modules.c:129:1: sparse: sparse: symbol 'dyn_hcall_lock' was not declared. Should it be static?

vim +/num_dynamic_hcalls +128 arch/arm64/kvm/hyp/nvhe/modules.c

bc68b420c1452e Vincent Donnefort 2022-09-27  127  
bc68b420c1452e Vincent Donnefort 2022-09-27 @128  atomic_t num_dynamic_hcalls = ATOMIC_INIT(0);
bc68b420c1452e Vincent Donnefort 2022-09-27 @129  DEFINE_HYP_SPINLOCK(dyn_hcall_lock);
bc68b420c1452e Vincent Donnefort 2022-09-27  130  

:::::: The code at line 128 was first introduced by commit
:::::: bc68b420c1452e2c029344d5c3954b8098e125e1 ANDROID: KVM: arm64: Add support for custom hypercall registration

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Will Deacon <willdeacon@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
