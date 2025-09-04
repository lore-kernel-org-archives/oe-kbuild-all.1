Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF214204E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 05:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756963116; cv=none; b=L2Ps77bm01mZkJGg6Ldns6pVPJyk9uHO7aJQjCyyrGbcP+cbKBrQdSPTjOyIh0q8h9HE41DUDIBlLy55xEdx8nZK21zmBopYBX5GAQrcfCyBTa/k2Tm76hN5Nsu750pO+wn+4CHjKMY5oYxKLqObwYH4mgi8rPBqHRKqaCuQwkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756963116; c=relaxed/simple;
	bh=lZ2KWNrnZvc2e4NaLGaTbDiehb4P8LrccOpSXRXd5LU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dU6ZkBTK9Q7VgNwyEsxQY0urocrsh64Kew6yN+1IulIhDeE52+tTE07EfHvkEmhlqesILIDEgpnzR2+y0sAbMUEVq8ECN1ht6dNk6zQoIXtgwtD82uH1KGI6dc92qdmgCq6r/LR1XMqZAYpy0+vzu2YLIYAFOOdBh0Btq+SRMpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/ytamHV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/ytamHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756963115; x=1788499115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lZ2KWNrnZvc2e4NaLGaTbDiehb4P8LrccOpSXRXd5LU=;
  b=H/ytamHVFmtk0jtFNaJRsZ0CHRAMDGkNR9M757y7e/COAFTwhZ0p37as
   336b9xu0XM0yMMZ01h/6xsol1RN4IVzHg7Iygme0yizdvwh1vgAJYh1sT
   FhuLrfSIaIpemfn/x6Vk9HWlPTe2CGhMnxaEFspWSKZcqEekV2qiLuTbs
   ZvuEWAEMyMhegUdBIU6vaEXMANXrcG5Ml7vkqeURuoUVDl7zsbgOc07yC
   ABBQ5EM8S45YhxXa3rAJ6L8FcXKftC96T52ndxwXexQ6Nw58P2+PAxK17
   o00ZjIdTULT3e4Mjq9SAmNH7wMIkUbXn+MfpbK/SKnXBSEJodKuTSxXCt
   w==;
X-CSE-ConnectionGUID: lPj78Sj2T66Gr8Jvb5HUNg==
X-CSE-MsgGUID: YRELFP7lSCOxt4y0qXuJcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76739456"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="76739456"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 22:18:34 -0700
X-CSE-ConnectionGUID: vCQsDWWhTFyEjcxpLsU8GQ==
X-CSE-MsgGUID: 5SuraovhS/eh32vqz0s6AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="195451594"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Sep 2025 22:18:33 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uu2Mh-0004mv-14;
	Thu, 04 Sep 2025 05:18:31 +0000
Date: Thu, 4 Sep 2025 13:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-hier-prototype 14/14]
 kernel/sched/ext_internal.h:881:12: warning: 'scx_dsp_max_batch' defined but
 not used
Message-ID: <202509041358.Up8qRDLN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-hier-prototype
head:   7443f4ccb9e360cd50e991db81d27e3514f1be65
commit: 7443f4ccb9e360cd50e991db81d27e3514f1be65 [14/14] scx_hier: WIP
config: x86_64-buildonly-randconfig-004-20250904 (https://download.01.org/0day-ci/archive/20250904/202509041358.Up8qRDLN-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509041358.Up8qRDLN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509041358.Up8qRDLN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:62:
   kernel/sched/ext.c: In function 'scx_vexit':
   kernel/sched/ext.c:4806:9: warning: function 'scx_vexit' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    4806 |         vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
         |         ^~~~~~~~~~
   kernel/sched/ext.c: In function '__bstr_format':
   kernel/sched/ext.c:6904:27: warning: function '__bstr_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    6904 |                           bprintf_data.bin_args);
         |                           ^~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:61:
   kernel/sched/ext_internal.h: At top level:
>> kernel/sched/ext_internal.h:881:12: warning: 'scx_dsp_max_batch' defined but not used [-Wunused-variable]
     881 | static u32 scx_dsp_max_batch;
         |            ^~~~~~~~~~~~~~~~~


vim +/scx_dsp_max_batch +881 kernel/sched/ext_internal.h

   880	
 > 881	static u32 scx_dsp_max_batch;
   882	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
