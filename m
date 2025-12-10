Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B24D27E7F0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 18:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765392771; cv=none; b=XkeUGb2Wj2vYKBusOQLSqmScbT3HgJ/XWr0cw/nOGDEGnJjvp4bCYAdCMk2lFZjkx8CX7ywfjR1WkdbsmDS2f7E8N6AZPXSoMvXps9oQZL14iZYa9CffLIyNQSTzhwYjs/mIS6lA4zauaf43vCWQhcKIizgbil7uG07/XWElwbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765392771; c=relaxed/simple;
	bh=1/tN5xldfNBnq64qlfvRflmRFS9s04cwy+quxW0S7ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rsuBJ5esyTpktZk7yXE62pcu/pfg2m3pQoebikT8qvJ/QDq6Y5joVPEXjprBcOeyZC9ng7BssU5CxsdZe4YT6wwmZMfjgdJtjF5B4VETsxGYzUa5GSjCR7rE++yLh5R8OukvAGpyefTh2z6b42lX7rO/KT4mJ67Evc27YnlCPZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RuF/oJWO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RuF/oJWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765392769; x=1796928769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1/tN5xldfNBnq64qlfvRflmRFS9s04cwy+quxW0S7ZQ=;
  b=RuF/oJWOovlFC0Sl58Uy/YdotaD8qPeGf48uQski8yjye7dMIffdWNLb
   7n4nIzb1g/cfMo/jTgOXNwJYWDkZerVt8YtCtB3xM/d0t8VFCDJyyNn40
   7YL25hVrqnMJQaweBFtf0Udh1NVcxdVnSE0P0dE0tZCeELiHsOGs1XJVw
   fueW6CBxWlQjtRLDEWQIqJDMRzCZ2JWVjRZndA8uRpp5BCOHZ+RajK1QO
   DuM8Y1fP3FWySCiiB7j9Y+KeuwvoQX0cxa4GZA+mOsBp0EGClBpHRJI5F
   NagDQZ7JJftZT9FljvhMCrHowQ1Sr4VLzTeSxCsmBBvdTK1WyjtGBmiym
   w==;
X-CSE-ConnectionGUID: UhPICitNTR2rFsYG61beog==
X-CSE-MsgGUID: sS+XLusBRiiQYqMCrDv16g==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84977455"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="84977455"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 10:52:48 -0800
X-CSE-ConnectionGUID: EJ+D7W9/QmaIOyipOrLuoQ==
X-CSE-MsgGUID: 4guavnh1Qgyw81CAqV5CZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="200758742"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Dec 2025 10:52:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTPIq-000000003ev-3qVc;
	Wed, 10 Dec 2025 18:52:44 +0000
Date: Thu, 11 Dec 2025 02:52:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508]
 drivers/ub/urma/ubcore/ubcore_cmd_tlv.c:98:24: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202512110241.IA0OcNWQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d281438782e3c28a3df71a64513a3312d43dcf01
commit: 4023540b983eda09c4397401ac6a5a037d17a9c0 [3508/3508] ubcore: implement support for UVS commands
config: arm64-randconfig-r112-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110241.IA0OcNWQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110241.IA0OcNWQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110241.IA0OcNWQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ub/urma/ubcore/ubcore_cmd_tlv.c:98:24: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_cmd_tlv.c:98:24: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd_tlv.c:98:24: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_cmd_tlv.c:131:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_cmd_tlv.c:131:46: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd_tlv.c:131:46: sparse:     got void [noderef] __user *
>> drivers/ub/urma/ubcore/ubcore_cmd_tlv.c:196:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_cmd_tlv.c:196:44: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd_tlv.c:196:44: sparse:     got void [noderef] __user *
>> drivers/ub/urma/ubcore/ubcore_cmd_tlv.c:228:5: sparse: sparse: symbol 'ubcore_tlv_parse' was not declared. Should it be static?
>> drivers/ub/urma/ubcore/ubcore_cmd_tlv.c:262:5: sparse: sparse: symbol 'ubcore_tlv_append' was not declared. Should it be static?
   drivers/ub/urma/ubcore/ubcore_cmd_tlv.c: note: in included file:
   drivers/ub/urma/ubcore/ubcore_cmd.h:140:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:140:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:140:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:140:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:140:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:140:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:152:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:152:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:152:33: sparse:     got void *args_addr

vim +98 drivers/ub/urma/ubcore/ubcore_cmd_tlv.c

    72	
    73	static struct ubcore_tlv_handler
    74		g_global_tlv_handler[] = { [0] = { 0 },
    75					   [UBCORE_CMD_SET_TOPO] = {
    76						   ubcore_set_topo_fill_spec_in,
    77						   SET_TOPO_IN_NUM,
    78						   NULL,
    79						   0,
    80					   } };
    81	
    82	static struct ubcore_cmd_attr *
    83	ubcore_create_tlv_attr(struct ubcore_cmd_hdr *hdr, uint32_t *attr_size)
    84	{
    85		struct ubcore_cmd_attr *attr;
    86		int ret;
    87	
    88		if (hdr->args_len % sizeof(struct ubcore_cmd_attr) != 0 ||
    89		    hdr->args_len >= UBCORE_CMD_TLV_MAX_LEN) {
    90			ubcore_log_err("Invalid args_len: %u.\n", hdr->args_len);
    91			return NULL;
    92		}
    93		attr = kzalloc(hdr->args_len, GFP_KERNEL);
    94		if (attr == NULL)
    95			return NULL;
    96	
    97		ret = ubcore_copy_from_user(
  > 98			attr, (void __user *)(uintptr_t)hdr->args_addr, hdr->args_len);
    99		if (ret != 0) {
   100			kfree(attr);
   101			return NULL;
   102		}
   103		*attr_size = hdr->args_len / sizeof(struct ubcore_cmd_attr);
   104		return attr;
   105	}
   106	
   107	static int ubcore_cmd_tlv_parse_type(struct ubcore_cmd_spec *spec,
   108					     struct ubcore_cmd_attr *attr)
   109	{
   110		uintptr_t ptr_src, ptr_dst;
   111		uint32_t i;
   112		int ret;
   113		uint32_t spec_el_num = spec->attr_data.bs.el_num;
   114		uint32_t attr_el_num = attr->attr_data.bs.el_num;
   115	
   116		/* length of ubcore spec and from uvs should be strictly checked */
   117		/* as length of uvs ioctl attr should be strictly equal to length of ubcore */
   118		if (spec->field_size != attr->field_size ||
   119		    spec_el_num != attr_el_num) {
   120			ubcore_log_err(
   121				"Invalid attr, spec/attr, field_size: %u/%u, el_num: %u/%u, type: %u.\n",
   122				spec->field_size, attr->field_size, spec_el_num,
   123				attr_el_num, spec->type);
   124			return -EINVAL;
   125		}
   126	
   127		for (i = 0; i < spec_el_num; i++) {
   128			ptr_dst = (spec->data) + i * spec->attr_data.bs.el_size;
   129			ptr_src = (attr->data) + i * attr->attr_data.bs.el_size;
   130			ret = ubcore_copy_from_user((void *)ptr_dst,
   131						    (void __user *)ptr_src,
   132						    spec->field_size);
   133			if (ret != 0)
   134				return ret;
   135		}
   136	
   137		return ret;
   138	}
   139	
   140	static int ubcore_cmd_tlv_parse(struct ubcore_cmd_spec *spec,
   141					uint32_t spec_size,
   142					struct ubcore_cmd_attr *attr,
   143					uint32_t attr_size)
   144	{
   145		uint32_t spec_idx, attr_idx;
   146		bool match;
   147		int ret;
   148	
   149		/* spec type of this range is only in type */
   150		for (spec_idx = 0; spec_idx < spec_size; spec_idx++) {
   151			match = false;
   152			for (attr_idx = 0; attr_idx < attr_size; attr_idx++) {
   153				if (spec[spec_idx].type == attr[attr_idx].type) {
   154					ret = ubcore_cmd_tlv_parse_type(
   155						&spec[spec_idx], &attr[attr_idx]);
   156					if (ret != 0)
   157						return ret;
   158					match = true;
   159					break;
   160				}
   161			}
   162			if (!match) {
   163				ubcore_log_err(
   164					"Failed to match mandatory in type: %u.\n",
   165					spec[spec_idx].type);
   166				return -1;
   167			}
   168		}
   169	
   170		return 0;
   171	}
   172	
   173	static int ubcore_cmd_tlv_append_type(struct ubcore_cmd_spec *spec,
   174					      struct ubcore_cmd_attr *attr)
   175	{
   176		uintptr_t ptr_src, ptr_dst;
   177		uint32_t i;
   178		int ret;
   179		uint32_t spec_el_num = spec->attr_data.bs.el_num;
   180		uint32_t attr_el_num = attr->attr_data.bs.el_num;
   181	
   182		/* length of ubcore spec and from uvs should be strictly checked */
   183		/* as length of uvs ioctl attr should be strictly equal to length of ubcore */
   184		if (spec->field_size != attr->field_size ||
   185		    spec_el_num != attr_el_num) {
   186			ubcore_log_err(
   187				"Invalid attr, spec/attr, field_size: %u/%u, array_size: %u/%u, type: %u.\n",
   188				spec->field_size, attr->field_size, spec_el_num,
   189				attr_el_num, spec->type);
   190			return -EINVAL;
   191		}
   192	
   193		for (i = 0; i < spec_el_num; i++) {
   194			ptr_src = (spec->data) + i * spec->attr_data.bs.el_size;
   195			ptr_dst = (attr->data) + i * attr->attr_data.bs.el_size;
 > 196			ret = ubcore_copy_to_user((void __user *)ptr_dst,
   197						  (void *)ptr_src, spec->field_size);
   198			if (ret != 0)
   199				return ret;
   200		}
   201	
   202		return ret;
   203	}
   204	
   205	static int ubcore_cmd_tlv_append(struct ubcore_cmd_spec *spec,
   206					 uint32_t spec_size,
   207					 struct ubcore_cmd_attr *attr,
   208					 uint32_t attr_size)
   209	{
   210		uint32_t spec_idx, attr_idx;
   211		int ret;
   212	
   213		for (spec_idx = 0; spec_idx < spec_size; spec_idx++) {
   214			for (attr_idx = 0; attr_idx < attr_size; attr_idx++) {
   215				if (spec[spec_idx].type == attr[attr_idx].type &&
   216				    spec[spec_idx].field_size != 0) {
   217					ret = ubcore_cmd_tlv_append_type(
   218						&spec[spec_idx], &attr[attr_idx]);
   219					if (ret != 0)
   220						return ret;
   221					break;
   222				}
   223			}
   224		}
   225		return 0;
   226	}
   227	
 > 228	int ubcore_tlv_parse(ubcore_fill_spec_func fill_spec, size_t spec_size,
   229			     struct ubcore_cmd_hdr *hdr, void *arg)
   230	{
   231		struct ubcore_cmd_spec *spec = NULL;
   232		struct ubcore_cmd_attr *attr = NULL;
   233		uint32_t attr_size;
   234		int ret;
   235	
   236		/* Command of hdr is valid, no need to check it */
   237		if (fill_spec == NULL) {
   238			ubcore_log_err("Invalid command: %u.\n", hdr->command);
   239			return -EINVAL;
   240		}
   241	
   242		spec = kcalloc(spec_size, sizeof(struct ubcore_cmd_spec), GFP_KERNEL);
   243		if (spec == NULL)
   244			return -ENOMEM;
   245	
   246		fill_spec(arg, spec);
   247	
   248		attr = ubcore_create_tlv_attr(hdr, &attr_size);
   249		if (attr == NULL) {
   250			ret = -ENOMEM;
   251			goto free_spec;
   252		}
   253	
   254		ret = ubcore_cmd_tlv_parse(spec, spec_size, attr, attr_size);
   255	
   256		kfree(attr);
   257	free_spec:
   258		kfree(spec);
   259		return ret;
   260	}
   261	
 > 262	int ubcore_tlv_append(ubcore_fill_spec_func fill_spec, size_t spec_size,
   263			      struct ubcore_cmd_hdr *hdr, void *arg)
   264	{
   265		struct ubcore_cmd_spec *spec = NULL;
   266		struct ubcore_cmd_attr *attr = NULL;
   267		uint32_t attr_size;
   268		int ret;
   269	
   270		/* Command of hdr is valid, no need to check it */
   271		if (fill_spec == NULL) {
   272			ubcore_log_err("Invalid command: %u.\n", hdr->command);
   273			return -EINVAL;
   274		}
   275	
   276		spec = kcalloc(spec_size, sizeof(struct ubcore_cmd_spec), GFP_KERNEL);
   277		if (spec == NULL)
   278			return -ENOMEM;
   279	
   280		fill_spec(arg, spec);
   281	
   282		attr = ubcore_create_tlv_attr(hdr, &attr_size);
   283		if (attr == NULL) {
   284			ret = -ENOMEM;
   285			goto free_spec;
   286		}
   287	
   288		ret = ubcore_cmd_tlv_append(spec, spec_size, attr, attr_size);
   289	
   290		kfree(attr);
   291	free_spec:
   292		kfree(spec);
   293		return ret;
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
