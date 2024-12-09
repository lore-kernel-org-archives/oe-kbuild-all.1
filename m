Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9587E233151
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733766206; cv=none; b=gnNeuQsD6t/L4aq5pgFj0xc3SOOrclLJmDM4oJaOVS2aHi/DbLo9vaQSDG4WYg5v9zrEJ31x0V0CDK8XlaA1HDCK0u6Hfp26oGnJPclojHgq6HuWcXNgUECa+7EH2ch/f4S/Azu7/X9inpHTvv3lYMawEf2H5lRqe+Wbjpw6GYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733766206; c=relaxed/simple;
	bh=J18g49BqTzch8Yhu2rBZI0yVn8NmDJzzl63DsmAqVSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=us7/dFTnGOjcw6HjpueWvCRCx0y3aHUekd5msjhZPuQwwKYsCNNjOrm3boJ3zvDea5AdE+1K2aEKd4QgttdgvP4HMlH1p9aR6OY29CSvW5zGd3hYjXuaD4zjCkNe4oCLJpX/KaIY6V8H5KcfeVNqZxzfbEx1Kk6ugjbswUAiy7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0EdZ/Of; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0EdZ/Of"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733766204; x=1765302204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J18g49BqTzch8Yhu2rBZI0yVn8NmDJzzl63DsmAqVSc=;
  b=O0EdZ/Of+Oq2gqumznyliPzUmfZsPIFxEJ0+cQoZSwGRLMTrkY9D9xr/
   Qi0C4hxRhd6ViOkI1j5dciepyLIsJqP0ARLQ3hTKntmzR8+LuEuhWzdWA
   yW11XgUaNYzGEtpa2kES20bWiC7RCzFFrzPhPS8rdNxprAtaqSXSb3bti
   AK9OLOj29NCN2zBv4Ya/k1DpeWQ9o0nDWX8y9GHQt8tZgLysvenJnCrAe
   KiQjr6aKxf58gKBfTcMosqBxYZU5kNLM1C4LAoOHR4adrC0Y+/YRyRhox
   uObFkIfjxC1IpgvPYpHlVN99HFQ3Ut2XnvecNzRssBwEHGYn58sOS/9+a
   Q==;
X-CSE-ConnectionGUID: abgxF0N7Sf6/8wr3Z9bn8Q==
X-CSE-MsgGUID: mTY1SQEkRVe48hvd4aAE4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34321470"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="34321470"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 09:43:24 -0800
X-CSE-ConnectionGUID: 6AGFuUf6TYGH4YqkQZXZ2w==
X-CSE-MsgGUID: ZKx6jZ68TR+PAGjzcTRNIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="118390833"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Dec 2024 09:43:23 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKhmz-0004fb-0B;
	Mon, 09 Dec 2024 17:43:21 +0000
Date: Tue, 10 Dec 2024 01:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 11/12] cc1: error:
 drivers/media/platform/mediatek/isp/isp_7x/mtk-hcp: No such file or
 directory
Message-ID: <202412100120.dnuhV76K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   87f02bef3628d61ca3d6598a6572270dd9452ea8
commit: ee0941e8f5004aa3f8190c4d1bbbea2837aac4a2 [11/12] CHROMIUM: media: platform: mediatek: isp: remove the hcp driver
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20241210/202412100120.dnuhV76K-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100120.dnuhV76K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100120.dnuhV76K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: drivers/media/platform/mediatek/isp/isp_7x/mtk-hcp: No such file or directory [-Werror=missing-include-dirs]
   cc1: all warnings being treated as errors

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
