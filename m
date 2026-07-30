Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC01368277
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 02:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378495; cv=none; b=adQA1T+J1yId0I7T9XhOZsIJwRIFZEH4aobtBTuVD0oOWERI5Sy62LDMj5UkHPMbpw70eQnqtx/54Tf7aiJx1Nmxz/lMaIeOsbWHgY2GrY8zjMvrNzQj/D9XHODritz3a4A/JVWVAQawx3gh1ZaINRA9xIvcdb7H1X2seP3hWSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378495; c=relaxed/simple;
	bh=EvXc73KjUy8NezGvLmSY2fcUcmgzRRUtUoqriC9yHhc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aO2hpswqaAers+jmDPCqK7oboLpTLOPuPSBR+kwjkoys/DN2SJCsk/ThApraWwNUwLFO97BeMzrEVVGRRxuOmFi3oE1Lrj7UpWFZKSA4Xvw8xL8iC4wfAF0LcgZiEWxJ6LG+EwpgmEnf0GqcdztPOZSL8l6B/jtHLGqetFBfyG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CfGSaOXs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CfGSaOXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785378494; x=1816914494;
  h=date:from:to:cc:subject:message-id;
  bh=EvXc73KjUy8NezGvLmSY2fcUcmgzRRUtUoqriC9yHhc=;
  b=CfGSaOXsQoLv8atiL9w0MwYMELrWNYvqVR3CkJLjJXh0YQiTUXwsIDEm
   dLVfC7lMGMa5eZtJMWl82wJzxA6XX6FaduOUtjdNfXM0jbbh/aRYYMIqj
   sY2VcQr3tbBZJ5zJUCMRZColaF/w8DQN9Eyzp4REVBip7iopP73CV35Us
   UGwMNiSm7bHk2oTNiGpvxa5A5H0pQjrAqB83c3qGKEwvLZHt9nV1lZ0NW
   VTRAUP3ORAPTIF2N8DMxqC/f7H63YK48W1VJmgWR1G6YCAklpB32YkPcR
   /6xkXkkuLK/Y/GhgBcS0eCK3fJt7kdsi/ENmaJaD8LZtB3gSeXNARydMD
   w==;
X-CSE-ConnectionGUID: zfkgofiGQwCG11AfTGMogQ==
X-CSE-MsgGUID: zPCfBkJOTCeHP859LyZYJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="111538139"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="111538139"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:28:14 -0700
X-CSE-ConnectionGUID: 8H4VewVERouP/UxyRqLgEA==
X-CSE-MsgGUID: GyeRJVAzSXezSkqw4z958A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="256840093"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2026 19:28:12 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpGVG-000000002Io-2J7s;
	Thu, 30 Jul 2026 02:28:10 +0000
Date: Thu, 30 Jul 2026 04:28:03 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 4/4] Warning:
 drivers/char/tpm/tpm_crb.c:193 function parameter 'loc' not described in
 '__crb_go_idle'
Message-ID: <202607300430.sjII752T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Stuart,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   5e9654c516d84286a1589d22470d9c4c04ed8507
commit: dbfdaeb381a49a7bc753d18e2876bc56a15e01cc [4/4] tpm_crb: Add idle support for the Arm FF-A start method
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260730/202607300430.sjII752T-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300430.sjII752T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dbfdaeb381a4 ("tpm_crb: Add idle support for the Arm FF-A start method")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607300430.sjII752T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/char/tpm/tpm_crb.c:193 function parameter 'loc' not described in '__crb_go_idle'
>> Warning: drivers/char/tpm/tpm_crb.c:246 function parameter 'loc' not described in '__crb_cmd_ready'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
