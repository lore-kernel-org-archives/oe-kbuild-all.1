Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D412A258CFD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 13:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241516; cv=none; b=IEih1a9xysdXlWccO5ksg+r9MJXtmUgUREXIiFg6bObxPuH0xuN49yq4KuS6E7NpuYCPs4TLVJG4HhAinRjYpZTpZiGPCSFsEzsOcGYCe793CTWN/T9mN/6yH4qCln46VcBfpIvPoZLVL6/Yn85eWZY/uHgx0kW+Dop1+ZT0HUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241516; c=relaxed/simple;
	bh=Eos4Q0zSXFZ+FI2Bg9bDdQAocHsJkuFmEU22JMH1uEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8Vjx9iAb0V1tRuAcSHIH0XjqtwpnXBMv+qcwfgKaqVJMIyQ2Uy9Ga5ItRqo8Zb1UPm9VgWMG9nnqHd7sGYjS4E0kjrB9GugN90H54FmMOHn3qYx605lRW6kXqDhGgcRJmPB7XSTLsJe46h3B0x7r1xJOU4vwCfoyfFNESpT3Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8m+lVQ2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8m+lVQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745241513; x=1776777513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Eos4Q0zSXFZ+FI2Bg9bDdQAocHsJkuFmEU22JMH1uEc=;
  b=l8m+lVQ2lMqPuvxp0VBDKvkfoP8ZUeT/kEj+rVmQg+rIWqlclkuWprme
   BK2xNfmUTyGOX7l62cnZtvNINRRnMiO4vKZcy2/KRyXQZLP290W61pMNH
   Cv3+MiPaqQrA1CZtRNYAwEay/iLRG4J52fWTvp8VWgR3UUN55EFBM786F
   6V7PsUJmdrvN1nqujrjRTk4Q8/4U+so+HRjvrkYJoWumx+wW4UP5V9lZd
   gCJmXxFTN9gn9IJsKb/zr3u6dHQW4cbOkGyI0sRkTwrWT/cwshLFkm7aE
   5QlSubo7qKO8nmFkiWGbzCHVjPfuN91w+olKV/MRSbB2IqdzfMahNRcVD
   g==;
X-CSE-ConnectionGUID: kvr/rrUCS+2JxqXdzl8e2g==
X-CSE-MsgGUID: Y3LCgpKuRXO2NzZ44CVJxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="50435041"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="50435041"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 06:18:32 -0700
X-CSE-ConnectionGUID: NndHScZsQBuonnqkT+RAPA==
X-CSE-MsgGUID: K9t8FrhsSOiY8CQg5Ueg0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="131567766"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Apr 2025 06:18:26 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6r2W-00008J-0z;
	Mon, 21 Apr 2025 13:18:24 +0000
Date: Mon, 21 Apr 2025 21:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Gerhorst <luis.gerhorst@fau.de>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Henriette Herzog <henriette.herzog@rub.de>,
	Saket Kumar Bhaskar <skb99@linux.ibm.com>,
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Jiayuan Chen <mrpre@163.com>, Matan Shachnai <m.shachnai@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 05/11] bpf, arm64, powerpc: Add
 bpf_jit_bypass_spec_v1/v4()
Message-ID: <202504212142.V3yjAcaI-lkp@intel.com>
References: <20250421091802.3234859-6-luis.gerhorst@fau.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421091802.3234859-6-luis.gerhorst@fau.de>

Hi Luis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8582d9ab3efdebb88e0cd8beed8e0b9de76443e7]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Gerhorst/selftests-bpf-Fix-caps-for-__xlated-jited_unpriv/20250421-175926
base:   8582d9ab3efdebb88e0cd8beed8e0b9de76443e7
patch link:    https://lore.kernel.org/r/20250421091802.3234859-6-luis.gerhorst%40fau.de
patch subject: [PATCH bpf-next v2 05/11] bpf, arm64, powerpc: Add bpf_jit_bypass_spec_v1/v4()
config: x86_64-buildonly-randconfig-003-20250421 (https://download.01.org/0day-ci/archive/20250421/202504212142.V3yjAcaI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504212142.V3yjAcaI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504212142.V3yjAcaI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/core.c:3037:13: warning: no previous prototype for 'bpf_jit_bypass_spec_v1' [-Wmissing-prototypes]
    3037 | bool __weak bpf_jit_bypass_spec_v1(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/core.c:3042:13: warning: no previous prototype for 'bpf_jit_bypass_spec_v4' [-Wmissing-prototypes]
    3042 | bool __weak bpf_jit_bypass_spec_v4(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_jit_bypass_spec_v1 +3037 kernel/bpf/core.c

  3031	
  3032	/* By default, enable the verifier's mitigations against Spectre v1 and v4 for
  3033	 * all archs. The value returned must not change at runtime as there is
  3034	 * currently no support for reloading programs that were loaded without
  3035	 * mitigations.
  3036	 */
> 3037	bool __weak bpf_jit_bypass_spec_v1(void)
  3038	{
  3039		return false;
  3040	}
  3041	
> 3042	bool __weak bpf_jit_bypass_spec_v4(void)
  3043	{
  3044		return false;
  3045	}
  3046	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
