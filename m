Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1294014A61A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 22:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719356248; cv=none; b=i/O7U8y+4Bqz2tIAE7ZyTV+X+VTj96bK2ypUs7AHSOtQBSfhqDUwuf/iCZq291Guf9N7tfn0OqieNA6Mh4SdZLRCss2c+GyMnj7VDk+FWdNyKiShKcMjMTO6lWHVSEgo3o7o1Pp5qga/dUnxiHh9WFDZPAWpiRzP+44fvdw0CbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719356248; c=relaxed/simple;
	bh=0+9J71YVCx2cW7bjNW1kLWJudHmtV0bo9Ig6CiSdjkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=idvFNGGVRapPPunf3JVdkl558C+annQlrd81d8gVn5JqA/meAdztFXHM8aX2FkCSxUil3oOS2igj37HX8idqk1sIF5FZc2lpaD9bkFSMfHgBm3BsEl2EtyrcKxoV4ZNGB+mLIEHcyZOphJn1rxu11dai8U4iojjmo73i9cv15yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRcm42oM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRcm42oM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719356246; x=1750892246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0+9J71YVCx2cW7bjNW1kLWJudHmtV0bo9Ig6CiSdjkI=;
  b=MRcm42oMkduL+NbWyyUH/SSapHtkhtqNz370O5WJRrW8os5B8RvLu8zz
   ThsEn5xKZkdHsR/rm9bXzmC+pGpeshcrh/Tzrc7oRUhTmdezbY23FkIYv
   MOtBwPKk0DYsZe+rswUwuNYyxSJiOiB/Sgeqt5Y6dyKGUyddgxLK7Ugju
   oq6ipjzI+VlmUi1uKIB0QXabF9fDIF3urkXQrZrm6/VWuiM3w/yX/oXfn
   EIiHnJSd2crpmeQoeShJ/gdV4DFMgSBkPVFAjYcn395ZYYQNZJxC6NwBM
   iF6hu4FDDwgRQa8cG5I4hJEgvEYF0qP5E/TnwTQRu2gz9JBUgTCAQxUAL
   A==;
X-CSE-ConnectionGUID: Y9F83wgKSMGrYGj54Zgv5A==
X-CSE-MsgGUID: 6kYy7pRoRf6j1eEiXxwuOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="33938006"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="33938006"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 15:57:25 -0700
X-CSE-ConnectionGUID: nR5vq6VQSlqIkJ81yIzj2Q==
X-CSE-MsgGUID: tiQSCJ9ASgK7RCrBrT1/Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="48247186"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jun 2024 15:57:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMF6G-000EnC-1s;
	Tue, 25 Jun 2024 22:57:20 +0000
Date: Wed, 26 Jun 2024 06:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7182/7880] kismet: WARNING: unmet direct
 dependencies detected for VFIO_MDEV when selected by CRYPTO_DEV_HCT
Message-ID: <202406260601.Rk1ubQvH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ca7064b2308b42201419e17b030e6a9347be29cd
commit: 346dc8c7ca8d21796c3ae7fbc1cd7bfcae4eddaf [7182/7880] Add mediated ccp driver support for hygon crypto technology.
config: x86_64-kismet-CONFIG_VFIO_MDEV-CONFIG_CRYPTO_DEV_HCT-0-0 (https://download.01.org/0day-ci/archive/20240626/202406260601.Rk1ubQvH-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240626/202406260601.Rk1ubQvH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260601.Rk1ubQvH-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VFIO_MDEV when selected by CRYPTO_DEV_HCT
   WARNING: unmet direct dependencies detected for VFIO_MDEV
     Depends on [n]: VFIO [=n]
     Selected by [y]:
     - CRYPTO_DEV_HCT [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && CRYPTO_DEV_CCP [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
