Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACF11754B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 01:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746842184; cv=none; b=QSl4mG5vlc29cAxdEpMB9pU3om/Awzub1pejB3LVUbxzHaJgn+crJ4EHw7xFc5Q6cHBnTsv8GqDGC9kqVjXd/P+/4yGIgg1Yc5sX1CQf13RSFHgYoedknQfjvjaAH8rIfhnapoAl5CrNDGCiIRTKRAKn6ZiyFYhdHjw4P2rhPqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746842184; c=relaxed/simple;
	bh=3kw7GwvlQSxXk2TFGn+EMYYmpKYDJL0SriSZ1oNnUyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5GdSSc0LFB15Ur7d6k2J20CrZ9jgUr4Az2T3g4tm1CWjoxubzWnRmr5U032jM5PXsbdspVMhfDxbRFp5G41kvGtCrQGcfMPN2plU7SX8qfev00zsax93XWg2B7DV14xGYr77E3GrCe3UAu5924WT1aY9XqNgV9R3Dpc5C4Ns48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SG62DSsN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SG62DSsN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746842183; x=1778378183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3kw7GwvlQSxXk2TFGn+EMYYmpKYDJL0SriSZ1oNnUyE=;
  b=SG62DSsNdWvHA3SsTs2WXCZHYYSuUdF3IQcPCS+Dov+rrGnAh9fBP168
   YsoaEhA3uJ8BWflkHH1inAjt3UlWVAaQiSGjntraE52uEBFC9qTASOSUe
   xluZc3O5Kf/JF2foVb3jd/sHeZK+XGJOvkdQcCTJpxzYnVMCIcR4FAcZt
   JkMJZpF3XaygmgaSpNlZFC5yekriAQYA0wRJnVNM9DrXLPqy/jA05c05z
   coHEDlhHgg/h6S1Enl8ve3hadDwVtf8wOSGWE+ciRqGQ7NIW49ouiJAFz
   W8Fc2XqjdNZdACjtnDuWrCrjIbOxNBSv/dwmy2fsjAgV51/ejSFHqUI7Y
   Q==;
X-CSE-ConnectionGUID: qqXpNw6dTd6WbYhG5UDcRw==
X-CSE-MsgGUID: t+MDmsnKTKm9432jIpIOWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48378553"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="48378553"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 18:56:22 -0700
X-CSE-ConnectionGUID: E2COr/TLQOuey6R2Ths4IA==
X-CSE-MsgGUID: 8foTDd3jT5WhlTyAKxhe6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="167868132"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 May 2025 18:56:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDZRq-000CfP-37;
	Sat, 10 May 2025 01:56:18 +0000
Date: Sat, 10 May 2025 09:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Byungchul Park <byungchul@sk.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 19/19] mm, netmem: remove the page pool members in struct
 page
Message-ID: <202505100932.uzAMBW1y-lkp@intel.com>
References: <20250509115126.63190-20-byungchul@sk.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509115126.63190-20-byungchul@sk.com>

Hi Byungchul,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on fd93b3350b4314eebd8fbf0fea3ca7fe48d777e3]

url:    https://github.com/intel-lab-lkp/linux/commits/Byungchul-Park/netmem-rename-struct-net_iov-to-struct-netmem_desc/20250509-195458
base:   fd93b3350b4314eebd8fbf0fea3ca7fe48d777e3
patch link:    https://lore.kernel.org/r/20250509115126.63190-20-byungchul%40sk.com
patch subject: [RFC 19/19] mm, netmem: remove the page pool members in struct page
config: x86_64-buildonly-randconfig-003-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100932.uzAMBW1y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100932.uzAMBW1y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100932.uzAMBW1y-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/netdevsim/netdev.c: In function 'nsim_pp_hold_write':
>> drivers/net/netdevsim/netdev.c:852:49: error: 'struct page' has no member named 'pp'
     852 |                 page_pool_put_full_page(ns->page->pp, ns->page, false);
         |                                                 ^~
   drivers/net/netdevsim/netdev.c: In function 'nsim_destroy':
   drivers/net/netdevsim/netdev.c:1077:49: error: 'struct page' has no member named 'pp'
    1077 |                 page_pool_put_full_page(ns->page->pp, ns->page, false);
         |                                                 ^~


vim +852 drivers/net/netdevsim/netdev.c

1580cbcbfe770b Jakub Kicinski 2024-04-12  827  
1580cbcbfe770b Jakub Kicinski 2024-04-12  828  static ssize_t
1580cbcbfe770b Jakub Kicinski 2024-04-12  829  nsim_pp_hold_write(struct file *file, const char __user *data,
1580cbcbfe770b Jakub Kicinski 2024-04-12  830  		   size_t count, loff_t *ppos)
1580cbcbfe770b Jakub Kicinski 2024-04-12  831  {
1580cbcbfe770b Jakub Kicinski 2024-04-12  832  	struct netdevsim *ns = file->private_data;
1580cbcbfe770b Jakub Kicinski 2024-04-12  833  	ssize_t ret;
1580cbcbfe770b Jakub Kicinski 2024-04-12  834  	bool val;
1580cbcbfe770b Jakub Kicinski 2024-04-12  835  
1580cbcbfe770b Jakub Kicinski 2024-04-12  836  	ret = kstrtobool_from_user(data, count, &val);
1580cbcbfe770b Jakub Kicinski 2024-04-12  837  	if (ret)
1580cbcbfe770b Jakub Kicinski 2024-04-12  838  		return ret;
1580cbcbfe770b Jakub Kicinski 2024-04-12  839  
1580cbcbfe770b Jakub Kicinski 2024-04-12  840  	rtnl_lock();
1580cbcbfe770b Jakub Kicinski 2024-04-12  841  	ret = count;
1580cbcbfe770b Jakub Kicinski 2024-04-12  842  	if (val == !!ns->page)
1580cbcbfe770b Jakub Kicinski 2024-04-12  843  		goto exit;
1580cbcbfe770b Jakub Kicinski 2024-04-12  844  
1580cbcbfe770b Jakub Kicinski 2024-04-12  845  	if (!netif_running(ns->netdev) && val) {
1580cbcbfe770b Jakub Kicinski 2024-04-12  846  		ret = -ENETDOWN;
1580cbcbfe770b Jakub Kicinski 2024-04-12  847  	} else if (val) {
915c82f842f955 Jakub Kicinski 2025-01-07  848  		ns->page = page_pool_dev_alloc_pages(ns->rq[0]->page_pool);
1580cbcbfe770b Jakub Kicinski 2024-04-12  849  		if (!ns->page)
1580cbcbfe770b Jakub Kicinski 2024-04-12  850  			ret = -ENOMEM;
1580cbcbfe770b Jakub Kicinski 2024-04-12  851  	} else {
1580cbcbfe770b Jakub Kicinski 2024-04-12 @852  		page_pool_put_full_page(ns->page->pp, ns->page, false);
1580cbcbfe770b Jakub Kicinski 2024-04-12  853  		ns->page = NULL;
1580cbcbfe770b Jakub Kicinski 2024-04-12  854  	}
1580cbcbfe770b Jakub Kicinski 2024-04-12  855  
1580cbcbfe770b Jakub Kicinski 2024-04-12  856  exit:
b9b8301d369b4c Eric Dumazet   2024-12-16  857  	rtnl_unlock();
b9b8301d369b4c Eric Dumazet   2024-12-16  858  	return ret;
1580cbcbfe770b Jakub Kicinski 2024-04-12  859  }
1580cbcbfe770b Jakub Kicinski 2024-04-12  860  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
