Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB0E2E40C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 02:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711680035; cv=none; b=GTTzPNM4G0ZCyufKD4pToenLqJMPLca+MNHu3Bujcwp4SjGU0K1e46I89Z6kw2nYTjnNaYSqdrBZjWrPaiwd5z4tidzBpqJwF2i+yE8FmGF7hKS6xSgSJWrXjGvvqRUaQEw11uaqFphbnhLFdKa6NbbEzRd5JEGQQhxA2RQI+Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711680035; c=relaxed/simple;
	bh=wAjNaR5aF7/Bs+Edpnaw+cc4ZIEpyeJBjvTUJ91s468=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AMe7zL/QSLdR/rfh8THG5DQ6qYAB0Ti++aM2Hk0wvsyPX5i7HVfHF7lg1kfUkMAjiLMjbejPsPoSoCcIXf5aF8kpfR4YiGVw8D7nzmk6MYewfmTjpkmyQi8GfipomfgKxNtXBW9ScrJO2GBLXmUgy145itOl3DvlVxxlM/Vft8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gql8T8nJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gql8T8nJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711680032; x=1743216032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wAjNaR5aF7/Bs+Edpnaw+cc4ZIEpyeJBjvTUJ91s468=;
  b=Gql8T8nJsLOyKJHCLDPOIahrNxTxFWtQprjSj9vjJ6/kmjFxv9GwISoE
   bScSH4Bsv97goNXtggyYQkUOyC9QCByGKQT2YDajAM0JRE4MVEhAp+yu2
   aXQALpFyZJAXvVDbIi2qx13JV1qk1jreu8nz5AbpOgbbQ2BJ3NOxFFMKF
   SqOEUZ0/zQB8uOMWRkwlWkDbbqKJZdf2uGUZXM1R669CwuDihczpDg8HZ
   y622dGb9pbamepk/NIpdcQ7w0Xe4dxJzW3Isu9dHXz1YujK0IOMmeSyuQ
   xx4hlP3kM2Mvc07t5ZOMH6I248w6g3PANovWAGYHri3N2SV0AHXw20OBP
   w==;
X-CSE-ConnectionGUID: xiT8D7TsQcGV/NLJhC5ciw==
X-CSE-MsgGUID: uq+s8gZpTW23/VkVq7GHwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17420364"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="17420364"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 19:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16677835"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Mar 2024 19:40:32 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq2AP-0002mY-33;
	Fri, 29 Mar 2024 02:40:29 +0000
Date: Fri, 29 Mar 2024 10:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 12/24] warning: unused imports:
 `error::Error`, `error::code::*`
Message-ID: <202403291033.Mkb8q0hv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   9f4ea12e8f515e38ba593b149a6c196d795f99c4
commit: 0d19788e2310a8f2db54f325b3fb7bd7c10e4cfe [12/24] rust: add device::Data
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240329/202403291033.Mkb8q0hv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291033.Mkb8q0hv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291033.Mkb8q0hv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused imports: `error::Error`, `error::code::*`
   --> rust/kernel/device.rs:11:5
   |
   11 |     error::code::*,
   |     ^^^^^^^^^^^^^^
   12 |     error::Error,
   |     ^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default
--
>> warning: unused import: `fmt`
   --> rust/kernel/device.rs:22:5
   |
   22 |     fmt,
   |     ^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
