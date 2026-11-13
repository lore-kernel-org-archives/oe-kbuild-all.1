Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794609716;
	b=r8beE7vdU6ZoSu0XejXvZa24Wpc25L/utMN+mOkq4STK8G7E/6Tv57z59Fz8x3PV1DIM
	 F5ZETwXU5s0V9Xb82gZApFYoMMZDua91MmQbAwoZ/oPpGj082FQwWJc6PKesI4l/3H1dD
	 Ovu39Bx+bRrqNxYaNfou1scwmkS4LeQn0ipLQgxGNOoDjaJvgVdkYU3PRzKAQe2PslDtS
	 PSo3WhpZZsjv2/QZ0CexMcykQH79/AOvBAa84lQ/ethQfx8t5JcMcfQwOTiOV/1/L9YnX
	 8F1vDqDfdB1HETCFFYUqrLIS3TejWlzpL8YZ15jmUP3SN3Qz/8psqZCo4352pAlH3aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609716;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=diWraMKDSzghTMuGWucz72tjXzsxXYIj+pgA3X58JZk=;
	b=Cs/ZGN1OSj3drY81LM112OF33CaG5da5S8a8tDCEIV/Oq08ajlKFkNjSW35mtANYYGnq
	 sRJZ+7Rc9YGkps9ZO/OvlwXehNM9wajtV1FtoINdFaKQbZRTnV9lM9OdnhQTe/GzZjFWp
	 YHocnM6QRmKxyY/ixLfPRH1NLc+SnH2iDvYJRNHvj83BAYKoyrQOcFhBXCyFAk6pnHNbP
	 0IERe+EnOkXZhsJd2e0Q+L8wXL6wRVM1uM1BNsxI2BuyIyHJan52c6QsshMByfXyQvx7j
	 a5AwlHInT6ElHnaSNayvxxa0WQYZODNVzbMB/95JsLIcMawtUh8iduEHRCqDbTtKTpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GsoYIRcw;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEEF606A333
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 22:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AEEF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GsoYIRcw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794609715; x=1826145715;
  h=date:from:to:cc:subject:message-id;
  bh=NQvvrluQ8hFX65MSndACavsbJe4zdGcTIrGJsLFIkvg=;
  b=GsoYIRcwR+4Cy7i+dSNtq9UQKRJbq2QKb7YkKWLzcbU6V6Ly/wH09NE6
   FaShGYxOHFtFjTj/hpMOoTdGkpGVIJHIt72gPNsRtZYNEO4vEKIjT+IB4
   eB7Ib/yxdFcuDUFbs0Bh1absxEd1pA5QVrgxxzCIDClcFs0E0cld6NZss
   Nz+0CLcho5+Rwd8M3BmLaGBRJ718HDW6dMEovJ3z7v++VBOgR1RaGsRFf
   Uvw/qnEDzvT5Bs13mAAgP0H/rZK1Z6pVs8c4UvlvmOM5qjPKmN2drhw+n
   FBiVhqhZa800afkWuCMJDAF6629R9GuehuMD+4yErIif58C42QzSY5RDX
   g==;
X-CSE-ConnectionGUID: Be/1ctcGQ1SwYWXuUJc7pg==
X-CSE-MsgGUID: wnbhPWmjQVqpAqaL8aMtQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3530893"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3530893"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 14:41:55 -0800
X-CSE-ConnectionGUID: PcRJA7gHRQidZ5g3EdSWsA==
X-CSE-MsgGUID: 7VMObbnnQvm7Wxbq5AYlqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9191005"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 13 Nov 2026 14:41:53 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRzxv-000000001Lv-177T;
	Fri, 13 Nov 2026 22:41:51 +0000
Date: Fri, 13 Nov 2026 23:41:38 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_2 31/68]
 security/integrity/ima/ima_attestation.c:366:48: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202611132302.hXUschnD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: 838a230dec9f155e7e064b2afb98e487f70fda7a [31/68] ima: Project the attestation journal through securityfs
config: s390-randconfig-r2301-20261113 (https://download.01.org/0day-ci/archive/20261113/202611132302.hXUschnD-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611132302.hXUschnD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611132302.hXUschnD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/integrity/ima/ima_attestation.c:366:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] encoded_length @@     got restricted __le32 [usertype] @@
   security/integrity/ima/ima_attestation.c:366:48: sparse:     expected unsigned int [usertype] encoded_length
   security/integrity/ima/ima_attestation.c:366:48: sparse:     got restricted __le32 [usertype]

vim +366 security/integrity/ima/ima_attestation.c

8d1b3ed1db2e379 Jiri Pirko 2026-09-30  319  
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  320  static int
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  321  ima_attestation_template_copy(const struct ima_template_entry *entry,
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  322  			      u8 **data, size_t *data_length)
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  323  {
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  324  	const struct ima_template_desc *desc = entry->template_desc;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  325  	bool legacy = !strcmp(desc->name, IMA_TEMPLATE_IMA_NAME);
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  326  	size_t length = 0;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  327  	size_t offset = 0;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  328  	int index;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  329  
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  330  	for (index = 0; index < desc->num_fields; index++) {
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  331  		const struct ima_template_field *field = desc->fields[index];
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  332  		const struct ima_field_data *field_data =
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  333  			&entry->template_data[index];
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  334  		size_t field_length = field_data->len;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  335  		bool length_prefix = true;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  336  
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  337  		if (legacy && !strcmp(field->field_id, "d"))
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  338  			length_prefix = false;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  339  		else if (legacy && !strcmp(field->field_id, "n"))
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  340  			field_length = strlen((char *)field_data->data);
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  341  		if ((length_prefix &&
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  342  		     check_add_overflow(length, sizeof(u32), &length)) ||
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  343  		    check_add_overflow(length, field_length, &length) ||
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  344  		    length > 65536)
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  345  			return -EINVAL;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  346  	}
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  347  
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  348  	*data = length ? kmalloc(length, GFP_NOFS) : NULL;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  349  	if (length && !*data)
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  350  		return -ENOMEM;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  351  	for (index = 0; index < desc->num_fields; index++) {
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  352  		const struct ima_template_field *field = desc->fields[index];
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  353  		const struct ima_field_data *field_data =
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  354  			&entry->template_data[index];
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  355  		size_t field_length = field_data->len;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  356  		bool length_prefix = true;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  357  
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  358  		if (legacy && !strcmp(field->field_id, "d"))
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  359  			length_prefix = false;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  360  		else if (legacy && !strcmp(field->field_id, "n"))
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  361  			field_length = strlen((char *)field_data->data);
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  362  		if (length_prefix) {
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  363  			u32 encoded_length = (u32)field_length;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  364  
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  365  			if (ima_canonical_fmt)
8d1b3ed1db2e379 Jiri Pirko 2026-09-30 @366  				encoded_length = cpu_to_le32(encoded_length);
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  367  			memcpy(*data + offset, &encoded_length,
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  368  			       sizeof(encoded_length));
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  369  			offset += sizeof(encoded_length);
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  370  		}
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  371  		memcpy(*data + offset, field_data->data, field_length);
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  372  		offset += field_length;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  373  	}
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  374  	*data_length = length;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  375  	return 0;
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  376  }
8d1b3ed1db2e379 Jiri Pirko 2026-09-30  377  

:::::: The code at line 366 was first introduced by commit
:::::: 8d1b3ed1db2e379ad99f0104f505e7724c92f8f4 ima: Route measurements through attestation

:::::: TO: Jiri Pirko <jiri@nvidia.com>
:::::: CC: Jiri Pirko <jiri@nvidia.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
