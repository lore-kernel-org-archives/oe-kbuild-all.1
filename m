Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020916138
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 01:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716512763; cv=none; b=ZQViGg33X/wlJgr/qrdlfTzNxrR4F+FyXCHUUGW6+4vKwRk/jzp3r0DLBQCkyuIf/20vTkMDZwYAcKtX5PaYmkHV2gje3/mBLJZZBTOjPS+NayxyAHn4HroynaF3aD7EqWle8dqphK4JST2BxvBBamGlRZqGOyTr4gwi3zp5f6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716512763; c=relaxed/simple;
	bh=IMEffDGPhvizUF2P6nyaQAZ3UlwNpCQXPULDdbIP3NU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uwn2aJqseD7TKUVkJxh4CTj3tqPnAbWVABcYyc5rflaBo0gPHnMF1MYIgurRg5toXpyWYr2Y1vvlGH+fWIieb4Y2FefuPZVutBPW+FO7D0yVLpp7yzgSj+L8lJI/EIpkY+zQgEfBrl0vBLG+k4KgkrIwecCU0thRcoh78bWE3tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpP/cXdx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpP/cXdx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716512761; x=1748048761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IMEffDGPhvizUF2P6nyaQAZ3UlwNpCQXPULDdbIP3NU=;
  b=bpP/cXdxaihO7QCyx/d/ShtIaa6/9kXwFb5pLfOkXbG6EeiK1n687R4e
   6bFZ+X3YOaVZSOphdmW4qQtdBy1vY+PCu0h7se7AvCInLkFdo9VSQyR4p
   1Ispt+sGJf7J2sxWZ50HOPsXTL57bmYimYnOkNbz3D0TpzrjH0Gs/nXyu
   5t2c6dmMtALkzPggefgmbSAltaB8AgXtql/YErgDMsOQ7tWIP5HN34A1o
   y5VOMXw8kfEiEsWbkrmTWfCwVvWXEr6/EQbP5sEg4ObMgCDeqyHCbWF5f
   jCZQbXDHCmfAsN42AXGNP1ZC2iCNGi3cpDPC7yxc1AXEHjMWgDZ/UHxfN
   Q==;
X-CSE-ConnectionGUID: ZJE3czGNT9GN7nBR3fYH4w==
X-CSE-MsgGUID: Xprc6uEkRjyrsa7bTvgibg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30374741"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="30374741"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 18:03:14 -0700
X-CSE-ConnectionGUID: KAnItdN6TBSRuLLGFS8kAw==
X-CSE-MsgGUID: OtdDz0SARtqShBbgV1L8HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="33966245"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 May 2024 18:03:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAJKn-0003hJ-0X;
	Fri, 24 May 2024 01:03:09 +0000
Date: Fri, 24 May 2024 09:02:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hanliyang <hanliyang@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9687/9759]
 drivers/crypto/ccp/hygon/csv-dev.c:32:6: warning: no previous prototype for
 function 'csv_update_api_version'
Message-ID: <202405240829.xBq9c5jO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c564f68dbcd17a532bedbcd78ee4a0b3a2853a84
commit: c73088c4bfaa46261a59e5879143688fb540d53b [9687/9759] crypto: ccp: Print Hygon CSV API version when CSV support is detected
config: x86_64-randconfig-003-20240524 (https://download.01.org/0day-ci/archive/20240524/202405240829.xBq9c5jO-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240524/202405240829.xBq9c5jO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405240829.xBq9c5jO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/csv-dev.c:32:6: warning: no previous prototype for function 'csv_update_api_version' [-Wmissing-prototypes]
      32 | void csv_update_api_version(struct sev_user_data_status *status)
         |      ^
   drivers/crypto/ccp/hygon/csv-dev.c:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      32 | void csv_update_api_version(struct sev_user_data_status *status)
         | ^
         | static 
   drivers/crypto/ccp/hygon/csv-dev.c:40:5: warning: no previous prototype for function 'csv_cmd_buffer_len' [-Wmissing-prototypes]
      40 | int csv_cmd_buffer_len(int cmd)
         |     ^
   drivers/crypto/ccp/hygon/csv-dev.c:40:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      40 | int csv_cmd_buffer_len(int cmd)
         | ^
         | static 
   2 warnings generated.


vim +/csv_update_api_version +32 drivers/crypto/ccp/hygon/csv-dev.c

    26	
    27	/*
    28	 * csv_update_api_version used to update the api version of HYGON CSV
    29	 * firmwareat driver side.
    30	 * Currently, we only need to update @hygon_csv_build.
    31	 */
  > 32	void csv_update_api_version(struct sev_user_data_status *status)
    33	{
    34		if (status) {
    35			hygon_csv_build = (status->flags >> 9) |
    36					   ((u32)status->build << 23);
    37		}
    38	}
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
