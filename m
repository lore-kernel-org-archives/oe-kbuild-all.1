Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5C91A0B15
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 12:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766580224; cv=none; b=nxZ4xKNoGD8ZGBcPrAl1vg9ar8o8FhigUcfpIwzI2agiJAC7/T/zFQOZRCSrcsYZH/OMPtIV69eoYB7K3tavFWaYDi/ssRDQNrFeWo/lksZjrBDj8nbxNBbBdLEgADhNW0pXZze0wwUyPyEvmNHT+UGG/WsAwDxi5kQjZ6zAuBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766580224; c=relaxed/simple;
	bh=sZJvESUNxFuV8JaUbyx7g5Nu0eEf7a35+CH4iSOL75M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPdQPWjocpIjEcpu0jQHgklzuCIwbpXq0mCc2IGkr2fHnNr6XFPToIg5f0EX6pDHcaede6/y5aRxLkUdVAT3SsqmTIontNudTiK9pjGW6Hq506N59wY95oXMZKpcmeCbt77b9lue6FFjHZcTtinvjp1B7iM2xHo7yBvamAzYHeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlOg8Y+7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlOg8Y+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766580222; x=1798116222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sZJvESUNxFuV8JaUbyx7g5Nu0eEf7a35+CH4iSOL75M=;
  b=hlOg8Y+7jVQ4uCSR5R3SOElY56tJPhL++Aei1SP/z5OIfIDLvFi6Mcz9
   5uJqlfmNF2GbyxhQIahOdTdspiK1zpG5aLoEPoOeovT/BN8aOrA6RbOTT
   bCj8+wcvqGeC51SFlgN/fNWb4h3hLW05jvGTkYqrjlpb+G/nyPuG8wsvo
   jPgPhHNDMDT0i6skUhxi+tewsE4LGMNg9g2T9blPZ5PtLYpXvzX10o3Nt
   9bqWl1n+BuzgwWW4wYS3uqUZ5OBzapVtaOuzqfITo5fG/nCcWzp0oLIH2
   LQVzASzJT2tpK0lQY1/RU1r6FDoi0CG9LIZQKYNNVWhB72QHoPjGwR+Wk
   Q==;
X-CSE-ConnectionGUID: c44S97OSSkOW4TaoffEMpw==
X-CSE-MsgGUID: kaLFDUDdSnKVTOdIN0aWjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79139419"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="79139419"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 04:43:41 -0800
X-CSE-ConnectionGUID: 2dxxDwVaSuSc18YekinAUg==
X-CSE-MsgGUID: Tx1/xbhiSjCFnyYl5zQrlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="230674955"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Dec 2025 04:43:36 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYOCV-0000000034b-2yZr;
	Wed, 24 Dec 2025 12:43:13 +0000
Date: Wed, 24 Dec 2025 20:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yazhou Tang <tangyazhou@zju.edu.cn>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ast@kernel.org, daniel@iogearbox.net,
	john.fastabend@gmail.com, andrii@kernel.org, martin.lau@linux.dev,
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org, tangyazhou518@outlook.com,
	shenghaoyuan0928@163.com, ziye@zju.edu.cn
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Add interval and tnum analysis for
 signed and unsigned BPF_DIV
Message-ID: <202512242039.MsW4xvOa-lkp@intel.com>
References: <20251223091120.2413435-2-tangyazhou@zju.edu.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223091120.2413435-2-tangyazhou@zju.edu.cn>

Hi Yazhou,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yazhou-Tang/bpf-Add-interval-and-tnum-analysis-for-signed-and-unsigned-BPF_DIV/20251223-171652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251223091120.2413435-2-tangyazhou%40zju.edu.cn
patch subject: [PATCH bpf-next v2 1/2] bpf: Add interval and tnum analysis for signed and unsigned BPF_DIV
config: m68k-hp300_defconfig (https://download.01.org/0day-ci/archive/20251224/202512242039.MsW4xvOa-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242039.MsW4xvOa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512242039.MsW4xvOa-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/bpf/verifier.o: in function `__sdiv_range':
>> verifier.c:(.text+0xff6): undefined reference to `__divdi3'
>> m68k-linux-ld: verifier.c:(.text+0x103a): undefined reference to `__divdi3'
   m68k-linux-ld: verifier.c:(.text+0x108c): undefined reference to `__divdi3'
   m68k-linux-ld: verifier.c:(.text+0x10dc): undefined reference to `__divdi3'
   m68k-linux-ld: kernel/bpf/verifier.o: in function `adjust_scalar_min_max_vals':
>> verifier.c:(.text+0x11c2a): undefined reference to `__udivdi3'
   m68k-linux-ld: kernel/bpf/tnum.o: in function `tnum_udiv':
>> tnum.c:(.text+0x636): undefined reference to `__udivdi3'
>> m68k-linux-ld: tnum.c:(.text+0x678): undefined reference to `__udivdi3'
   m68k-linux-ld: kernel/bpf/tnum.o: in function `tnum_sdiv':
>> tnum.c:(.text+0xc92): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
