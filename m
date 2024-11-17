Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687ED15445D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 23:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731886593; cv=none; b=jJ+WILLKrxsgFCqRoNcwKksgrr57CQtqgOWypaJx5KBWBidEx0Nl8HzeZv6rTYxcfysXxmIvhCwQr/4JgtBGSyzhEiiktad1sCZQTw5kSslOutt5HskxWwSp2SW7T7+2YamAOfz21gNRztKIz0vw3xULLPBvdqWRniwBC5Eo0QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731886593; c=relaxed/simple;
	bh=tuUO1UMAhmmPUoUqriVlKlOil5EFPM7fK426oGBLnQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uuc2Lt8CwuYym30+69cXQD3I1z0Z7Cm1y5GuMYGW9TwAxoNgY3c1vhKd/Ggxu0N2eDVyJFnk+wugoB9SZ7S1F/R4l+fWfZ7i2yKcaL37NR+196eannLY+DNDSxcU5qB9PFEcbaNpwtTuxWBqU4+6r2LGkvOqqeJ4egvVB0eUgv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1EKBu3V; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1EKBu3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731886592; x=1763422592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tuUO1UMAhmmPUoUqriVlKlOil5EFPM7fK426oGBLnQM=;
  b=B1EKBu3VzFKWblRjZhPMNZBTcoZoyDZgJP03t5BaTldu0Vydly/L55e6
   HV5g/N92/0sFFZ82BEQSKthOsCCF9YrT+x5EVl5HeNl/U40b5FjNZsx2e
   A8FMNYYrh1XL1T+d2DPi7lqS5m8Jvu2DG34wAEZu951czbNZhk3SM5bm2
   YHhahRqDflW/R41zcxh9Ib0jr2V5GnmaWJVwkeiKAG0oCtOB7b6Traiq1
   CTwmYynEsFWIr8BfBhYHFRHh5jtKGR9MAEH0C1QtlJw+QLGED/W87v6wV
   SazDQrSDVxw4j9+3TKjzxvasLMiwQoBrgr+fYroJ/uCKw9OPMd4aCIOxZ
   w==;
X-CSE-ConnectionGUID: ZC3fqp0FSqa2n7Vu3xwsbg==
X-CSE-MsgGUID: FQnoMTm7TK+5KpkLlSoIlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42469444"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="42469444"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 15:36:31 -0800
X-CSE-ConnectionGUID: EqUQ9toJT/qeoFryIpxMrw==
X-CSE-MsgGUID: 1pPznnXfSF6jPaDioMf+Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="88638233"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Nov 2024 15:36:30 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCood-000273-1v;
	Sun, 17 Nov 2024 23:36:27 +0000
Date: Mon, 18 Nov 2024 07:36:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297] sound/core/seq/seq_queue.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202411180702.Swqtnm4B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4c37b6449701a1fcb16050d4e517fa6d505673e1
commit: 00976ad5271999ba06d24319fd1031b178aff832 [1297/1297] ALSA: seq: Fix leftovers at probe error path
config: x86_64-buildonly-randconfig-004-20241117 (https://download.01.org/0day-ci/archive/20241118/202411180702.Swqtnm4B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180702.Swqtnm4B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180702.Swqtnm4B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/seq/seq_queue.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
