Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2031D9A48
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 21:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730841052; cv=none; b=InF9B6H0bm9BZcXos7MU3QZopx/bOyjYLYYBmdvwEI1cqhltoO2gKVIHh2bCa0EaisGSAi4mNDgkySL/BSbd19tSbY1w5Sek4iYf2aae+bNyHWAAxrzVCzAkJjSwGaseo6KWm16kdVa+V1lvczRIuTCeHV1Jxz20qRtluKRHkeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730841052; c=relaxed/simple;
	bh=BW7NF+gAMoXOksWcxQfrEYm76yZ2HMJMrUaJoD3+FlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RJbBSt6fRDWjqCuLg+YbP1cnluKBC6xf2vm1gB2zz6S2rypWbzCFI4hmVK9X4CB9RyM5ubXr3QSQ2pLW2WokbNJAH1pyMd18V1U0FzSDXVokQ8yy1juEckLG/CkhFbHwcYizYtA6qriBb/gaAYSXfSOuOsPKgXjcm9kmjfqvfB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QI3E+CvX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QI3E+CvX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730841050; x=1762377050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BW7NF+gAMoXOksWcxQfrEYm76yZ2HMJMrUaJoD3+FlA=;
  b=QI3E+CvXxvRze/R8oLkiAtMjmOB2LuW6MmRZ6Uk7jlycpYRmCR4PbN1Z
   i5Maj0KVgTNCljXSgJZds0/Nqv17edi4vdoiNOUdQBqL9lWqlvB6Azsu/
   /PfNs1sWxWlgJ7DN2lqIPRnJstLjqEuYqLNuNRRQ5EcRe+bucUFIQClPx
   sbnazs8sGGnCiDRQoPaWV9HtVsZZuM7lFow66gT/vGlfk+TWMHZRVdT0D
   7DwiXfoI8IeVqhlnVEvalrDUhUBdIxlA+UFA1/0+twTjhc0Qi6TuB27Y+
   XEThGOGmxvY6321M8lf57s5P/+1F+993GsWHwnNfJjwcZRIH/DUHj5FqZ
   w==;
X-CSE-ConnectionGUID: hmQ6F4+iT82Ae4o5z3rJjQ==
X-CSE-MsgGUID: v49fyeV6QFi796pIed400w==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="34399004"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="34399004"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 13:10:49 -0800
X-CSE-ConnectionGUID: LiQWL4XZRQOVpK7GkJZdNQ==
X-CSE-MsgGUID: bbYEPAV/TU2G2Wp087YPOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="88667333"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Nov 2024 13:10:48 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Qp4-000mTX-1X;
	Tue, 05 Nov 2024 21:10:46 +0000
Date: Wed, 6 Nov 2024 05:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1218/1218]
 drivers/media/usb/dvb-usb-v2/anysee.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202411060729.yZ0sshJi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e33ed48bc600febcdca9e71e43cf224934dadc4f
commit: 56bc1719652e7a937bc9856f76f0c0fbf8ce1b23 [1218/1218] objtool: Support GCC 9 cold subfunction naming scheme
config: x86_64-buildonly-randconfig-006-20241024 (https://download.01.org/0day-ci/archive/20241106/202411060729.yZ0sshJi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060729.yZ0sshJi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060729.yZ0sshJi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/usb/dvb-usb-v2/anysee.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
