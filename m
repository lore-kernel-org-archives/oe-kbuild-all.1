Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890D62F2F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 04:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737260752; cv=none; b=ZuZ27z9AC5Je+KAuLkTAu0uWwvhV/U6RKr9tWkZLHb76KFDbFIHZw3g60jCE8ZCkYqGMBw5dEsUJbYpwSl4H3MvLe7wyw1nfxkMo+Cd5bdmAg85DVlPXrd9CWFTXSnTHYpJOTDT0boMJXWQH/Z0gcdtycjv+vF5+h4BfpAK/aC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737260752; c=relaxed/simple;
	bh=FnhbJrtr5hIMgZ1WQqIlQtbAIpCtUMGMNgzQdxMCY+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JmRrg/bykn1sLQrzEVJeIUg0hofVY6jLs+LGYfDiWtoyY1GT7JeFEpnHCIG5RVr1S2EABVHgDOSW7sMV//3bp4eAOT5YKqJThb/Vx4DqvjiVF+J5C5UG6pZfkMGZps2ro34AW3ivlQKw0yTeyKjr6cDRb5vOTCIcDO5vJFaSQtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0p6n2lA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0p6n2lA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737260750; x=1768796750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FnhbJrtr5hIMgZ1WQqIlQtbAIpCtUMGMNgzQdxMCY+o=;
  b=Z0p6n2lAsvXhbwleAA9FmSCB0in5d+UJZL/DcECKf3qnf9KpojIuu0dE
   fj6jj7y2Du/N2Fzw+93wHU9gAwsPZ5RSSLWDACcYPQOjamXm69+7n6vRO
   /6mptjE4qv4ybCx4wXN2XvRX+uyM/zhRlMGKQ2UZg6tWpHki1eey5sXuv
   wZKPgFwSYjfnOEKkswHArzdd2v4lW9fOT7XaqQ8JWwRDabnbz/Wed/2D7
   AC9/HghX3+HDPqRVIa4F6KoK2ALNNSUtsm75xhvgv3nZvt4X+S5jZ9A80
   HKLW0k5OjNxRmbzRPg8JOSFOdlLhn/dVSKPcjv9FBo5LoolT7MGXZeNvt
   A==;
X-CSE-ConnectionGUID: d68z8l0mRQO5zB0U9phxsw==
X-CSE-MsgGUID: pOHPeG59QniPvwWiJo7scA==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="55207079"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="55207079"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 20:25:49 -0800
X-CSE-ConnectionGUID: OU4XYOHsQPOPm/QaZiYiPA==
X-CSE-MsgGUID: WmJioC+ZRvG00Dqb3y/wMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="111148132"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Jan 2025 20:25:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZMsb-000V6N-1r;
	Sun, 19 Jan 2025 04:25:45 +0000
Date: Sun, 19 Jan 2025 12:25:39 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:trace/for-next 15/22] WARNING: modpost: vmlinux: section
 mismatch in reference: __do_trace_initcall_level+0x28 (section:
 .text.unlikely) -> initcall_level_names (section: .init.data)
Message-ID: <202501191238.Ihxr0zmw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   542079b4b12e89f82c8a689b6e9b119ab7d52018
commit: cff6d93eab00bacf8b6bffdef775fc2de0273c96 [15/22] tracepoint: Reduce duplication of __DO_TRACE_CALL
config: xtensa-randconfig-002-20250119 (https://download.01.org/0day-ci/archive/20250119/202501191238.Ihxr0zmw-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191238.Ihxr0zmw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191238.Ihxr0zmw-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: __do_trace_initcall_level+0x28 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
