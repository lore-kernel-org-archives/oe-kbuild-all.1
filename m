Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85ED285C85
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761052033; cv=none; b=LREGjgHn20M+JaOzrq3ImEQsBMoyKPTEzC2kS6p3EQVkbVzoHRFh9eR78mJoP8Y4J8/04m5rlzP35a1sVqsJo9K5XyPiL1oblgEcKnzkqisqkdtZPmtofb7UbSl4Mvi0OnsYaYr2zGP6IoXVkpXYXdzumWh9TCqiGvBalG6W6x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761052033; c=relaxed/simple;
	bh=V+Gqbll+SY6QUsS/Wr1/Gn9/Qi0UdTEREcQYsqkVan8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCxantSWzLdaF76M8MW6VSJEdJXuCUB19tKSYUmTfPhQBC8qEBDELlekQhV44dHB1GFr0QTirGNabo99Bm15kxJeoE2GYt40zfCOPX228IMztI5byk0JepkNHGAthodOk6bPnFFGQvFEKawBisSILQh8obJgCccYf9qYjJYidfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEDCF4aa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEDCF4aa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761052031; x=1792588031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V+Gqbll+SY6QUsS/Wr1/Gn9/Qi0UdTEREcQYsqkVan8=;
  b=ZEDCF4aaBt9GY0lnL5oeUXj7BQmncEfIXivPxOpd5jFp7YbLY6lFVNNH
   +yvmcLzDkOFlNXEyCbZaakznzprawIVtg3bTC3kgWRLTw8LPwIJngyton
   FiWX0S4CFGcAMJ7OzcWHI7UsDHstbClKeiXhFutJ1DwaYrhwN+hfvwnfz
   6njQvSo8hw7E/jLRiFGXNgY8IKdoQ9cGsaJ1eP0txiXlGY1C4eOT8e6CW
   xPt5jDjdpxY3AIxt1OihhTh6zGV4y3BGZme1kkdkD9ywabmIzL1vDul4R
   IHRZf3s0uGhwsgtYFK4xRuDF5HdeJ1A/ILeXBu/nS66DW562+HdUgabVy
   w==;
X-CSE-ConnectionGUID: f3S4I19+S86aYsXzdoojzw==
X-CSE-MsgGUID: scBm4x+WREiKZY/GbsR1hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63273060"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="63273060"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 06:07:10 -0700
X-CSE-ConnectionGUID: EXJNoOkmRqSQCUftNNoTsg==
X-CSE-MsgGUID: 1NQpMApGRuqZP3nxmsm2Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="188695616"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 21 Oct 2025 06:07:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBC4w-000AqH-31;
	Tue, 21 Oct 2025 13:07:06 +0000
Date: Tue, 21 Oct 2025 21:06:24 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] arch/riscv: add proc status (proc/<pid>/status)
Message-ID: <202510212007.IkT9RA9u-lkp@intel.com>
References: <20251020-proc_status-v1-1-59d2c8ccd4f0@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-proc_status-v1-1-59d2c8ccd4f0@rivosinc.com>

Hi Deepak,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/arch-riscv-add-proc-status-proc-pid-status/20251021-022001
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251020-proc_status-v1-1-59d2c8ccd4f0%40rivosinc.com
patch subject: [PATCH RFC] arch/riscv: add proc status (proc/<pid>/status)
config: riscv-randconfig-001-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212007.IkT9RA9u-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510212007.IkT9RA9u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510212007.IkT9RA9u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/cpu/proc.c:8:10: fatal error: asm/usercfi.h: No such file or directory
    #include <asm/usercfi.h>
             ^~~~~~~~~~~~~~~
   compilation terminated.


vim +8 arch/riscv/kernel/cpu/proc.c

   > 8	#include <asm/usercfi.h>
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
