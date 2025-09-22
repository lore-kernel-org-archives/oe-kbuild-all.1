Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3BC7081C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 13:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758546237; cv=none; b=dBqCQP+pWRyImDiROdPjyScfBlVqN0fuxMdp7Qd8dpxSs/85SsFkaBeRV7zI+FwTIpOhHIh11Ne6WBkqfE/Ml6csGrkjQwNI4aLAfZyYTWBcDykC8n/JphceRwsdaCHrutZm+EUvzfxGYXRlg6uxvZY2aPVAVghHBdN5JxfamkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758546237; c=relaxed/simple;
	bh=6Fml/nYgrJrMomySy6PHh64zlAr/I2NW2hNz5UG3nqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=inw6Vc9vcDbfh57uBoZiiRL6HQREjv2lf0QT9mCgrweaJd+vHJXROVknoygThLUgmIjc9QkFZRZ3D00C1xcBuvB4EZvmlaY9wWiDX8vlB2pUBg3OW519XK5JQwKZXxLVCKuJ3dcHXV6SclW/l5bwQioVReBJqQDg3EudMY2KU+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1LpkJBX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1LpkJBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758546236; x=1790082236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Fml/nYgrJrMomySy6PHh64zlAr/I2NW2hNz5UG3nqY=;
  b=f1LpkJBXjZaQRZ6IXfQtsw+/ZCQMvqaLGKjB585F4tCpBe1yUC/UiJDV
   /xV/rYkCPbcUOLK4S0zGloOOnD83gSzMoQ0qOo8lkyBERrS67JJSVhRv+
   RhyYLhkx2MEQTKIbA99H3xmhjOPPhdnfSyS9TpW6M223Z7NTMrafls2yd
   vDcqXocCVXmdG+ee1XTRY7nc9iLsX0831gXeL08kZ7wR1UQvmT+7TlBu/
   mTmEe8GTzCgHaJvEB870LB2CZf4hecIwqsgCIvt5CF1+TJfX5bFj5eZ5D
   25WhCLZ7U1XdkmjwWT8dLYizMljaEmwrfZafVe0/Gj3PnIFtYGuXMFCOM
   A==;
X-CSE-ConnectionGUID: c2/OFIY5RYqFuJ1wblfClw==
X-CSE-MsgGUID: R4JoeX0zTkqoltfMCIysEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60746231"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60746231"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 06:02:03 -0700
X-CSE-ConnectionGUID: 8iOVzwS5S4ymO0z8x3n4HQ==
X-CSE-MsgGUID: xHk+tSXOQE6lzSJ9zfTjDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="176390355"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Sep 2025 06:02:00 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0gB4-0001gn-09;
	Mon, 22 Sep 2025 13:01:58 +0000
Date: Mon, 22 Sep 2025 21:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 146/146] mm/vmscan.c:186:38: error: macro
 "get_total_swap_pages" passed 1 arguments, but takes just 0
Message-ID: <202509222023.8sN0eIZl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhongkun,

FYI, the error/warning still remains.

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c73db7ebb024f59416db0cf136dc2d4b9dbc3695
commit: 5291f45f705b03858f36c68bbdfdbdf7857e651b [146/146] bytedance: mm: add /proc knob for proactive swappiness
config: arm64-randconfig-004-20250922 (https://download.01.org/0day-ci/archive/20250922/202509222023.8sN0eIZl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509222023.8sN0eIZl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509222023.8sN0eIZl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:186:38: error: macro "get_total_swap_pages" passed 1 arguments, but takes just 0
     186 | inline long get_total_swap_pages(void)
         |                                      ^
   In file included from mm/vmscan.c:20:
   include/linux/swap.h:565: note: macro "get_total_swap_pages" defined here
     565 | #define get_total_swap_pages()   0L
         | 
>> mm/vmscan.c:187:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     187 | {
         | ^
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:761:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     761 |  int err;
         |      ^~~


vim +/get_total_swap_pages +186 mm/vmscan.c

   185	
 > 186	inline long get_total_swap_pages(void)
 > 187	{
   188		return proactive_swappiness_enabled ? 0 : total_swap_pages;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
