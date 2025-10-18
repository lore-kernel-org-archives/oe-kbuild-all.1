Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1852727E0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 10:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760782215; cv=none; b=rId9A4/D0hKylSbEbMXGUKrzu+fwq+rv1MF2oTO4V+nA8lzd54efTPDK038p3p95z9z4BYRwpxwWXtunRhWd+uXuXSppgAfAjyNJj+ZAiw2x9c3WlP/qWe5sVPzKpUKrBRbdkUlwXt2DusPd3L7XYpn/xcAat4LojzT19ASR8ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760782215; c=relaxed/simple;
	bh=5YYKchnGTBKNSMA25es0qRcpJGI6v8j2Bpc4Qxrk/GE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MH48nSTgshhghywCt2IdIjsDButPdDJwf2DvFoBoHHpXiyyQRngUjt3RSiD+imY98n6w5IVHrnI7uCv6cBhsHUqy+WbwcuU55Gjz5EEaBj0CwsAZV5c5x8ImWNZWIdf/u3Jm72vWeX02T46A/GXfavPyYe/hUNdMUAd4FPH0ya4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZoY/eXN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZoY/eXN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760782213; x=1792318213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5YYKchnGTBKNSMA25es0qRcpJGI6v8j2Bpc4Qxrk/GE=;
  b=MZoY/eXNZrTGRl0SEn0pmVknP1xbDJeS+Wa5OyFrhs36k56JLeaimTr4
   Em2kurBazdSu6Navsp0Mwsb85nH+UGPDxvuAgtoy1UsB47OKs9D/elZ2R
   5RiJBou0gHgOU22fFeJ0Z3w7GzGEtlHWvZEFHgSKMuzeOz1l22IU9PSvg
   piG1vxmNTQ6TKAupVs820bahAhO3vRH4DrnCZFwtWZ1ySIGzI7nUWGevS
   No2pWyavpbAPrZ202BKdPbcpas8dOza4/npZfL5J1rfySYu01MVYUopjd
   e2HXs92vImTz3GWYpumDhiuOFOd9+of7FkeaiJJumTQXP/erhi+7J3Xgn
   g==;
X-CSE-ConnectionGUID: N+tzE06bQwSS5HipZ9PpVQ==
X-CSE-MsgGUID: wFOHKpg5TB6vxYAK3d0u4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="74329596"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="74329596"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 03:10:12 -0700
X-CSE-ConnectionGUID: zFvmVnL7TgCXdU18acKvpQ==
X-CSE-MsgGUID: g3YkONqkT1W8OruCq22f9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="187185862"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 Oct 2025 03:10:11 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA3t3-0008DA-0H;
	Sat, 18 Oct 2025 10:10:09 +0000
Date: Sat, 18 Oct 2025 18:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/mem_reliable.c:126:5:
 sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it
 be static?
Message-ID: <202510181808.04lWorDM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e98deea13d81cacd6479edf0de6267118ae7c639
commit: 1845e7add95773a24019fb72bbea24a0a568663b [1740/1740] mm: Add reliable memory use limit for user tasks
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20251018/202510181808.04lWorDM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181808.04lWorDM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181808.04lWorDM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mem_reliable.c:126:5: sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it be static?
   mm/mem_reliable.c:126:5: warning: no previous prototype for 'reliable_limit_handler' [-Wmissing-prototypes]
     126 | int reliable_limit_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~

vim +/reliable_limit_handler +126 mm/mem_reliable.c

   124	
   125	#ifdef CONFIG_SYSCTL
 > 126	int reliable_limit_handler(struct ctl_table *table, int write,
   127		void __user *buffer, size_t *length, loff_t *ppos)
   128	{
   129		unsigned long old = task_reliable_limit;
   130		int ret;
   131	
   132		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   133		if (ret == 0 && write) {
   134			if (task_reliable_limit > total_reliable_mem_sz()) {
   135				task_reliable_limit = old;
   136				return -EINVAL;
   137			}
   138		}
   139	
   140		return ret;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
