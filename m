Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2459C15491
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEi6+CXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697444972; x=1728980972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6TLU1BpVEfDTDOXctuu3tL9dEJ6pg/RFxNxDYftXn3g=;
  b=HEi6+CXQbsjcq6EMLRIXzE9LtLAGGQwvDVH9/GL+qCnW8BKMeKM0NP8L
   4Gyw9WlRlCeKzDrIdx++rBq+fr+d2u/LI0Jo3JHu97bhltMNC7XwxMmJn
   BcGjjvdy5lV9ZcJz/s0QaMwT3L8nxqsT9u2fl8+hlABljFzMMwA1XvvFx
   dRkKnZVZEwCUruTn3wIr08Mn1cZNN723FtmUsA/tBFJHTfxZnY+rc+pQC
   80NdhfvOKHnRXmYRdHzCKdhaTiBL+eGJr0j1K0Lqa7uWKyHMRG+tNlk52
   JXQ7GCSF27ZcPM3CxYFK4PR9wlzc05jR+7Z/Odlm3q6UmOsNmANnOppK/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364831771"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="364831771"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 01:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="3467484"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Oct 2023 01:28:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsIyd-0008ER-2G;
	Mon, 16 Oct 2023 08:29:27 +0000
Date: Mon, 16 Oct 2023 16:28:48 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [klassert-ipsec:master 2/7] checkpatch: WARNING: Possible repeated
 word: 'Google'
Message-ID: <202310161601.OSWnJUAK-lkp@intel.com>
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
commit: f7c4e3e5d4f6609b4725a97451948ca2e425379a [2/7] xfrm: interface: use DEV_STATS_INC()
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310161601.OSWnJUAK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161601.OSWnJUAK-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Google'
#83: 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/26/2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
