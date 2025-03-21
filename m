Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAB41EE014
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 19:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742586963; cv=none; b=qFtZXUy8NF4i1HzovawgJn7UP3oh3F5yc5MXmMGpJX/+p/Bb0uSQ4erpOBsePkcbyYqn1VgVQYJJtNjtJEEXjUSNjZy/9erscb2oUDW8dmuTEgu1EHMKlpFheJ6Re/ilJxpndb8TqFWVVMIp2Cbv2tySYqroZPW+YqIOrP0bgec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742586963; c=relaxed/simple;
	bh=bC8TSVlRON3LqQUSt3OtaGYZWwx5+m0uikuyUnj7dzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AL0jdtSWEZnplr53zG541gI0wAZAdByiQvoYkii6CfX2RfV0YWKUAuZkfywkWG/4MzkomBImYny9FTRGVAYfesP38TTZbQR9LUtOM/oL7M9YRCKWe3qXeKTxtD01yGr8K4qvq1QDPFw9wpfUd+oeItQN0iwWMiRjzcVQ8xvVl5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdOr7Mjk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdOr7Mjk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742586963; x=1774122963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bC8TSVlRON3LqQUSt3OtaGYZWwx5+m0uikuyUnj7dzk=;
  b=kdOr7MjkLjj0Lj7Uvzait6JxIzthI/7VhCgFtmTOoKG90kEJijVyzW1V
   Qc5d36p+xXtfvV9345RJx2RooeG6xphHBshq/G0oqhTeVTb/1afW5WkiA
   xb2Zl5TDuZEJ/S3QM7Xv1c5oxl7bxLzjky/wQETEp/kp8+ngyamiLAehF
   vjgRr9dTXgCwesMlRmlzF1I5n6H2Ze4omTu9wDiUnr8x5bKm9DuD7ZIVF
   NAk75Zp2oOhbGNqweQNoMzgwEyv1+M2UPoQ8l4k3owB1FZkOaiwGM91cr
   N0egJ3ESHJrVfjH9oKZAEqyIAleo5rcQrpL4U5neLL/AYv2VHfA+U7/YL
   Q==;
X-CSE-ConnectionGUID: 7L2+dQ6wTn+HUc4/MIwAHg==
X-CSE-MsgGUID: haZi/t4UQ+SotAmaBSLt2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="47643511"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="47643511"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 12:56:02 -0700
X-CSE-ConnectionGUID: 4E7WU/thRviGP37eYq1EfQ==
X-CSE-MsgGUID: jp6IeV3UQcCAuLsLxBu5oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="124009463"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Mar 2025 12:56:01 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tviTB-0001eX-20;
	Fri, 21 Mar 2025 19:55:55 +0000
Date: Sat, 22 Mar 2025 03:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sumanth Korikkar <sumanthk@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: s390-linux-ld: Error: unable to disambiguate: -no-pie (did you mean
 --no-pie ?)
Message-ID: <202503220342.T3fElO9L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b3ee1e4609512dfff642a96b34d7e5dfcdc92d05
commit: 00cda11d3b2ea07295490b7d67942014f1cbc5c1 s390: Compile kernel with -fPIC and link with -no-pie
date:   11 months ago
config: s390-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20250322/202503220342.T3fElO9L-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220342.T3fElO9L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220342.T3fElO9L-lkp@intel.com/

All errors (new ones prefixed by >>):

>> s390-linux-ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
