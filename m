Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8881913A3F1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 09:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717665395; cv=none; b=UihH0Cy7cACJ5cBevzVSUmt3yV7VfS1WvwkTJMpaCN6Nzp0cnBOJm6tH0EVB7VJkNlUuXHMbzEc5p9eZ8V46gw3JTaJ/gwpBwBcriNkZvaJ99eEOyJwWifd8is9ZMGBuRzQVSSmAqpAeYhhEw9TTs4RkWb/KahPj/ZIEWpSW050=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717665395; c=relaxed/simple;
	bh=s/LEKzhglfD+kdFxXOUSWDELLQdE26cjEcFTSJwlZTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o8U1a30VPNff7zzaxISHIg2vsAzfDfrR3Ry5LnZferiAscrTCpF/ZLojjmsNUJeNcWN/pLx/NsS1tpxEjxCl1G6NVhmqNCwD87TSUiuNOkLFF2r+LVFDnVcj+MX2JdtUPwuqJSsO2oVTdxEXxsGcLT3uDvg5y7h4j1OSLoSwrFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+I5ZcIZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+I5ZcIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717665393; x=1749201393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s/LEKzhglfD+kdFxXOUSWDELLQdE26cjEcFTSJwlZTM=;
  b=d+I5ZcIZLHB02L+GmasK6Eooye+SoN4tGRe5M/kklZt4BF+kKSSYSxUq
   BmFl3uCkRmRDtpV/p+FupzG0hrVzvAS0QiQIb3DEq3yUdiMWFdRiIcMqE
   KbwTMz7E7jpxpyi1pt/Lsy35abQu1UTRgWJTKhpmde0JF+OUf6My1myEX
   AY2zfVz7QQ5tWzgtWV+xVkzaScK5o54mBoQmICg03B/GpOGrL/OzQESNX
   ahdZ3x9Huceraj/yQIPzRd9Jv5/iVmGY7yzXPm+OE262EBIX3/BxvxgIL
   0D72MQUi5ihb90vJo0gSWFB4qw7TqA07tbEBOBOUD1JjEDMJSVTtXJIz4
   Q==;
X-CSE-ConnectionGUID: aBJG8MO4RaGcIxNPJFl68w==
X-CSE-MsgGUID: 7fwD6KhPQCm9wykazpvdqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="18166272"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="18166272"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 02:16:33 -0700
X-CSE-ConnectionGUID: /2pHx4BEQQqbR8f3pD/Fig==
X-CSE-MsgGUID: U9Ci0j0fSd6+SmEhLq1N7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="37867588"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jun 2024 02:16:32 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF9ET-0002u4-1e;
	Thu, 06 Jun 2024 09:16:29 +0000
Date: Thu, 6 Jun 2024 17:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [linux-next:master 3357/4264] kernel/trace/trace_selftest.c:761:
 warning: "BYTE_NUMBER" redefined
Message-ID: <202406061744.rZDXfRrG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f
commit: 47c3c70aa36971c90e32e91f9254110195d67a02 [3357/4264] function_graph: Add selftest for passing local variables
config: sh-randconfig-c004-20211223 (https://download.01.org/0day-ci/archive/20240606/202406061744.rZDXfRrG-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061744.rZDXfRrG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406061744.rZDXfRrG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/trace.c:8677:
>> kernel/trace/trace_selftest.c:761: warning: "BYTE_NUMBER" redefined
     761 | #define BYTE_NUMBER 123
         | 
   In file included from arch/sh/include/asm/bitops.h:17,
                    from include/linux/bitops.h:63,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/ring_buffer.h:5,
                    from kernel/trace/trace.c:15:
   arch/sh/include/asm/bitops-op32.h:14: note: this is the location of the previous definition
      14 | #define BYTE_NUMBER(nr)         ((nr ^ BITOP_LE_SWIZZLE) / BITS_PER_BYTE)
         | 


vim +/BYTE_NUMBER +761 kernel/trace/trace_selftest.c

   760	
 > 761	#define BYTE_NUMBER 123
   762	#define SHORT_NUMBER 12345
   763	#define WORD_NUMBER 1234567890
   764	#define LONG_NUMBER 1234567890123456789LL
   765	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
