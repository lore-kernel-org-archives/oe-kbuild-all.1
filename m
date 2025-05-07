Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDC428A3E4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626298; cv=none; b=Al/PERWvE5A2ALWJmtGMfHk/rC3GgMeruMHeNIIXQ8nEp7fUcDYLpVXegewgOVIUg2FVafwXbgKrPzDEAltvwQeoMaYez6KdcMOveOiZi3OYXSJBOiW6Fgh66/YXCsWfGMPuPRlwfXdYHPwBfN7A0lCIng4VzcRlrss+d4608qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626298; c=relaxed/simple;
	bh=8usAjHxnly3zcMgwOCXNe0rrQuD/a+0n2jCiGEBVseE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GZAqMCLXO57Xmao5/y+bGq6Vdayc2vZKfq2/OfW30Gx9KfxQKcvfObN3U538yX++uKuViwUdqMaqMdazeFZ2mx7XHCZfNIOuEaqnuK3YuLGcFbhNwAMNBS+Tp/bi5PFy6Fv3FvFZd1QW7J+C4l672pIbufpDhMRW8Fv0n/TGSQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7XrUt8r; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7XrUt8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746626296; x=1778162296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8usAjHxnly3zcMgwOCXNe0rrQuD/a+0n2jCiGEBVseE=;
  b=L7XrUt8rck226Q7S7getRCkeSL4HUXMB3lYNg/9P4oqhsLtL1PXqqK0b
   yToI/JqEmVKj8gWu32VU7b1bpROZjbYTA9Iaic2mcnyfZjHB6XNkjbG+a
   jEjMPJHHVwhc0uQhA/d4gvtb4WhFRX1wJ1EveaGX/xurtu9/oIlFDPb7t
   Ce6IzccsBUJDrXAS/2hBx2kSFFlJzlM6ilTtC7P0nYOgJZoGZXGdAwEwu
   8tiayqwayT6tIYuBj1Z0gyhXMUxvaq6U8rYusMCrRD1nrktT4VZYCY6yT
   ngI0c5MOsB6fEpYpiIsnyGKOyYtwX9BVigLAb/t2mFJ7UcdlUNgqgxPpP
   Q==;
X-CSE-ConnectionGUID: xlrfOUXtTfeqrrdcC9VXWw==
X-CSE-MsgGUID: jCQomkRTQPGpK+Jsg6udxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47613032"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="47613032"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:58:16 -0700
X-CSE-ConnectionGUID: Q7U4qZTQSQC85+y1PRRCgw==
X-CSE-MsgGUID: 9WBYe7A2SUGVlAnKnPG+Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140011264"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2025 06:58:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCfHo-0007vP-2g;
	Wed, 07 May 2025 13:58:12 +0000
Date: Wed, 7 May 2025 21:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: oe-kbuild-all@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>
Subject: [linux-next:master 3986/6092]
 drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: incorrect type
 in argument 1 (different base types)
Message-ID: <202505072140.30QBc5bv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: dae75950ce79fb30ac2e0d38148322329052c4cf [3986/6092] i2c: octeon: add block-mode i2c operations
config: arm64-randconfig-r111-20250423 (https://download.01.org/0day-ci/archive/20250507/202505072140.30QBc5bv-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505072140.30QBc5bv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072140.30QBc5bv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __be64 [addressable] [usertype] buf @@
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse:     expected unsigned long long [usertype] val
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse:     got restricted __be64 [addressable] [usertype] buf
>> drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
>> drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
>> drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
>> drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
>> drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
>> drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
>> drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
>> drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:732:42: sparse: sparse: cast from restricted __be64

vim +731 drivers/i2c/busses/i2c-octeon-core.c

   688	
   689	/**
   690	 * octeon_i2c_hlc_block_comp_write - high-level-controller composite block write
   691	 * @i2c: The struct octeon_i2c
   692	 * @msgs: msg[0] contains address, msg[1] contains data to be written
   693	 *
   694	 * i2c core command is constructed and write data is written into the FIFO buffer.
   695	 * The execution of the command will result in HW write, using the data in FIFO.
   696	 * Used in the case where the i2c xfer is for greater than 8 bytes of write data.
   697	 *
   698	 * Returns: 0 on success, otherwise a negative errno.
   699	 */
   700	static int octeon_i2c_hlc_block_comp_write(struct octeon_i2c *i2c, struct i2c_msg *msgs)
   701	{
   702		bool set_ext;
   703		int ret;
   704		u16 len, i;
   705		u64 cmd, ext = 0;
   706	
   707		octeon_i2c_hlc_enable(i2c);
   708		octeon_i2c_block_enable(i2c);
   709	
   710		/* Write (size - 1) into block control register */
   711		len = msgs[1].len - 1;
   712		octeon_i2c_writeq_flush((u64)len, i2c->twsi_base + OCTEON_REG_BLOCK_CTL(i2c));
   713	
   714		/* Prepare core command */
   715		cmd = SW_TWSI_V | SW_TWSI_SOVR | SW_TWSI_OP_7_IA;
   716		cmd |= (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
   717	
   718		/* Set parameters for extended message (if required) */
   719		set_ext = octeon_i2c_hlc_ext(i2c, msgs[0], &cmd, &ext);
   720	
   721		/* Write msg into FIFO buffer */
   722		octeon_i2c_writeq_flush(TWSX_BLOCK_STS_RESET_PTR,
   723					i2c->twsi_base + OCTEON_REG_BLOCK_STS(i2c));
   724		for (i = 0; i <= len; i += 8) {
   725			__be64 buf = 0;
   726	
   727			/* Copy 8 bytes or remaining bytes from message buffer */
   728			memcpy(&buf, &msgs[1].buf[i], min(8, msgs[1].len - i));
   729	
   730			/* Byte-swap message data and write into FIFO */
 > 731			buf = cpu_to_be64(buf);
   732			octeon_i2c_writeq_flush((u64)buf, i2c->twsi_base + OCTEON_REG_BLOCK_FIFO(i2c));
   733		}
   734		if (set_ext)
   735			octeon_i2c_writeq_flush(ext, i2c->twsi_base + OCTEON_REG_SW_TWSI_EXT(i2c));
   736	
   737		/* Send command to core (send data in FIFO) */
   738		ret = octeon_i2c_hlc_cmd_send(i2c, cmd);
   739		if (ret)
   740			goto err;
   741	
   742		cmd = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
   743		if ((cmd & SW_TWSI_R) == 0) {
   744			octeon_i2c_block_disable(i2c);
   745			return octeon_i2c_check_status(i2c, false);
   746		}
   747	
   748	err:
   749		octeon_i2c_block_disable(i2c);
   750		return ret;
   751	}
   752	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
