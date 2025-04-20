Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B41CA4B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 12:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745153506; cv=none; b=XYFT4g0llswyxy2edVFWBdUbBLren89bMglihKG6goJf9qYlhWZX1+n8xQJUj6a+lcTcaRxpDUusQVKYi3bVCHWs6bLsvwN33LSqTbQx+ZeixYnCTlelz/PgN7yx3dCpgbEyvzB9cjuFvhLGtrvH7oHMFK9ETHboncywLbhd0a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745153506; c=relaxed/simple;
	bh=EuEmabNjQ4wgETmB+iLkGsp08blrPRJBYkysYhEakUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJ4KfCy1ijmc99p5lKvPclXqhM3Ve+kMuzvBlbrj/rqWJAzOfoM5lHXXZeyH/Ay2d4p/EFmEaHV/EeP1hNnWcqCOs+fV3/2fLS431/qJgvJNEkSoLKelRejgR23n5kbpjg5ozbx4B3QQbUUE4R0r2ShgvjGAP5Kucl9IGxeaA3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TObLlBZc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TObLlBZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745153504; x=1776689504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EuEmabNjQ4wgETmB+iLkGsp08blrPRJBYkysYhEakUE=;
  b=TObLlBZcDXgg6YDhuXcUlec8+fRk9GnLxpOLO4xwz2hgrcolLO3EYxQK
   NS2BVzWlVot/uOIdIQMJQynRS69Q45dOfUKanMe5wjA/+1TeK8VqrjxXD
   UbDvQIdTpCoZAe1+xt56ESTY2jXpJgJKAteLGMardVmukCF/FcrE638dz
   J6tYyTdAqMQ3y3KqDMv1QynPU9NvqvfswMMCCs9Gn4NTF/rt76KS4ScAJ
   /NGwvIM5Tbv49DdHucir/G8FX3j9D0BlHpCRZtjubB8MIOQYmib7VbGFi
   hUCvBjcikzMLF0Xd6gERi3u1Ivdnadul5An6BekM5RcAPwrlrbXa2Khir
   Q==;
X-CSE-ConnectionGUID: FN2HzR3KTVGm5lLkqHNl3A==
X-CSE-MsgGUID: Wm8Zdr2aTca34SvWitkTCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="72097694"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="72097694"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 05:51:43 -0700
X-CSE-ConnectionGUID: d69v3ZFQQBSQ89BWO40Idw==
X-CSE-MsgGUID: YsHjiDm6Q5a0nl98RzRkTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136465265"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Apr 2025 05:51:42 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6U96-0004dl-11;
	Sun, 20 Apr 2025 12:51:40 +0000
Date: Sun, 20 Apr 2025 20:50:53 +0800
From: kernel test robot <lkp@intel.com>
To: Raj Sahu <rjsu26@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 4/4] bpf: Runtime part of fast-path termination
 approach
Message-ID: <202504202001.DtarnmV1-lkp@intel.com>
References: <20250420105524.2115690-5-rjsu26@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420105524.2115690-5-rjsu26@gmail.com>

Hi Raj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Raj-Sahu/bpf-Introduce-new-structs-and-struct-fields/20250420-185825
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250420105524.2115690-5-rjsu26%40gmail.com
patch subject: [RFC bpf-next 4/4] bpf: Runtime part of fast-path termination approach
config: arc-randconfig-001-20250420 (https://download.01.org/0day-ci/archive/20250420/202504202001.DtarnmV1-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504202001.DtarnmV1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504202001.DtarnmV1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from arch/arc/kernel/smp.c:12:
   arch/arc/kernel/smp.c: In function '__do_IPI':
>> include/linux/smp.h:178:9: error: too few arguments to function 'generic_smp_call_function_single_interrupt'
     178 |         generic_smp_call_function_single_interrupt
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/smp.h:178:9: note: in definition of macro 'generic_smp_call_function_interrupt'
     178 |         generic_smp_call_function_single_interrupt
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/smp.h:176:6: note: declared here
     176 | void generic_smp_call_function_single_interrupt(struct pt_regs *regs);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/generic_smp_call_function_single_interrupt +178 include/linux/smp.h

f37f435f33717d Thomas Gleixner 2012-05-07  171  
3d4422332711ef Jens Axboe      2008-06-26  172  /*
3d4422332711ef Jens Axboe      2008-06-26  173   * Generic and arch helpers
3d4422332711ef Jens Axboe      2008-06-26  174   */
d8ad7d1123a960 Takao Indoh     2011-03-29  175  void __init call_function_init(void);
74a62e27c20ef9 sidchintamaneni 2025-04-20  176  void generic_smp_call_function_single_interrupt(struct pt_regs *regs);
9a46ad6d6df3b5 Shaohua Li      2013-02-21  177  #define generic_smp_call_function_interrupt \
9a46ad6d6df3b5 Shaohua Li      2013-02-21 @178  	generic_smp_call_function_single_interrupt
a3bc0dbc81d36f Andrew Morton   2006-09-25  179  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
