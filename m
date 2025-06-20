Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EA6274660
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 08:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409933; cv=none; b=pAkVNwg0P61XsVuf19u3Aq/0dQLIzyfSbF9mGzDuPzcFg9ypl3r0ozE/+ifQbUn9aq8T43ngUEdB2hhgKMmZjIRubimzSN8AsTHArqsGAS3OC4w6+iccru3bBV5JtJYO5gVuiWqtNXyY8EKdARD8HcQdgp643UgbpBxihfDVaIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409933; c=relaxed/simple;
	bh=YbOLFB2snOUIXA5fK13w2az8uWaTgh6ox+WTmIJQ0Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q53INscbnWtczvXY764nhthssoYiEhCUsEfRj6grPz6iGm89FTlwIriz6AGj4wkWKs9zG8XkV75UqomKWRO9r8WXVx89XhUnpN2AQfObsZtB3mUTZFiNVWksbBR95ecIctyEkJKTVC8Q5Yv5LTvTfFDhrDpWempj4JszNc075W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WySQT/7+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WySQT/7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750409932; x=1781945932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YbOLFB2snOUIXA5fK13w2az8uWaTgh6ox+WTmIJQ0Lk=;
  b=WySQT/7+Y5ImOeJifyo2R3Pf8pg8l+k5xtYNBpWdSCNLDcYMz5dobUCv
   qN2snsKMK4rhGWAPBE/sAedBOz+WFCeNDZIdKmddkR1vNqZse7Es505s2
   /3BEqXyhPJ1+3amuJ2k3BFErSAke0WxJdILayMGFeJbYjTwwqKlj2gkev
   WXpR8A6rXVaUW50/8DHPAOhvoQnICWMdNb8Cd8VGap5iSXeRpr5DhjXkt
   bC817xxS6NAXJ83L+FIf2Om0B4MtP75S9x5AvkSIhncDx6FJPYiCLmXzK
   6MpqIxXxR1uY7u312RBd6gB309I5rB2G5JnjfM8qM+4tfx2mJorjhA7Sh
   g==;
X-CSE-ConnectionGUID: iP0R0rtwQVOW/AV9dfslQg==
X-CSE-MsgGUID: 9nCR60PxR8SZJA0gKX9LaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64098804"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="64098804"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 01:58:52 -0700
X-CSE-ConnectionGUID: 4NFOqgNmQ6uRlbD/G2XQhA==
X-CSE-MsgGUID: F53uMza9T7WQo/K4H6vNtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="150996495"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jun 2025 01:58:50 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSXaC-000LXm-21;
	Fri, 20 Jun 2025 08:58:48 +0000
Date: Fri, 20 Jun 2025 16:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 6/10] Warning:
 kernel/trace/ftrace.c:5970 function parameter 'ip' not described in
 'register_ftrace_direct'
Message-ID: <202506201656.njfWQNOG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   b288c6b15d20122d59ddf3bce2fb86afe6ed56c3
commit: 60f053ac0f246163e7330460f249edf54905e8cc [6/10] ftrace: Use direct hash interface in direct functions
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250620/202506201656.njfWQNOG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201656.njfWQNOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201656.njfWQNOG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/trace/ftrace.c:5970 function parameter 'ip' not described in 'register_ftrace_direct'
>> Warning: kernel/trace/ftrace.c:6001 function parameter 'ip' not described in 'unregister_ftrace_direct'
>> Warning: kernel/trace/ftrace.c:6033 function parameter 'ip' not described in 'modify_ftrace_direct'
>> Warning: kernel/trace/ftrace.c:6033 function parameter 'lock_direct_mutex' not described in 'modify_ftrace_direct'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
