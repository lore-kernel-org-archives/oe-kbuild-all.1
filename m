Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0DB187876
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 17:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231737; cv=none; b=CJDJBsUIN3b7Kp6l54vhie0tcnD4/vMYhh0O0oyAUWDRTIKLSphdgJQ6VxflKChQdy6V1VVruCDwOPRRDDc6V8vVvAdqP3qB4r6psQaiUzZmWu750IACQNnWyTbl1V4Pz6zLHib7VcOpQeYpttXrtDu362j9LViTHja7uoBBkO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231737; c=relaxed/simple;
	bh=MzzuSONMAd0CExtC48D5R9kJc/NUMiqJ6yGSKXSE1IU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i++NP5wjbPQGG4Fs6aRBulwHbpiOJq5EIhSeeR63WdlPanA6lpLbPJlBlF5Vw6yJP7/loJ2oPfJBRsAPNLG+hYVznPKL349VbpH3Yw2pXq+1GwdW9yAfJYjqC+yXVUPzLY1mbmKMG5e7PoAAloQA8jzZ+gFVo3JgCzBzEN+Myuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxZ3C+IX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxZ3C+IX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742231735; x=1773767735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MzzuSONMAd0CExtC48D5R9kJc/NUMiqJ6yGSKXSE1IU=;
  b=lxZ3C+IXsnUIIuNPJ0zGuwaHljMk2NFu8b9C25ah6T/R4BkMsGVL0KFT
   U9V7OZsBqfNpNNyVp2Lea1dOhrUj+e80T/MsuNKbacSH8NV4jNVIdrjHi
   E3O7jxJPYRMDUNGZr9wFMEcTBIqLPIA4gVbZdGgd7q9Qd7WuwiJoEE3ig
   GnQZWJ9+kC88cZEYM1WpohpJGks0tBH5IF+bkLPZTxMfFASu/AmYKh/gC
   eo9XWJ+NTmgcPKIX/IGbLAWHbJpR/ECNp+ZhRn4IaDlghx4T+qPRL1gHc
   c2uSL8iq8rOEPGEXv6fzT00XpCkcipSS+aC/1gdHJpMkAtv6a7R9Jvfa0
   Q==;
X-CSE-ConnectionGUID: 9RAlxOm8RTWw5PI6u5GeKA==
X-CSE-MsgGUID: v86BhC0CSI6PTaOOVzU0LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54335100"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="54335100"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 10:15:35 -0700
X-CSE-ConnectionGUID: LI5pvT07TaWztxIa8OwNdQ==
X-CSE-MsgGUID: aSne9piRTdm+gq8TfqSIKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="121955450"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2025 10:15:35 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuE3o-000Cyd-0d;
	Mon, 17 Mar 2025 17:15:32 +0000
Date: Tue, 18 Mar 2025 01:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/plat2faux_dev 3/10] random.c:undefined reference to
 `smccc_trng_available'
Message-ID: <202503180105.y2lGKtjw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/plat2faux_dev
head:   311808e89f691de1648385823ca10d4bcdd72ea0
commit: 956d963234312b4891386248ca1feef218a9fb3b [3/10] hwrng: arm-smccc-trng - transition to the faux device interface
config: arm64-randconfig-003-20250317 (https://download.01.org/0day-ci/archive/20250318/202503180105.y2lGKtjw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503180105.y2lGKtjw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503180105.y2lGKtjw-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/char/random.o: in function `arch_get_random_seed_longs':
>> random.c:(.text+0x370): undefined reference to `smccc_trng_available'
>> random.c:(.text+0x370): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `smccc_trng_available'
>> aarch64-linux-ld: random.c:(.text+0x380): undefined reference to `smccc_trng_available'
   aarch64-linux-ld: random.c:(.text+0x388): undefined reference to `smccc_trng_available'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
