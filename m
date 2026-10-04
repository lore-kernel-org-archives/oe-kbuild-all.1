Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1370A3B42FE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Oct 2026 03:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791085415; cv=none; b=rbu2l1EmAtsLKuf5qKK/s/PADRkJ9BCNEm88ZxzuNBegH1s8n52w41wIQNVxuKHHWUipROY2ea04rI5K9WGKoIaR3bnMw1tarHtHgPArD4SdTmygZuWZMvY0no26GBOJmdj+Pwk29GE/CokBYEcvRvF1NhAFk7t2iVHkYeWc3DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791085415; c=relaxed/simple;
	bh=Eh4Ncy+Ja0ldUxZvEJvuLFcxsNKF/lnuyCO3DztNCc8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O/OI/aDwPoj645KW9ZB+TmFYOePbwifPoQ+TmDlArH34zgT5DUYMl5MPfgxTNtNcjzT3Rb2nkW8SRt9AW3/5t93kyUBKVpzMa4cs5yGQl8rPRYyfMB/jTfRbjjM+UdAEcGYXcsvOmg5KZb97vNqXyprnNDWW8LBnqA32PQKKKQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z7sfJ4mU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7sfJ4mU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791085414; x=1822621414;
  h=date:from:to:cc:subject:message-id;
  bh=Eh4Ncy+Ja0ldUxZvEJvuLFcxsNKF/lnuyCO3DztNCc8=;
  b=Z7sfJ4mUX4SHqV3YTgj0k8Mfwp48vP4eJ92IJlvhgjTqYl68/ow/+yC2
   W1mAhaE01iU9jVa0K9ezJ438ot/ek2jB52evjH9OYzro6PWiJIHyR1zJE
   z3QAiuJZbqF6cFo0ZwA/yixPSIoTJM3Rv+BgNF8zKFRfme6Ce7Pz7qECb
   bJqIc8pcQ8WwsRNTaFKbACVhSNgzyS/ajiuhFradN4Cr9EvuF0JO4r9a6
   7oLMnQXjZdxqUZk1OPL+tJiQjwdH1Mi3OYgp0JhCkCnDWq4R9MnqC9uVb
   bO7tnH5RTIcMmAuba0sV86fFoiW3Q4KqOl4Drvk+MvTouh4HU/+2F9WxS
   Q==;
X-CSE-ConnectionGUID: So9Ya+97Sw+9qY5477jxgA==
X-CSE-MsgGUID: XZB7Thm/QOGsTZn1vPsQfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90651804"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90651804"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 20:43:33 -0700
X-CSE-ConnectionGUID: rdkZNMd7TQqx1uYJHfWphQ==
X-CSE-MsgGUID: nceycFY0T0qm20Pk46Lctw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="280283492"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 03 Oct 2026 20:43:32 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDD8L-000000000Bf-30pJ;
	Sun, 04 Oct 2026 03:43:29 +0000
Date: Sun, 04 Oct 2026 05:43:14 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] Warning:
 drivers/char/tpm/tpm_crb.c:193 function parameter 'loc' not described in
 '__crb_go_idle'
Message-ID: <202610040528.EvVAWPKj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Stuart,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   89b3cc162c81c59edf4a48f784725849effed283
commit: dbfdaeb381a49a7bc753d18e2876bc56a15e01cc [1/1] tpm_crb: Add idle support for the Arm FF-A start method
config: x86_64-randconfig-2200-20261004 (https://download.01.org/0day-ci/archive/20261004/202610040528.EvVAWPKj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610040528.EvVAWPKj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dbfdaeb381a4 ("tpm_crb: Add idle support for the Arm FF-A start method")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610040528.EvVAWPKj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/char/tpm/tpm_crb.c:193 function parameter 'loc' not described in '__crb_go_idle'
>> Warning: drivers/char/tpm/tpm_crb.c:246 function parameter 'loc' not described in '__crb_cmd_ready'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
