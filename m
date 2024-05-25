Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1881A2C33
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 02:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716604823; cv=none; b=RZ7XcQDeiU+7r3i+eZG+erWh57oxIXlhuBeHVuOBIQPsi8X/aC7dO+mgAl4BrczF3robVhwCd6oBWbbltLRD831+906Lp6ZZuPo3AR3/vHymQH9POo9CJbap5935hDVxYMjS/1IB18xs0Amcx+6pBq8FACXdqZgDtayC0o0r5tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716604823; c=relaxed/simple;
	bh=Mph/gjqHOJx7xc+d8ws7btutzo4hJuBJLgOAPeGJWL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ROZiBTR72CWwLCKnSUu/XAvUIxca83xwjKXajunLa5rpnwLOwz77u2WbkYAXXfB+YC13u0toFRvSUMOtC0OgsbTkdSg+DuZ20m7qLGQAR5hHajk2oP8hgUPACgyWluMTjBk7HGStrd3n5DplKlVCp6i+LQeCwk930cLGSLS5GWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7xJF9Md; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7xJF9Md"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716604822; x=1748140822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mph/gjqHOJx7xc+d8ws7btutzo4hJuBJLgOAPeGJWL0=;
  b=Y7xJF9Md7mOtmGz3K19GERLggaRxwQf+NfQOHeaylgg0ejX40XbwOV4c
   iuxtM+vMIw8BwvCzzDssm2ao35Rn+HFXLel7mVdp6PvvpGoicr5GCmiC9
   2NM7ruMSbQXU5VKPNjTvZ7MZ5EooRlp4sy/nAIbN5v6Ea75f0iahD/zM0
   uhvvsfVoP+1L67jkNENEPTnaVTLr4Je+XQirVWlOao4SfCkdlw78R9N/L
   w8NAyu40Rm8a3KuJ7R/mTxlAXauHrL7GNM6HFpdWxHUqy0vY7Nl8qsahP
   lix+nov1YaD6k46726YClElOK+Vx1w1gShUDvRb6A/R5yn/qwRqYU8lAG
   g==;
X-CSE-ConnectionGUID: x111mYy3TiOVhA9/RTvM+g==
X-CSE-MsgGUID: w//qxfUkQlqvP41wYcOuYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="16828299"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="16828299"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 19:40:21 -0700
X-CSE-ConnectionGUID: tc8xtJm8T3a2iSgIv7jFvQ==
X-CSE-MsgGUID: y8O6GirKSGeTjk4SJSRWOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="34704354"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 May 2024 19:40:20 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAhKT-0006Nz-1o;
	Sat, 25 May 2024 02:40:17 +0000
Date: Sat, 25 May 2024 10:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ian Rogers <irogers@google.com>
Subject: [akpm-mm:mm-nonmm-unstable 40/43] drivers/md/bcache/movinggc.o:
 warning: objtool: unexpected relocation symbol type in
 .rela.discard.reachable
Message-ID: <202405251005.deDEZFhy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   0477ed6ffdfddf1ad08413a0aa7d64cf8956fcab
commit: 31973f4f818a8ef234c834ac8263c3c8a6a2315e [40/43] bcache: remove heap-related macros and switch to generic min_heap
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240525/202405251005.deDEZFhy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405251005.deDEZFhy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405251005.deDEZFhy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/bcache/movinggc.o: warning: objtool: unexpected relocation symbol type in .rela.discard.reachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
