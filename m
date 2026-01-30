Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681572638BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 02:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769740950; cv=none; b=Zhc97BVcVLACFuvMBg5vsrTaGS+4jBv1XP/ZUKgs3f25DrCIM819HX0R59sOtSQu1Rj25XmcYpYzfeph5wbnsDoUWwIo4b5aXnYjG+N+jhd12NXw9zsTYdw198MWMomiOjkFmVf1oLQPAvC6buK+GY+2bkatHw/OqIt23/2n0fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769740950; c=relaxed/simple;
	bh=ejGZOYA4RcvU1S7f2ZYEv0K8b+Crmn47/rGvbgfJNhI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tAagZmtr8ruiwoOdSUUQA9/SSOjmM6qg4pN2VfDEOzpd+1XimkxmlEwCIBaWiTnzFN/Gbkprd7uXJU2rORG6K0AYVa6MwhPBlq+cGzfLzazm9X49QZQpTuXosdRsFZ0HCYeB7Vb3P33IYZn3D/p9eqiHd7k38laj91hN3rpLtFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFPyQzta; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFPyQzta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769740948; x=1801276948;
  h=date:from:to:cc:subject:message-id;
  bh=ejGZOYA4RcvU1S7f2ZYEv0K8b+Crmn47/rGvbgfJNhI=;
  b=YFPyQztanFKytcOfc1jN4TQY9LoGBYiRUfWsOFWJ/IXUYq8hXi99G6Bi
   7GvVKserg70Xfk/ThdjFrMUVT2PRymSb+UecMKVn7QsZr8hI62Rhb+ICF
   tIjsBmW1l6JDJeCYbtCYLLm4CFs8y9Yj6C7HYvU3+c9BKDLnEWllTXVJs
   WuYv0ei25LmlCXEa7av6r5mo7prYj1xB9UKkZxb9ElR0iF2K5M1cxf6o0
   G/NtxZ5aepQ2N/bNMRSe3c1EXfknkgJEfsitVWSYlXc9+jNZNqJzktS5c
   bvjPaqmPWS7X1YVsxN212/q64VVtNsavFx8mybCtwmYR/brMAyniNFkMw
   g==;
X-CSE-ConnectionGUID: 2Bifi0YXQ1a4U4ODteDsFA==
X-CSE-MsgGUID: ETF8n95hQsirj0dHfqIMxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="93650234"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="93650234"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 18:42:27 -0800
X-CSE-ConnectionGUID: bUu3RbuIQ5yinTzAcN4Eig==
X-CSE-MsgGUID: 4DVeom0bQg2qrmZZhOpJyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="209093906"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jan 2026 18:42:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vleSl-00000000c6q-3BdT;
	Fri, 30 Jan 2026 02:42:23 +0000
Date: Fri, 30 Jan 2026 10:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>
Subject: {standard input}:9314: Error: pcrel offset for branch to
 .LS0042 too far (0x3e)
Message-ID: <202601301052.ylsFIe7S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4d310797262f0ddf129e76c2aad2b950adaf1fda
commit: 84654c7f47307692d47ea914d01287c8c54b3532 wait: avoid spurious calls to prepare_to_wait_event() in ___wait_event()
date:   11 months ago
config: csky-randconfig-r063-20260130 (https://download.01.org/0day-ci/archive/20260130/202601301052.ylsFIe7S-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301052.ylsFIe7S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301052.ylsFIe7S-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:9314: Error: pcrel offset for branch to .LS0042 too far (0x3e)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
