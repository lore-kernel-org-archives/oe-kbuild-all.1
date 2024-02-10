Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2215FEF2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 23:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707607729; cv=none; b=CCnDxsrrC1xrXqjhwC9MBWHQC2ICXOtIfZo5JJGPjBd90NpmWShB9LM2aYMYTTLYdB3ge8Wr89fFDcw5UwzBtmikEhOIfv+1D6exbCJVlmCmJtJo5kGoarJGkZAum2dmafjioDJUDxuprdo8v0OnLWjVVRCT6jtAPMWiTqC+j3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707607729; c=relaxed/simple;
	bh=ZTNK0sLhbjDIS2Vs5ni+3wXi8IJDp3nfMueWp8AbPP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kdd7ypf5l2NJKxICJifJxXOhlmbPNN7J2Y84iIbLHMgzQw4F++wzN1th4gSEB0ZxtbiP+RlDv537uaC6sM+WTmk7Hpp1y1Q5dURcwlltF+A8xos72zthoy4CacS/+la+xUs1iGfsjar+P4tpY6Q2lVYm3/raVtS7toiKzGzq0tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFV+IOUF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFV+IOUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707607727; x=1739143727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZTNK0sLhbjDIS2Vs5ni+3wXi8IJDp3nfMueWp8AbPP8=;
  b=lFV+IOUF5/8d47KBl8W0nMJYy+X+j7rs3od84B+xxbeWOuKnEiuHE1Nr
   ADUN9ApBp5ugX5zdGCakItbeJy/o4g6l19nxv7U971iO2b4PHdatCxVPm
   52zWM097bhl2ntoBZcgKX0atyOVC0/+oEhh28OiuFHEXMy3W2gmxT5B8A
   55BvU2reyhxNlXlJB4mcfpGpM2i0uLduvPGoIvf0qhluofbJo2phjNB4m
   83bW3ZWJjZ9O/+JfMrulrM0pGNnToCiF3qcTDatcyI3OBjrlElSZICnSh
   rRmPlKXinBU7dXHeviXIHT75cFIWGorctLmEU4oOKtZl3XVEkyilh9ItM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="1477561"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1477561"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 15:28:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="25471586"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Feb 2024 15:28:41 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYwlz-0006BO-0s;
	Sat, 10 Feb 2024 23:28:39 +0000
Date: Sun, 11 Feb 2024 07:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 9570/21625]
 drivers/scsi/scsi_logging.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202402110720.fVhD2BSl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7efcac7603953bb58d80041f410b079378b5174c
commit: 63b053c4efdb2e27f350bc9c1db4fed08a30801d [9570/21625] scsi: core: Reduce memory required for SCSI logging
config: x86_64-buildonly-randconfig-004-20240205 (https://download.01.org/0day-ci/archive/20240211/202402110720.fVhD2BSl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402110720.fVhD2BSl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402110720.fVhD2BSl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/scsi_logging.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
