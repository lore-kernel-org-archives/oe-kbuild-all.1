Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374BE18DB04
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 06:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741244265; cv=none; b=uqrC86XHhUb/jv+H5sE4OGAuHkp5axxR4/9AFKiH/Aow7VNT5WO/geOsuBUfc8qgSyNXSbZ6zpL3+wvews7AIrviiJsqUHY2c3eUU6zy5dYa8ox8Zk8F7v/hmnCAaPPTJW60KP7JULsQ3JocweGzUnUC+g/7vqcHS3NB3nWeiOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741244265; c=relaxed/simple;
	bh=J1ik1N4H0ZNpSITcWC7EMUpb+Q47ww7gWZSnWHZJUw0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ISb8CKnqVts/mQYH/Ub0tq3nZC1BdtsEvKnJGn/2VStNi3NU6P1IWpyKH5zDL3/fOzXZq7Rrz8nJWKc0yPRJ4l4joHgfBg5cEWycNZnlYwlq1dW4/PE/Pp8bCOtnCrl9p+xkho7TMEXgQTEkNEwwpuP0/b/N6LKV4sAet/6bHLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4+VuvRa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4+VuvRa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741244264; x=1772780264;
  h=date:from:cc:subject:message-id:mime-version;
  bh=J1ik1N4H0ZNpSITcWC7EMUpb+Q47ww7gWZSnWHZJUw0=;
  b=Y4+VuvRaDqkvfGaqZC1TsgIB0+hWdp7hQEQXDv24mZ0y9HVdNSmCWM/r
   hWcWHg/eaV3wOc/RBYiH3mKFyXK0sjKbUN2nyuXarOBQvFu88Kw00nivO
   OrW+MAChjZfNcfm1fVGTqRCQa60SxKngrJQQKxjV8qAm9v9m0+W7jDSNa
   U5oKIAOfmt/MBPu+b5N2dLiR9OkCyVTwHMqvpdz4xucVV0cfXQ+QLLLAc
   5EwiQIPbRNBAgbUgOdP63eYWq5kn7q//92k7As5MidiGNTTzggWMnhFV2
   NvsbQ7HDnsgFk7Gj8QdXJg/6hLdy2IbkTG/unCS7APnR6ghkT2YFriO9j
   A==;
X-CSE-ConnectionGUID: 861W2m5jR/GDa6LLrZOmzQ==
X-CSE-MsgGUID: lnhZFMUNQNa7EtjOqKUJWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41947967"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="41947967"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 22:57:44 -0800
X-CSE-ConnectionGUID: mCNEfhyURa6P4Blj1eVrhg==
X-CSE-MsgGUID: kOibjBKZQHuDrkn/UDqAMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="119624384"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Mar 2025 22:57:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq5Aq-000MfX-2v
	for oe-kbuild-all@lists.linux.dev;
	Thu, 06 Mar 2025 06:57:40 +0000
Date: Thu, 6 Mar 2025 14:56:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/base/core.o: warning: objtool:
 device_links_driver_cleanup()+0x344: unreachable instruction
Message-ID: <202503061445.jsVVORwb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 8a4b32691120b8fd6b029f5ad37d742a97ec82c1 [1/1] driver core: silence device link messages unless debugging
config: x86_64-buildonly-randconfig-006-20250217 (https://download.01.org/0day-ci/archive/20250306/202503061445.jsVVORwb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061445.jsVVORwb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061445.jsVVORwb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/core.o: warning: objtool: device_links_driver_cleanup()+0x344: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
