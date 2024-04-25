Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215FF39ADD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 20:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714078460; cv=none; b=sLYeMl5HT9A4Jjt6O8KChszlCds+uxbmzDMaMRbtdyhpiMIDbV1Jcz7xqf2Zxru3hA0el8cKF/8aSTjHM0fI7Px71p1LF++Ga6DjijM/6wTKB5vCW3w9pqAoD+oNRYIDlX05862XFg4WUxygBMdv6A/TgCveJorOL1ZoCTt1lKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714078460; c=relaxed/simple;
	bh=dh+kwxnL1E0HxAIhw6rkebLlcj+6O3vkobvzq6QSH5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VcGYd3xZd1H3dJhNLWmDVDqaHX8E2tgbiiM32mUjLpeyPH/IDqW7qzHZKFef4kCS7ZvHXmkjBUTDZzniQunlQgQD6eEV1JAeG+zr/Rz0OzpabhrMoEycs6kLB4F94esLAX0lw/WFI4cVQDVPsSjdDMbRIeHLRD1Nmywkv9AsscU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfAFTr4M; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfAFTr4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714078460; x=1745614460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dh+kwxnL1E0HxAIhw6rkebLlcj+6O3vkobvzq6QSH5E=;
  b=TfAFTr4M55e4raj90fmahAzpZVsuxYtU/GVFoBLGQOH/WWXXnfT39G0O
   jUCUYz7gjg60bRFeiPdzgXzIHUuWbxnuu1/ZlvxoA2ySo3wuXI/ME4I+X
   XYIaIDWtAvzsST7QRg/Ovo7QkwMH8HkJKLmgYvq/RiHNyGIZzCF2NntyF
   nbKDHYRsIa6uxRqq2+uzGrJOHZvZzJ+3lvFSfQ2CeMHPlSt9wAJhrCwbX
   iRyc58qc6CCwhOZupUZS4+OxztSEsmn5tBGlGDfmjGG3ncTAvLMwBMvof
   xyxgPHwjA5VagNoXQmHTEU0YhW1K91v3Ids5MBwJBnPwRP202TfARh3gv
   Q==;
X-CSE-ConnectionGUID: JPCkWTdRQRiswn/s0hUYMg==
X-CSE-MsgGUID: CG0IU4f6QUeofLav04YttQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13578853"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="13578853"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 13:54:17 -0700
X-CSE-ConnectionGUID: qReVrwxxTeWnZPCmXWytpA==
X-CSE-MsgGUID: S+aE3BccSkKxrppAPLvgNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="30005958"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Apr 2024 13:54:15 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s066f-0002rA-0y;
	Thu, 25 Apr 2024 20:54:13 +0000
Date: Fri, 26 Apr 2024 04:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/sysctl_remset_net 2/9]
 net/mpls/af_mpls.c:2692:25: error: 'tabel_size' undeclared; did you mean
 'table_size'?
Message-ID: <202404260412.CpPkSONb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/sysctl_remset_net
head:   0601b5211d4d02b83c06047608e6ab7023379071
commit: f01da46a76f68d2c13bb9d16e00324de5af560c8 [2/9] net: Remove the now superfluous sentinel elements from ctl_table array
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240426/202404260412.CpPkSONb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404260412.CpPkSONb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260412.CpPkSONb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   net/mpls/af_mpls.c: In function 'mpls_net_init':
>> net/mpls/af_mpls.c:2692:25: error: 'tabel_size' undeclared (first use in this function); did you mean 'table_size'?
    2692 |         for (i = 0; i < tabel_size; i++)
         |                         ^~~~~~~~~~
         |                         table_size
   net/mpls/af_mpls.c:2692:25: note: each undeclared identifier is reported only once for each function it appears in
>> net/mpls/af_mpls.c:2676:16: warning: unused variable 'table_size' [-Wunused-variable]
    2676 |         size_t table_size = ARRAY_SIZE(mpls_table);
         |                ^~~~~~~~~~


vim +2692 net/mpls/af_mpls.c

  2673	
  2674	static int mpls_net_init(struct net *net)
  2675	{
> 2676		size_t table_size = ARRAY_SIZE(mpls_table);
  2677		struct ctl_table *table;
  2678		int i;
  2679	
  2680		net->mpls.platform_labels = 0;
  2681		net->mpls.platform_label = NULL;
  2682		net->mpls.ip_ttl_propagate = 1;
  2683		net->mpls.default_ttl = 255;
  2684	
  2685		table = kmemdup(mpls_table, sizeof(mpls_table), GFP_KERNEL);
  2686		if (table == NULL)
  2687			return -ENOMEM;
  2688	
  2689		/* Table data contains only offsets relative to the base of
  2690		 * the mdev at this point, so make them absolute.
  2691		 */
> 2692		for (i = 0; i < tabel_size; i++)
  2693			table[i].data = (char *)net + (uintptr_t)table[i].data;
  2694	
  2695		net->mpls.ctl = register_net_sysctl_sz(net, "net/mpls", table,
  2696						       tabel_size);
  2697		if (net->mpls.ctl == NULL) {
  2698			kfree(table);
  2699			return -ENOMEM;
  2700		}
  2701	
  2702		return 0;
  2703	}
  2704	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
