Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3830C19DF66
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 12:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760704389; cv=none; b=GC1mVe0YXkMmId3Oe46EB9r1dhCi23qUT9xC2nPT72ODnr4L4lU6wkx7UTds3PUx+kV6goP4TuQUqt+eo1SWTsrodm22s5R5yQRq1YNpzW0LN2RQ11ctTvY1PxNiMRczJnU1HKfguI1Ot8Y3Xrzk/URsCzvxrvBG/SUSHYYEcBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760704389; c=relaxed/simple;
	bh=0vOgAsrxrjcg1rdz1ChJ58L5I/G4bfzrcD8WA8cnEB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SwJCmiDbumH76Gy8pUfk5Hl4v17qCt8Z3bVQmUicsdnM6VHlxtcrhI6d8aHlAadGlO0zvoVYBqMLM+P6LI+czd4GATWVORIPNJPHpuM2QqyUx2PV+OiChlK/v5wKHmh7W5a6lfbuz4qQuO9fdLwwVIhLVXNXnFm2MMasKD34rvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUlPnUVr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUlPnUVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760704388; x=1792240388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0vOgAsrxrjcg1rdz1ChJ58L5I/G4bfzrcD8WA8cnEB8=;
  b=MUlPnUVrDByKf2mn2nnNZpZlDuNAbcZ7iis8On+STKxJx9J7NNzEolst
   RDtTS7bv2d1LvvO0iG1ukn8Dzm9VnoE6ExUsEvMjdeLMzkJT1nCLVsmLR
   H1t1IkZadosyQLSEM7qoHTFTmBYsAxeAAqtmqpKYr/YM6KLM7woXTRg6s
   PXGYWlbivRVzzXpev7V8sVUjpo6PG2z5t8vvz/64DcDQ1OOAjpbUJmtZ6
   CQ7vfVQcV5YqUW8+OJKoWE3DbTi1V9zGvOlTV9N2nVKAJto2ejbKuGBHz
   DNf6CSQqAIMR4xRQWtgZw3kLddGFlj87RGlD1wkJZ3c8qxZjjyMnef17X
   Q==;
X-CSE-ConnectionGUID: TSw2lftLR8OwxwFsogJrNw==
X-CSE-MsgGUID: seV3fDVYTkehUTkeIQN0Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73197903"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="73197903"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 05:33:08 -0700
X-CSE-ConnectionGUID: K99UGNQAQuyzh6Kk6w2JKQ==
X-CSE-MsgGUID: +cgHu8hxR8C/+14f2hfIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="187132650"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Oct 2025 05:33:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9jdo-0005xX-1M;
	Fri, 17 Oct 2025 12:33:04 +0000
Date: Fri, 17 Oct 2025 20:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:ethos-v5 3/3] drivers/accel/ethosu/ethosu_device.h:192:16:
 error: implicit declaration of function 'FIELD_GET'
Message-ID: <202510172015.gYg0R8Gb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v5
head:   b0387da0b7877bc9e120bfc20df0c73623c596c9
commit: b0387da0b7877bc9e120bfc20df0c73623c596c9 [3/3] accel: Add Arm Ethos-U NPU driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251017/202510172015.gYg0R8Gb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510172015.gYg0R8Gb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510172015.gYg0R8Gb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/accel/ethosu/ethosu_gem.c:9:
   drivers/accel/ethosu/ethosu_device.h: In function 'ethosu_is_u65':
>> drivers/accel/ethosu/ethosu_device.h:192:16: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     192 |         return FIELD_GET(ID_ARCH_MAJOR_MASK, ethosudev->npu_info.id) == 1;
         |                ^~~~~~~~~


vim +/FIELD_GET +192 drivers/accel/ethosu/ethosu_device.h

   186	
   187	#define to_ethosu_device(drm_dev) \
   188		((struct ethosu_device *)container_of(drm_dev, struct ethosu_device, base))
   189	
   190	static inline bool ethosu_is_u65(const struct ethosu_device *ethosudev)
   191	{
 > 192		return FIELD_GET(ID_ARCH_MAJOR_MASK, ethosudev->npu_info.id) == 1;
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
