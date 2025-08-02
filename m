Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B008F6F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 04:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754107833; cv=none; b=F0V51sEoYTldxv3aDjc+u+T3EII0KI7dLIssx2tgM/ZZOtdklu3G3tjhZ+cvitKgk75W+hITh7tgofjz1wvvVQrQchR1/7mS2bIQQ3GH4ylPYrsyLkXwb740F44AjFNWjkxbWPXy3P4C9bwoS9hiUmf+88vAKM3bQz0d7FSoGb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754107833; c=relaxed/simple;
	bh=5hnJ7FNlDJzWmHz+lQbTjXg5O2B+j4H6zKxq1GSHvEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BpmmNCgr/Fae6PkstGYwm+9Vne6JUW03tilPu724fX2fMWGp2I2LODAKwXp60jf2sDSNQq4iRf67krtsFfOKbAbR8Nn0yPG5gqZi0x1vmshuVRkGS6KSRqK5Imbmh8fVcReOsyf/LzXBMGV2LFevgO/QHFDbxNDfy+gCsAir95M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gCjisTbj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCjisTbj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754107831; x=1785643831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5hnJ7FNlDJzWmHz+lQbTjXg5O2B+j4H6zKxq1GSHvEk=;
  b=gCjisTbjGyrQqnAkZqHWIKcSzf0XS2znJBXW3cqKval9aMxdJ7XLXvL7
   jsXrQxT1BCKUps75t/J6vq8pc7JWajm6aXgdjwhdm638cgZjn1rOpOil+
   ylkkPfQvDGdQr/tgk1yoLGxGh7GZBYsIhkU0h3rrvGMhxgXVVTJe2SDi3
   mTXZgA6M7n/MLWt2JJoFOLvQY6xK89qBgd3MOCmdDHhsa5GDoZvJd/pZp
   TxRq3wkVgRO0Bl1oUGPADHQb/wlHlrcQ72uj/4vjSglzAkEGAxPk36uHQ
   Wq24VR/4Hv3QhxR8SPMyc1O/PNiEHPGItVJmSOSlY/Drei4IsS9bK7Q2B
   g==;
X-CSE-ConnectionGUID: 84fFhjtdQqKWNwIUD5AJVw==
X-CSE-MsgGUID: lkdIsjL7SVGgZNnx8zC1Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="74042810"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="74042810"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 21:10:26 -0700
X-CSE-ConnectionGUID: MT3LnpaoRDOiC065pBNt7Q==
X-CSE-MsgGUID: dbcSLhwhQoW3tT9QFXRFdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164063767"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Aug 2025 21:10:25 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui3Ze-00059Q-1x;
	Sat, 02 Aug 2025 04:10:22 +0000
Date: Sat, 2 Aug 2025 12:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/tidss/field-api 5/15]
 drivers/gpu/drm/tidss/tidss_dispc.c:624:9: error: implicit declaration of
 function 'FIELD_GET'; did you mean 'REG_GET'?
Message-ID: <202508021247.g5JjGPm6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/tidss/field-api
head:   8e7aa9647fd4168ea2115bb34ca99eade5b0c751
commit: d47482da8db871014f98b72967240cc79c0a6377 [5/15] drm/tidss: dispc: Get rid of FLD_GET
config: sparc-randconfig-002-20250802 (https://download.01.org/0day-ci/archive/20250802/202508021247.g5JjGPm6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508021247.g5JjGPm6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508021247.g5JjGPm6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'FLD_VAL':
   drivers/gpu/drm/tidss/tidss_dispc.c:614:9: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     return FIELD_PREP(GENMASK(start, end), val);
            ^~~~~~~~~~
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'REG_GET':
>> drivers/gpu/drm/tidss/tidss_dispc.c:624:9: error: implicit declaration of function 'FIELD_GET'; did you mean 'REG_GET'? [-Werror=implicit-function-declaration]
     return FIELD_GET(GENMASK(start, end), dispc_read(dispc, idx));
            ^~~~~~~~~
            REG_GET
   cc1: some warnings being treated as errors


vim +624 drivers/gpu/drm/tidss/tidss_dispc.c

   621	
   622	static u32 REG_GET(struct dispc_device *dispc, u32 idx, u32 start, u32 end)
   623	{
 > 624		return FIELD_GET(GENMASK(start, end), dispc_read(dispc, idx));
   625	}
   626	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
