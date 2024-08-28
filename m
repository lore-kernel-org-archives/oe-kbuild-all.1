Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4C41AE87D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 23:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724888256; cv=none; b=EUeLNKEKQMWCrZ2ErXEcXnGrqcOO5vN5csbTfLzRbWIf2XGG+4obbkq7ee4CU37SfeCBQu6hqvCwd/PTbKrRmAgbd+jcrKAhTsXqOfz+lX47aYx6QvOzN02uW1SSqbugqb/fsBap5L+38XrLlDHsnb4otm97/Zc3Mb2N+n1iDJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724888256; c=relaxed/simple;
	bh=ZmUdwUA3/86+VINrkOjZtIFKanQqPqUAZ//v3LfFUug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gw7mbx57gIvIhMLYXM27/lcFIWm+NMelhZjUZVrkBKXZh1/XPW0TYeih3RemMLLatigoqHQf9sUPWCfV9P7G5GEvJyd9mRXK5bSgcIANBtbLiOzA60TgpsNe51gZfnOOteA+BV5d9+Qq5gaZ2M3YPqsBv1LxhENapW1CoicTFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WV3BrI9A; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WV3BrI9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724888255; x=1756424255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZmUdwUA3/86+VINrkOjZtIFKanQqPqUAZ//v3LfFUug=;
  b=WV3BrI9AYJYQ7uIVEqNiWeA561jx9hR2sgX5KnfxbZdXw/YaTruB8oOu
   HGm0ya0qhKQUnR6WBGgt63LcqjSBdSpFJOGjwRInwegBIDoQTZltfKGCI
   F9INddUN0LUDHtBbbjHPhcfpD3jmzoFFLYKSAbuAGlmkKmGibelV4S0AV
   iW4W3Ms5L2S4yIjafxJVQg2640v6UN1XirNulYR+vTE2qTB3Dj0nXJ5zI
   z7v09ichxRpndvqKTRuLo0w9YxLHat933eVrkFkwafvmwOi2z/K14iyhh
   Y+NGkcbcQ9yxUrwaRMQUN0r+tthQtPFZYzi6IiAhEu6Uui+HyA7ftFfp2
   Q==;
X-CSE-ConnectionGUID: 6KMgDKJZSBe5S20rgTAvZw==
X-CSE-MsgGUID: 9heB5UU8SraB4P8xCk+OwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23257841"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="23257841"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 16:37:34 -0700
X-CSE-ConnectionGUID: IwMh48sHRCyIqQFxdehCEA==
X-CSE-MsgGUID: ssooHOwqSkSbelwAKB9nCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="67531906"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Aug 2024 16:37:33 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjSEF-000LSO-1i;
	Wed, 28 Aug 2024 23:37:31 +0000
Date: Thu, 29 Aug 2024 07:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Zekun <zhangzekun11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21426/23581]
 drivers/base/regmap/.tmp_regmap.o: warning: objtool:
 _regmap_raw_read()+0x22b: unreachable instruction
Message-ID: <202408290700.9RGzzfB9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   46d28312ab3cc0cfe7e8dea2f41d22fe4ac35e67
commit: d98c83e735e83721d3f995fe2bd190cf8aec8d78 [21426/23581] regmap: fix NULL deref on lookup
config: x86_64-buildonly-randconfig-004-20240825 (https://download.01.org/0day-ci/archive/20240829/202408290700.9RGzzfB9-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408290700.9RGzzfB9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408290700.9RGzzfB9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/regmap/.tmp_regmap.o: warning: objtool: _regmap_raw_read()+0x22b: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
