Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A80F219E9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 07:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709970021; cv=none; b=A25ije4NPbvT3nj55jxTKsZVWrY+/H85rBG8wBuiArRARECRpaK7YWXt3t09Usj0VS12vpbv2+tD72MbXhlMQyWFtCh0Bf7r5kE0JMUIjvMWUrTocTcd1O3+pbriZLtyMnJT15RObcItIsmynm2+6sSz5VjB15HNQVm2Vu0lTfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709970021; c=relaxed/simple;
	bh=5JSCmClIbTcsDzM4Mz/TcvBwRtx1RcDvODhK8eGwXec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lz0Sm+mmBcqNhbhfTzGuggoZNadXrMqzg8Or5DvW+J5Y45DLV0zjn1sqir4d0CdNuJXRrYqO4RrE+gY/uh7IreSPFSZM29AQTpir3v7bBpTa6E5F0r4uVFVdsaorSSwuDPwzXETLv8zwiSVgGUm/WoEJusYlGFqNhm71tzz1Qcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqAIbM+Z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqAIbM+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709970019; x=1741506019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5JSCmClIbTcsDzM4Mz/TcvBwRtx1RcDvODhK8eGwXec=;
  b=GqAIbM+Z90tCJ1ttMOlgVQNdVIZ70Yv/g/NrQA9WoQdi4p5PKysNPr1l
   4XdZCL7N14r6GjJ9Ikcq7Gv8X9bPvJXJ4pRRiHIHc9HjPujO68bi5/X4Q
   r6XFoofmruR9OG+PwaSU/sjWBbIosFR4DgNTnSq6CU0bTJ8l7WLVUq/3E
   qANSyMIRKxG8xmC4PRuFwFdDsSuqZFr5FJTxhdqZMRQRY16OW3kvmOvYY
   vmPRt1ZmIeWQO/5TpsGYvlPAqaUgsz0K42OTrXjUJUIpRRhVeIwZKc10x
   zprij/7JvJr/Ae4J+eNXyJCvNrig5TDjRGEMaR71wDiNU08ZfBjX7Aui+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="22156011"
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="22156011"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 23:40:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="10743795"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Mar 2024 23:40:18 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rirJX-00077x-0i;
	Sat, 09 Mar 2024 07:40:15 +0000
Date: Sat, 9 Mar 2024 15:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: Mina Almasry <almasrymina@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next v1 1/2] net: mirror skb frag ref/unref
 helpers
Message-ID: <202403091513.maOcbeOS-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Mina-Almasry/net-mirror-skb-frag-ref-unref-helpers/20240307-080123
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240306235922.282781-2-almasrymina%40google.com
patch subject: [RFC PATCH net-next v1 1/2] net: mirror skb frag ref/unref helpers
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240309/202403091513.maOcbeOS-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403091513.maOcbeOS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403091513.maOcbeOS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/net_namespace.h:43,
                    from include/linux/inet.h:42,
                    from net/core/skbuff.c:43:
   include/linux/skbuff.h: In function 'napi_frag_ref':
   include/linux/skbuff.h:3490:18: error: 'page' undeclared (first use in this function)
    3490 |         get_page(page);
         |                  ^~~~
   include/linux/skbuff.h:3490:18: note: each undeclared identifier is reported only once for each function it appears in
   net/core/skbuff.c: At top level:
>> net/core/skbuff.c:914:13: warning: 'is_pp_page' defined but not used [-Wunused-function]
     914 | static bool is_pp_page(struct page *page)
         |             ^~~~~~~~~~


vim +/is_pp_page +914 net/core/skbuff.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  913  
8cfa2dee325f72 Liang Chen     2023-12-15 @914  static bool is_pp_page(struct page *page)
8cfa2dee325f72 Liang Chen     2023-12-15  915  {
8cfa2dee325f72 Liang Chen     2023-12-15  916  	return (page->pp_magic & ~0x3UL) == PP_SIGNATURE;
8cfa2dee325f72 Liang Chen     2023-12-15  917  }
8cfa2dee325f72 Liang Chen     2023-12-15  918  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
