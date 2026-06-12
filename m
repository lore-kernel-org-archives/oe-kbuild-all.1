Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B3E30C177
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 01:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781226672; cv=none; b=WdIfX47M7/IrMJfR+WfRunGcgiIaQTNVL87a8Apx79x2tpeTrt9E/R/zatV4K5ZXzrrZ4GP3iv7bBAYcFnYOnT508K9JWV/ebgvmkCyFkxVTFvs6Tn5LhkM/aqz77Pt7AS0QtIQKEIHfMle6Y3YbkBA1fhuRhhTub8PbTD8WRUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781226672; c=relaxed/simple;
	bh=1QjHTu1wVEh+bY2j/x2HQWU5a9XzG7di5kXJu1Bw4Qk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q0P0IXAdruTnY2Vm32OR2SoFhi82ionY56zyGYy68iiOLFrY7/K+RfE2jPRoKFSni5RjP6E+Ya8lheqVcG/OE45vlxpRqBsyVija76cK/s72jhncOtbYrcQncBNRNJd75/kjc4/8AT6sbBhBNfmcysxmIwZrkATiZuaC2Or4+94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4zaN01K; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4zaN01K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781226670; x=1812762670;
  h=date:from:to:cc:subject:message-id;
  bh=1QjHTu1wVEh+bY2j/x2HQWU5a9XzG7di5kXJu1Bw4Qk=;
  b=G4zaN01KpwH3pShlk4D/Y572R8UNVfWwHJ9jsbS6dPvpEDknP6FbkJEf
   DkG9dqz6APNLqpXLLrWKDES60hcgdLElPNxBpjCIClnoXnYOe8V2z8jR/
   KDQAd8Tr0rjCmXUWSV79zSAOWkXQ24mVN7aO0eK4woF35LoUVbdTknaPY
   Y1esPlfZsROZnG2gH1a9B9SX+KJyeZrtWEvVUDogLRAvkT/e3rag8r1C1
   urFd56+vFk1FAJ3aJQH2QBGf5vhTQRtDmGPOG6iQ2LunyH3X0gyyq7MGI
   rtTvnYryTN9yJLXenC/3k36Y30Qb8Dq1ozSFVNmmB1qT6nOn8i8c/SQTf
   g==;
X-CSE-ConnectionGUID: OTeT9wh+SDyX603fCqB19A==
X-CSE-MsgGUID: 6P51VlK8Sv62L0Qd3HDCpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69601806"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="69601806"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 18:11:07 -0700
X-CSE-ConnectionGUID: tb4+92lpQwSmPhz89Jxkrg==
X-CSE-MsgGUID: GgXjiDylRQCoB95TGzISWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251764258"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2026 18:11:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXqQJ-00000000O6K-1ZkH;
	Fri, 12 Jun 2026 01:11:03 +0000
Date: Fri, 12 Jun 2026 09:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andi Shyti <andi@smida.it>
Subject: drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202606120948.7cDw3nU7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 63ef02da5ddb725555cd41f125ec0bd8e893da3a i2c: octeon: add block-mode i2c operations
date:   1 year, 1 month ago
config: riscv-randconfig-r132-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120948.7cDw3nU7-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120948.7cDw3nU7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 63ef02da5ddb ("i2c: octeon: add block-mode i2c operations")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120948.7cDw3nU7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __be64 [addressable] [usertype] buf @@
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse:     expected unsigned long long [usertype] val
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse:     got restricted __be64 [addressable] [usertype] buf
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
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
