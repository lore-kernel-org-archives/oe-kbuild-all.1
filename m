Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B767739734D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 16:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589391; cv=none; b=Z9Fz+/pu41sHrNoHKLOpi5kMq/NZtwVeR0S3jafItNNvqwYr9mYmrtnEBfahNSWAZcZPIUwWy4leBO8ozVg1NeTHNeXTvtJhUyfuOLShr3nAw7aU5YTd5RhZdiWZyUklmg6BaKSBGFnJ+TNNZO36IP0URlGYOYfMxtQ2cyNuB/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589391; c=relaxed/simple;
	bh=NPIoT7EAQsdTd0KLb00Lo8EBbQnpHhiFj7mHfj1tt/Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QQq0y+azhN3Cnm0qSanOQoPWhdt6HtZysLvCKQJrujlwaE73IXWbA6AQ3NHgx7tzfkiy67Y4lAF5GRtxylEIxEl4J7jSy9GlQu8ucmAVd+veKPclssDtctem4nP86k8nNUnYKF5t2Vj+UPSWvAivr6ndPzuOEQDDhyriXrCJd+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijW2NQF9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijW2NQF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780589389; x=1812125389;
  h=date:from:to:cc:subject:message-id;
  bh=NPIoT7EAQsdTd0KLb00Lo8EBbQnpHhiFj7mHfj1tt/Y=;
  b=ijW2NQF95ibdKsH/HDLDkF47z+9Vd6H8zyUiZS7Dco689rc4we47UOq0
   i6rgPWkKNz8h8ddN2Lw7/9KL3iLToY2zVzf58T4zNZgD7yxhDmDPIyt+I
   e8sXZIODwqxHf69y7AZ5pC/4sYtBJ2tDExgTz3ZaSGCbIvqmBdCytO58x
   t9kBpSbgP3XTbJffEL2bK7fsgW+ePD0EKIDrBSevezmZMX/c/KqIzmf6M
   1RrIk4CbWdH4bzCOoTm7ZImfMLSgRo2j6tBs+5162Mq3nDVc5jj6obOYw
   l/olyfXTyJVL1HqJ0ScP4a6xArOVO/Sn3cx48rvM7Qlv3hFVhlvQEaobP
   g==;
X-CSE-ConnectionGUID: 8RdEBcLJQ0WMc0ymxr4Yzw==
X-CSE-MsgGUID: whbbVRVlTfGKp8Z1ZbtS+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81415193"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="81415193"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 09:09:49 -0700
X-CSE-ConnectionGUID: 6igbQd4/TNG60byVQ9O2yQ==
X-CSE-MsgGUID: WcUhUXEBRfikzuOr9bvq8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="268258729"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jun 2026 09:09:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVAdd-00000000Ewc-1NGQ;
	Thu, 04 Jun 2026 16:09:45 +0000
Date: Fri, 05 Jun 2026 00:09:34 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctls-v1 29/31] net/ipv4/sysctl_net_ipv4.c:643:14:
 warning: 'ipv4_sysctl_tcp_syncookies_data' defined but not used
Message-ID: <202606050056.lyYsO15R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctls-v1
head:   7c8f50dd793cb0314002e78bb70e3bfd0346e606
commit: ed699fdc856ea36d4d96deb3905ebf7c90b86305 [29/31] sysctl: use ctl_field in IPv4 netns sysctls
config: parisc-randconfig-002-20260604 (https://download.01.org/0day-ci/archive/20260605/202606050056.lyYsO15R-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050056.lyYsO15R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050056.lyYsO15R-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/sysctl_net_ipv4.c:643:14: warning: 'ipv4_sysctl_tcp_syncookies_data' defined but not used [-Wunused-function]
     643 | static void *ipv4_ ## field ## _data(const struct ctl_context *ctx)     \
         |              ^~~~~
   net/ipv4/sysctl_net_ipv4.c:756:1: note: in expansion of macro 'IPV4_DATA'
     756 | IPV4_DATA(sysctl_tcp_syncookies)
         | ^~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:643:14: warning: 'ipv4_sysctl_igmp_qrv_data' defined but not used [-Wunused-function]
     643 | static void *ipv4_ ## field ## _data(const struct ctl_context *ctx)     \
         |              ^~~~~
   net/ipv4/sysctl_net_ipv4.c:666:1: note: in expansion of macro 'IPV4_DATA'
     666 | IPV4_DATA(sysctl_igmp_qrv)
         | ^~~~~~~~~


vim +/ipv4_sysctl_tcp_syncookies_data +643 net/ipv4/sysctl_net_ipv4.c

   641	
   642	#define IPV4_DATA(field)						\
 > 643	static void *ipv4_ ## field ## _data(const struct ctl_context *ctx)	\
   644	{									\
   645		return &ctx->ns.net_ns->ipv4.field;				\
   646	}
   647	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
