Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE321DE8A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 21:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747431272; cv=none; b=gE84NImw9Gj+UIGgz7kFp7Kt4RPsbXS4163SUwoJnmNp+dD/zB6Qay7/DHRcZFB9y7TOj4RHPOYKbIumZZOvT3eWSpfq9Pc64MDvwrXfOfvC0L9+xl75DTQtwkjXlSCD3xbE8Ai9dC6+3HsFnU3RuzxDiXWf73IkCHeS1Ys56l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747431272; c=relaxed/simple;
	bh=HylAQzlqDGRJc3bSrfAajQXvwAzWuzRDZoiU2O767ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sFk5WKhDNF+Jr3vzgEokiW/aBrVEjmr7MSWvvaiWwAKjKSqTDrBQSNurOerQNigRF5Maks/8axm3MsbNFja9TsGzxIZWNKnjumpgaS2Nx8tP14yvSTIkR0HVtSwEkFzRreuXcvFpMMzhJGHBKrELHq6FCad1X/BIhrE3HDqVKeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/IrXR4o; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/IrXR4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747431270; x=1778967270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HylAQzlqDGRJc3bSrfAajQXvwAzWuzRDZoiU2O767ZY=;
  b=b/IrXR4oOwHHsy4Wrdo8/+/o2Vus2l5VnLnC61v2eY/yy8HgdxL14vCC
   2vHQaTuQMrmzuxWGr7pNNTOnp206cICR90/N8VMtQRa7RMwrZnYBg5Nmd
   FCPcc7YNmSVbdIdl0wj6oh10pNr6H3Jp1OQPXvllkdQaQpQQWDMv+ao7y
   af38oR10RoWv4ZVEWhG218iMADimgorXIxNTxXnLL+VH4dgeQaWi3JGBg
   JEqEm+bGuRlX0F/bMlLfW3O0ojx9Ah1WCq08MGE0a1LHBe3ldrhmQOpJV
   pWXDC1vAoU41H6pffKI7ZGs/H8g2N3KQ6jdtU1CWxrktadNE7ERQbvyNT
   Q==;
X-CSE-ConnectionGUID: J51VSZzeScibfMypWBhfRg==
X-CSE-MsgGUID: PVcaxUTYTr6Hme+sfKjl6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49483154"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="49483154"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 14:34:29 -0700
X-CSE-ConnectionGUID: ipiJiUkiQYmqJH4rCTL81g==
X-CSE-MsgGUID: f9M2lojaSaCwclDxbUUDFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="138543200"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 May 2025 14:34:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG2hG-000Jj9-0Z;
	Fri, 16 May 2025 21:34:26 +0000
Date: Sat, 17 May 2025 05:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next 31/33] lib/find_bit.c:291:50: error: call to
 undeclared function 'get_random_u32_below'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202505170554.k81GgR8h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next
head:   0577ced82818590ec7abe2f40119b340c1124a55
commit: aa01ca210954cd289ad46c5017ce820bfad61ce4 [31/33] bitmap: generalize node_random()
config: arm64-randconfig-002-20250517 (https://download.01.org/0day-ci/archive/20250517/202505170554.k81GgR8h-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170554.k81GgR8h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170554.k81GgR8h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/find_bit.c:291:50: error: call to undeclared function 'get_random_u32_below'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   return find_nth_bit(maskp->bits, MAX_NUMNODES, get_random_u32_below(w));
                                                                  ^
>> lib/find_bit.c:291:23: error: use of undeclared identifier 'maskp'
                   return find_nth_bit(maskp->bits, MAX_NUMNODES, get_random_u32_below(w));
                                       ^
>> lib/find_bit.c:291:36: error: use of undeclared identifier 'MAX_NUMNODES'
                   return find_nth_bit(maskp->bits, MAX_NUMNODES, get_random_u32_below(w));
                                                    ^
   3 errors generated.


vim +/get_random_u32_below +291 lib/find_bit.c

   280	
   281	unsigned long find_random_bit(const unsigned long *addr, unsigned long size)
   282	{
   283		int w = bitmap_weight(addr, size);
   284	
   285		switch (w) {
   286		case 0:
   287			return size;
   288		case 1:
   289			return find_first_bit(addr, size);
   290		default:
 > 291			return find_nth_bit(maskp->bits, MAX_NUMNODES, get_random_u32_below(w));
   292		}
   293	}
   294	EXPORT_SYMBOL(find_random_bit);
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
