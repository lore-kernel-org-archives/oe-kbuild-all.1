Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650BE22DFBF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 10:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749985; cv=none; b=kAVP3OXJziLzT7ALwWIr+snOrV1IqGPOVWDaRXRXfHd1JKqiEIaX+PcKtdhTW1d99UdPdgLx2HdjmfDfrrdS4OwkPyreB97WGwVjmjYfmLGKo52CiVGXGlHlBE7kMlaDfOgBTVDZTzWO5b39z7R7P02aGbK+P6DBD8KZkZ9uGUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749985; c=relaxed/simple;
	bh=Gi8geCOCasPnz0fif5uPvgCSaKb6XfXpjWeXVD365/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bAoEd/rdb2O5mGlofspiKd5jnNV2tKfrHgATA1py7A4zkxFD77cLYkUnhEP7a0H+1P/h7gs88rXSqoxDA2ixwtnAoQyGvigau6IKiyVAlAI5OQNCJtnU8F8Y1rq9XNneY3U3s+dXQIJulhq+D8HINU+p7GAXVQiVacJQ1xDa52Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OftyiGRQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OftyiGRQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738749983; x=1770285983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gi8geCOCasPnz0fif5uPvgCSaKb6XfXpjWeXVD365/Y=;
  b=OftyiGRQXtWS2LwPtX6f7V6vySLQVWsupgJl9YMnRm3DaP0ch2zjDYU8
   EDwpXjSspbTniMg6YJ95d9sZdaTsKLXpLeAJB0Utx2rYkdxPyxU4LtqEY
   n9vWPdV6IBl0fMXXHbj++0Gl2Ys7rssQxHzL9cgLbOBU0u7uGdCeybNwd
   yk+PICOzCAII3na4tObuAVUO64jfIE4KaGdPsk5C+ULX4wMgn71Xi/Wcn
   IEjMvtGGkwzu294BDR2YvHrj1sOXx4igMPhVQcYU5QsdKSAdGaCpPaUXm
   d3JfeCQmYquD3UvkGPEIcD1hgIr2nU37hJzvPhT6N84rWN1RRQ16oOgXA
   g==;
X-CSE-ConnectionGUID: sDWyiu1PSEORDsFDZKFBgg==
X-CSE-MsgGUID: aC371kp0QOmCgZwn1PWuOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38541450"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38541450"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 02:06:20 -0800
X-CSE-ConnectionGUID: Fi5cEVLMS0KKDhBnLFRvBw==
X-CSE-MsgGUID: HVXmePOpTiigeT0u/dBF/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="141717620"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Feb 2025 02:06:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfcIR-000tjL-2l;
	Wed, 05 Feb 2025 10:06:15 +0000
Date: Wed, 5 Feb 2025 18:06:11 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Winkler <rwinkler@antmicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Gabriel Somlo <gsomlo@gmail.com>
Subject: [litex-hub:litex-rebase 11/15] drivers/fpga/litex-fpga.c:114:17:
 sparse: sparse: cast to restricted __be32
Message-ID: <202502051703.2QcrfJ0B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/litex-hub/linux litex-rebase
head:   a1cd33eb9593685b8b0716cbecf1a817b6410ca2
commit: 8e7a6c0a5ea5b945506ef310544efdd7c64bb3ae [11/15] LiteX: driver for ICAPBitstream fpga manager
config: arm-randconfig-r113-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051703.2QcrfJ0B-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250205/202502051703.2QcrfJ0B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051703.2QcrfJ0B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/fpga/litex-fpga.c:114:17: sparse: sparse: cast to restricted __be32

vim +114 drivers/fpga/litex-fpga.c

    89	
    90	static int litex_fpga_write(struct fpga_manager *mgr,
    91				    const char *buf, size_t count)
    92	{
    93		const struct litex_fpga *fpga_s = (const struct litex_fpga *) mgr->priv;
    94		uint32_t *buf32;
    95		int i, count32;
    96	
    97		/* Bitstream should consist of 32bit words*/
    98		if (!bit_is_aligned((uint8_t *) buf, count)) {
    99			dev_err(&mgr->dev, "Invalid bitstream alignment\n");
   100			return -EINVAL;
   101		}
   102	
   103		/* Correct bitstream contains sync word */
   104		if (!bit_has_sync((uint8_t *) buf, count)) {
   105			dev_err(&mgr->dev, "Bitstream has no sync word\n");
   106			return -EINVAL;
   107		}
   108	
   109		buf32 = (uint32_t *) buf;
   110		count32 = count / BITSTREAM_INSTR_SIZE;
   111		for (i = 0; i < count32; ++i) {
   112			while (!READ_SINK_READY(fpga_s->membase))
   113				;
 > 114			WRITE_SINK_DATA(fpga_s->membase, be32_to_cpu(buf32[i]));
   115		}
   116	
   117		return 0;
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
