Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC3B287276
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 08:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755851834; cv=none; b=o4omgIkZI6KaTBQMBeakRYfq3Y2sMU8woof+0mBPlh1oWLP7ES3i5B9+ff2omGVFGM6tGLQA+Zn8Lx1A2v/9trsUdRODjrAKQ+yQD3r9Xs4QiXFF1Dy5uLYyG9An6NAzvCbcXYebzgDQ3e1GgsUBQOhS+odbR/FWLnKtKsCACOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755851834; c=relaxed/simple;
	bh=eVTZyiZvgqa682S9nJU3vD53mTkSTA+NUYHYOx/YAOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tt83rSOEwRfQh4sKEHVFelA9ln8w1Kyz89/NVWxntArnraWif1cXA2cDw6E/7V0Z/X0NRmN92lTY75tGE7EWD5WALzP00pTbBcwocCqUZCf5CF32nHbTPuCMybF4qdnIu/+8r233J4dxsQWcfbF1Uez9Snl9jtMmlm0hprC/Mkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxdVYRkB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxdVYRkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755851833; x=1787387833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eVTZyiZvgqa682S9nJU3vD53mTkSTA+NUYHYOx/YAOg=;
  b=JxdVYRkB5NWuzr2s98oOjwCFDna28lM6woDmBmXWoZUwA3jaxjepgr90
   QqSG+bqRE3x9DvvNRokghNL6uNwvxPYR51WBctHuAcPjydJXJDKR5/UlO
   ZNZzzXh0t7klVMi4gCPYLwHDX/8u6wM1YyU9jhmpLAEM7d0oQipxdsvmF
   b4wqhBdi/xVF6y7y8dYnE1XuRtCmnZiKW1CNPxU2VXyJrWwbRaVVp+Fc8
   EzVh0glosm+u2i4y9Ebjp/IfT6Otvx1iTrjR7BkHDiDHZ4XrfYP0tvA6j
   J2/Fkug3L3ZvIhIdGvx2bXSY1Q5OCFm6EouWI2rVGC9Ja6sjbEgktnv1X
   g==;
X-CSE-ConnectionGUID: r4ZUGZf7Q7OGL1JuI4ezkA==
X-CSE-MsgGUID: wPgzQ5IZRiGg8fORIme8Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58080537"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58080537"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 01:37:12 -0700
X-CSE-ConnectionGUID: KTQIfo8ZQ6iQkd9L1JMxkQ==
X-CSE-MsgGUID: ryAUjIpNQ5KD8eRUby/dLg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Aug 2025 01:37:11 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upNGg-000L4V-0s;
	Fri, 22 Aug 2025 08:37:06 +0000
Date: Fri, 22 Aug 2025 16:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: {standard input}:27156: Error: operands mismatch -- statement `sub.l
 -228(%fp),-184(%fp)' ignored
Message-ID: <202508221639.OF7OHpcE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3957a5720157264dcc41415fbec7c51c4000fc2d
commit: aced132599b3c8884c050218d4c48eef203678f6 bpf: Add range tracking for BPF_NEG
date:   8 weeks ago
config: m68k-randconfig-r133-20250822 (https://download.01.org/0day-ci/archive/20250822/202508221639.OF7OHpcE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250822/202508221639.OF7OHpcE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508221639.OF7OHpcE-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:27156: Error: operands mismatch -- statement `sub.l -228(%fp),-184(%fp)' ignored

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
