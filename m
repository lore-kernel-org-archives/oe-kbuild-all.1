Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDC637754D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534621; cv=none; b=oc5s/7L6zfrUaomu2++iXpfEC0q5B+nAL9d7pgbOl5ixZzqAXYb52ojq0I/UDnEza7mX2mqsau7J7eJFQlg1ZMBrwaD/P6XTjGY+ZCzzw5tWnr8fqMoZYMvLnR0FGtKRUg1x1YhDhJ0Cj5JGl3u52xv+cRO9WOEsduYoyY/lk8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534621; c=relaxed/simple;
	bh=hwgDJa6yrTdoXCtaGXlGh9n7urEirGodxem/DoyRmok=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Im68z/hZ+qy21nxdEgtTcemZKIc0fNCiGv1f1WF8b/lZh7h1RNbKW8r4ChacR3HeZ1xsXxsNaUGIj57Pwj2p3fxhOXTd44qCHcbulcXhzTps6bNXTRtNVDEo3gPhmwqY/eX3hVc841gRCUnYveki4B/M8pwMBMgujOaYppsXGbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0dwNwo/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0dwNwo/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534620; x=1807070620;
  h=date:from:to:cc:subject:message-id;
  bh=hwgDJa6yrTdoXCtaGXlGh9n7urEirGodxem/DoyRmok=;
  b=U0dwNwo/Js/0zt8T9GPFW+j9Xra18x6nEoFpu6tTPrlA7rkKTIvWWmvR
   gk+jcemwMkEW+9hPqzkrgNfDT4MOoEe/0mmUkScGlWAfMYmvVSvNWbhxM
   Ns2WGaJobIcgAAh4FwZTK6WGZojy8XxCsjODcbSZlElUkUW+ytiKujh03
   qHqxqNRpdQ21rx3FC+qa5o591bL1Wd2lbIXO5vwx3OE2qk2XP9emo0oWl
   uKsDt7KPJU2n2HLjz76l/D++wXDshzQgSXVmVgkSXNQvSaE/vSU1Qk71X
   IKKmut4m9u89466mQWNwV4BO3U7DI8/V3WKkCtHkDv2/PHgFuh858MqYH
   Q==;
X-CSE-ConnectionGUID: kOefkAv9SCSFTF78zwAW2A==
X-CSE-MsgGUID: r2MOb7UcSR2dhzW8cd9aGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87114711"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87114711"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:03:37 -0700
X-CSE-ConnectionGUID: k4AIanlBR4qSyJ14uC72Eg==
X-CSE-MsgGUID: d2Fh4ReNQIWb836r30K4Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="223261238"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2026 21:03:37 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xf4-0000000008p-0NA9;
	Tue, 07 Apr 2026 04:03:34 +0000
Date: Tue, 07 Apr 2026 12:03:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Sanderson <kyle.leet@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1103 1/1]
 fs/bcachefs/alloc/zone.c:23:10: fatal error: linux/printbuf.h: No such file
 or directory
Message-ID: <202604070147.tWhkRMNZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs pr/1103
head:   5c65ed577ff88f1ef3236caa947c006c4131dc5f
commit: 5c65ed577ff88f1ef3236caa947c006c4131dc5f [1/1] wip: defrag
config: i386-randconfig-141-20260406 (https://download.01.org/0day-ci/archive/20260407/202604070147.tWhkRMNZ-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604070147.tWhkRMNZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604070147.tWhkRMNZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/alloc/zone.c:23:10: fatal error: linux/printbuf.h: No such file or directory
      23 | #include <linux/printbuf.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +23 fs/bcachefs/alloc/zone.c

    20	
    21	#include <linux/math64.h>
    22	#include <linux/log2.h>
  > 23	#include <linux/printbuf.h>
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
