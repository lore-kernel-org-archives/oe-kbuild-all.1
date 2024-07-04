Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DC5FC0B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 02:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720061057; cv=none; b=rziKWEPxqRYk++foKPjmMlAz1PlPaxurI0pHrP8pkiLsafblbnkLiFzHDIKLZc1fewCh6uqKLV6vQaHzPuoGX/lAAj8JUHkrwbMGm3qqWcNcjmEDUHtRyc7oTd21hY4pYcftoohFBamVKDtI85eg/m0TQVRUYZYCYfeNLtH1+OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720061057; c=relaxed/simple;
	bh=6w61LsO1NaJb1M3/Po/b5KVK7ORdY3Gdx0sypFMxeKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WtYp9VfgGqlPUXTOwGPHF2yZx8KXCShBsnkOoAw5EGORjM7N2XD2jrtqsMVQQPhEi+X0VCa03VB76AG9RZ8RffbISIQl44m9Dx3/td4S1n0lYw0FSU8aS7Gcvom0POFtYiFSybSxwd3hz1IKsC5eYaGIT4/1V7alPDeorVPB7i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4/pDux5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4/pDux5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720061055; x=1751597055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6w61LsO1NaJb1M3/Po/b5KVK7ORdY3Gdx0sypFMxeKM=;
  b=V4/pDux5A3yNTlUYe7Yz/hLdYHW5nmcM7CtEjN1bYYOy37RyW93Sir2n
   WROThI9By39T+jNoUOk57REUt55jMQ3U4VULnjcr5BSpHbXB5skcXg4Lq
   6vQ7HrX44hPZLxxGZ/kRAeEfIt9sW2E+Pp0beTEKi+yNcuA58TCn39Mki
   4KJU6EWGVT9HkpwsaDPDs36zX0j9NAbY5+pOrZZtnRqswRavG1wd/xk4d
   9buGf+HyLFbFjjC2RYeO/rUe4KC0g7OEnZLRRM4LP2PksZTd/+oHde7g8
   tkHzq9kx8mZZ/FxvJiS5vYfER3GkYJDW6qrwnXn+43bihHvBolzbHBtq8
   A==;
X-CSE-ConnectionGUID: IG2ZhHEmTcyPDvDIdu8eyw==
X-CSE-MsgGUID: 8hMgaRcKTEClvul4xAOKXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="27921505"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="27921505"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 19:44:14 -0700
X-CSE-ConnectionGUID: QxH2eUDSR/mNA2x5g0+M7w==
X-CSE-MsgGUID: NhTXM6bsRSSIbnxsCQVtkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46239249"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jul 2024 19:44:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPCSB-000QSM-1y;
	Thu, 04 Jul 2024 02:44:11 +0000
Date: Thu, 4 Jul 2024 10:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 13/25] error[E0425]: cannot find function
 `free_cpumask_var` in crate `bindings`
Message-ID: <202407041055.YnpcrqwG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   fc96c25e42aef96de62122e2c94fd81fab04a35c
commit: dc75de8999bf63494b76d71afde92122985c1f9d [13/25] rust: Add bindings for cpumask
config: x86_64-buildonly-randconfig-003-20240704 (https://download.01.org/0day-ci/archive/20240704/202407041055.YnpcrqwG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041055.YnpcrqwG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041055.YnpcrqwG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `free_cpumask_var` in crate `bindings`
   --> rust/kernel/cpumask.rs:80:32
   |
   80 |             unsafe { bindings::free_cpumask_var(self.ptr) }
   |                                ^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
