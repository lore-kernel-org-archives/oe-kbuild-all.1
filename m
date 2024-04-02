Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E67912BF37
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712070042; cv=none; b=T64erQtYqd5sbaTMAUK5lDhHFfI3rHNiSgXYOUny9BdhFuepLdht+WNsxAIjYhsG3bPqGO28/9l4y29D+0bd9tYzNNPywCVXZObHfwPXDGkiHRO3RkIo93htnshq14Ldgiy7uQ+K1QMmqSn9HHuQbpYNB57Dvqu26ZgpeHHYMzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712070042; c=relaxed/simple;
	bh=rIrW8XG3jbU/4i27hbTTpUb2F8gvnbcq4PnhQa6rJQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uKnOE7vu3AWp1lChpzNUz658QpQ9Kt2FqxduAi7qzjHjqCh4Q2HJZ1hElrQEO2sLoJ401gKfF8xcrudTvvJvfJ4jVRKRNqBy+88Lvd9gEYT5xYWN7jWvC+n33fxWQVr7NwoUZZgHbI7HTztEZ7ni4ZJNNitFaBBx9N4y1Y7MHVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUGuDwLB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUGuDwLB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712070040; x=1743606040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rIrW8XG3jbU/4i27hbTTpUb2F8gvnbcq4PnhQa6rJQk=;
  b=HUGuDwLBeKeBW5QxpRfQy0vBGmrqEhfvXzMJk/60BrSqW7/YPwSJfcqB
   PfdBXEvLguCx4BPaJgsSvlwJSzU8/QwtSxG2C60JyKCaEnxjt5G34aMYx
   uje634p3zMnRHzxc7YVRbRf2wONX/wMIxm+WYaC3BL+PjEkYC0CkTOiOC
   LK5Nnrsbg+/wJX8D6EZZslwSlqPcH+1PnPW2/YY+0NbiHF5UPpast6AiA
   cd2/O752wEj0akRS1SUCSOF4g/+0g1Md4yT0rcr3ZVJWIUWPNM0J2P7Ay
   0mVx1hi5EWk1grYpGuSnEote2JoSZ8ytGTPJeZwym3Z0RG/FBkeb2UABC
   Q==;
X-CSE-ConnectionGUID: j1wnsA+rTBC5kHyywyUcxg==
X-CSE-MsgGUID: re3Fri8DQAOS6Qafz9+hsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7460728"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7460728"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:00:39 -0700
X-CSE-ConnectionGUID: KHnebp+2TmisDPwSBhS+JA==
X-CSE-MsgGUID: S1m/aCtcQNy89eMvKuHx6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="55545355"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Apr 2024 08:00:38 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrfcp-0001GD-2W;
	Tue, 02 Apr 2024 15:00:35 +0000
Date: Tue, 2 Apr 2024 22:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/session_data_2 8/12]
 kernel/trace/bpf_trace.c:3559:22: sparse: sparse: undefined preprocessor
 identifier 'CONFIG_UPROBES'
Message-ID: <202404022214.SKByZgZd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/session_data_2
head:   5c279b9374cb05aac12c82a7941e61d816d3937e
commit: 99d14a41c1f4eb0ea5c10cf383de9502ff359eae [8/12] bpf: Add bpf_wrapper_is_return kfunc for multi uprobe
config: sh-randconfig-r113-20240402 (https://download.01.org/0day-ci/archive/20240402/202404022214.SKByZgZd-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240402/202404022214.SKByZgZd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404022214.SKByZgZd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/bpf_trace.c:3559:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_FPROBE'
>> kernel/trace/bpf_trace.c:3559:22: sparse: sparse: undefined preprocessor identifier 'CONFIG_UPROBES'
   kernel/trace/bpf_trace.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, kernel/trace/bpf_trace.h):
   kernel/trace/./bpf_trace.h:11:1: sparse: sparse: self-comparison always evaluates to false
   kernel/trace/bpf_trace.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, kernel/trace/bpf_trace.h):
   kernel/trace/./bpf_trace.h:11:1: sparse: sparse: self-comparison always evaluates to false
   kernel/trace/bpf_trace.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/CONFIG_UPROBES +3559 kernel/trace/bpf_trace.c

  3558	
> 3559	#if CONFIG_FPROBE || CONFIG_UPROBES
  3560	__bpf_kfunc_start_defs();
  3561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
