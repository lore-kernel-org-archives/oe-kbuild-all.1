Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094DCD51F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLv0ZANz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697185131; x=1728721131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gcXT8xTY155ZTROh/jMviMj5H1v/mWVH3DTa7zU1XMo=;
  b=WLv0ZANzJ4RrkwJjpWl3SjYOU0hEOsQwBhZ6MSGSRWuxJwwmE7IxbhP8
   d/g13sbqaJWvkTCYtbaWTD1jyUxRd8DsY6pRfzkjcKpGsLUJIqGn1eNfB
   Rkrwm/93dDrOYKJclWOeYlhZEr0JPeVlvW1J1JblqUv1isFSghnduXlfA
   RDABfPYR9pRqthF8ohL7h3FSyC90W6bQwJ+GYch5D2zdksD1CKYHsJ7S5
   qrIaFyEeYkxTD0x5XPGuZMUss/okRbJggXNE0+/1c/F/JA52cYKQKMQHD
   28K1O+YtuMyfWEFMqggEI7pRd68w5umqleaYxkzH443pJQyzSJSFQFPFi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="449320966"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="449320966"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 01:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928331014"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="928331014"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2023 01:18:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrDNf-0004Vl-2n;
	Fri, 13 Oct 2023 08:18:47 +0000
Date: Fri, 13 Oct 2023 16:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [klassert-ipsec:master 3/6] checkpatch: WARNING: Possible repeated
 word: 'Google'
Message-ID: <202310131623.a17FGS36-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec.git master
head:   513f61e2193350c7a345da98559b80f61aec4fa6
commit: 3e4bc23926b83c3c67e5f61ae8571602754131a6 [3/6] xfrm: fix a data-race in xfrm_gen_index()
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310131623.a17FGS36-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131623.a17FGS36-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Google'
#51: 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/26/2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
