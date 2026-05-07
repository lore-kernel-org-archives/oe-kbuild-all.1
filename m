Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB30B387569
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163479; cv=none; b=tLeZOIdUmAmFJOatkEvhIoEacoVf7+PIW/IjN9bqfhnHde9NgP72HQPJRTEMBCSv6nVIWj+2cuARlDqqmxjw/kSBXZmfFgv9sDJr9UqSe2BpFwZccJ95zIsviPw7cA4St6ecLcr2vhXxyLWrmJzvcPg6p4D+jKR5aFFMZLP4HIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163479; c=relaxed/simple;
	bh=sjYrXHO/ODNSxy81oAsj1SSXYPcQS6Uagqx9YqW2fqI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GEycxCA/vicG9iBmcfLz8jfzHhmX/nBjV6R/cHybVah4RYm2cO6oZKMBA3sEDoaodTkXLaLyBzMPrWPcIhCyEbZ8tggFrBizVWpfx5KczlPevyw5s5IJZzLmpBfDsiUXxzqT8cADyRKQi8sJARrPVsW+rXWgJeUDOVECn9fyZv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7tzTgtA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7tzTgtA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778163477; x=1809699477;
  h=date:from:to:cc:subject:message-id;
  bh=sjYrXHO/ODNSxy81oAsj1SSXYPcQS6Uagqx9YqW2fqI=;
  b=n7tzTgtAdRtTLcdTzTi4A5uRSO92TNiD8W0l6cHPBHiKAPdxOtd34sHr
   q+hFBbzw2aQzkFr9yyC9wjeWQjGaGi2qEeNIPSEc6s76KdyvBwbLt8TvO
   9tUhbfc3+KJMXQ80wb49lg7uytdf7VdjD1NEAhJr3E+j0ggb0Nzi/Kqzg
   nbx9SVvfkhJvTq48Q5f+VSSw+pHxMrWXsXb292HXaShpB5e7FknqriKHL
   yZeOIQdd7RJ9eddw6sCYdLVfmuUzVGCxfxmAHwHyRC+ntwyJDeTqCqDDZ
   Y/q9cGYPf5AXkLuuPGZl/e6Mae7ghau17yZTSvCqk+nB/8odJNo2HptAI
   Q==;
X-CSE-ConnectionGUID: Z9DCaQ9OS/SFfaVlS8OA1A==
X-CSE-MsgGUID: 1ZPNZrxXQZqIbWwcWmKmag==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79222794"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79222794"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 07:17:57 -0700
X-CSE-ConnectionGUID: MEExvhdBQqOLUH3tGrvaPA==
X-CSE-MsgGUID: rBhsH4iQSM6ulD6COEI/dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="230081644"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2026 07:17:55 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKzY1-0000000008j-1EE1;
	Thu, 07 May 2026 14:17:53 +0000
Date: Thu, 07 May 2026 22:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: Fred Treven <fred.treven@cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cirruslogic-drivers:v6.18-cs40l26 36/692]
 include/linux/mfd/cs40l26.h:38:10: fatal error:
 linux/firmware/cirrus/cl_dsp.h: No such file or directory
Message-ID: <202605072245.TwrUCXkb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/CirrusLogic/linux-drivers v6.18-cs40l26
head:   215fc5a27de5a5083e55bfb43ce5e3de6df52c93
commit: affd439f8b33ecb889c674e08c4ab6a5e1ce37e2 [36/692] ASoC: cs40l26: Add CS40L26 Stub Codec Driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260507/202605072245.TwrUCXkb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605072245.TwrUCXkb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605072245.TwrUCXkb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/cs40l26.c:7:
>> include/linux/mfd/cs40l26.h:38:10: fatal error: linux/firmware/cirrus/cl_dsp.h: No such file or directory
      38 | #include <linux/firmware/cirrus/cl_dsp.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +38 include/linux/mfd/cs40l26.h

351140f7d5d63ea Fred Treven 2020-05-28  37  
3cae9b2fa130a1e Fred Treven 2021-01-07 @38  #include <linux/firmware/cirrus/cl_dsp.h>
351140f7d5d63ea Fred Treven 2020-05-28  39  

:::::: The code at line 38 was first introduced by commit
:::::: 3cae9b2fa130a1eb3fc597c2b32e0edaeda6ca00 input: cs40l26: Change include location of CL DSP

:::::: TO: Fred Treven <fred.treven@cirrus.com>
:::::: CC: Fred Treven <ftreven@opensource.cirrus.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
