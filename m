Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C304CB47
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 03:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730779086; cv=none; b=U2/gVvfq02ZwQadtvXtpzRBjLjsX4QO/QfK7RsR8ZNexZm5lRF50CIbUqkSnrx+167zb3qJGU9kTjCJAS7i1ZYJS1s+pJ5uTEOaXW7jcugKOb56FiOnmBp+KK4pTcM7U31dNgYy6x9luNCTEhFTjZZClDaVviOiPF8AKrJUlUAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730779086; c=relaxed/simple;
	bh=FKnIlZTTot8OujcqxxcQuhGyeuWPW0JOel+0+cya0D8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=liBjfAQ75UoCYFyFEeNwjKRdBvlfzBMJxJplX48GbNEOMoNgB2FcHQH6Q3lK7b4NVWgQqvBVZBgs2ftYsmKOwPw4c9uYXy4wNZ3910u6mQ7DY3EVi2t4iIvLl1Sb2IAL4Dprqne+ozH88JkyABpBKsRbKYNT92DixHrWJO4tM1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHfzkJCT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHfzkJCT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730779084; x=1762315084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FKnIlZTTot8OujcqxxcQuhGyeuWPW0JOel+0+cya0D8=;
  b=FHfzkJCT3M4ybnXOvHHfKUJIHsZU1X/jgG/gpipjpmHQapaleHRzN/dP
   1/V6mF0AOvzLkzTLFhovX/DOgl8yqhfMUm3O2EMqFlf8aU704iOB1LEEV
   oW7r7BCtbweVNzH9hM5EISbLn/Wmt0Wql731a4fYg+RudEUZyjuuzH0Nc
   DTHfy7xIRqQVB35aiPkGJQQuNqhm6SPKhztoYzHP9GwN6JUY0lt9R4drO
   0x2sFInzBJWVlHuBqIFXWauZzFfB2Vjw32Nt5eBO2KpuWPTOPgW8pxrWb
   wurB7aAF9sxFm2vGrA8uPi2/1nyc6QpNzC9Zi9WGJAhMJqM4Cryx5JIxC
   Q==;
X-CSE-ConnectionGUID: ccIcbQ0DSIyIe3dqIOCb/g==
X-CSE-MsgGUID: sQf6KkrYRZC9ZWo7Xltx1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29933167"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="29933167"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 19:58:03 -0800
X-CSE-ConnectionGUID: i73vlcMZS1SAE2n+Q0zhdA==
X-CSE-MsgGUID: En9Q8pToSWeUXMfFRu5arQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88614964"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Nov 2024 19:58:03 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Ahc-000laV-0T;
	Tue, 05 Nov 2024 03:58:00 +0000
Date: Tue, 5 Nov 2024 11:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1219/1219] drivers/crypto/qcom-rng.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202411051443.zy2SurFf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d426553bb97ebfcb4ea34e8fd63477a44316644
commit: c5f5aeef9b55b362ad5a0e04e4b41cd63b208842 [1219/1219] Merge git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux
config: x86_64-buildonly-randconfig-001-20241025 (https://download.01.org/0day-ci/archive/20241105/202411051443.zy2SurFf-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051443.zy2SurFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051443.zy2SurFf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/qcom-rng.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
