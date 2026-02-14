Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495F71E47C5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 11:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771067427; cv=none; b=Q9i61kYDpcrkq9/QsjRfflh6XFo1e2bXmnkjjBxEIQRYFzDWLybRSIiObAD8JDlLIrohhVyKVbt1GdbArUodkifxoFM525NKXf2CIsYAiMmCH6MeLQYQqplhPhW1g+sFO5ZmbEzRxFkxZcW6LDVI/vRZuqenB2GB4B0nvgXzu6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771067427; c=relaxed/simple;
	bh=uWTtdPH0MVPTEEzLpT8lfCdIsw6WMfGYETL5fcXLv4s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=epDn2D9ougXg4Q7iVERz5u8cOEilWpEfGG3Pnth639ryxZF7rYDWXCSVUETnVxe+ekqVBNcpIYeJdLU+yyKOXrRzwUcrax4QVoi6mU45CTRq9iF01kVwaobt+eNFBDN5B0OFm0toucd3mq1HUKtq8VWqhbaA+60LaKv8KR0zs3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hb66klV5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hb66klV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771067425; x=1802603425;
  h=date:from:to:cc:subject:message-id;
  bh=uWTtdPH0MVPTEEzLpT8lfCdIsw6WMfGYETL5fcXLv4s=;
  b=hb66klV5Wuq+iezzHmdDKEJZ8xBqq3fOrv8TZTJ5NU9qhBknTOl9neXA
   fJ6ZzMji5ISZO721t2g3sm34hQ6ctWklfLtxw76pMbbcOoauC3/DFpWEa
   nGPzOa8ATVuhT89UV2DzSykGtfBMCLQ0RMB/2pAlakFQIHNxJzSAaaY89
   zoCaz6x9MFcyqo/Ifejz2el9D+3dn7tCF9VIvfMikEoIe1eZSWCtkC/eG
   EcqajaPqy1Ykc9nACZLpUyOyVyPV+2qu/wWzMhgdYVpEgUriX6civEQWz
   DdZwxlFgeiojn0/mHKlnO4L2vKtlBuSVb8cR2qx74cBy+Vl/HcCQD2/8a
   g==;
X-CSE-ConnectionGUID: Nf1+Rhf0R5mTxnRH6iyDsA==
X-CSE-MsgGUID: wXlStvtuSCmiJA0N/ApxTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="74832781"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="74832781"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 03:10:25 -0800
X-CSE-ConnectionGUID: L9i6ZuZaT4Gu0b3HnvpuUQ==
X-CSE-MsgGUID: EZDpxZOHQ3OtmJbM8pG9kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="213257016"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Feb 2026 03:10:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrDXY-00000000wTG-3ScJ;
	Sat, 14 Feb 2026 11:10:20 +0000
Date: Sat, 14 Feb 2026 19:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Eric Biggers <ebiggers@kernel.org>
Subject: fs/f2fs/data.c:2514:undefined reference to
 `fsverity_readahead'
Message-ID: <202602141934.xN4mcU2f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   770aaedb461a055f79b971d538678942b6607894
commit: 45dcb3ac9832650e5fdc2046cc7cdb97cebbb888 f2fs: consolidate fsverity_info lookup
date:   10 days ago
config: parisc-randconfig-r113-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141934.xN4mcU2f-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141934.xN4mcU2f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141934.xN4mcU2f-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: fs/f2fs/data.o: in function `f2fs_readahead':
>> fs/f2fs/data.c:2514:(.text+0xe334): undefined reference to `fsverity_readahead'
   hppa-linux-ld: fs/f2fs/data.o: in function `f2fs_read_data_folio':
   fs/f2fs/data.c:2494:(.text+0xe494): undefined reference to `fsverity_readahead'


vim +2514 fs/f2fs/data.c

  2497	
  2498	static void f2fs_readahead(struct readahead_control *rac)
  2499	{
  2500		struct inode *inode = rac->mapping->host;
  2501		struct fsverity_info *vi = NULL;
  2502	
  2503		trace_f2fs_readpages(inode, readahead_index(rac), readahead_count(rac));
  2504	
  2505		if (!f2fs_is_compress_backend_ready(inode))
  2506			return;
  2507	
  2508		/* If the file has inline data, skip readahead */
  2509		if (f2fs_has_inline_data(inode))
  2510			return;
  2511	
  2512		vi = f2fs_need_verity(inode, readahead_index(rac));
  2513		if (vi)
> 2514			fsverity_readahead(vi, readahead_index(rac),
  2515					   readahead_count(rac));
  2516		f2fs_mpage_readpages(inode, vi, rac, NULL);
  2517	}
  2518	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
