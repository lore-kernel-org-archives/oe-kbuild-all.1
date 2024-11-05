Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDA01C07C8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730804727; cv=none; b=IpRcoxt8uDw8JIxTrtQGgZPbVA8/l07gEhGM4GDECHybN6+27ujcy1h9IOHmW+6TXdMwLFgRhGyJMASURfVLxnmL6M/KjvTNE54FH7GQ6iD3HMFYYypueid4s524wDDr7DI/Q2lZ/F+3mSQFNG6CCMIwKUXrrC0uVKhDrjYXSmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730804727; c=relaxed/simple;
	bh=BdNerhcCcxAH/2KQ7UTRks97dQ3eZDDrkfLy7AoNqgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYFrONRxeFhSwsj6ktCLRNpPGdqRRbn1IrccoEqKQj1Kir0s1wnqQx3VXfrRyh4fOUhT8VAn6khswSkRLr3nAgTzJrjNdpgtgHuLM1v1DgEb5bqjwkGpR0GroWe7jdYPaBfBaP+NURZrxplfpEtsmLKXUVXEStOar5lF0ReR08o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIk8x1Gd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIk8x1Gd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730804725; x=1762340725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BdNerhcCcxAH/2KQ7UTRks97dQ3eZDDrkfLy7AoNqgE=;
  b=SIk8x1GdfQ9Bqj3+cSfc6Abjp+cA78UwgmY8I4Ycr3dW/Gujh3GPsYLg
   Be6wCgu5XrqbURfeI94pW8Fx4KyHSHUCTAixSALhIRaufFsjvl8nwRviq
   6Z1i0Gec+cZVEgbiDIDLh/qs6qU6pF0qsPp5dpgf19Tlr8WUkUQJlVhhU
   sjVAXDYH/VonKUedFuoMEkDJTRHwPHA4LxK2jZpoIqMdelHyDFUp+vL42
   kLZUjaWYGW7YNmDRq/AfEn/memuPRfg67vX+GV9D8+FU6BF8PQZkwb0fz
   12DqbLGBrsGJpAcjPGzMRm7HMqZdTDy0iFv+JA/POrbQrCQDWD+x01bsU
   g==;
X-CSE-ConnectionGUID: x6gzxapLQTWFEq+wSBeFOQ==
X-CSE-MsgGUID: 7m6ZhC/iQsGkLEu78lu0Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41139592"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="41139592"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 03:05:24 -0800
X-CSE-ConnectionGUID: MbweQmUqSB6PfYtnwGhUYA==
X-CSE-MsgGUID: paDoG8VyQBO/+ByoTUFGzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83866619"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2024 03:05:24 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8HNB-000lwx-1D;
	Tue, 05 Nov 2024 11:05:21 +0000
Date: Tue, 5 Nov 2024 19:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1225/1225]
 drivers/cpuidle/cpuidle-haltpoll.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202411051849.OUFvUDzd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marcelo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0c1156b86933300fc91692f839a7f6e0676f55d7
commit: 8104395ba98a81c8cb1ddd245482baca0d57d163 [1225/1225] add cpuidle-haltpoll driver
config: x86_64-buildonly-randconfig-002-20241028 (https://download.01.org/0day-ci/archive/20241105/202411051849.OUFvUDzd-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051849.OUFvUDzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051849.OUFvUDzd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpuidle/cpuidle-haltpoll.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
