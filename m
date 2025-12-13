Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5007B27A10F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765632754; cv=none; b=ghXGGI8sZDGAFlhSYNfEmtzhSLoSo7lbhbARRA0TcEw8uNoC3U1dWSc/atNc1eorqG785mVfHwgWFvQEtz3JeOo5Ik+NNv0FFu8DPomeXz+xrK89i2/VZTUR1JC0kyhDZOjcwYPgs1x6tXs4EE8DpsO2vQF2mYaUQOXORmtBfdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765632754; c=relaxed/simple;
	bh=IqEjYAjjyxnx0Y4ymUdnhTF5LXLSw7uMEosD0D7x/+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rvUfSOYM5pS7DgFk76lvRtrMVA3QnKixkRxCsGTvyscMbTU5iW/QpMTbk4oFlQQjK04RpZVWB4soEzwUzFKbRyQuJRLmXm+Utrk0Ps56uG74+D2Fl75/OLAuh0+yvgwHq9hqBdjpbd3Ab+VZFj1Um8pxiOwzl9AUk1leffPzXoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cB149yIp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cB149yIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765632752; x=1797168752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IqEjYAjjyxnx0Y4ymUdnhTF5LXLSw7uMEosD0D7x/+0=;
  b=cB149yIpTjvMaWykW4ECPyC9v6K6OsnCpWVqyTFIaYAndDkadPVC8wFx
   lzZK/kAIZP1TPMf/bWGq3zCSzV/0unHXPv8Y/kc9wv/UOi//UiyZJKCyQ
   bT47GqmZyyMYoWTe3tNwbBLvNk39Wi49m+7I1jXliFQaH+8dp12I0YYF/
   0Y2VUjl76UPadgldHAGL05nLDNJLaHwmJmnz5Q2Jc1YDPTHPp+os4+O5c
   MI9Gm/7U/GTmgwuYocmiPLA4P6Q7/kECmovD+d55s8vRZZhWeEtSza22i
   ljwK67F5ISWRQQNjf7h29kPPZQxh+1VUP9noos3tVuF0jFmjuYPxnKJPS
   A==;
X-CSE-ConnectionGUID: y8ywXJgoRbKu0HG8UGydSQ==
X-CSE-MsgGUID: 0QiHPM38Qk2CAM+iQyHEFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66599202"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="66599202"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 05:32:31 -0800
X-CSE-ConnectionGUID: WNDj4dbEQ0mv2de02RRsjA==
X-CSE-MsgGUID: KXozj1rNSVe32w7CejHMAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197584508"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 05:32:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUPjY-0000000024q-3SJh;
	Sat, 13 Dec 2025 13:32:28 +0000
Date: Sat, 13 Dec 2025 14:31:32 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 40/40]
 kernel/sched/core.c:4976:6: warning: no previous prototype for
 '__balance_callbacks'
Message-ID: <202512131456.nocmSs8S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: 51ba045c81b3d00225cfe6866e5fd18a1faddf30 [40/40] ANDROID: GKI: vendor code needs __balance_callbacks access
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512131456.nocmSs8S-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131456.nocmSs8S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131456.nocmSs8S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:4976:6: warning: no previous prototype for '__balance_callbacks' [-Wmissing-prototypes]
    4976 | void __balance_callbacks(struct rq *rq)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/__balance_callbacks +4976 kernel/sched/core.c

  4975	
> 4976	void __balance_callbacks(struct rq *rq)
  4977	{
  4978		do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
  4979	}
  4980	EXPORT_SYMBOL_GPL(__balance_callbacks);
  4981	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
