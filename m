Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A801230BF5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 07:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745567451; cv=none; b=axcR5qnPPaYqwwa+lhpfN0j60J8NI317GQtE4ujVx6+fLnDnYyp8WhgjoXONpu5P+JlL9bWf0QxsrlmdrDrxoYxSMeNo0X0ZQntBtk3KnQ5QAV0Yeq8SvjASwl1cpe3VmsNgqwL3sYS+/vdvaqNIaNq3qicnAwvqp0hzXp3xryU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745567451; c=relaxed/simple;
	bh=rKa258W9mK5ExYpEo1fdSW2oPbMqvPLV+qR3dDzMnZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L/glA9V03tmxvySqIUIOaTK4NuXa/LCRk/Pg5jmUIlEQzjieY8eL/UrpX1BIHBO2Eb59Qgpj2GrErBFUZe3fOu8RRkYG+AHXOr9OlMArA/w+2HrbdTorafRaXq3HPUz+2S3vn0fLpgPpMfn0Rwsh+y2k+s4w7yJB+slqtBT/r04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmYSlU9t; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmYSlU9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745567450; x=1777103450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rKa258W9mK5ExYpEo1fdSW2oPbMqvPLV+qR3dDzMnZ0=;
  b=NmYSlU9to7IQaYCGrQI6u6q/6AVR0GxXDH79xjnlG13lmexBCuGTKc3p
   AcqapeH+3GZs5kXmqBODzzpUHEjN3MQKkN9tsoT8EUu5+YcM+Qa5PNdH2
   MroWoeO7NSB/2jX2GcYnmdcFHlggh/1+bWXkvEv5aw/VaFoK5kb4ZAZTU
   M53ry6ZueeDt+KIkr9UycxtSEChXn7XsYKS3Nx+rCtRDnmGbF6SifpImf
   DVZ1VtniusnMuzeIlZL5vUbqEgAjSY0EwR5Lu0xMMw6rfo0pnirsOlm/t
   kzEF+yvfkhUIO3Hq4GJC/q1OkaX1x5Mc4seWaw1PrRUOcr/IgXcFGHns3
   A==;
X-CSE-ConnectionGUID: 7eaY39iLQsiFjjo9VXCncw==
X-CSE-MsgGUID: vOEN0QliTiGJS0TpxG7YHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47315303"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47315303"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:50:47 -0700
X-CSE-ConnectionGUID: 3TRa7hDtRa6WrkASbmmiZw==
X-CSE-MsgGUID: 0pKGwLFOQlCWgl3ywPNJ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132761841"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Apr 2025 00:50:47 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Dpc-0004vs-27;
	Fri, 25 Apr 2025 07:50:44 +0000
Date: Fri, 25 Apr 2025 15:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-23 111/116] {standard input}:15:
 Error: symbol `__export_symbol_snd_soc_dapm_to_dev' is already defined
Message-ID: <202504251544.jUGZjV5n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-04-23
head:   66104ef95f2f8e651b29bf32aaa483868492887e
commit: a3f4e8cf9db06f4768bb6a874cfe3c3378b4836c [111/116] hoge
config: arc-randconfig-002-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251544.jUGZjV5n-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251544.jUGZjV5n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251544.jUGZjV5n-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:15: Error: symbol `__export_symbol_snd_soc_dapm_to_dev' is already defined

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
