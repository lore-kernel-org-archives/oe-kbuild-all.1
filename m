Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839542E84F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 07:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709968760; cv=none; b=q7zQ4bN0tIkw7k1OuYHmfeOoy+eXFsH+f/3vcub0hU1lx6a2jppryAyXrYOeltO7E1BIDxBFFCVOgXzBEC5KNVKj7hMC9Tx020YqipAdkNRYxepDDCf/jnM8JOjapezAZX7dyYY4KgPX0mjA4zFpWfmohXhfbhSIyCWfvR27H2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709968760; c=relaxed/simple;
	bh=7VIkUmuro8cpG0pjDsMjDJyGj+LT5vTgnRkMRBMAlu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjZHn4YvxDO4UvVAVIOK125S1zDPqpB/03gPv3xHJP9+gYfWAODNerGc3M0eGjcwHdtIgSK4Mfw5MHuCU4uG0JrZQfdxmC1Ez0X0pgk6oTk1l7KurvUuijGxOhAA0J3h4bnEJmFTeohLv4AaHVwtO1kUBqDmdoi7IGMhqbKpTVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GjsqhPts; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjsqhPts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709968757; x=1741504757;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7VIkUmuro8cpG0pjDsMjDJyGj+LT5vTgnRkMRBMAlu8=;
  b=GjsqhPtsFHMqvd1OZoeXysBMZ1e4jE/zstfN/8GChmYTMtWJinau12tf
   Z5WgPM+xPpkWuAwbPCs/KoARZfxLGhHdk6jtHttSlYKYKjsYDTiUWLUjU
   oDPfMoGWl0Cjh9GgqW1ucCbSlYlbLNkKzprhV40WUul/ewonfHkqUBK+G
   rxaFlwgoKiGMjPF0GVIsz6sgVhvIlDnI0zcS9bA5k3Y4TEhikvPjggk3U
   /5bAqv/cQz3tNNJXz93hi6P6gTT4RQjnAGtuBWPnSM7l53teoysfOhv2e
   /eCKzpqUngdnqspctox9lKpDm7Rl66lFNGIJQb3U/5TlT+hXo8l4XesUY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="16104853"
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="16104853"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 23:19:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="10771668"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Mar 2024 23:19:16 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riqzC-00076d-03;
	Sat, 09 Mar 2024 07:19:14 +0000
Date: Sat, 9 Mar 2024 15:18:49 +0800
From: kernel test robot <lkp@intel.com>
To: Mina Almasry <almasrymina@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next v1 1/2] net: mirror skb frag ref/unref
 helpers
Message-ID: <202403091505.OAdvKNFI-lkp@intel.com>
References: <20240306235922.282781-2-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306235922.282781-2-almasrymina@google.com>

Hi Mina,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Mina-Almasry/net-mirror-skb-frag-ref-unref-helpers/20240307-080123
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240306235922.282781-2-almasrymina%40google.com
patch subject: [RFC PATCH net-next v1 1/2] net: mirror skb frag ref/unref helpers
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240309/202403091505.OAdvKNFI-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403091505.OAdvKNFI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403091505.OAdvKNFI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/net_namespace.h:43,
                    from init/main.c:102:
   include/linux/skbuff.h: In function 'napi_frag_ref':
>> include/linux/skbuff.h:3490:18: error: 'page' undeclared (first use in this function)
    3490 |         get_page(page);
         |                  ^~~~
   include/linux/skbuff.h:3490:18: note: each undeclared identifier is reported only once for each function it appears in


vim +/page +3490 include/linux/skbuff.h

  3481	
  3482	static inline void napi_frag_ref(skb_frag_t *frag, bool recycle)
  3483	{
  3484	#ifdef CONFIG_PAGE_POOL
  3485		struct page *page = skb_frag_page(frag);
  3486	
  3487		if (recycle && napi_pp_get_page(page))
  3488			return;
  3489	#endif
> 3490		get_page(page);
  3491	}
  3492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
