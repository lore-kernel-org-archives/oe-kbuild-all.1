Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D2B1A57E4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722523177; cv=none; b=khNbYxsG7DvVmn1AqaciHBxOqQ1ccT7lAr5/NwoyRalpBuGm/rCcDih2siwxsplLPAsNd5/XW9xbrrMH8c06gXP5Wx0b2IgWlj69ZF8W7Uzph+BO+iyRSZYurKgOLOkxY5wuZ9MOSPrpFywTZ6dSvsgNSdS3sFSXD3wpPcmeaHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722523177; c=relaxed/simple;
	bh=WEpqnJghvoWtnuC63ebz/aZz/aEkWcc0uIulPUtdzaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g6VLkzoxxbK4T7rOdxys9JW3eRKq0WPPiIMhpSRXufxBbnasx3KmfGdxpBQtDq44F+85h05XR9GIQahTaiIK2idnB4sNULbLcQA3zh8Qcu5bggvKNgGhH3P5q4S9JubZuOrzo+aYJ6q2H2wwF53uwNgNjj8tfrlxDupD1WabEhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7XV6f4u; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7XV6f4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722523175; x=1754059175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WEpqnJghvoWtnuC63ebz/aZz/aEkWcc0uIulPUtdzaY=;
  b=b7XV6f4uvTRZ9P7mwcJ0xK1TsvfV/ER22eNeRp6Fzj+IkRqQZo3468Mi
   ybw242IeTvJDD/u9XYLs3l8e8xv0dzcU+qTYk1UdzYaUeoUMBMGTzdzDv
   7+DyHKuiUWQLlxYn2EcG72de3fzqWovYh4FLahWelocezjaAMVyeyYkHZ
   tKG43+7dGzWqvkT9YFFT5ZG8sNRJtzicI2v7NljsldgpYJDCPKucxfsHI
   kR0/O6gp86FZ6Z96yzw4dszyFYDsuVC8Rpq3bMfVEVoAdJ/vRwh4p/5Rk
   Oqo3Iut2fw+LisQh7PlgZV8s+Z4ls5HoYG53ZCmHa4HRW/WI63g2fCS95
   Q==;
X-CSE-ConnectionGUID: QzQRspLTTSWVSPVR/bWSow==
X-CSE-MsgGUID: qckPfJ/wQOumLaqkeeS+dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="37944327"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="37944327"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 07:39:34 -0700
X-CSE-ConnectionGUID: HADTYOnZSAqWmHsFHBVc0g==
X-CSE-MsgGUID: 3idC+iJiSD28riAd+CEcSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59705878"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Aug 2024 07:39:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZWxm-000vf0-1h;
	Thu, 01 Aug 2024 14:39:30 +0000
Date: Thu, 1 Aug 2024 22:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, dinglongwei <dinglongwei1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 22383/23403]
 drivers/gpu/drm/nouveau/nvkm/core/object.o: warning: objtool:
 nvkm_object_del()+0xd1: unreachable instruction
Message-ID: <202408012245.IRmWDQQn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   12dcab98264cb7d9ede69cf67e579aa585d6e4b6
commit: 901dbb48d8a4f60af427f1ec67ac1247ff219f39 [22383/23403] nouveau: lock the client object tree.
config: x86_64-buildonly-randconfig-002-20240801 (https://download.01.org/0day-ci/archive/20240801/202408012245.IRmWDQQn-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408012245.IRmWDQQn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408012245.IRmWDQQn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/core/object.c:37:19: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
      37 |                 struct rb_node *node = client->objroot.rb_node;
         |                                 ^
   1 warning generated.
>> drivers/gpu/drm/nouveau/nvkm/core/object.o: warning: objtool: nvkm_object_del()+0xd1: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
