Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937A136C592
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 03:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780372429; cv=none; b=dc2oEuZu5ES9pxElVBmUrUUKMVwTXPaZM9WbeGigT0m+PBj6k8+eYmMGSLx+JRrTr6FD1c5Nrw/orwOUi6COpLOHZ8aDzn9SSWfPKZfYRWLYxzzoiVnLhZWikvdHrgwNlkR8M0Pozh0HpwdtBIgx1+KSh945B+Al0HheZLgZx68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780372429; c=relaxed/simple;
	bh=Fu3Wdd9+4BheEzXWbgUNchv58z9Db0lR8EHZjF6eCsw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ekqMzkgV0GkJm3wj6FIe5T++MD59mDBfIR26aUBxkatu0oEv8S9sv3ddQlWQh4AkmSF42da/7MkwD4M/LMJ79PQCyVOc7SDC/pz9eB2LKV+ebqAdziMqf9l6xMrRK2LFixDlDV7hQm4hHF9VUGcSdP0F+Bd1AJtFB3Oq2oJYfMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m398x/Mv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m398x/Mv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780372428; x=1811908428;
  h=date:from:to:cc:subject:message-id;
  bh=Fu3Wdd9+4BheEzXWbgUNchv58z9Db0lR8EHZjF6eCsw=;
  b=m398x/MvM/RiRC2Eki+SpIWdXdgaqynvlRnWioJOnHttbziqmO0weAAe
   nj0Im/N5LVf239YavXWUmxKb/MaR8s6nqDE/VN2ZkLv2n7KRHsHpK+NKW
   ZUqpgDlA0ykdcjvwkikpOLu2RkXXsknAEtwLAGlqGwkVDZH588R6Cud1M
   MSf/PsU+IpQK9jkAJqrRE5J+AAH4WFI17fHo2Y31uf/2S5pSZE2+KUbIg
   5L4krpwYRWp3kswJ3XSaeq12A1LjJ3McVtvF2qD7QN/E1SUvlAx5bZwfO
   1e20mbYn2AIl6nohyJdiRplSLMcmD/Xw0bHu2u/AE5rubmwYf44mdKvxA
   Q==;
X-CSE-ConnectionGUID: yrtOKzUBQ9q5tt4oUkhfaQ==
X-CSE-MsgGUID: 3ZKVaxI7SVCsfnQzQPnv6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81117706"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="81117706"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 20:53:48 -0700
X-CSE-ConnectionGUID: NES4f2vCR3+/yunxKVxcww==
X-CSE-MsgGUID: h2sWuk5EQbOLiozShJLnyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="248713665"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Jun 2026 20:53:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUGCE-00000000BSa-42CG;
	Tue, 02 Jun 2026 03:53:42 +0000
Date: Tue, 02 Jun 2026 11:52:42 +0800
From: kernel test robot <lkp@intel.com>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andi Shyti <andi@smida.it>
Subject: drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse:
 cast from restricted __be64
Message-ID: <202606021143.KjvJRzff-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: 63ef02da5ddb725555cd41f125ec0bd8e893da3a i2c: octeon: add block-mode i2c operations
date:   1 year ago
config: alpha-randconfig-r122-20260602 (https://download.01.org/0day-ci/archive/20260602/202606021143.KjvJRzff-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606021143.KjvJRzff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 63ef02da5ddb ("i2c: octeon: add block-mode i2c operations")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606021143.KjvJRzff-lkp@intel.com/

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
