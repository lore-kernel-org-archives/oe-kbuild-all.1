Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792934970;
	b=lMhO2a11l6fggkGNms2t6bw+k/xXZ7fDYxQgdKpggcYPNE5p/4pDHdxxvj+BadviqpUH
	 jsQougJl/HlLVLfRrLupEFROy4gOHOQjfLO8NoY90+IumORZgz8aVxprWtUJ2XzrlK3Un
	 EfHwYvJVGyvLzpsQ/oMOquNnZDCxZpNtq4IrrM0ewr9D/Y3LRtFj4F/EnQFyfeAg5phUm
	 rtb8WAu99qm1nbGaltuu5MLtjh+BazmJ0vDXR4mfucC0E1sJ70HjrQpQMlyvrQqhTR95a
	 iJU/OHljW4zlq5QsTRXH0HDd54xSI5zUXSejBAtAj2Z9BzY4yvU0SLZF58rV7hC8ikg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934970;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=L5GVlFL+9xMY0ML6nvWkTsG+4CzauUfzghZgAH/Xsng=;
	b=SZ078yyetTor2JAXhM33CmmydpNj2AXL7aVN60j+8p1pszrqsZ5uzLGoRetULDkvBkAs
	 KTxS5V8JNjNYj9uE+rw2+ri3tatwYQg6GO5AqQWPkIujbd1JiQhHhhjqL96vJRQHMShoG
	 jrarhEzPM/T4+ysGUICIL2uDMlDickwpwg0/gf64eeuOESamhqashjizvQf9TNFK6u1j0
	 9qZUAbfgV0T9DO3+9HHmW1mTdbir2RfF2i/lP6NvtCJsETVUw2AGqfjl9NqOU2j4sKzJP
	 D9fRAurdT2C3OBl7rnvhOEAg90IYO/HnlYRXFBZcDvNg4ucA2eQwAIN+KGU9ZbkaM8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=npVNviev;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99945606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 13:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99945606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=npVNviev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792934967; x=1824470967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sP9Tt0b9thw2mWocqihahfXQJVngONBmUg7yjGFBoeU=;
  b=npVNvievW1P4WdxlYOx54E/3MpmwjMA/rjQIKatleWkl0/5DEsDMcRB4
   gtv/fN6cyCAxdhoKLkKI8o+mePzGJMUMA3QSi8y0T4NkfCGwpQRCNWZ85
   r69him0BDPENfMUTK0ohJlGPx2bpWDq8dLVDGBTH14XFeTM27X8dAgthn
   w79kuY+kP+ssbumQ0DasqvC0vMdRCfHMszUKZ8ohXfbayPJ4ay+bzKLiC
   vzWnmNhjePCmFvvyuba7iiV5D8wGsVSS5yNQUXH+JM33wYmHeI0G4dmyS
   hZEO296rpaFBt3udQhBOArMjFjskhspgsw/CkHvlmdiuUwb/a/I3auTEQ
   w==;
X-CSE-ConnectionGUID: 1IYVJubUQ06t4mR17Frtrg==
X-CSE-MsgGUID: RCwRob9uRLqK9NMxf0C+xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1705889"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1705889"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 06:29:26 -0700
X-CSE-ConnectionGUID: WEEHViF/SDmGchnV3QexnA==
X-CSE-MsgGUID: 34vX9W79Tf6mGFPla265rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="3932911"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Oct 2026 06:29:20 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKyHk-00000000Uos-39iD;
	Sun, 25 Oct 2026 13:29:16 +0000
Date: Sun, 25 Oct 2026 21:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, chrisl@kernel.org, kasong@tencent.com,
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, yosry@kernel.org, david@kernel.org,
	muchun.song@linux.dev, shikemeng@huaweicloud.com,
	baoquan.he@linux.dev, baohua@kernel.org, youngjun.park@lge.com,
	chengming.zhou@linux.dev, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com,
	weixugc@google.com, riel@surriel.com, gourry@gourry.net,
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com,
	baolin.wang@linux.alibaba.com
Subject: Re: [PATCH v6 04/12] mm, swap: support physical swap as a vswap
 backend
Message-ID: <202610252143.VHe95EJ2-lkp@intel.com>
References: <20261021060323.553433-5-nphamcs@gmail.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021060323.553433-5-nphamcs@gmail.com>

Hi Nhat,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4dbe24720eb3811563cd56b35d87ddf3f9beed2a]

url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/mm-swap-add-virtual-swap-device-infrastructure/20261020-230312
base:   4dbe24720eb3811563cd56b35d87ddf3f9beed2a
patch link:    https://lore.kernel.org/r/20261021060323.553433-5-nphamcs%40gmail.com
patch subject: [PATCH v6 04/12] mm, swap: support physical swap as a vswap backend
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20261025/202610252143.VHe95EJ2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610252143.VHe95EJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610252143.VHe95EJ2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/workingset.c:19:
   mm/swap_table.h: In function 'swp_entry_to_swp_tb_vswap':
>> mm/swap_table.h:418:17: error: implicit declaration of function 'swp_offset'; did you mean 'pud_offset'? [-Wimplicit-function-declaration]
     418 |         return (swp_offset(entry) << SWP_TB_VSWAP_MARK_BITS) | SWP_TB_VSWAP_MARK;
         |                 ^~~~~~~~~~
         |                 pud_offset
   mm/swap_table.h: In function 'swp_tb_vswap_to_swp_entry':
>> mm/swap_table.h:427:16: error: implicit declaration of function 'swp_entry'; did you mean 'seq_dentry'? [-Wimplicit-function-declaration]
     427 |         return swp_entry(vswap_si->type, offset);
         |                ^~~~~~~~~
         |                seq_dentry
>> mm/swap_table.h:427:16: error: incompatible types when returning type 'int' but 'swp_entry_t' was expected
     427 |         return swp_entry(vswap_si->type, offset);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +418 mm/swap_table.h

   415	
   416	static inline unsigned long swp_entry_to_swp_tb_vswap(swp_entry_t entry)
   417	{
 > 418		return (swp_offset(entry) << SWP_TB_VSWAP_MARK_BITS) | SWP_TB_VSWAP_MARK;
   419	}
   420	
   421	static inline swp_entry_t swp_tb_vswap_to_swp_entry(unsigned long swp_tb)
   422	{
   423		unsigned long offset;
   424	
   425		VM_WARN_ON(!swp_tb_is_vswap(swp_tb));
   426		offset = (swp_tb & SWP_RMAP_ENTRY_MASK) >> SWP_TB_VSWAP_MARK_BITS;
 > 427		return swp_entry(vswap_si->type, offset);
   428	}
   429	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
