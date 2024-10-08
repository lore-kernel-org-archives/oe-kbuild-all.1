Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EF67DA6C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 18:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728411486; cv=none; b=MXsK+D+/iFYyTWSCtf4bN3AawBW/7E+KpZkvr31XrEb3PMPws9WLAeV776m2RxfC5b+Mk3ka2TevlAgfpbKNyeP6V1IcSjNc/LLVnQO2f/aBRui8UuJYtNxs3/QaZN3CRtOcOSjxd3je215HnrQNe9K0xXxjvcRWwnHqNZx734A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728411486; c=relaxed/simple;
	bh=/eHrRZ/wUq2sTy5ncdeXgjmwc1TCOc3Q4OB5ftCqXP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JaV4nN8ketbHLlUEgFrg04PDxo0H5Nbk+vcVLkG7eiwCuDuUMEOW2R+Cd/sX3jfBOP5apn4Vi0I2KUTDoNutU4nT+2GWpJdPt70zMukyg3zzmTzn17fbGYArjfnlF9lxIyquzE6SSjWXgiPUrA/PcFLbQJLthFb+p4DyaeC5KAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDUrk11o; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDUrk11o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728411484; x=1759947484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/eHrRZ/wUq2sTy5ncdeXgjmwc1TCOc3Q4OB5ftCqXP0=;
  b=fDUrk11ogrtrbIN3z59niekcm9KKSZ1BpcVUMQd7SLhaOlHylHBuNOcl
   Hlw9NHEuMsaWjAsyoqwG/+vArzeFI6O8liQm8nHompM1za4uSjtmnG9KY
   GWidmHpp89Vu/uuM6ty/Nmlmn+3DOoLmigGS/pd9GM9T7/aXBQAfxasx3
   Th7rHseK99WAHtFtuda4cPF34otkY+J+5uo1sW1vQWjzi+ONldUCei6K+
   4svzf729zZhC0aceuL/Q+n1uzng8Uue1vUE8coXN8QYRu9yTb7R94uMio
   OhT0QJzmM3UBqbgSMA7q8X3+SG6mP5ezvn0ryFOW8KkyTtz85h2ggCAa8
   w==;
X-CSE-ConnectionGUID: NhWTSdOoSBarbNuokCG9WA==
X-CSE-MsgGUID: nMiNCOlTT4u9DJ77zAHBjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38292532"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="38292532"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 11:18:03 -0700
X-CSE-ConnectionGUID: tocgxxgbQmao1oSJbu315w==
X-CSE-MsgGUID: 6j6J1wCYR1SKPum6v4a5LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="80524999"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Oct 2024 11:18:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syEmW-0008Eu-1n;
	Tue, 08 Oct 2024 18:18:00 +0000
Date: Wed, 9 Oct 2024 02:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 14/14] drivers/perf/arm-cmn.c:356:15:
 sparse: sparse: symbol 'arm_cmn_debugfs' was not declared. Should it be
 static?
Message-ID: <202410090255.0Jk766xI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   e508fa9bacf1f9644be2f1badd107e0e8790055a
commit: d2cfc10a38e4a45765fc93227da9a5826fba3734 [14/14] UPSTREAM: perf/arm-cmn: Add debugfs topology info
config: arm-randconfig-r121-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090255.0Jk766xI-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce: (https://download.01.org/0day-ci/archive/20241009/202410090255.0Jk766xI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090255.0Jk766xI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/arm-cmn.c:356:15: sparse: sparse: symbol 'arm_cmn_debugfs' was not declared. Should it be static?
   drivers/perf/arm-cmn.c: note: in included file:
   include/linux/io-64-nonatomic-lo-hi.h:38:9: sparse: sparse: cast truncates bits from constant value (8000000000 becomes 0)
   include/linux/io-64-nonatomic-lo-hi.h:38:9: sparse: sparse: cast truncates bits from constant value (8000000000 becomes 0)

vim +/arm_cmn_debugfs +356 drivers/perf/arm-cmn.c

   355	
 > 356	struct dentry *arm_cmn_debugfs;
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
