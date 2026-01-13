Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C8D3921C1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 12:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308006; cv=none; b=ERI3Fkz7vhDa1ffD8J07naiLE/0qOaN5kAEOTeextRDS+CQtMm77GIJobNwFYFsV+bA8RvybCSHOs7JbisNInyM0b4SznT3FYPLghDzvk/uwTHN2eDpVkuVQaJ2BO0XaW3AfMcLwaPCNQqzu53WodLKQYSy2dUmUzoZC7W8Ne3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308006; c=relaxed/simple;
	bh=YfDnd/0XsXvIrhEQN3I9Ga0xqWCnpu1Rec0p6/LMDq4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IT6tUSVio/ewIxm4h3M4nxa7mhe7MNXMqiDh1NPiNW/5dSzm5vfDokLVx/YCsuJ5CS9AEAYPRTg5lbgKL2ZuWCy+fjKHHaNSfOhSP28DM7Fv88fwqdkYgWCc1wuiO+GN0ALPsD9+MSs7Z0gLjcfg8hP2DYaYueto5firW1KCpQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEX/HA6V; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEX/HA6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768308005; x=1799844005;
  h=date:from:to:cc:subject:message-id;
  bh=YfDnd/0XsXvIrhEQN3I9Ga0xqWCnpu1Rec0p6/LMDq4=;
  b=TEX/HA6VMyBP5PQdMVYIYk8ddKG6eiZPAPmEMjBgnP40kL2IGUrKCbDU
   W0tOZo7ery/+Wwq/LQnl12+e9LSrRw+JRbqt93HIZY+Kju8j37HNkT2xK
   IDCsIHJysIj01WFBu9GotP8Re64cnI+ouQZmRRXTzzS9rbiVa4NRfUIjB
   Aj3b21TQjGpGPG8jbHlqOjweGLDpmnC1IYyfdRmSysctCtYA3r9SOB2X7
   i1bH5N56x9YgsT20kTfh7/xyZ0I12vJqWXsy+Ul0tvNC6wttHwU5HZFhs
   VuHRslcjYErVLuqKX7M3g+OU0syUvSd01Wtiv+Rbdh/8IZAcq3RUT5HHJ
   Q==;
X-CSE-ConnectionGUID: /fJvFOXfQZ+67MkCqEJtoQ==
X-CSE-MsgGUID: ZeHJs6GcTZms1itngm5uLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69748698"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69748698"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:40:04 -0800
X-CSE-ConnectionGUID: ddTJBw1lQzmnAIwYhxFQgg==
X-CSE-MsgGUID: hgiOQut0Ra6x9kPF8btWLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203586123"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jan 2026 04:40:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfdgl-00000000Ek8-373M;
	Tue, 13 Jan 2026 12:39:59 +0000
Date: Tue, 13 Jan 2026 20:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andi Shyti <andi@smida.it>
Subject: drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse:
 cast from restricted __be64
Message-ID: <202601132015.AVgB52xg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 63ef02da5ddb725555cd41f125ec0bd8e893da3a i2c: octeon: add block-mode i2c operations
date:   8 months ago
config: arm64-randconfig-r121-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132015.AVgB52xg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132015.AVgB52xg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132015.AVgB52xg-lkp@intel.com/

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
