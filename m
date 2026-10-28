Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175025;
	b=s3qat230R7fn4hQgXGFBCLq/WFTHb1VRe5xPrmzV08J+CBpz4tKJIBqOLvk2l7qJvqNX
	 No9kAFdMn6VTTQIxtVQ7/LRSI0L275Kbs6s6sogX2SHQWU8/1Tr7dcE3GHCN6jgGqJ6+B
	 f/UrSIqB+fBqOERnkyiXF9J78nVxaGrYXz0L8fqM2bgmy/B0cJpRRJQkVDCEQAbPWtN3H
	 Ju2/jXq0GuYbUp8deEePI/Dh7N272K6whkyiHOcD/fx8DaAutsfXLMAIHmGBGUG5Qz9+N
	 lQU3qa3E82Y2UiT7qwfspBDnXZzi21VoOEgqOByuQWYb3k7QjlUD76S1X7c2GqEDytw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175025;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Hh9Wy8tH9gzZyVJFsxaKrroJrhTewzeV20OzhsXne4w=;
	b=feGJrHQZs4q79Zf5awMSZuJqdT34fi25ZpSbucr3AIVcj5p2S2Lh3iWnipMyBepLZYDl
	 o3bOdIRfc0mEaC/d5KYPtUUkkHjrkL+tM2pd4EEAR9CuOGOBWHMWWukzzPzobeoDcPEsC
	 kOzup4udT2w0vF+cz+tyOZYQorht0uV/5W3bcjV7S9+czlCmvkxu0JIHpiCCkCa1hv5HL
	 qOMDsC5mprHJgfOHFiyQW35o3LwTI988+aip9nsNnTXg4PeNp4J3vsWNzm2zZ5lv5efvG
	 i6qKoj9MyHKwXdcrYCQdYOBsHT14vlIRdXtOXYSAN55Q3jmTGXqcb2wogcsn5ghf2LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CUMEGqhf;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44742606A31D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 08:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44742606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CUMEGqhf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793175024; x=1824711024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CmkPjiWVepHL9kFgDxbSfsyXmjZF0FkTAus6SfUIF+A=;
  b=CUMEGqhfN3KK5yqC9BBejFYt4KYyVIla6ddPgLoccOX4/Ei2zPs8PPD+
   rrgeXdcKH5Jel907n9nRaFUT87thhg5VAwUHoiA6s/qJzrte7d7dPKKnB
   mkvD43MOCIn8cH2+CnX7B9Djr1lakHZht2F60QVjzVyuH3GYRn0yPlQlK
   dPwvOM2FECF5yOQ7wI/JSVyaU+sioo2C+d8njFG6ci07oT5saZcTFrvNJ
   rUwfjP0GtDZrN3Iz1tnSWGH7Wlu014IW6rfGRf/RthTaFgWwudYnlgO3l
   /ZDwtfPSk9czLttJccx0cg8VsHC5DDh0ftpTpT7FucX2RyLYak0q6TywA
   Q==;
X-CSE-ConnectionGUID: ncwmJJL1QgqmV6yjKj4syw==
X-CSE-MsgGUID: 7RYsjXi0S7m1ZcJqm8RUGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1770616"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1770616"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 01:10:22 -0700
X-CSE-ConnectionGUID: IjFGHawIQFCCNwWZd8te5w==
X-CSE-MsgGUID: wPg+660ES2WXtLNAsYWuBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4717188"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Oct 2026 01:10:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLyjZ-00000000YTo-1Q2G;
	Wed, 28 Oct 2026 08:10:09 +0000
Date: Wed, 28 Oct 2026 16:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: Salvatore Dipietro <dipiets@amazon.it>, akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, ryan.roberts@arm.com,
	abuehaze@amazon.com, alisaidi@amazon.com, blakgeof@amazon.com,
	dipietro.salvatore@gmail.com, rvvandan@amazon.com,
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
	linkinjeon@kernel.org, sj1557.seo@samsung.com, yuezhang.mo@sony.com,
	miklos@szeredi.hu, agruenba@redhat.com, djwong@kernel.org,
	hyc.lee@gmail.com, almaz.alexandrovich@paragon-software.com,
	cem@kernel.org, dlemoal@kernel.org, naohiro.aota@wdc.com,
	jth@kernel.org, willy@infradead.org, david@kernel.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com
Subject: Re: [PATCH 1/2] mm: add infrastructure for per-dirty-page accounting
Message-ID: <202610281551.QJBalzYT-lkp@intel.com>
References: <20261027112702.3747009-2-dipiets@amazon.it>
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
In-Reply-To: <20261027112702.3747009-2-dipiets@amazon.it>

Hi Salvatore,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907]

url:    https://github.com/intel-lab-lkp/linux/commits/Salvatore-Dipietro/mm-add-infrastructure-for-per-dirty-page-accounting/20261027-112701
base:   24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
patch link:    https://lore.kernel.org/r/20261027112702.3747009-2-dipiets%40amazon.it
patch subject: [PATCH 1/2] mm: add infrastructure for per-dirty-page accounting
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20261028/202610281551.QJBalzYT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281551.QJBalzYT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281551.QJBalzYT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/page-writeback.c:2739 function parameter 'accounted' not described in '__filemap_dirty_folio'
>> Warning: mm/page-writeback.c:2739 expecting prototype for filemap_dirty_folio(). Prototype was for __filemap_dirty_folio() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
