Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB181E525
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716286941; cv=none; b=P73ZV1QjxckzBTdHWfHfBOzELaJbkFZbimoyBxKtgfNgLOfwRMinm+tiX8KwMtidXOaIhbi9ijlClaeAXAZn4mJxKnH8HR8tGNtD0YGayCizHm2hRKl7lmPHfn3+gd/lQ12oXJ5Q85Y7rK2UQECg3J6dhXdfOo1e6wDw6An5VXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716286941; c=relaxed/simple;
	bh=ZaJkp5YkjKdAu6CpuRbRHiy+A4OukP9pR8QBz7zDjSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c8prJWgWOO+nxVIQEz4oFT7Aas9/yPuS0lU/1q+xCdMqjFjO8cRcSZjyxVH6jYb0tJqGkl0qjqqPd+vBEH4yxg6V90XO21RrqZkF/KdhGHt21T5U3l+q+CC38Tu2b5prwwLkBGunAi0JCXzseatR0EZShMH6UMfN/J+fP303avI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lTizdroz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTizdroz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716286939; x=1747822939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZaJkp5YkjKdAu6CpuRbRHiy+A4OukP9pR8QBz7zDjSQ=;
  b=lTizdroziHjXnxnPGnmG+JLvoq8ld0ExJ3rV9KEJM4JcxECWTL6TAHrq
   hQtbrkp2FDP6Iuin2r2kWOuTAUqyCs6QLVjvDfkEXvqWiIfqKmN4H5D1F
   RzbWQUOlzZH+3AAe9w0WlNAQttX14LIrBHHZ5s6IAc836HuboXFFKXafo
   +LcN+6sT1kdqT/5MN8wMCnyWhLkjMvnomyNEO1cy3HhiDw9D8hfWlSxgQ
   DMWt5koAXni34TXrN1+3teCOIKY7Nm7lswm7XL8wE7fob34DeJFhYJ/80
   102Iw6rGwAtTvZgVOWXfsWlThcF+jOEPezDlBy2MbvbQHCc47W8dQq0xr
   Q==;
X-CSE-ConnectionGUID: srUlwlQCRpmLWd011XpvBw==
X-CSE-MsgGUID: 0coBIHgrRYaVmmdO+fyJMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12651107"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="12651107"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 03:22:19 -0700
X-CSE-ConnectionGUID: wBMCjd0+S0yJHc9EUWyFjw==
X-CSE-MsgGUID: oNY2fW/6SkK8GqwfKu7XXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="37253414"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 May 2024 03:22:17 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9MdL-0006HP-0r;
	Tue, 21 May 2024 10:22:15 +0000
Date: Tue, 21 May 2024 18:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Malloy Liu <liuqi1610@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21291/22450]
 drivers/spi/spi-phytium-plat.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202405211804.T84TVKIc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5708160127a606e51a136509cfe0a9448a09849a
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [21291/22450] spi: add phytium spi support
config: x86_64-buildonly-randconfig-004-20240521 (https://download.01.org/0day-ci/archive/20240521/202405211804.T84TVKIc-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405211804.T84TVKIc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211804.T84TVKIc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-phytium-plat.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
