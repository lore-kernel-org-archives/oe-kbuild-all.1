Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD052ED873
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 20:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767990766; cv=none; b=AGBzD/9s273oxhhpm/UtFK/zVysECB5LwlsXzKt9mwWsE16G5Jioc8MxQ0JwOU5kUuqyA10Zlawmsc/eT8w7KloyyoDABML1hoAUH8BGdPQGqnc4bH+TgOP9Q/UfzfLo6nSzhtct2ssp/xPmRq/fElx/2yN3ILD35qz37b+0ESI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767990766; c=relaxed/simple;
	bh=vfTuY7p0m0K6CNSUC1cZoGmv3GGrNFOdYUFAV8eZnYo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cqVPw0bIvU0mz4Vk4cvRxIZWTyzDUb1NrNVF6scevu8e4kfVXWBTwN5GnBWEDE3wwtsoybt2xhKDMkPvSTUoybbWq4iePbXJQo3gpo/mChD6MSWR2pI+asiD3LvMv7MxDTEydZmhsWZwnbyqq54+/2rPPJVi0liJ6L4Yai6vW1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8zR1A4L; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8zR1A4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767990766; x=1799526766;
  h=date:from:to:cc:subject:message-id;
  bh=vfTuY7p0m0K6CNSUC1cZoGmv3GGrNFOdYUFAV8eZnYo=;
  b=I8zR1A4LLag1BswObNvGb1Fwxjtw677G2hHx8/Tz4DvvWLxJdDwVfyI9
   qFUiGwQImwVfIBIHDFg38f1splyJparU6DzBbECaXdv1lufmqK4a6xV3b
   lByadAoV1hNEUCprdPC7A09RCia5zk9ejCXPiCD7qwuBibxsHRdMDvNYw
   XCLUM8W4GwESjv7CP40K9JgADjfEA4z1LDB81W0Z2XQhK/AjPI5aJ9f+D
   w1vzKMw0rzfwQhUs1R9bO5w0P528zUWzZFHuaMu5bxolCpT81rPj1Xrev
   KmYE9AJjGHjC0vLrhyjNRqkuzhGMfFg2MR0335xxS0EldXB9s9HHGSoNP
   A==;
X-CSE-ConnectionGUID: Q5HLn9ZnTe+tluGa1FtOaQ==
X-CSE-MsgGUID: j8b0J0PlR1SYGDj4DZwV5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="86794154"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="86794154"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 12:32:44 -0800
X-CSE-ConnectionGUID: CPLooFm5RNG9KJApWhnMIQ==
X-CSE-MsgGUID: OANIqPalSd+ziDQGckD+DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="241059785"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2026 12:32:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veJ9z-000000007hd-2odQ;
	Fri, 09 Jan 2026 20:32:39 +0000
Date: Sat, 10 Jan 2026 04:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: {standard input}:20429: Error: operand out of range
 (0xffffffff not between 0 and 0x3f) `l.slli r17,r17,-1'
Message-ID: <202601100448.3PrAP6KQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   372800cb95a35a7c40a07e2e0f7de4ce6786d230
commit: a211c6550efcc87aa2459ca347bda10721c7a46a mm: page_alloc: defrag_mode kswapd/kcompactd watermarks
date:   10 months ago
config: openrisc-randconfig-r063-20260109 (https://download.01.org/0day-ci/archive/20260110/202601100448.3PrAP6KQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100448.3PrAP6KQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601100448.3PrAP6KQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:20429: Error: operand out of range (0xffffffff not between 0 and 0x3f) `l.slli r17,r17,-1'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
