Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC309B64C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 03:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720409689; cv=none; b=Z0Pwu+1LR7kLBZafx9nrqgZOgMaK6bCObjmhz9njnjZtfbFxbyYVq0WwVZg+TbPBZtWbLeHBf1ur4c7XRcmgfSmzuGd7gt4Ds/AbgtSyxuXs5TKUhLVRBOR1FnnfWTO22Fcyf3MOpMYsZfHfg6pl5kFYCjeQZol0z2ghG9ppDyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720409689; c=relaxed/simple;
	bh=0Gr0TSHJTUsW+uPokSc5mss6nJIprzKt4ja6wH2rGic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpDGOS7uZ8MEeIfTp7WtdO4jG07cmeGyDNtbAUtOfR26YUI8RN9rIMOmTy6JcSDzsgQIT1uRdWJOG4x0mAlhDjC9Fo2uYv0IW5lZmRP4zQW/JTxj+3ESc6Vn7R7qgqgBx0OxvGjxkPPrJMDG0Qb8yjsTMc67ThIwosHwRTBmkGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jopFcKxm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jopFcKxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720409688; x=1751945688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Gr0TSHJTUsW+uPokSc5mss6nJIprzKt4ja6wH2rGic=;
  b=jopFcKxmSioHSUSiQFf3qHMEmiVr9mnBbBSpbt/+5L4Wm6ehqTyDFpCW
   cGoB0H17SwnincTD5wdSt/BdQ0/5ULCskJ9c1EKxUYFioZgqC8lYnsNp8
   klBilyFWTeuWMWuDHorxEsAkuoI7+tK5C19utG/tthP8cKQx8M/EGMbVd
   /ImMXlNtgEvSsK6bvzih4DQclH5GP8WCHK6nAgWIk4ZNW01VlK3he854n
   xXJNjI7wUc/jfn8C65JGKsBoaVvNQFZ6ntJhhk16u3ZFYaCC6m6htttEZ
   wB2DqvvwTYPO8QuYGdKYxkbpQwn6dEhrsYpzkFwXeOX6sxs5sYLxmhwgw
   A==;
X-CSE-ConnectionGUID: WtyaZfrVQSiUr65LTO2bEQ==
X-CSE-MsgGUID: RHQscakXTomsSGQkjHxiCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="40104805"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="40104805"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 20:34:47 -0700
X-CSE-ConnectionGUID: fQ7DokSOQN21yrH/AgKFmg==
X-CSE-MsgGUID: Dg/tiGn8Qp+RaVixxYRNCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="47348025"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Jul 2024 20:34:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQf9H-000VUM-1S;
	Mon, 08 Jul 2024 03:34:43 +0000
Date: Mon, 8 Jul 2024 11:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next v2 1/3] crypto: caam: Make CRYPTO_DEV_FSL_CAAM
 dependent of COMPILE_TEST
Message-ID: <202407081155.WRdTU82G-lkp@intel.com>
References: <20240628161450.2541367-2-leitao@debian.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628161450.2541367-2-leitao@debian.org>

Hi Breno,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/crypto-caam-Make-CRYPTO_DEV_FSL_CAAM-dependent-of-COMPILE_TEST/20240630-073726
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240628161450.2541367-2-leitao%40debian.org
patch subject: [PATCH net-next v2 1/3] crypto: caam: Make CRYPTO_DEV_FSL_CAAM dependent of COMPILE_TEST
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240708/202407081155.WRdTU82G-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407081155.WRdTU82G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407081155.WRdTU82G-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/crypto/caam/jr.o: in function `caam_jr_init':
>> (.text+0x1938): undefined reference to `iowrite64be'
>> alpha-linux-ld: (.text+0x1944): undefined reference to `iowrite64be'
   alpha-linux-ld: (.text+0x19b4): undefined reference to `iowrite64be'
   alpha-linux-ld: (.text+0x19bc): undefined reference to `iowrite64be'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
