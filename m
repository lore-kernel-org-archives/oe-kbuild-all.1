Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594A923D7EA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 17:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759252108; cv=none; b=SzYM7XM5qNJEYMKLhNl9gEgrDD3bVoECGuYk0ToTXQa2x/VhmDbK5lNaGe8hvZRHg5Ij4HCgbF8L9U5CoMtvaqgqFOlqdHf1vBWlP47gT0BIC7DEePbjP6V7VAZs9Fsl+cnhZtODPOlzOORtfi9LGUjTVAX8gEb04z5iiH5alRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759252108; c=relaxed/simple;
	bh=tI9D9zFShQ5DuERy635yr80xxg37Is+m0QlYCkdlF6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tsMfup/8WzkPTpP7CgeK2nXJ4BIhvNNl23eV8EWG6sjp71XYwjR4p6+t0tt9Tb53nO+9wkJJrh3t3lUNWohpU4GJPdysIrJR7ud4x6n8uKodAMtmgBlPrCkYdQwZRjwNvXjw3OQDDtLLBzRH7PjdSU5axWj3vW7gvV/jKCO/i3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3ndSFjI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3ndSFjI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759252104; x=1790788104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tI9D9zFShQ5DuERy635yr80xxg37Is+m0QlYCkdlF6E=;
  b=N3ndSFjINvilR+P7MzHHjiPUoNNREaTw61wfkNVDDtB5tQ2dXkF+l0Jk
   2cyPFNaWCFmOldWSPEXWAoI9Su9F8USMSyaZunNQHIRJFpMMMcnCjtgOE
   ycToiM+TMzGbd19OEsYxNDzDVNBRgSb+W/QrCJLZuxds20rD5htaDvoph
   P6AHGQQBOkahR5iC7grJZWsJ/uuO2Vvj2g3LnVjltQ3WX98/On4+2HskO
   aKKB1uKNNYooNWviYl7Nmm7x73t1uv388Xt8cgzNEXfysKD0dwGHNAsu1
   6h3JE6050Pt5ajAZRfQ1mvnXrUy4YOAho5S/5DLF/HbWeRmdY3ZRfu/YQ
   Q==;
X-CSE-ConnectionGUID: BOff4mtWQVeXvtEF7rjdPQ==
X-CSE-MsgGUID: gQEkgy2cTyiDT6f5UeLasA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60727908"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="60727908"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 10:08:20 -0700
X-CSE-ConnectionGUID: lvkdjDRQTvq76IHaEhexfQ==
X-CSE-MsgGUID: iqB3Ty8JQmOwjxmrfNkqgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="178962198"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Sep 2025 10:08:19 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3dpo-0002KR-2x;
	Tue, 30 Sep 2025 17:08:16 +0000
Date: Wed, 1 Oct 2025 01:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.17.y 25/50] psci.c:undefined reference to
 `psci_cpu_suspend_enter'
Message-ID: <202510010055.kX7QCEnK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.17.y
head:   920850f32669833c7d393f69785ac16d0292a10e
commit: e3371fd24246953cfa1bbd5d82e5f026cc031a8e [25/50] firmware/psci: Allow specifying an S2RAM state through CPU_SUSPEND
config: arm64-randconfig-004-20250930 (https://download.01.org/0day-ci/archive/20251001/202510010055.kX7QCEnK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510010055.kX7QCEnK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510010055.kX7QCEnK-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/firmware/psci/psci.o: in function `psci_cpu_suspend_s2ram_enter':
>> psci.c:(.text+0x6d8): undefined reference to `psci_cpu_suspend_enter'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
