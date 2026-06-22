Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31BE3B3886
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 14:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139276; cv=none; b=BC539fDdJEQj8SKfp/SzCpSOk3vKtr7PTD2gL3OM0o+d/Dl+jOO5/bTXCrZ0c4rPnqyOr4yIHBdiXFylfnCldA+F72bLEmT5JMjdYq3t7nVmjObMLjJhtfVJ+d9Orf/Om+nG8TRhbfcLFYyXC1Aci/QNGzptNOk3hjvBEMj7/Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139276; c=relaxed/simple;
	bh=YOGOZGT+fz9bDKK6JeIhwZPwuB8vua4T74tNhohBu3c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WBl+oIk8PuCmtZGtkaKK5OD/asZGavHJjk3vSGth5RPtc5QmBOygv12c37P6/1kZGutgJs0WWUFz0PdqmAHX2ggY4+NH9Ykl7mTyHUaKjRCuocwcoqhYzN/rPvpHqYOOHMKKY8zCNcdDo9bk2dvS18xsU7fQFOMy9iFauedq9yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPYussvO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPYussvO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782139274; x=1813675274;
  h=date:from:to:cc:subject:message-id;
  bh=YOGOZGT+fz9bDKK6JeIhwZPwuB8vua4T74tNhohBu3c=;
  b=cPYussvO+1vXMBdOsUZ/0ZSsCGby5V2ca7gTIoqB7Zos3Nzw5JimBP2Y
   oA4RoTYRG/2je8xAMFu5KwC2atF3STeP3G9xZYdenIpx2TEE6mfrnEA12
   6pzBQ3m5M+63MX9o+um5LHEOya5nQy+pA9eS7WePsyJAiz/Ll+d7phKsL
   1qGf4yUuIEuFPRRun5OhGCfa8Uiyz37LTgQNtRpymEegOMWi5A01y79Re
   suiGMTTTdQr+UkmABZm3hOU2c8l+VIZt+BIU6b8uimi8nacjQamPvDUFD
   0zSoMhKoe/MQzXkCuBUB3FS4gQnmpibBuYO3HD5CKBs2+dGRlBFTGuyC+
   g==;
X-CSE-ConnectionGUID: pC/3XPHBSVuJfzZPrmxYFA==
X-CSE-MsgGUID: lXCktN9eQvmgXf/5d5fSYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="85421493"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="85421493"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 07:41:13 -0700
X-CSE-ConnectionGUID: BstmUl8uRwS8+qFxsnUmjQ==
X-CSE-MsgGUID: ez+M+L8kQqmfoGTPkdUtSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="272946746"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Jun 2026 07:41:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbfpl-000000001KX-0NVx;
	Mon, 22 Jun 2026 14:41:09 +0000
Date: Mon, 22 Jun 2026 22:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [jic23-iio:testing 36/53] Warning:
 drivers/iio/adc/hx711.c:90 struct member '__counted_by_ptr(num_channels' not
 described in 'hx711_chip_info'
Message-ID: <202606222214.0QOs1Ug4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Piyush,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   cc746297b23e89bd5df9f91f3a0ca209e8991763
commit: b0949f79b8ffa6f02c713cc2b14a16d8f32c08cc [36/53] iio: adc: hx711: introduce hx711_chip_info structure
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260622/202606222214.0QOs1Ug4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222214.0QOs1Ug4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606222214.0QOs1Ug4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/iio/adc/hx711.c:90 struct member '__counted_by_ptr(num_channels' not described in 'hx711_chip_info'
>> Warning: drivers/iio/adc/hx711.c:90 struct member '__counted_by_ptr(num_channels' not described in 'hx711_chip_info'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
