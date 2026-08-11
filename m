Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B8143800B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Aug 2026 11:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786448453; cv=none; b=kxTWB0kNc3HaKbC1TvRnTKpJ0a6nueG8/40R69U0et6YE6fQ/j1DkoMNVtASsusTdT286qTcYCzy/cw3CaSeDWMddsmxkP2HtXcr0/sSEMcaPjtS7dFGXG27HYeWlxa+Tky6yDvqXyq9Nb3i82Wv1RCiUgL+aJXDO3C9DgL1kkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786448453; c=relaxed/simple;
	bh=EIHCl4sNAwVEv/c3maJu2okMIk952pEq5g+JLEnyh3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jMpuD4BQqjRSESFxhFenl1kd28gHoKkoHNe4kI80GOO2hzn9Flw2vVqejI7NWTqY7zvQkuA6oHICW0H6DEkBuBYCfdL2g1c1pQYijFofNrTxbIYT+XDxFBuZbv1UyyVqEAwBTDUynnEA8RsHeyzorBsV1E5/covuAGkgUEe8uUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wad9zokv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wad9zokv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786448452; x=1817984452;
  h=date:from:to:cc:subject:message-id;
  bh=EIHCl4sNAwVEv/c3maJu2okMIk952pEq5g+JLEnyh3A=;
  b=Wad9zokvFVw9StSmwpYel6NA6dndLMXg5t3QenHT0fwizy+EUyVPXhcj
   InuhRR1vO4cZZ9nS7TSS9+UT3weADuPczQzFpFpZ01JpN8n88naqUJ6AS
   ZGB3Xf+Nerw1PNHc0cqZi72hEiW88oztXeWiCoztMsYk7KAL8Hihr2E1C
   Dm+zCKzTE7JVdaIOm06z9pnhOPXR8RZBhnjUfevUypiK8ZNIWJ4pNzA8T
   fCI6ykbOtjFnhysr0D1jM3T6KR3kE/O5ENQJtwOVe4JVABli5LE1wWanu
   Me8bThb3sVi2wIc9ljFuZyqdEt2M5fwAHQUturS13DqYtahL9AmmVqZsV
   g==;
X-CSE-ConnectionGUID: jAuZbNCkTp+VkkuNNpoutA==
X-CSE-MsgGUID: wpFsYUzvTmO10nQCEPCpVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="97633316"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="97633316"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 04:40:51 -0700
X-CSE-ConnectionGUID: k703tthETjCvy/9KQX+MeA==
X-CSE-MsgGUID: kREoRRc+RDuqmGe+ftNWqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="288025302"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Aug 2026 04:40:49 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtkqc-00000000Ogs-3doL;
	Tue, 11 Aug 2026 11:40:46 +0000
Date: Tue, 11 Aug 2026 19:40:11 +0800
From: kernel test robot <lkp@intel.com>
To: Aksh Garg <a-garg7@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Helgaas <helgaas@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [linux-next:master 13060/13846]
 arch/powerpc/boot/decompress.c:132:8: error: call to undeclared function
 '__decompress'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202608111848.Kv74vVhw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Aksh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6b8c8af514d739d0335f5579b585e02babe8a727
commit: 79752653c136493ae8c3b4260f9f80de0b91d0bf [13060/13846] PCI: cadence: Fix host/endpoint dependencies for cadence-plat driver
config: powerpc-randconfig-r133-20260811 (https://download.01.org/0day-ci/archive/20260811/202608111848.Kv74vVhw-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260811/202608111848.Kv74vVhw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608111848.Kv74vVhw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/boot/decompress.c:132:8: error: call to undeclared function '__decompress'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     132 |         ret = __decompress(inbuf, input_size, NULL, flush, outbuf,
         |               ^
   1 error generated.


vim +/__decompress +132 arch/powerpc/boot/decompress.c

1b7898ee276b39 Oliver O'Halloran 2016-09-22   97  
1b7898ee276b39 Oliver O'Halloran 2016-09-22   98  /**
1b7898ee276b39 Oliver O'Halloran 2016-09-22   99   * partial_decompress - decompresses part or all of a compressed buffer
1b7898ee276b39 Oliver O'Halloran 2016-09-22  100   * @inbuf:       input buffer
1b7898ee276b39 Oliver O'Halloran 2016-09-22  101   * @input_size:  length of the input buffer
930a77c3ad79c3 Zhang Jianhua     2021-05-10  102   * @outbuf:      output buffer
930a77c3ad79c3 Zhang Jianhua     2021-05-10  103   * @output_size: length of the output buffer
6efc2f1a64ef62 Yang Li           2024-04-08  104   * @_skip:       number of output bytes to ignore
1b7898ee276b39 Oliver O'Halloran 2016-09-22  105   *
1b7898ee276b39 Oliver O'Halloran 2016-09-22  106   * This function takes compressed data from inbuf, decompresses and write it to
1b7898ee276b39 Oliver O'Halloran 2016-09-22  107   * outbuf. Once output_size bytes are written to the output buffer, or the
1b7898ee276b39 Oliver O'Halloran 2016-09-22  108   * stream is exhausted the function will return the number of bytes that were
1b7898ee276b39 Oliver O'Halloran 2016-09-22  109   * decompressed. Otherwise it will return whatever error code the decompressor
1b7898ee276b39 Oliver O'Halloran 2016-09-22  110   * reported (NB: This is specific to each decompressor type).
1b7898ee276b39 Oliver O'Halloran 2016-09-22  111   *
1b7898ee276b39 Oliver O'Halloran 2016-09-22  112   * The skip functionality is mainly there so the program and discover
1b7898ee276b39 Oliver O'Halloran 2016-09-22  113   * the size of the compressed image so that it can ask firmware (if present)
1b7898ee276b39 Oliver O'Halloran 2016-09-22  114   * for an appropriately sized buffer.
1b7898ee276b39 Oliver O'Halloran 2016-09-22  115   */
1b7898ee276b39 Oliver O'Halloran 2016-09-22  116  long partial_decompress(void *inbuf, unsigned long input_size,
1b7898ee276b39 Oliver O'Halloran 2016-09-22  117  	void *outbuf, unsigned long output_size, unsigned long _skip)
1b7898ee276b39 Oliver O'Halloran 2016-09-22  118  {
1b7898ee276b39 Oliver O'Halloran 2016-09-22  119  	int ret;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  120  
1b7898ee276b39 Oliver O'Halloran 2016-09-22  121  	/*
1b7898ee276b39 Oliver O'Halloran 2016-09-22  122  	 * The skipped bytes needs to be included in the size of data we want
1b7898ee276b39 Oliver O'Halloran 2016-09-22  123  	 * to decompress.
1b7898ee276b39 Oliver O'Halloran 2016-09-22  124  	 */
1b7898ee276b39 Oliver O'Halloran 2016-09-22  125  	output_size += _skip;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  126  
1b7898ee276b39 Oliver O'Halloran 2016-09-22  127  	decompressed_bytes = 0;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  128  	output_buffer = outbuf;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  129  	limit = output_size;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  130  	skip = _skip;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  131  
1b7898ee276b39 Oliver O'Halloran 2016-09-22 @132  	ret = __decompress(inbuf, input_size, NULL, flush, outbuf,

:::::: The code at line 132 was first introduced by commit
:::::: 1b7898ee276b39e54d870dc4ef3374f663d0b426 powerpc/boot: Use the pre-boot decompression API

:::::: TO: Oliver O'Halloran <oohall@gmail.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
