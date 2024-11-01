Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00B5125D5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 01:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730423888; cv=none; b=KK9ETbmoiwORzcJ4KFSRUfCFos4tsvD78/7CeVqUNagYl/mWwxt9JVSUqYsF50GyIlbV9uhh97hp7DHR6Z67B7ya2COjodL9aK0RkKUlmy11Qnnc28YoHr7TcVlIexLM4rTzqZD33FD/t5E1mFNrEi8eySDIdSZJynVLRfIqgOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730423888; c=relaxed/simple;
	bh=RlecfPqDES7zRFNwYjxn5JkTz3ViOyTd/Ur7G3HP0Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mS0cCKqO5h3xGynh+QDU2cxzc4hAOGpz/PrfAIpwLGgCZFMVKeEaaCS0F25j+HsfrUHjpWHny2DiD/lVFr7spK3Ptn5nsls5H9TpSF2lVv/+hHtMTON1GpPsUqutQ5jlKbNBzpMinHK2rVFYW51ezlpxc77zo/50F4psNP+Ifpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YN4o6K3r; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YN4o6K3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730423882; x=1761959882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RlecfPqDES7zRFNwYjxn5JkTz3ViOyTd/Ur7G3HP0Qk=;
  b=YN4o6K3rmPLk+xL7zEpaRzODT3h5Ggt9DE56dPD7vDhYGBgvuuzkWpym
   MTJvn8Dxyks/uyIvf6YbVfIJmg+2tWp/VHTayzNW6G+zMDuzyj+z9vIb4
   CqSGZLXSBG66sutj/4eGeurrPjeT7TljNuUiK3jAs8EhHeu8/d9T3JUgP
   L6pubbdxiH12AqsNisFGiw8ranW9ZopDXWaQYrPixIIGLTs8+QK5ckXca
   cUNKMr5F0wSH8Xoi7t77nkaDg5rCKx6cV+R/krWmuSk+ofPrtxBCJPEBb
   l2T2itmu0i0JITFtXx5Mz+9Clbh3ZzruD3RbQ6Z7YQz9Z03UiqNrxzT4k
   g==;
X-CSE-ConnectionGUID: uTbzzbpaTMWAykPW+wsdcA==
X-CSE-MsgGUID: 0t1ztV9hSomWL/FOvtsGyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30354977"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30354977"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 18:18:01 -0700
X-CSE-ConnectionGUID: GGUVngjYSVGdJ27m5FmjiA==
X-CSE-MsgGUID: N+5e8ceDQ06sKtkoEWED9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82962173"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Oct 2024 18:17:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6gIV-000gyO-0q;
	Fri, 01 Nov 2024 01:17:55 +0000
Date: Fri, 1 Nov 2024 09:17:19 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 11988/13046] net/core/netclassid_cgroup.c:515:5:
 sparse: sparse: symbol 'bps_limit_dump' was not declared. Should it be
 static?
Message-ID: <202411010919.hxn2oftB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: ca0f6ddd217803ae350424336308109cc6ca6fdc [11988/13046] rue/net: add rx && tx rate limit for per cgroup
config: x86_64-randconfig-123-20241029 (https://download.01.org/0day-ci/archive/20241101/202411010919.hxn2oftB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010919.hxn2oftB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010919.hxn2oftB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/netclassid_cgroup.c:122:5: sparse: sparse: symbol 'cls_cgroup_stats_init' was not declared. Should it be static?
   net/core/netclassid_cgroup.c:151:6: sparse: sparse: symbol 'cls_cgroup_stats_destroy' was not declared. Should it be static?
   net/core/netclassid_cgroup.c:337:5: sparse: sparse: symbol 'net_cgroup_notify_prio_change' was not declared. Should it be static?
   net/core/netclassid_cgroup.c:489:5: sparse: sparse: symbol 'read_class_stat' was not declared. Should it be static?
   net/core/netclassid_cgroup.c:501:5: sparse: sparse: symbol 'rx_dump' was not declared. Should it be static?
   net/core/netclassid_cgroup.c:508:5: sparse: sparse: symbol 'tx_dump' was not declared. Should it be static?
>> net/core/netclassid_cgroup.c:515:5: sparse: sparse: symbol 'bps_limit_dump' was not declared. Should it be static?

vim +/bps_limit_dump +515 net/core/netclassid_cgroup.c

   514	
 > 515	int bps_limit_dump(struct seq_file *sf, void *v)
   516	{
   517		struct cgroup_subsys_state *css = seq_css(sf);
   518	
   519		if (READ_ONCE(netcls_modfunc.dump_rx_bps_limit_tb) &&
   520		    READ_ONCE(netcls_modfunc.dump_tx_bps_limit_tb)) {
   521			netcls_modfunc.dump_rx_bps_limit_tb(css, sf);
   522			netcls_modfunc.dump_tx_bps_limit_tb(css, sf);
   523		}
   524		return 0;
   525	}
   526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
