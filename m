Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67E21F8AC5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 06:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748586288; cv=none; b=CoRZ2JLK9hx1TPEWnx1SBrHJJU8tWq9VbprJMB7uPZOKHe6j1NCkH5cP3A4HWkG7p+d7PDax3u+2LapEcfek2dD/n5wvoLSNy/DTUuJj0QpBnLn9YKmXpr5pGln5pPAcuGUx75RTHEx1GbhB1DZsb5tu9T5lKLcJxm5MNpp+4ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748586288; c=relaxed/simple;
	bh=iJlkg452yrtou/r1VwGRIrfnqrioKqw12Q5uF1IVYCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t96WOM12Ag8H+mfZa9M16d0mcDOyOcFo/lvoPojMV1kGXWxqKd92k5NvapHnAdMW/fdDPC41TIBuL78Zlu1Ss6dfZicMN+1IaC0nGUOJ/bbAhs7D2ifakgIlg86fduTTtv90LfjnQxy/sZB5ZJ/omJ4xxUZJSfA7o8oT+nACvGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JN409767; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JN409767"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748586286; x=1780122286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iJlkg452yrtou/r1VwGRIrfnqrioKqw12Q5uF1IVYCc=;
  b=JN409767UQv4G39mW8rVZemsqhWaPfJRUsf1oFicEW4/mVJ6pK3H+IVF
   Wop01NqTnray5FhDFTzsPY6KOcQywlfgPT7uezsrm8aPmOIWJJsKrAxnf
   iflShwbE+K8qX1zBLjbdL6lDJ5R9xai81IvhLIu+0hF85neecPTdD6rIz
   XC6ELPmQO2/AO5unhv97LyAq4zEH+0lNHl+6THupggCB4nDry+UdNWejR
   UfPBZ9QagBFH+6VcIsXL2usvqC6Ujgnh1D85k21cNza9nhfHIsTo4SLwp
   +aj7EnJei8P5f9LSmlVdJmVKiE80aIa15c6PFztpPhwi2rRtgf+Ut64R5
   w==;
X-CSE-ConnectionGUID: qIld74WyQhCDfEXk5PdAyw==
X-CSE-MsgGUID: owqDUUwdRdmMobQy4J9zXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50815513"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="50815513"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 23:24:46 -0700
X-CSE-ConnectionGUID: DGDoL9crSIGZhHzqNjK+Cg==
X-CSE-MsgGUID: z1+Z475RR/OdOGQFloqy5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="143608939"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 May 2025 23:24:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKtAX-000XPc-2r;
	Fri, 30 May 2025 06:24:41 +0000
Date: Fri, 30 May 2025 14:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jia Qingtong <jiaqingtong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2938/2938]
 drivers/irqchip/irq-gic-v3-its.c:504:6: warning: no previous prototype for
 'build_devid_pools'
Message-ID: <202505301434.xq8uzhGR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b5ec139da1a4916dfc9644ee3d9426dbd6f23c13
commit: af552f9d957def499065ed6e194bcd5f0c75dbc5 [2938/2938] irqchip/gic-v3-its: Move build_devid_pools from its to acpi iort init
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250530/202505301434.xq8uzhGR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301434.xq8uzhGR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301434.xq8uzhGR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3-its.c:504:6: warning: no previous prototype for 'build_devid_pools' [-Wmissing-prototypes]
     504 | void build_devid_pools(void)
         |      ^~~~~~~~~~~~~~~~~


vim +/build_devid_pools +504 drivers/irqchip/irq-gic-v3-its.c

   500	
   501	/*
   502	 * Currently we only build *one* devid pool.
   503	 */
 > 504	void build_devid_pools(void)
   505	{
   506		struct its_node *its;
   507	
   508		its = list_first_entry(&its_nodes, struct its_node, entry);
   509		if (readl_relaxed(its->base + GITS_IIDR) != 0x00051736)
   510			return;
   511	
   512		if (!probe_devid_pool_one())
   513			rsv_devid_pool_cap = true;
   514	
   515		if (rsv_devid_pool_cap)
   516			pr_info("ITS: reserved device id pools enabled\n");
   517	}
   518	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
