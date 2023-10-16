Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2F01865C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BllgTjrJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697444974; x=1728980974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=823ixDYGQeAn3i5u9XjkUPll9SgGVhj968h1adMUlJI=;
  b=BllgTjrJz9lVO0Uxms7JXbAnyJiRojDZNkCYCn9X6daDEwM7ouMB4JzB
   v4CvbEVaeIAq1FhZHxx3sZxRR+JqoefBKgfNXIY/k7AXA9+p8/UJuzwVN
   iQi0yUpEhni2yjiOb/jj4EoPtUK+mv08vU4vDFxSN8Dh52PrfIbYnerUS
   vJIcIWx9hVxXY1zRLRXYI/PzqeUNuO2CoqXpjL6YyA4H3usPYi5PYUe46
   BlxxWwpVJHlgdLRrUtYXai1Z1paz5d05Bmegf+AH4EtbKKkbfWDMOkREu
   QE0ntky93I152JlwgSnywepujTgRGj4uGabkeOuXRLYN6IZDLD6f38RJn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364831773"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="364831773"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 01:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="3467482"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Oct 2023 01:28:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsIyd-0008EW-2O;
	Mon, 16 Oct 2023 08:29:27 +0000
Date: Mon, 16 Oct 2023 16:28:49 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [klassert-ipsec:master 7/7] checkpatch: WARNING: Possible repeated
 word: 'Google'
Message-ID: <202310161641.gU5ENIyA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec.git master
head:   de5724ca38fd5e442bae9c1fab31942b6544012d
commit: de5724ca38fd5e442bae9c1fab31942b6544012d [7/7] xfrm: fix a data-race in xfrm_lookup_with_ifid()
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310161641.gU5ENIyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161641.gU5ENIyA-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Google'
#53: 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/06/2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
