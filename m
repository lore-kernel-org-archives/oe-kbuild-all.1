Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29FD283CB0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 16:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746723206; cv=none; b=nBT8H9kQSQDpK52KpFcQOHtLQ1268guK5+A1Uwy/GGzch/3FWcDt6d/ZqPeDj88kaP6l9uFaEPptF3D5Yh+M1lOK6L/e5J4u2GlCFa09Uf5soSt1w54Z8A9pZu5ySc4ci8TxhKXWEJ84bBteDXxQvIQjZdOJ8q7luqDLIc+ike0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746723206; c=relaxed/simple;
	bh=tJregpr1WNZpWhMP+Niyk94Aso3Q9fhcLTZEe1qsf1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ge6FrzmOOeNJ8A/Emv+FuUvd1/TRm0ji3toOyVasG3WU8PYS7uXBcqVzxkfMMhoKtuBTn0vPmcu96acxdaX1+gb0eRFpW0P//1XNyWjlIA81NoSQa9d5SlWpjDQJmZe+9z4dBNE+qss5e9l/eHd0fw4rnBH6/LecTb16ccTTCSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbXFv7vi; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbXFv7vi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746723204; x=1778259204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tJregpr1WNZpWhMP+Niyk94Aso3Q9fhcLTZEe1qsf1M=;
  b=EbXFv7vimJFkhkZfRvYJG31sqsMiTtKd3sezl6pQMnNgmedouL+F4ft0
   4zfrpStCrYHmaO1VkYomEi9XeyGGXlAZdfPZuSIGWfm3l8NGSYEFWsrtI
   eaStFaIGg4cAFIvE8cyGptR8HXypX5y6S9Jg3rEzoYi5xtoPGG2sZucUc
   7fCj9WuuPTjjRpcACN9RZQW4QcJmPPLErvTAzmH3LK9UFuQ3qrhjmKKTx
   fTcGsLxurR25IIdrWHOZmgEa2DtZeZIdiNDl7yv9JprTHYUleJUcdnWv1
   fsbsTeAyKS3Fm3n0hN0KONegK7k4rXdiFwEuDZGsGuuV5Zu2rt6XP857+
   A==;
X-CSE-ConnectionGUID: PSyc9rcZSaW0QSm3R7JWyQ==
X-CSE-MsgGUID: s03ymn+BTnqJzYLtkIzYWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48533774"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48533774"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 09:53:24 -0700
X-CSE-ConnectionGUID: fPdRNJU0RISBUkQqqtgzRg==
X-CSE-MsgGUID: rqnjCocZTvO7vnMwq2ZsAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136233334"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 May 2025 09:53:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD4Uq-000BBV-0C;
	Thu, 08 May 2025 16:53:20 +0000
Date: Fri, 9 May 2025 00:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 350/350] mm/vmscan.c:186:38: error: macro
 "get_total_swap_pages" passed 1 arguments, but takes just 0
Message-ID: <202505090022.NbxeCK4g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: 5291f45f705b03858f36c68bbdfdbdf7857e651b [350/350] bytedance: mm: add /proc knob for proactive swappiness
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250509/202505090022.NbxeCK4g-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090022.NbxeCK4g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090022.NbxeCK4g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:186:38: error: macro "get_total_swap_pages" passed 1 arguments, but takes just 0
     186 | inline long get_total_swap_pages(void)
         |                                      ^
   In file included from mm/vmscan.c:20:
   include/linux/swap.h:565:9: note: macro "get_total_swap_pages" defined here
     565 | #define get_total_swap_pages()                  0L
         |         ^~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:187:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     187 | {
         | ^
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:761:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     761 |         int err;
         |             ^~~


vim +/get_total_swap_pages +186 mm/vmscan.c

   185	
 > 186	inline long get_total_swap_pages(void)
   187	{
   188		return proactive_swappiness_enabled ? 0 : total_swap_pages;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
