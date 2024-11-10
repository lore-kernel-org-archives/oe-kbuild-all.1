Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2403DDAD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 00:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731199690; cv=none; b=b4sINUHJlj+NyijJLfns9WAPWpJV8FTE6Vi7tOdid/UDQxvAwCQsFcvV+6dAky3wlAgw+tQ5XTLbhIe6VfOjL+bYoeNnbN5SCTZv/1Y23QVxyuIZNcqiF33XV/9/ka2PaXHvuNVmEmqPTXHxM35lbzXlQCm9kF+vpclfn+fETu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731199690; c=relaxed/simple;
	bh=ep0vsR15g60m5RjKQw62yIU6HV3plzT0gmOPACcSiDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hMDJa+eYu2fzZPoLxhZjsoyS80ji8FXn7/2x2e5sYbIFZv+UFREDighB4QXoBgoHDCbiSqkkM8pRn1h29GbO23Vr4poO2tgYEy6KNZHRNVxM2286cNPeSmVbSJ6Hh6BSNNF/QU1X6Ts2I0BA4qMe1v0R32Ekdy8zv7tKturXGsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTvdw7Zn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTvdw7Zn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731199688; x=1762735688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ep0vsR15g60m5RjKQw62yIU6HV3plzT0gmOPACcSiDA=;
  b=LTvdw7ZnuIZ1e6kRDSoKvpMpIKXyd7Q/D7SAFxRajWHrgKo8EaU2SvwL
   L2S4uhzUfCiCuySssXi8p04wy8TcS86gNs9EiPP0Iv7JdDw3nSENRZnIL
   Bykv7Zgb85egAFm0cArnyfMWHQ4WbZQrxaSYGWVnVCkP15+1wtcpZ2Mpq
   7kgUmb6G/jmW7b7O98Tn2mH0OUY6s3BD+rKnsimyjQgYVD2+BLojMVa3B
   ecYgf6vQMvVgt7O/1pqLT1hXghxOVDmzfOtid0UfoLPXR5rHnziyZB56A
   HYTG7CG7xBq9ppuPQOEV5XGIeJ+bhhDVgNpWjXOYWImuIWKVBOm7k6zcK
   Q==;
X-CSE-ConnectionGUID: OXZF5FSdTfSNWqHwvkjIAQ==
X-CSE-MsgGUID: t6Ef4xlPRiC67FDIJScaOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="31151802"
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="31151802"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 16:48:07 -0800
X-CSE-ConnectionGUID: P+DZ70UpQCq7gjWFGOHreg==
X-CSE-MsgGUID: LU8oyaA2T0mTon6ozbBq9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="85811133"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Nov 2024 16:48:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9w7X-000snS-2e;
	Sun, 10 Nov 2024 00:48:03 +0000
Date: Sun, 10 Nov 2024 08:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1288/1288] net/ipv6/output_core.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202411100806.TVwoc5Jt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bafa65a8c91fb9c99706d2d22210690199f95779
commit: 643ec9dfcfa248b19ed1a1acce12f05d6dda6de4 [1288/1288] inet: switch IP ID generator to siphash
config: x86_64-buildonly-randconfig-004-20241106 (https://download.01.org/0day-ci/archive/20241110/202411100806.TVwoc5Jt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100806.TVwoc5Jt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100806.TVwoc5Jt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv6/output_core.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
