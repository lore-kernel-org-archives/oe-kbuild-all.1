Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B529199FD0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758986316; cv=none; b=GNNamKuxpiVhxyTeMf3N/lwh4PDwNCg+Nl9WZ9xE6Cjc3q3/JtLlioaFgtE2mndTQdzJ0NCWKXLgSyt8not3X5XeEJ9iugPLLTsCyF7H0j89m0hbu3wLokwIi1ZjTJo5EPx4HFcTa3/oOmZvKxXuOUlwuPVtBcgdVSAufOgNH28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758986316; c=relaxed/simple;
	bh=mfZndPQp2H+ZDinfzzZXY//Ef4DbRNmw7gxcvIEu6u8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4H+pA4FWu/n6VypIANi+QN1FG41GTyH03diWQnIOUMxcCvWQPJNLN/b9rl2h0b/gGvOIyxK+xCuKCGyOEa04bmB3rp01mIOUj1VR7HndSyhjTdvgJ5w87GvGshc0NAa95wm+vlCICLUv4ZoEZNtpwxzXvdlFiw99OpZQ+t0On4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ihs+hyuE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihs+hyuE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758986314; x=1790522314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mfZndPQp2H+ZDinfzzZXY//Ef4DbRNmw7gxcvIEu6u8=;
  b=ihs+hyuE3GfH7Y7KZWwOGtdWsdMqhrR4ZdgLr9iYwZPG1e57qy/X9WOC
   Vfy0SiCtQWWleXXdfxTJCyXapN52fsN7+LjELzJ1kdio2h1v9D5wQv9ZP
   AcF3hrK/8Bt89TI46zz3p1wDf238kZbBtSHdfwFH4w10f8HcT5WKJcCQY
   yFdX4VNeETVdCjhFF+aJXREUwLzZGjH64uPpH4GbuH7iXsNfVEk13UVnu
   YFNpoQlj8bdXfYrVN8iHZXWONugo/QE/FtVKCIAHi3D0IPYtS9TeHQ3T8
   OYYfpS+VR7QfDYAieuTLuQ131mgWSvAEAafTx4paIhJS0XOxiLIxW0yz8
   g==;
X-CSE-ConnectionGUID: xtcGdpvOQJ+++91G2pBYqg==
X-CSE-MsgGUID: DhvAn2zmTyS15AJsQTT4FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="86738785"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="86738785"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 08:18:34 -0700
X-CSE-ConnectionGUID: c/6lbqYNSvaR+mONvzUf+w==
X-CSE-MsgGUID: D8vOy0YWRRWK5zaufitrQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="177120065"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 27 Sep 2025 08:18:33 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2Wgw-00078h-1N;
	Sat, 27 Sep 2025 15:18:30 +0000
Date: Sat, 27 Sep 2025 23:18:28 +0800
From: kernel test robot <lkp@intel.com>
To: Luke Howard <lukeh@padl.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 3/5] net: dsa: mv88e6xxx: MQPRIO support
Message-ID: <202509272325.MTS85ySX-lkp@intel.com>
References: <20250927070724.734933-4-lukeh@padl.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927070724.734933-4-lukeh@padl.com>

Hi Luke,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Luke-Howard/net-dsa-mv88e6xxx-add-num_tx_queues-to-chip-info-structure/20250927-155031
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250927070724.734933-4-lukeh%40padl.com
patch subject: [RFC net-next 3/5] net: dsa: mv88e6xxx: MQPRIO support
config: x86_64-buildonly-randconfig-005-20250927 (https://download.01.org/0day-ci/archive/20250927/202509272325.MTS85ySX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272325.MTS85ySX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509272325.MTS85ySX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/mv88e6xxx/avb.c:120:12: warning: 'mv88e6xxx_avb_set_hilimit' defined but not used [-Wunused-function]
     120 | static int mv88e6xxx_avb_set_hilimit(struct mv88e6xxx_chip *chip, u16 hilimit)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mv88e6xxx/avb.c:84:12: warning: 'mv88e6xxx_port_qav_write' defined but not used [-Wunused-function]
      84 | static int mv88e6xxx_port_qav_write(struct mv88e6xxx_chip *chip, int port,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mv88e6xxx/avb.c:75:12: warning: 'mv88e6xxx_port_qav_read' defined but not used [-Wunused-function]
      75 | static int mv88e6xxx_port_qav_read(struct mv88e6xxx_chip *chip, int port,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/mv88e6xxx/avb.c:20:12: warning: 'mv88e6xxx_port_avb_read' defined but not used [-Wunused-function]
      20 | static int mv88e6xxx_port_avb_read(struct mv88e6xxx_chip *chip, int port,
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/mv88e6xxx_avb_set_hilimit +120 drivers/net/dsa/mv88e6xxx/avb.c

    19	
  > 20	static int mv88e6xxx_port_avb_read(struct mv88e6xxx_chip *chip, int port,
    21					   int addr, u16 *data, int len)
    22	{
    23		if (!chip->info->ops->avb_ops->port_avb_read)
    24			return -EOPNOTSUPP;
    25	
    26		return chip->info->ops->avb_ops->port_avb_read(chip, port, addr,
    27							       data, len);
    28	}
    29	
    30	static int mv88e6xxx_port_avb_write(struct mv88e6xxx_chip *chip, int port,
    31					    int addr, u16 data)
    32	{
    33		if (!chip->info->ops->avb_ops->port_avb_write)
    34			return -EOPNOTSUPP;
    35	
    36		return chip->info->ops->avb_ops->port_avb_write(chip, port, addr, data);
    37	}
    38	
    39	static int mv88e6xxx_avb_read(struct mv88e6xxx_chip *chip, int addr,
    40				      u16 *data, int len)
    41	{
    42		if (!chip->info->ops->avb_ops->avb_read)
    43			return -EOPNOTSUPP;
    44	
    45		return chip->info->ops->avb_ops->avb_read(chip, addr, data, len);
    46	}
    47	
    48	static int mv88e6xxx_avb_write(struct mv88e6xxx_chip *chip, int addr, u16 data)
    49	{
    50		if (!chip->info->ops->avb_ops->avb_write)
    51			return -EOPNOTSUPP;
    52	
    53		return chip->info->ops->avb_ops->avb_write(chip, addr, data);
    54	}
    55	
    56	/* 802.1Qav operation wrappers */
    57	
    58	static int mv88e6xxx_qav_read(struct mv88e6xxx_chip *chip, int addr,
    59				      u16 *data, int len)
    60	{
    61		if (!chip->info->ops->avb_ops->qav_read)
    62			return -EOPNOTSUPP;
    63	
    64		return chip->info->ops->avb_ops->qav_read(chip, addr, data, len);
    65	}
    66	
    67	static int mv88e6xxx_qav_write(struct mv88e6xxx_chip *chip, int addr, u16 data)
    68	{
    69		if (!chip->info->ops->avb_ops->qav_write)
    70			return -EOPNOTSUPP;
    71	
    72		return chip->info->ops->avb_ops->qav_write(chip, addr, data);
    73	}
    74	
    75	static int mv88e6xxx_port_qav_read(struct mv88e6xxx_chip *chip, int port,
    76					   int addr, u16 *data, int len)
    77	{
    78		if (!chip->info->ops->avb_ops->port_qav_read)
    79			return -EOPNOTSUPP;
    80	
    81		return chip->info->ops->avb_ops->port_qav_read(chip, port, addr, data, len);
    82	}
    83	
    84	static int mv88e6xxx_port_qav_write(struct mv88e6xxx_chip *chip, int port,
    85					    int addr, u16 data)
    86	{
    87		if (!chip->info->ops->avb_ops->port_qav_write)
    88			return -EOPNOTSUPP;
    89	
    90		return chip->info->ops->avb_ops->port_qav_write(chip, port, addr, data);
    91	}
    92	
    93	static int mv88e6xxx_tc_enable(struct mv88e6xxx_chip *chip,
    94				       const struct mv88e6xxx_avb_tc_policy *policy)
    95	{
    96		if (!chip->info->ops->tc_ops->tc_enable)
    97			return -EOPNOTSUPP;
    98	
    99		return chip->info->ops->tc_ops->tc_enable(chip, policy);
   100	}
   101	
   102	static int mv88e6xxx_tc_disable(struct mv88e6xxx_chip *chip)
   103	{
   104		if (!chip->info->ops->tc_ops->tc_disable)
   105			return -EOPNOTSUPP;
   106	
   107		return chip->info->ops->tc_ops->tc_disable(chip);
   108	}
   109	
   110	/* MQPRIO helpers */
   111	
   112	/* Set the AVB global policy limit registers. Caller must acquired register
   113	 * lock.
   114	 *
   115	 * @param chip		Marvell switch chip instance
   116	 * @param hilimit	Maximum frame size allowed for AVB Class A frames
   117	 *
   118	 * @return		0 on success, or a negative error value otherwise
   119	 */
 > 120	static int mv88e6xxx_avb_set_hilimit(struct mv88e6xxx_chip *chip, u16 hilimit)
   121	{
   122		u16 data;
   123		int err;
   124	
   125		if (hilimit > MV88E6XXX_AVB_CFG_HI_LIMIT_MASK)
   126			return -EINVAL;
   127	
   128		err = mv88e6xxx_avb_read(chip, MV88E6XXX_AVB_CFG_HI_LIMIT, &data, 1);
   129		if (err)
   130			return err;
   131	
   132		data &= ~(MV88E6XXX_AVB_CFG_HI_LIMIT_MASK);
   133		data |= MV88E6XXX_AVB_CFG_HI_LIMIT_SET(hilimit);
   134	
   135		err = mv88e6xxx_avb_write(chip, MV88E6XXX_AVB_CFG_HI_LIMIT, hilimit);
   136		if (err)
   137			return err;
   138	
   139		return 0;
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
