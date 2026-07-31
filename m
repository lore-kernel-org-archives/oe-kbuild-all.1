Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F43431D372
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 09:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785490875; cv=none; b=eyFx0QdG1NtAIFuyFbcKVUKwDsk5qh0VbOkhOnXTMNFZwM9+HE5ovHMYS+gmHxCv1RQaZKlu/gaU6V787Vs8eyDwZacisC2nB6V6YLMTObpO0fO9dvccu+S2wAMPuqZlFNjMpzWkM86i6U4JQm8mrSsYN97gKoyGgH092xdpq44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785490875; c=relaxed/simple;
	bh=ptofUNg7T3DCSUHGRRGljmQe7DKaHcYrXY6dnCyJUEI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gv8qzRTaPW1BtIVrJluovVTreKiurGqMaVGJYYxujYf+BcSEgQby+8FQc9ca1EbXvxSZRRgvkcWsHpr3/5TJJPcgfBmJF/w6lqaTbVkrESz6n3hW61SaKuK3hiTqI3UBPHy0wcqtCqni1mv/F4VkZHOBSVW8tTs7gsg04W4WBnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAd9sM4f; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAd9sM4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785490874; x=1817026874;
  h=date:from:to:cc:subject:message-id;
  bh=ptofUNg7T3DCSUHGRRGljmQe7DKaHcYrXY6dnCyJUEI=;
  b=eAd9sM4fe5iouz5dJwMKar76cVLWcJ0fLlG7NJedkr6jHqybTw7WS7bZ
   EgK9eP0Zm0DJ++OB3qd+oRx02q3cc3r1QfVz+VlHT8L4sc9d0moBq3Egk
   EQyUcTIvcwyrzCw9zkhOHu3EzmMbIm86UcPIsyLEr+2wlmklRqH9gI+Y0
   hlm9HaYmlG8G6fqSHqknnDkYvjqyeXYLb77Z7ncMQqv3I7y1yRDL+E7Nw
   cvImyzB7apnyHE/IjhCPgW9XghokKQ6z3UrLa2FDsAV3JUckWl89E7V5c
   ePyXuHUjMyrfVmsHS3qFREUJgdlkm2UpikxIC7ONJZnpl0c7pBhXvbjdq
   g==;
X-CSE-ConnectionGUID: dutgAaBXSGGlLiFJz3CJHw==
X-CSE-MsgGUID: W6aHoAAWT6aTaDYwC+utPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96473621"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="96473621"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 02:41:13 -0700
X-CSE-ConnectionGUID: dNMhuhBCSrWXlZ9ldUqvMA==
X-CSE-MsgGUID: Dj7EynkSS2mUf+hzDqLe4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="259295176"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 31 Jul 2026 02:41:11 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpjjp-000000002iM-1tvy;
	Fri, 31 Jul 2026 09:41:09 +0000
Date: Fri, 31 Jul 2026 11:41:05 +0200
From: kernel test robot <lkp@intel.com>
To: Priya Bala Govindasamy <pgovind2@uci.edu>
Cc: oe-kbuild-all@lists.linux.dev,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [linux-next:master 8890/10862] Diff in
 rust/kernel/cpufreq.rs:1361:
Message-ID: <202607311127.vrars8ja-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95d6a9ccef99117115e41e9adb271243bd5e985b
commit: 8aa931819543aaed39215a8ee39af4b1ed44cfa8 [8890/10862] rust: cpufreq: Fix temporary write in Registration::bios_limit_callback
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260731/202607311127.vrars8ja-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311127.vrars8ja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311127.vrars8ja-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/cpufreq.rs:1361:
                let mut policy = PolicyCpu::from_cpu(cpu_id)?;
                let val = T::bios_limit(&mut policy)?;
                // SAFETY: `limit` is guaranteed by the C code to be valid.
   -            unsafe { *limit = val; }
   +            unsafe {
   +                *limit = val;
   +            }
                Ok(0)
            })
        }
>> Diff in rust/kernel/cpufreq.rs:1361:
                let mut policy = PolicyCpu::from_cpu(cpu_id)?;
                let val = T::bios_limit(&mut policy)?;
                // SAFETY: `limit` is guaranteed by the C code to be valid.
   -            unsafe { *limit = val; }
   +            unsafe {
   +                *limit = val;
   +            }
                Ok(0)
            })
        }
   make[2]: *** [Makefile:1993: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
