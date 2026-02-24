Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763BD37F8B8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933904; cv=none; b=ax5RsmkcdKUJqueet27i/baClI0vGIDIKorqaBISpR2lBYdHOEGPNb4P//hgEkUCmsuFkZ8RRtk3PdpLwNYqnRup98u5dOYxLBcmD8lWBgLzxZtDT15I2zap4u1ZpYEwnW/c+o/SxlOVmEI18u25wm8b8oNuT4F2zdIBOSi4E5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933904; c=relaxed/simple;
	bh=ycsodJkvnOIQEEonHOGkQf812ru9d9wXzC4uyMef33U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UdYyIBcTiZIywS2CZkbBpwjaU3BezWhAHJGxq1JzT2IrULR7MsSb4sYtdg7OXn/vpudcDFPEWmnMTCtF4uSh9eJjhU+e/KnWjFtA6ZhUGYZpieV5UjZixPNHJAHBrUA0GfOPbXiWQPLaFhcnNY5vJj8cycqHm5Eg+XTb3bS0HOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvNkSEBj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvNkSEBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771933902; x=1803469902;
  h=date:from:to:cc:subject:message-id;
  bh=ycsodJkvnOIQEEonHOGkQf812ru9d9wXzC4uyMef33U=;
  b=kvNkSEBjKPuWHGR2ZejbFTwQGv1AL+I3jq3N+qmsyQrWOYxxRfw7Bw9s
   7JVtJHP/T8GGavoqDZmZW4hGGPBW3hmyna/QrJdUppDRKVv+bgBclVFZI
   2qTQrujqrTgD2xZPPCo1qb1Snz9BlJX9n9Tkt7LC8o/NVmACjC+8nS7y+
   Nh2iluvkYwuI8/RoWZrsuQyZV0CRvsgXXiVIYjRGidq5buySJiYV8fPZ5
   fz8IYHn4/AVQtOItz/VEOCcai5+U77JAj1gwoxgJf7TDXirff6BFlRpsE
   KtZamEMJFWzKWkVuSckaYW4M8CY7vm6/Mv8hK1X5CTHD6fnfOpJQMP9lD
   w==;
X-CSE-ConnectionGUID: y6EC273kR+etIEuncxcRQw==
X-CSE-MsgGUID: Tq0PvLjxQXO8gG40JesF2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90357223"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="90357223"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 03:51:42 -0800
X-CSE-ConnectionGUID: nsBc0WTmTWSOyG8SSoSmWA==
X-CSE-MsgGUID: jYw/QfmyQPy6MdBsLiCIOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="246458619"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 24 Feb 2026 03:51:41 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuqx0-000000005DV-1rov;
	Tue, 24 Feb 2026 11:51:38 +0000
Date: Tue, 24 Feb 2026 12:51:13 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-DMR-APX-ANBZ29353 30/30]
 kernel/sched/core.c:9327:9: error: implicit declaration of function
 'tg_enable_sli'; did you mean 'enable_nmi'?
Message-ID: <202602241245.vzGinOV4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-DMR-APX-ANBZ29353
head:   d8e6957edead90297a4f8cb1f247c54e559dbf8c
commit: fe958b7e95e27b3bac51f93b652ae2c289548195 [30/30] anolis: sched: support cpu.exstat
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260224/202602241245.vzGinOV4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602241245.vzGinOV4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241245.vzGinOV4-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'cpu_cgroup_css_offline':
>> kernel/sched/core.c:9327:9: error: implicit declaration of function 'tg_enable_sli'; did you mean 'enable_nmi'? [-Wimplicit-function-declaration]
    9327 |         tg_enable_sli(tg, false);
         |         ^~~~~~~~~~~~~
         |         enable_nmi


vim +9327 kernel/sched/core.c

  9322	
  9323	static void cpu_cgroup_css_offline(struct cgroup_subsys_state *css)
  9324	{
  9325		struct task_group *tg = css_tg(css);
  9326	
> 9327		tg_enable_sli(tg, false);
  9328		scx_tg_offline(tg);
  9329	}
  9330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
