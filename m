Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1C1225A44
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 09:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738832995; cv=none; b=nGVI3SWdyn+o5V21bYcJTWaiecHcpyHXd193qHSTOo5JWt/VeN9j0EaeCKIRHf6Dmpre/QzyQj1EJeX91MjXqMl5IKeslq5WEa2Zj2hzUEMlWp8/mUdHrjSlEoB/qHk1sTVKJTzWFMDXdK5yxQozMlqd5ndPhlKDvz+EiugcxDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738832995; c=relaxed/simple;
	bh=MllZBxDuR5xB1AcuV5XtF31ktGOF3bW531gMTSloiiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j/FI5ewr+wZIvGHzbEtXOtvoAl9ULxCDvIvUchZU3s/Ua4z5XGrkxXRJXn4/cvftgKorZs+31p0bOOOpNXv79KwV8UMtvhG9SrniQqmKutGv2hLfpyOFw1s2yzaWuO9h77UwWljEBYw8aPtQ6TPXVZF68RvxdXP97dCUJwH94Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkECtiUT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkECtiUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738832994; x=1770368994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MllZBxDuR5xB1AcuV5XtF31ktGOF3bW531gMTSloiiY=;
  b=HkECtiUTI9jV/v7dflC+PS8z9bLisYUZJ31F00z4WKzUBpMeOidDX5dk
   N1RHhmRvlrdbmX9kcE8V522GqKrvuOhuST0cf1DnRjCo7iKTM9wNLjeJm
   jROEckZHzs3wGGeYVwL+IsX4byJdfQHiv37KLgwHalt1ePR9BcztWA54o
   5bJYndYCkHeSOxoYn0/A4GMsn7mIT1ZlDYCNNze0S+ojTz3AgGShx8wDF
   GWcADggyTAnxasCkf0Ru4JxspCt8LnAFs9y5Dfo+YijJvDZoMtaLdVthc
   OBsbtqqhHvWYeQA7ZWOmwjZor04Ti6x5ytVnYR3IX9086bYtJLPbA3sQ3
   g==;
X-CSE-ConnectionGUID: h7E26SjeTleKw/zLc0eEwA==
X-CSE-MsgGUID: KKO6DsGFShOAhin2O42yJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61902437"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="61902437"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:09:53 -0800
X-CSE-ConnectionGUID: FWSYz/9qTO+Rn1Y4O9nrvw==
X-CSE-MsgGUID: FOezAQpBQcavEEE3cEuNUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148354636"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Feb 2025 01:09:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfxtN-000wep-2G;
	Thu, 06 Feb 2025 09:09:49 +0000
Date: Thu, 6 Feb 2025 17:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2723/2723] net/tls/tls_device.o: warning:
 objtool: tls_device_rx_resync_new_rec()+0x941: unreachable instruction
Message-ID: <202502061607.3EO2vKCF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   86893ebd6e3edffebb8d7dc1091533735c6bb082
commit: f2c902d8c653f8021f9761092a27f7b9db42b662 [2723/2723] tracing: Make tracepoint lockdep check actually test something
config: x86_64-randconfig-102-20250206 (https://download.01.org/0day-ci/archive/20250206/202502061607.3EO2vKCF-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061607.3EO2vKCF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061607.3EO2vKCF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/tls/tls_device.o: warning: objtool: tls_device_rx_resync_new_rec()+0x941: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
