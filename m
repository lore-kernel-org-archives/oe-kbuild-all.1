Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167BD12D758
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 01:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730425812; cv=none; b=mZ5lLOmB1vS/x2quYV1i2S8TEsTC8aElBjKd76UwlhWwdfqISyXCkWH1Ro+9jnGZeEJxu9UoselfG1MJRhqgOSGdsDsezr7wIIAisuUdTGkOI1rqP/Co47X5w5VcGHkebuQeZwmI6QF24nwQfgmhZ08GqMcNvkOBzMrNZFuH1o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730425812; c=relaxed/simple;
	bh=vsdEYLxDeFaXUTNddhAvQNIMgjwX0NMzlxsXZSLA6jI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lnlGX1nQWWQ3sKbDChzNakKjMoXW89QFJng7UgXAXGWDtZw2nNaNh4T6i85KlxzDZeu5UjDfSx0/Ah7xvXxSY7FtkejKJmpGZYGS6HPbE4bamdNM+OPddOC9A5XP8bsXGdGTP9c0Ms2GeFzQW79jPinNpzmyTlpYvl00N7dK4Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2OOSQNM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2OOSQNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730425807; x=1761961807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vsdEYLxDeFaXUTNddhAvQNIMgjwX0NMzlxsXZSLA6jI=;
  b=b2OOSQNMFH6JLBNHJNuZtu/D+lC5FrQC/bJAhqzYoWNB4BFGmqBbgZEY
   KVIwva76+l+DqEaZC8jSprp4dbdXNq8jj/eiGlgzH71y80f1/jGUKYd9y
   BzvU3+gjTskEoMVU3DWHTPivqf036hdkQnGlQADZREWgBLrsZXew+hsC7
   WtMIPAc2DMabFKqRKtHwUpmhxfYXxCaoUqIW2BNUtjCoVe+zR4MmkLwSq
   8TUVHDmHB16y0NF58Ss/guwmQYDueGEjOp58n7d+kcNnXYm+IYq3EEazm
   bnWd7kNSzDsqlZlLhfh7tEm84k+2eaOEZHytw9LnYl5oRrd3XsjZdt7pg
   A==;
X-CSE-ConnectionGUID: 82T+602WRLGk3zWvtx+dfw==
X-CSE-MsgGUID: XmbQoPQ3QNaZScqpBYx/ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41290745"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41290745"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 18:50:06 -0700
X-CSE-ConnectionGUID: SqEYWO2BQ5OrPJFPEJax0w==
X-CSE-MsgGUID: lh1zRwa6To2rxcmYBSj3jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="113660211"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Oct 2024 18:50:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6gnY-000h1W-2D;
	Fri, 01 Nov 2024 01:50:00 +0000
Date: Fri, 1 Nov 2024 09:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/extended-linear 5/5] drivers/cxl/core/mce.c:20:
 undefined reference to `mce_usable_address'
Message-ID: <202411010906.IaplxhPX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/extended-linear
head:   82adadebb1e8f20174c708e13571db27b13c64c7
commit: 82adadebb1e8f20174c708e13571db27b13c64c7 [5/5] cxl: Add mce notifier to emit aliased address for extended linear cache
config: x86_64-buildonly-randconfig-001-20241101 (https://download.01.org/0day-ci/archive/20241101/202411010906.IaplxhPX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010906.IaplxhPX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010906.IaplxhPX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `cxl_handle_mce':
>> drivers/cxl/core/mce.c:20: undefined reference to `mce_usable_address'
>> ld: drivers/cxl/core/mce.c:41: undefined reference to `memory_failure'
   ld: vmlinux.o: in function `cxl_register_mce_notifier':
>> drivers/cxl/core/mce.c:51: undefined reference to `mce_register_decode_chain'


vim +20 drivers/cxl/core/mce.c

     8	
     9	static int cxl_handle_mce(struct notifier_block *nb, unsigned long val,
    10				  void *data)
    11	{
    12		struct cxl_memdev_state *mds = container_of(nb, struct cxl_memdev_state,
    13							    mce_notifier);
    14		struct cxl_memdev *cxlmd = mds->cxlds.cxlmd;
    15		struct cxl_port *endpoint = cxlmd->endpoint;
    16		struct mce *mce = (struct mce *)data;
    17		u64 spa, spa_alias;
    18		unsigned long pfn;
    19	
  > 20		if (!mce || !mce_usable_address(mce))
    21			return NOTIFY_DONE;
    22	
    23		spa = mce->addr & MCI_ADDR_PHYSADDR;
    24	
    25		pfn = spa >> PAGE_SHIFT;
    26		if (!pfn_valid(pfn))
    27			return NOTIFY_DONE;
    28	
    29		spa_alias = cxl_port_get_spa_cache_alias(endpoint, spa);
    30		if (!spa_alias)
    31			return NOTIFY_DONE;
    32	
    33		pfn = spa_alias >> PAGE_SHIFT;
    34	
    35		/*
    36		 * Take down the aliased memory page. The original memory page flagged
    37		 * by the MCE will be taken cared of by the standard MCE handler.
    38		 */
    39		dev_emerg(mds->cxlds.dev, "Offlining aliased SPA address: %#llx\n",
    40			  spa_alias);
  > 41		if (!memory_failure(pfn, 0))
    42			set_mce_nospec(pfn);
    43	
    44		return NOTIFY_OK;
    45	}
    46	
    47	void cxl_register_mce_notifier(struct notifier_block *mce_notifier)
    48	{
    49		mce_notifier->notifier_call = cxl_handle_mce;
    50		mce_notifier->priority = MCE_PRIO_CXL;
  > 51		mce_register_decode_chain(mce_notifier);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
