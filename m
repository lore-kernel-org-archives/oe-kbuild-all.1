Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFC31A9B40
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 02:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747102858; cv=none; b=C44Ba8972zsFkPyW7SNCv32nP72GQNF5cHtnHqnTDEEbm8jAH/RfYFimXYaF8dR77w5zvFgGj+jAEwKZzJ6tdVvqPiBwaWq0aRaNd6IYTJXj9/ZrcCbr0eK1TcBJCA7OlsshTPNIPxJVIB9uAsjwHsrJc4UwYP8wqJCwL8+AC/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747102858; c=relaxed/simple;
	bh=GDX6+aavsfajHi9SFlO2Wg7N4aW9D2s1mWL3DajU974=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cNHtUb3g07v2js+RhTew1SKmm4useSWj1cMQt4C3BwjisHPkurVgm9hlYaKjH/g5B38AoUxjBloMGDNXzH+s0sYx9o6/GqAymHbbn08h8JjsXjcZNcXIE3UdZPDW5dguYxlXIlbytVDLw8dKJm+OYeXg2BuSqOdlbEIRZq+ZBc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSKuYdgu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSKuYdgu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747102856; x=1778638856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GDX6+aavsfajHi9SFlO2Wg7N4aW9D2s1mWL3DajU974=;
  b=HSKuYdguOdKu5lFyZ0EUvZUZA6sv3lhFl2g/o3h9LZsdFdaZTtZVQAZQ
   iwdrth/KXMwz7/0Iiy548ecgYG0ymxfX91JHnDts2ELB+t+5MjS8N2rWN
   oMM+WFJHLRkU68439Fg+wrYhZd4gUABHCE/yB9VC3z8iPcLZZgaQNFwjG
   clf7M9CvFMKQ1TuiiJf9bw4T704+yP28yJpcPRbfIgW1T/bAW9GkV0OCO
   oCmrTW+WB4gZ6zJjxRHzZjzeK10ciSzxydNX4efTe20p+gRKmXAv73lfR
   wjb3ghseY1nR6rMmERNCoYiGkLQqU3PgBCZtLrT3h8zj5t/YrbqknmCj3
   A==;
X-CSE-ConnectionGUID: wKXnq+M0QoaI9CqmRj3/IQ==
X-CSE-MsgGUID: n58NbnLUQZC6J2HG2S/RhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66334084"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="66334084"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 19:20:55 -0700
X-CSE-ConnectionGUID: g2PiVCxRRuaALts6JFfRZg==
X-CSE-MsgGUID: InqSlD4tQwaeJKcx2f26ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="137452281"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 May 2025 19:20:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEfGF-000FbL-2f;
	Tue, 13 May 2025 02:20:51 +0000
Date: Tue, 13 May 2025 10:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Belousov <igor.b@beldev.am>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [akpm-mm:mm-new 317/331] ERROR: modpost: "__vmalloc_node_noprof"
 [mm/zblock.ko] undefined!
Message-ID: <202505131051.bjv50kTL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   0f38780d8222f9f3fcd7f1b13cf2bd5a18661cda
commit: a5f92f389145e6c3ba9530d5349f2782377eda8f [317/331] mm/zblock: use vmalloc for page allocations
config: parisc-randconfig-r052-20250513 (https://download.01.org/0day-ci/archive/20250513/202505131051.bjv50kTL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131051.bjv50kTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131051.bjv50kTL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__vmalloc_node_noprof" [mm/zblock.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
