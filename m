Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB358F55
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 05:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710393803; cv=none; b=nHedCtSAnMZD4EfKFMfxqluYtxAe2zc4/1fTJI0U6LOfMKpF8PdSJcJG2n9JCI6L44nVv/1KQwXx9PiUqxXJ6z3V16kcDVaEtIYb/GochHFyT2xMovc6eK+dLec7/3Yk65E4jt8Q43/eYlP87MdHPorAmqaNuZFMLqgLqArMu+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710393803; c=relaxed/simple;
	bh=dFVJhOxI/d93+Uz9gC+u9o4Sk/WqJpc9P7GadAk2QM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ltrD7UHzF+4bPVSFFXykU12rtaWw60WRpdE03QuXd+iTrLHuEkTeSf8axQ47Xw2g5w59isO/tpq9lO1WbWPmotQQl3VhwFYee4OZLQ4/zne4CX/tN9dXcSAIu3OnYbACVeAjn7OQyClUN24gvjmWBmeUhszd39qKQL3MBXmlLAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWPZ9uvV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWPZ9uvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710393801; x=1741929801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dFVJhOxI/d93+Uz9gC+u9o4Sk/WqJpc9P7GadAk2QM0=;
  b=HWPZ9uvVkxCi9UZU5IsZcXrfqgT8dkMgRRRPxJyE/dwd8dBgr7YaTauS
   HD30nchQc5jCFkyfqUnAuIE0zi9+yQ48rRHglDq0gOfpb6/HP587tupzF
   mVmbxe5UeD+Ij02ElCFXfpg8jxxeh8RDWMek2eUJWgmGO14GyYHVXLbou
   W0vuGO7fwmu1t07LDnRFzpUmCWjcnKNbfhcp4vj7kyY4fTbpK0I4hTIHB
   JhBLi9n+sEkdI03KTqfVfC+r2+tHvOvMAk12K9oUTzPqL37cGPr4XoXYG
   f8tuNyS4N1Lfy4pFqWFtizcUOeahlDPb5vaXPbFkUCOOz5T2TQw/hrhZc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15836084"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="15836084"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 22:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="16766533"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2024 22:23:18 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkdYh-000D8J-32;
	Thu, 14 Mar 2024 05:23:15 +0000
Date: Thu, 14 Mar 2024 13:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26625/27507]
 net/core/netclassid_cgroup.c:518:5: sparse: sparse: symbol 'bps_limit_dump'
 was not declared. Should it be static?
Message-ID: <202403141333.j9RV1xi1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: 81c4728adcdbe8b9ea56a81590b66a3ee249512d [26625/27507] rue/net: add rx && tx rate limit for per cgroup
config: x86_64-randconfig-121-20240312 (https://download.01.org/0day-ci/archive/20240314/202403141333.j9RV1xi1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141333.j9RV1xi1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141333.j9RV1xi1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/netclassid_cgroup.c:122:5: sparse: sparse: symbol 'cls_cgroup_stats_init' was not declared. Should it be static?
   net/core/netclassid_cgroup.c:151:6: sparse: sparse: symbol 'cls_cgroup_stats_destroy' was not declared. Should it be static?
   net/core/netclassid_cgroup.c:340:5: sparse: sparse: symbol 'net_cgroup_notify_prio_change' was not declared. Should it be static?
   net/core/netclassid_cgroup.c:492:5: sparse: sparse: symbol 'read_class_stat' was not declared. Should it be static?
   net/core/netclassid_cgroup.c:504:5: sparse: sparse: symbol 'rx_dump' was not declared. Should it be static?
   net/core/netclassid_cgroup.c:511:5: sparse: sparse: symbol 'tx_dump' was not declared. Should it be static?
>> net/core/netclassid_cgroup.c:518:5: sparse: sparse: symbol 'bps_limit_dump' was not declared. Should it be static?

vim +/bps_limit_dump +518 net/core/netclassid_cgroup.c

   517	
 > 518	int bps_limit_dump(struct seq_file *sf, void *v)
   519	{
   520		struct cgroup_subsys_state *css = seq_css(sf);
   521	
   522		if (READ_ONCE(netcls_modfunc.dump_rx_bps_limit_tb) &&
   523		    READ_ONCE(netcls_modfunc.dump_tx_bps_limit_tb)) {
   524			netcls_modfunc.dump_rx_bps_limit_tb(css, sf);
   525			netcls_modfunc.dump_tx_bps_limit_tb(css, sf);
   526		}
   527		return 0;
   528	}
   529	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
