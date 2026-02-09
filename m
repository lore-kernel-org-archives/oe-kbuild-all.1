Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F481D6193
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 19:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770666364; cv=none; b=aabd4DKgfetaSmGwO5CPG1nI7/Jr9su7m/G1rV0o7xLbr55L7V/78WMU+2etfEuqJl8qhFN+WbMYUyMXeZEruSVks9oba0GWHTmvkYOjtNMBWuDbKEMfaXz3OR34+PxF0vV+JaxHoLPTJ0t8l9PW2XzuWRBwcw8oj/qye4LPcas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770666364; c=relaxed/simple;
	bh=/AylOXkYjmCdxB6BlueP/zs725bCNnpH7rYGxxcVmrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfbVZ9imbv6BlBjOQbb4Kp/EB1KNWcdxJAPtBMyyVoZCmfxfw8Xa0ou8n4yQh1hQ9iobORg7e4Kyd1AUijWBhGh2Mk2TsNw5s3H5gGzlO3q53X6Atqb3p6BhmLxxyMK306tZVQ7KcgXI64MucrGDS6s1E9k+pJ7bXG+Dl20k3J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctpkA+sU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctpkA+sU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770666363; x=1802202363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/AylOXkYjmCdxB6BlueP/zs725bCNnpH7rYGxxcVmrY=;
  b=ctpkA+sU5fKDsbC6k+mgzmD5Qfm4Kk6cucneXEaPLto5aQBLK6SA7lFS
   rmGs3AMhe6aRa6uRis8nsMJpRBtmHp2bloQItupNg8E0bDliF0AI6iS/D
   fkkmjDLfOp+9uCs8T1y/Wi87mfm3aaRI7S8G55T4FjmHRWx++6WVnsDJh
   y49VJGa73402jpBZtMVR56ErrvX4mdSALPL1x76wUBOLedn/Va4HCIpPx
   OJNhTOJJFXBvs+mweUE7Bj6oLGx6a4X9rXaIiyDUwozTEJIhpRfitPhxu
   m4j56eQUmBUfE1QmNrk0jAH3RRdwRy8pgvVXbeQzBGyxLCZxQYXXkXArg
   w==;
X-CSE-ConnectionGUID: LWdnbfhVS82GRg0HrzcFsw==
X-CSE-MsgGUID: 1GxWutYSTNKSlnDdoLhcQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="70803217"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="70803217"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 11:46:02 -0800
X-CSE-ConnectionGUID: yIVGipUsTV62BQ5eXAR/3w==
X-CSE-MsgGUID: XRnwCI74S1msfQyzYg8PLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="216206219"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2026 11:45:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpXCj-00000000oHW-1nKd;
	Mon, 09 Feb 2026 19:45:53 +0000
Date: Tue, 10 Feb 2026 03:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	akpm@linux-foundation.org, bhe@redhat.com, vgoyal@redhat.com,
	dyoung@redhat.com, rdunlap@infradead.org, pmladek@suse.com,
	feng.tang@linux.alibaba.com, pawan.kumar.gupta@linux.intel.com,
	kees@kernel.org, elver@google.com, arnd@arndb.de,
	lirongqing@baidu.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
Message-ID: <202602100346.YUGn1yTm-lkp@intel.com>
References: <20260209095931.2813152-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209095931.2813152-2-ruanjinjie@huawei.com>

Hi Jinjie,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes arm64/for-next/core tip/x86/core linus/master v6.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/crash-Exclude-crash-kernel-memory-in-crash-core/20260209-180157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260209095931.2813152-2-ruanjinjie%40huawei.com
patch subject: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
config: i386-randconfig-012-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100346.YUGn1yTm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100346.YUGn1yTm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100346.YUGn1yTm-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/crash_core.o: in function `arch_get_crash_memory_ranges':
>> include/linux/crash_core.h:140:(.text+0x69c): undefined reference to `arch_get_system_nr_ranges'
>> ld: include/linux/crash_core.h:149:(.text+0x715): undefined reference to `arch_prepare_elf64_ram_headers'


vim +140 include/linux/crash_core.h

   139	
 > 140		ret = arch_get_system_nr_ranges(&nr_ranges);
   141		if (ret)
   142			return ret;
   143	
   144		*cmem = kvzalloc(struct_size(*cmem, ranges, nr_ranges), GFP_KERNEL);
   145		if (!(*cmem))
   146			return -ENOMEM;
   147	
   148		(*cmem)->max_nr_ranges = nr_ranges;
 > 149		ret = arch_prepare_elf64_ram_headers(*cmem);
   150		if (ret) {
   151			kvfree(*cmem);
   152			return ret;
   153		}
   154	
   155		return 0;
   156	}
   157	#endif
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
