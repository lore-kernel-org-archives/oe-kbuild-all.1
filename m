Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6334126ED51
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 20:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762373060; cv=none; b=oK1MMG05s/sY11l5oLKXJ5wWOC/xT+K+T7S25fk26BvEA/Fu89OMFXfk0o8++UMQ1ifzz+n8CaivajOCkXkvZm8Pwo8nt16eV8J/8qlVQ5GWFqY0cfRYa6afzIO996C3hlndx7hxWQ5Z7k0d4FG55dps4g7uljc7KSkltEQFC9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762373060; c=relaxed/simple;
	bh=oKgZztT8f3W6MWiN/zazhdSsNokeNyr7xswfaFkLjjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V0MpVWeZSwz3VOo0nYv6tTdkDRi008xpj8QBMwAt0LDjVnw/jt8ec58eMAxl8Zan/vNMkhzbWhql0NUmb9oEf8+ypK/QLX2fU4YQHvNaCpNF8VW9ebLFjmHLmTQZd7zF5IhAMrbgR9zrfZiqlGGGrzF2x5ZW6H3/n5m6BgLxTbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYi0nQAF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYi0nQAF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762373058; x=1793909058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oKgZztT8f3W6MWiN/zazhdSsNokeNyr7xswfaFkLjjs=;
  b=FYi0nQAFNvPsavSsv9gG8VZzU2BUJHjQcWG4r7LMnY+4hnof98AV1q/D
   r6Xj2QCq0e9zWRdI9ztfyZ7b3x+tJui0uh2XIrIntOAl97ghd3+HaI3w9
   PLRmc68U+IFIG7vGV3+UvEuxRS9ECTY1y5ijvMfQD+TFOH2i1EBY47pnE
   6HOIlgZ4bGHilE7Waxxl8OLk20BYPJBxKv8+Uq73r1qg7Aol/BSQmAzaY
   bkIhU6MmGvlr890RgFLilLCoGTMf/9VJusamERdSMd6vvq1f8v6lPUEn7
   W8Fx8+Puvwh1xZZgw+4bCHbt40JXR8u0W/4YwVN8SHpq8OCjbcIPXJ3s3
   Q==;
X-CSE-ConnectionGUID: YVYtdLmwTnOp+M0UXETYgQ==
X-CSE-MsgGUID: EiiGP0/RTg6jE4rUSyZ/3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="81902442"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="81902442"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 12:04:18 -0800
X-CSE-ConnectionGUID: 0vst0Mm5SsybWmFpKP3FLg==
X-CSE-MsgGUID: oULZbMQ2Rf6qukV7/6GwZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="188000202"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Nov 2025 12:04:17 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGjjq-000T40-2V;
	Wed, 05 Nov 2025 20:04:14 +0000
Date: Thu, 6 Nov 2025 04:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 183/183]
 drivers/cpufreq/cpufreq.o: warning: objtool: cpufreq_update_limits()+0xcf:
 unreachable instruction
Message-ID: <202511060354.ug5T0aym-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   b632be2a7073355baca5794f6c9a31d4b104ba8b
commit: e8c628ec2f611229175752b43446bac9817f3311 [183/183] cpufreq: Reference count policy in cpufreq_update_limits()
config: x86_64-buildonly-randconfig-005-20251106 (https://download.01.org/0day-ci/archive/20251106/202511060354.ug5T0aym-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511060354.ug5T0aym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511060354.ug5T0aym-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/cpufreq.o: warning: objtool: cpufreq_update_limits()+0xcf: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
