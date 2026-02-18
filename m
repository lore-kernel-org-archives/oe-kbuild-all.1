Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ECF2C0F79
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 01:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771376970; cv=none; b=QEN7Kb5i30YLKgSHmgVL9gqZbtCRi8tDlm9jhxpj3LeMKt8iefJySRtu+sqNEoDBflxsdULWBTLj6LNfUtzkVRR3RkPpN3H3HpF5jeOtwQu+CXBnjnqEtrMDpjt0i4VrNHDuQ/1cFci3Yy20DppqvQ/mW0ENlEX4TDuLMrE0ObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771376970; c=relaxed/simple;
	bh=dxnrOLmXwodYyw/OmgrQBoCQ1iiCAZFApbnguG7IgwY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uouCP5eVFw6FHbZyB3waJT8NWzZdJAfErZ+lLvppX64BAbg/qe2uuDK87CyNtQyp6HooKojuq4YRWxSWXloxucrwar9tIdZn0J2X5SI7vesJVQQugykp1yTKzA2i/9GE892gzmyJSUjoYZI5rFEQc7x8zV6460dNYN3xI1PYbUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMtDtboP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMtDtboP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771376968; x=1802912968;
  h=date:from:to:cc:subject:message-id;
  bh=dxnrOLmXwodYyw/OmgrQBoCQ1iiCAZFApbnguG7IgwY=;
  b=HMtDtboPXyEodp37wr4HVL0ydPMM4gmfBWl405a3XdcOpSk5tC3oRcps
   dEAxqagqBcEjiimVgfCrzJOafoRo74fmi6KerCn0zsBKOETWCwMyiGnPx
   JGulGEYtfNO6/9v7sQXG/2EUCWJGcYx+5gjYBP9amjy6dLGCwE4n+vNWM
   VRGyQhnneBIibrHH1/21ugeSABzt95YskObDFoRq82NXIrFXDsK29UJW6
   saEW6TLaT7bf0EQpUwqdIWXCuYSkhTwY26RQghCcka62NkgmJsBiDV+6t
   ewZ8ZBtyvqYw9JQozVpLdqPJK8v4aIBflhnF9Yi8wDFX3w6XYGsDYi+Pf
   g==;
X-CSE-ConnectionGUID: dp4hsQEdREuCZaALNgTgsw==
X-CSE-MsgGUID: 1JtT0g0kS/GnsZhhxGdU8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="60025885"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="60025885"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 17:09:28 -0800
X-CSE-ConnectionGUID: NeBbRjCmQNypsK8rs83IEw==
X-CSE-MsgGUID: 91FS5XgkTiaUEkdKB2juqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="213142697"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Feb 2026 17:09:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsW4B-000000011tk-27Rk;
	Wed, 18 Feb 2026 01:09:23 +0000
Date: Wed, 18 Feb 2026 09:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Eric Biggers <ebiggers@kernel.org>
Subject: fs/f2fs/data.c:2514: undefined reference to
 `fsverity_readahead'
Message-ID: <202602180838.pwICdY2r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2961f841b025fb234860bac26dfb7fa7cb0fb122
commit: 45dcb3ac9832650e5fdc2046cc7cdb97cebbb888 f2fs: consolidate fsverity_info lookup
date:   13 days ago
config: parisc-randconfig-r053-20260218 (https://download.01.org/0day-ci/archive/20260218/202602180838.pwICdY2r-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180838.pwICdY2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180838.pwICdY2r-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: fs/f2fs/data.o: in function `f2fs_readahead':
>> fs/f2fs/data.c:2514: undefined reference to `fsverity_readahead'
   hppa-linux-ld: fs/f2fs/data.o: in function `f2fs_read_data_folio':
   fs/f2fs/data.c:2494: undefined reference to `fsverity_readahead'


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
