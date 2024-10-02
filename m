Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B1718E373
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 07:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727855407; cv=none; b=tW8b5TQQIlMaRRcvHBFFOVncb+sPPdeLRWZyGmawDtC2uQ9j27IKd1USveTuGqSiCZQdUCr2x5cBC+EjAJQj4z5IkoODLr/PbV4fg6HNMbS/Sx0AklSemphD/32Zmljbd1K96h+ddWrkl1FQL5Xx3rPZIUErsE3z0FM3J42jEN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727855407; c=relaxed/simple;
	bh=pBafR90mHOZxMXMrtGmnNbM6ZuPsweJ1CyDXXOTW89c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=be8GxQLU6w+JiCK/7av0x5E0IdAybEMoPaWJKhtGHExMsmF8mhtz0g/Q8kkv1IMz97td4E3ZSncoEn9GHP/2s+SHqSDmO/K3OcwIBsOpOUPBrL+k8J+2/EGbM5U0cGclMZCRXj5d0jir0k3Dv6RSf/Rk3rDS3jEepPctKX9P4rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HT2WUEH/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HT2WUEH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727855406; x=1759391406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pBafR90mHOZxMXMrtGmnNbM6ZuPsweJ1CyDXXOTW89c=;
  b=HT2WUEH/TWS7obiujSeNOonB5DEVZwjuMy5S9Rbyg5Ujpj26BQb5GVOc
   w100F47kC3Kq/bI4jCZQx6MWmYCG++lmaYmmq5cL8kIqpIWYwBWIMGgqI
   VBjGX9nv85b4f7ncfJthFP05qVRXBb0pI68fwPgxws7yNNwKwdDwWcFaA
   G/Be7Takz/bsdGJnKXJiLoJK0r2Qih4vsRHevKCUQBPc9s+ABNPu1v7wq
   IXQRgwsz80AqgOnn6/FLtDz2k4ulF56DrkEkggmDZCpb4RhzZvFjj/A44
   8dbEHKIhIDxgtFuRDispW5CmcRI5fP97yrxxX1CpW/zgRUeMf+X+bF77V
   Q==;
X-CSE-ConnectionGUID: RmLyb1zgRtmDxZxGkPoIzg==
X-CSE-MsgGUID: IxTlegeyTeyxgDmITKyoAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27145590"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="27145590"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 00:50:05 -0700
X-CSE-ConnectionGUID: IUWDT4mmS1KhrkAfiRWIFw==
X-CSE-MsgGUID: DdsrJqgSRg2TOWQPfkWeBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="73594140"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Oct 2024 00:50:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svu7V-000Rld-2I;
	Wed, 02 Oct 2024 07:50:01 +0000
Date: Wed, 2 Oct 2024 15:49:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17825/23811]
 drivers/platform/x86/intel_speed_select_if/.tmp_isst_if_mmio.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202410021538.rzR8vgtb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: 8453d1c1d4ecff553e6c5d7ef7671ab91a241f4a [17825/23811] Intel: platform/x86: ISST: Add Intel Speed Select mmio interface
config: x86_64-buildonly-randconfig-004-20240923 (https://download.01.org/0day-ci/archive/20241002/202410021538.rzR8vgtb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021538.rzR8vgtb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021538.rzR8vgtb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/intel_speed_select_if/.tmp_isst_if_mmio.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
