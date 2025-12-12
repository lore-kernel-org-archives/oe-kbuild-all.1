Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8372D7DC2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 17:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765560198; cv=none; b=CgsoO7vNRJvhXuf6YOKWczsic6F//YgkGF/UONpt3PbfV5BP4uCPBNErztetc2EtIAeDiu17TKp3HYk9jgF9EgQx1xiHbsrTLVKaysVYhmXbBnqXT86q3d/C0rfwAin6VSbgOst3Y/09cGdssIq1iDTwZWLsx9nhrrQluyS1SmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765560198; c=relaxed/simple;
	bh=wFuIhHYuAuMaOikS2pi6zwsYd0xg8BWptYnfDWAl1Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tzIOyUxYLe+nbKN7knLQauohEXnYgP+eNoLCGmjYnqpUIbJt8qJE9K3FsdaYZwjm6yPnb6BL6EhxedaCB/YA7GMpsNYRDlsFOJPpXU2lcfCzaCKmRyk8jRDZJ4YcaxcEvfwealaMn6otHEksc/2jERgByZaPamdeFUG8HtdDyAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTrLGKNZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTrLGKNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765560196; x=1797096196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wFuIhHYuAuMaOikS2pi6zwsYd0xg8BWptYnfDWAl1Ys=;
  b=DTrLGKNZp+NhHsBeprbyUjRhbUWbfnxopKun2Oi3VkBiPEivZ95INSfu
   HfnYkGuzO1QNDgHxvLZUwmso1jpUTVSdrjzypGnBB+0SS4doDtfrvwa2C
   T5QpLeWEDrQf31Hs+LIJ4at0Uf5DFYhVaQ3pHvj5KhuxNP70JoVDQoqT2
   L+qTWFTuZvj6E5aONDp110J4n0C8GdGvw3iq2vX+F94KP+kZEbNBmwoJJ
   NywiGqW0XEdsEMRS1u0Sd7oKV34GEb0q7G2XVmkEc0H2cY2gafY8Kko5i
   lBYaQyw/uz1uX9har2tAYHcuXNOaI6/ZFHzh5O8LQlyuwzg9hXB1OkZ2Y
   Q==;
X-CSE-ConnectionGUID: HDp3oLydTGSZeIxzAhxMBg==
X-CSE-MsgGUID: Lc0qduCtToW/KzElUlGgyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67607617"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67607617"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 09:23:14 -0800
X-CSE-ConnectionGUID: YMzuBl45SSODut/LS6AkTw==
X-CSE-MsgGUID: 4/kYF3XRRVKm9pgHKXBmsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196210321"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 09:23:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU6rG-000000006Mu-2Emp;
	Fri, 12 Dec 2025 17:23:10 +0000
Date: Sat, 13 Dec 2025 01:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andi Shyti <andi@smida.it>
Subject: drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast
 from restricted __be64
Message-ID: <202512130124.KQX07WZx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 63ef02da5ddb725555cd41f125ec0bd8e893da3a i2c: octeon: add block-mode i2c operations
date:   7 months ago
config: um-randconfig-r134-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130124.KQX07WZx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130124.KQX07WZx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130124.KQX07WZx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __be64 [addressable] [usertype] buf @@
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
