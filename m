Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB24139B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 03:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738207589; cv=none; b=t2nUP0/Esq1o2sD8Gpxzoz4ZfILISRFa4wsKF6pqtDIb7BZODoSfPfNzWea2fW35037o9K/llXovKrW9RXmS563cnhy8iqlRL9ZpKHW0m4imiljDNOfOfu/cuevaNb4M2iGAs5ae3/UXuf6sMXsPUtz1njWCCk1ZlChiF6rrc7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738207589; c=relaxed/simple;
	bh=adLpKhd95vSxQ3KIAqO4BqYQrxQovPWP8TubYq3wekk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7TW5/HbVFkc/6r2ran5RsRvIaluZ7ZRqWP40M9UN418Iyl+Pj4uxMt9zB2pg7gn8cOom79082uADiqzxMV+a1SgmjIFrazmkjrPyz9WxhpBY8zDLOxONxhYm7L1Fkp022QKiib940ecHiv7xZwVUKdop4hby3FqLqRnGrgX0oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nM7J2WoQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nM7J2WoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738207588; x=1769743588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=adLpKhd95vSxQ3KIAqO4BqYQrxQovPWP8TubYq3wekk=;
  b=nM7J2WoQNgNVqIHXoLw89GZEJmIIrHlbLMFkMOCuq0X3ttwY531DER1I
   RuBhqGfGKBsGpAieQ4jGgbKgWnzQtCXwax6jCPz99kufW3qG2eSsMLcHq
   QnOmgTtFYGy+0MD/WmZMi2pbOPF/uD0iqztI3IZ+sz8pRy6L1YadWJsb6
   ub3q5Bgev2qIF87bKfUck22/N8uJqfTPV9QlrR4nysB+KmftpcxIbsYS5
   Fr6NXXFrMqkruau3EKNzDSUGz9irvgggu4G9BWrAiZdW5DrnBgTO4A+Ag
   ADS7Z2YaYRvPNI+EsPMxm2MVnxHAHbfy67a8XbcUjQjYHWKXZDT3vE1Tn
   g==;
X-CSE-ConnectionGUID: KCpGK/fsSUKr4I11cZzIsQ==
X-CSE-MsgGUID: VTMU5KoTTsmxkC3p+QM4aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="42402373"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="42402373"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 19:26:27 -0800
X-CSE-ConnectionGUID: R1CRdqrrQQmZ9XLMfnfP8g==
X-CSE-MsgGUID: QBHYPb1xSFK/Vo074nsVsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113830423"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2025 19:26:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdLCC-000jd4-07;
	Thu, 30 Jan 2025 03:26:24 +0000
Date: Thu, 30 Jan 2025 11:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 11/25] drivers/cxl/core/mbox.c:85: warning:
 Function parameter or struct member 'opcode' not described in
 'cxl_get_feature_command_id'
Message-ID: <202501301117.pInM9J9a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   a94a98755ebe43e2cf8fa8b60eb78c64f9d9bdce
commit: dc24301094cdd46e28317cdab4eafa98da3bbfd5 [11/25] cxl: Enumerate feature commands
config: csky-randconfig-001-20250130 (https://download.01.org/0day-ci/archive/20250130/202501301117.pInM9J9a-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301117.pInM9J9a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301117.pInM9J9a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/mbox.c:85: warning: Function parameter or struct member 'opcode' not described in 'cxl_get_feature_command_id'


vim +85 drivers/cxl/core/mbox.c

    77	
    78	/**
    79	 * cxl_get_feature_command_id() - Get the index id for a feature command
    80	 * @opcode - The device opcode for the feature command
    81	 *
    82	 * Return the index id on success or -errno on failure
    83	 */
    84	int cxl_get_feature_command_id(u16 opcode)
  > 85	{
    86		for (int i = 0; i < ARRAY_SIZE(cxl_feature_commands); i++) {
    87			if (cxl_feature_commands[i] == opcode)
    88				return i;
    89		}
    90	
    91		return -ENOENT;
    92	}
    93	EXPORT_SYMBOL_NS_GPL(cxl_get_feature_command_id, "CXL");
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
