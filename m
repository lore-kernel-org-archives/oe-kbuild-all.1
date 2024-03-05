Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4C555C1D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709634525; cv=none; b=rx4kAFFX21Bky8Ea/G92d2/AGKs/9awQS8Jmwl1bz8ikjxl6ZBnwYVwe5ic+GvuNBn7u7ZB0BEhmzU7yP1mhwP12zwznz7weYlUfscR5qz1hPRpnCOYrdnC/EmSOvzndiC1yJD8xRkwBWZYrj46iIHva8ksgJ1CR46+HZ+aXos8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709634525; c=relaxed/simple;
	bh=pABuFDfEZZwgW57ieS1218bdjRzG1Ras2MAEBD8Egk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nkDFGWhbkGeI6EdF6ahWTmwKPjB0qgDlTtmucroCPUBpIChssyvQNR/+7rNXJjtDnTGvgIKD483Gb+8ntYE0HuKfRosNAvvkv3mMPlB7FN/vnwvBvLL97nrfTorelcQGQrELd2mE9GSL3dddwD7wENok1u/LYpRQUM7gRhq0owE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVMENXr9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVMENXr9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709634523; x=1741170523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pABuFDfEZZwgW57ieS1218bdjRzG1Ras2MAEBD8Egk0=;
  b=OVMENXr9fXdGoltytKX1r6r7B/lewWrNBEkt9UVgIFbTMb47apfAOs9Y
   GpVrKmBCr8Asl449L/ZXA+ZiZY/aPHC9VJ+DQQDLlLEkjY4JwISBwON1E
   NFuTlUkG3ynuNh0MKtEOZOl58fgzrVaKucxxd60vIstwivRUnG7J1hQH4
   /lzOUOazYSByLng/obCkSAuE9GukVhqsV6Bc7oqMg6C3nRtVLPcEllThP
   bbLXmkd0QqCA/uPpGOvWUDr2zAQdS850ezDuEvGNbcsZ1mOMj1axXxZ2L
   HxIBq1ze8pEyiIbmX/Tfc5yKiUplh1wOKoKLvPsKgnuxaMCW0cw2SkLCv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21630865"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="21630865"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 02:28:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9744721"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Mar 2024 02:28:41 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhS2I-0003EX-2Y;
	Tue, 05 Mar 2024 10:28:38 +0000
Date: Tue, 5 Mar 2024 18:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11052/11963]
 arch/powerpc/include/asm/reg_fsl_emb.h:18:9: error: impossible constraint in
 'asm'
Message-ID: <202403051835.iqLGz996-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   11afac187274a6177a7ac82997f8691c0f469e41
commit: f01dbd73ccf122486ad4b52e74f5505985dd6af4 [11052/11963] powerpc/fsl: Modernise mt/mfpmr
config: powerpc-randconfig-r016-20220116 (https://download.01.org/0day-ci/archive/20240305/202403051835.iqLGz996-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051835.iqLGz996-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051835.iqLGz996-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/reg.h:26,
                    from arch/powerpc/include/asm/processor.h:11,
                    from include/linux/sched.h:13,
                    from arch/powerpc/perf/core-fsl-emb.c:9:
   arch/powerpc/include/asm/reg_fsl_emb.h: In function 'mfpmr':
>> arch/powerpc/include/asm/reg_fsl_emb.h:18:9: warning: 'asm' operand 1 probably does not match constraints
      18 |         asm (".machine push; "
         |         ^~~
>> arch/powerpc/include/asm/reg_fsl_emb.h:18:9: error: impossible constraint in 'asm'


vim +/asm +18 arch/powerpc/include/asm/reg_fsl_emb.h

    11	
    12	#ifndef __ASSEMBLY__
    13	/* Performance Monitor Registers */
    14	static inline unsigned int mfpmr(unsigned int rn)
    15	{
    16		unsigned int rval;
    17	
  > 18		asm (".machine push; "
    19		     ".machine e300; "
    20		     "mfpmr %[rval], %[rn];"
    21		     ".machine pop;"
    22		     : [rval] "=r" (rval) : [rn] "i" (rn));
    23	
    24		return rval;
    25	}
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
