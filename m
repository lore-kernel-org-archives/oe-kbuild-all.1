Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537AE284689
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 23:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766706404; cv=none; b=lgzPH/UVt6LJ/O9QaRPXsLxLh1ifaL3rXfmS7WimkadrkEM01AaZz/ails7Cx8wFd7ymoraO+GGjCwR4l+G/W2GupxQQxa7pLHWdfvYf5mYUKpN/5a8RV6bjaxdipN/KjQma4Vjskz3f1Oqkq2moQW495cJZUiq5AvI+qY2alAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766706404; c=relaxed/simple;
	bh=UW2wDYgwr2ytHw3U2HslSTLdQEQB2uXJdRIXhglRnfc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YR/Ti33LtJ66oC9GsMbpJdlM+PY0eFk9Hpr1dqF/goQ1sNKGYAQORH9DPcKWj72FK1FlNqofi2CuZNCkCg5Ltu8j7+vWI6cuGvFtGpwG1lAEvxu4qHanFFchdq7KkfWsG0GnBHftIeFzpnDRduOwUUY9V1oafYkbuqr9+vYkcas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lkekK9Hk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lkekK9Hk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766706402; x=1798242402;
  h=date:from:to:cc:subject:message-id;
  bh=UW2wDYgwr2ytHw3U2HslSTLdQEQB2uXJdRIXhglRnfc=;
  b=lkekK9Hk3OqI4hLCnmdqnMTATnmrnYGCbR7dFSjXdYCV5Bvy/RzQtoMR
   a32u/vDfIIz1EQBTpB/1DkDCgDeAx9gX7Ib/MkdSMjSdU01xJu1VJMJ04
   zVtrGtdb8GRd7pslgnd5abAiYEd9u11MiykrfuXGXHeu4za/reAg01AGx
   FoKbjHf2fuVG93xXbuO+LE7Clk1xrTuNOG/q+flBMWwtdgPGwn4IONbRj
   KBypW5ygRD5B0wm7AUxhB/7AG1kkf7UTGlnkB4hXweS1HyUu3txK+rRbP
   GUHLnB/dCfjgZk9C/wqsCOGrSV8yZ+Cw+Iz8DKh6mJIpEyfsSc40S4aRG
   w==;
X-CSE-ConnectionGUID: 28jAWSuqS/aQLo8kNooJ+Q==
X-CSE-MsgGUID: h8AEmpxFQIS89U7mX2AiFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="56051684"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="56051684"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 15:46:42 -0800
X-CSE-ConnectionGUID: EPnWmj6aR4qXp+JZ+MMnCA==
X-CSE-MsgGUID: nPqcWaewSLGFxVooHuOU3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200591051"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Dec 2025 15:46:40 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYv2U-000000004Xt-0QNo;
	Thu, 25 Dec 2025 23:46:38 +0000
Date: Fri, 26 Dec 2025 07:45:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13] drivers/ub/ubus/config.c:15:3:
 warning: 'cfg_ops_t' defined but not used
Message-ID: <202512260743.vsk7cscA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   52a3b0aa13aa2325ca2caf528fbcaba06ad3bab5
commit: 8733e7995bd92d8159ba0df49df547f4b9c4862b [13/13] ub:ubus: Add Ubus setting configuration space function
config: arm64-randconfig-004-20251226 (https://download.01.org/0day-ci/archive/20251226/202512260743.vsk7cscA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260743.vsk7cscA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260743.vsk7cscA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/ubus/config.c:51:5: warning: no previous prototype for 'ub_cfg_read_byte' [-Wmissing-prototypes]
      51 | int ub_cfg_read_byte(struct ub_entity *uent, u64 pos, u8 *val)
         |     ^~~~~~~~~~~~~~~~
   drivers/ub/ubus/config.c:60:5: warning: no previous prototype for 'ub_cfg_read_word' [-Wmissing-prototypes]
      60 | int ub_cfg_read_word(struct ub_entity *uent, u64 pos, u16 *val)
         |     ^~~~~~~~~~~~~~~~
   drivers/ub/ubus/config.c:69:5: warning: no previous prototype for 'ub_cfg_read_dword' [-Wmissing-prototypes]
      69 | int ub_cfg_read_dword(struct ub_entity *uent, u64 pos, u32 *val)
         |     ^~~~~~~~~~~~~~~~~
   drivers/ub/ubus/config.c:78:5: warning: no previous prototype for 'ub_cfg_write_byte' [-Wmissing-prototypes]
      78 | int ub_cfg_write_byte(struct ub_entity *uent, u64 pos, u8 val)
         |     ^~~~~~~~~~~~~~~~~
   drivers/ub/ubus/config.c:87:5: warning: no previous prototype for 'ub_cfg_write_word' [-Wmissing-prototypes]
      87 | int ub_cfg_write_word(struct ub_entity *uent, u64 pos, u16 val)
         |     ^~~~~~~~~~~~~~~~~
   drivers/ub/ubus/config.c:96:5: warning: no previous prototype for 'ub_cfg_write_dword' [-Wmissing-prototypes]
      96 | int ub_cfg_write_dword(struct ub_entity *uent, u64 pos, u32 val)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/config.c:15:3: warning: 'cfg_ops_t' defined but not used [-Wunused-const-variable=]
      15 | } cfg_ops_t;
         |   ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/cfg_ops_t +15 drivers/ub/ubus/config.c

     7	
     8	static const struct cfg_ops {
     9		read_byte_f cfg_read_byte;
    10		read_word_f cfg_read_word;
    11		read_dword_f cfg_read_dword;
    12		write_byte_f cfg_write_byte;
    13		write_word_f cfg_write_word;
    14		write_dword_f cfg_write_dword;
  > 15	} cfg_ops_t;
    16	
    17	static struct cfg_ops ub_cfg_ops = {};
    18	
    19	int register_ub_cfg_read_ops(read_byte_f rb, read_word_f rw, read_dword_f rdw)
    20	{
    21		if (rb && rw && rdw) {
    22			ub_cfg_ops.cfg_read_byte = rb;
    23			ub_cfg_ops.cfg_read_word = rw;
    24			ub_cfg_ops.cfg_read_dword = rdw;
    25			return 0;
    26		}
    27	
    28		return -EINVAL;
    29	}
    30	EXPORT_SYMBOL_GPL(register_ub_cfg_read_ops);
    31	
    32	int register_ub_cfg_write_ops(write_byte_f wb, write_word_f ww, write_dword_f wdw)
    33	{
    34		if (wb && ww && wdw) {
    35			ub_cfg_ops.cfg_write_byte = wb;
    36			ub_cfg_ops.cfg_write_word = ww;
    37			ub_cfg_ops.cfg_write_dword = wdw;
    38			return 0;
    39		}
    40	
    41		return -EINVAL;
    42	}
    43	EXPORT_SYMBOL_GPL(register_ub_cfg_write_ops);
    44	
    45	void unregister_ub_cfg_ops(void)
    46	{
    47		memset(&ub_cfg_ops, 0, sizeof(struct cfg_ops));
    48	}
    49	EXPORT_SYMBOL_GPL(unregister_ub_cfg_ops);
    50	
    51	int ub_cfg_read_byte(struct ub_entity *uent, u64 pos, u8 *val)
    52	{
    53		if (!ub_cfg_ops.cfg_read_byte)
    54			return -ENODEV;
    55	
    56		return ub_cfg_ops.cfg_read_byte(uent, pos, val);
    57	}
    58	EXPORT_SYMBOL_GPL(ub_cfg_read_byte);
    59	
    60	int ub_cfg_read_word(struct ub_entity *uent, u64 pos, u16 *val)
    61	{
    62		if (!ub_cfg_ops.cfg_read_word)
    63			return -ENODEV;
    64	
    65		return ub_cfg_ops.cfg_read_word(uent, pos, val);
    66	}
    67	EXPORT_SYMBOL_GPL(ub_cfg_read_word);
    68	
    69	int ub_cfg_read_dword(struct ub_entity *uent, u64 pos, u32 *val)
    70	{
    71		if (!ub_cfg_ops.cfg_read_dword)
    72			return -ENODEV;
    73	
    74		return ub_cfg_ops.cfg_read_dword(uent, pos, val);
    75	}
    76	EXPORT_SYMBOL_GPL(ub_cfg_read_dword);
    77	
  > 78	int ub_cfg_write_byte(struct ub_entity *uent, u64 pos, u8 val)
    79	{
    80		if (!ub_cfg_ops.cfg_write_byte)
    81			return -ENODEV;
    82	
    83		return ub_cfg_ops.cfg_write_byte(uent, pos, val);
    84	}
    85	EXPORT_SYMBOL_GPL(ub_cfg_write_byte);
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
