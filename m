Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DBAAD51
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 05:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733205228; cv=none; b=E4b/887zVvgTXMdSCn4E1s60xnzvdZFL31kcFBSbkgxOIxCdQEgn7Q8G/L5URPDcbWz9vRkps2TkuPbEcZaDaHJuJhJAjtpwqHApdyArXH/QgkAySndcqpPmbyBV+q0teR6C1pqJ16GS6XXZpeiYPZkLO2uFoquJUMYo1XbMiwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733205228; c=relaxed/simple;
	bh=P8hHabuxXlozHa1MTefWgWLl31XaOdEag63UssjpFo4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R4DQj+pG9rdDSIcfWoxQGLwvuLLL8yFvIwf7L/4mVx3piKDxkr0lVm2ZzyJbVSFyGZOv40Fr4XPo9D0peUNqoQ7rev26qAmmltjtRqZwwtFZB/0rWw29B7iXgzcM9ApLPK8K1mKo/nzSraPbzqVIjGIEc/HNBPix4tqMU/W3H/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2pX1vAH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2pX1vAH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733205227; x=1764741227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P8hHabuxXlozHa1MTefWgWLl31XaOdEag63UssjpFo4=;
  b=G2pX1vAHUAPS4cjCrUmOCmFuAAjmTSYYNivuPdpeCSGnD36tsrJhWiWB
   aS/tNEmdpGC/56VunhlnH1EFc8Fi8kSgZhaVq1Lg+TaOmfp02ip54Azcx
   VstWf/50ktyqGF7KO9bteJOjnz8m6qN9OfEkoPG9cRcw++85eR4uh7ADs
   WW3DAboxFWtxdv7/K4JHCC8gkORAquzMU/2jTVfL/oKNn90AVz7iSoUyr
   RPxPbxD/5gx4+hxorAQOFEyiIn8HaJ5N9j29T4c6ydTFXrrN3Kih6B1sr
   66AuElXHQFmhsi/J/BzFz/NSOoQ+8W/QeRSLn59WkoTyYZCVNXJzHiELr
   A==;
X-CSE-ConnectionGUID: bmSl90UHRXK+pffhoagdpQ==
X-CSE-MsgGUID: ARy2is4bSjKn6vUuLfHu1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43885723"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="43885723"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 21:53:44 -0800
X-CSE-ConnectionGUID: qYNhBAGrT2KIb8XYmHOJPA==
X-CSE-MsgGUID: 55/wc5IIRNuioAVYPI/RVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="97390967"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2024 21:53:43 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tILqv-0000BJ-1Q;
	Tue, 03 Dec 2024 05:53:41 +0000
Date: Tue, 3 Dec 2024 13:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Huaxin Lu <luhuaxin1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 security/integrity/ima/ima_template_lib.c:102:44: sparse: sparse: cast to
 restricted __le16
Message-ID: <202412031310.oFwEBFj9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   020e0507954f21291b7b3a0a280128270a0d8959
commit: 2c0768b2f0838b4a365d958abd751773e795e987 [2516/2516] ima: Add ima_show_template_uint() template library function
config: x86_64-randconfig-121-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031310.oFwEBFj9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031310.oFwEBFj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031310.oFwEBFj9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/integrity/ima/ima_template_lib.c:102:44: sparse: sparse: cast to restricted __le16
   security/integrity/ima/ima_template_lib.c:109:44: sparse: sparse: cast to restricted __le32
>> security/integrity/ima/ima_template_lib.c:116:44: sparse: sparse: cast to restricted __le64
   security/integrity/ima/ima_template_lib.c:137:60: sparse: sparse: restricted __le32 degrades to integer
   security/integrity/ima/ima_template_lib.c:232:49: sparse: sparse: cast to restricted __le32

vim +102 security/integrity/ima/ima_template_lib.c

    66	
    67	static void ima_show_template_data_ascii(struct seq_file *m,
    68						 enum ima_show_type show,
    69						 enum data_formats datafmt,
    70						 struct ima_field_data *field_data)
    71	{
    72		u8 *buf_ptr = field_data->data;
    73		u32 buflen = field_data->len;
    74	
    75		switch (datafmt) {
    76		case DATA_FMT_DIGEST_WITH_ALGO:
    77			buf_ptr = strnchr(field_data->data, buflen, ':');
    78			if (buf_ptr != field_data->data)
    79				seq_printf(m, "%s", field_data->data);
    80	
    81			/* skip ':' and '\0' */
    82			buf_ptr += 2;
    83			buflen -= buf_ptr - field_data->data;
    84			fallthrough;
    85		case DATA_FMT_DIGEST:
    86		case DATA_FMT_HEX:
    87			if (!buflen)
    88				break;
    89			ima_print_digest(m, buf_ptr, buflen);
    90			break;
    91		case DATA_FMT_STRING:
    92			seq_printf(m, "%s", buf_ptr);
    93			break;
    94		case DATA_FMT_UINT:
    95			switch (field_data->len) {
    96			case sizeof(u8):
    97				seq_printf(m, "%u", *(u8 *)buf_ptr);
    98				break;
    99			case sizeof(u16):
   100				if (ima_canonical_fmt)
   101					seq_printf(m, "%u",
 > 102						   le16_to_cpu(*(u16 *)buf_ptr));
   103				else
   104					seq_printf(m, "%u", *(u16 *)buf_ptr);
   105				break;
   106			case sizeof(u32):
   107				if (ima_canonical_fmt)
   108					seq_printf(m, "%u",
   109						   le32_to_cpu(*(u32 *)buf_ptr));
   110				else
   111					seq_printf(m, "%u", *(u32 *)buf_ptr);
   112				break;
   113			case sizeof(u64):
   114				if (ima_canonical_fmt)
   115					seq_printf(m, "%llu",
 > 116						   le64_to_cpu(*(u64 *)buf_ptr));
   117				else
   118					seq_printf(m, "%llu", *(u64 *)buf_ptr);
   119				break;
   120			default:
   121				break;
   122			}
   123		default:
   124			break;
   125		}
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
