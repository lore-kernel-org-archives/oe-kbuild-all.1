Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E3720F08D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 05:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765431644; cv=none; b=O+amgXGbvp7FYqg+wI0M/5nxYq9ysMJmjXww+Y6C70Dxe1pOSPRncB/Ga0u5CUIT72edDHyJxljw3+byD5233kXeT3IMqs4GbayTtvLl6tM4/jtV8eWgu3DaQEG3m9VFgxEiBpCOOMSNI5hq3rn83klcBdwLKc88XFqUBf/+M2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765431644; c=relaxed/simple;
	bh=dHZwfbO27fdb1dajQoCbayrJbkejyJDJrKztel9oIrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OUlkNZ9RC3MBcXLOsfpU5KcEZE/ANHdHFiHHbQ8156BJdwpIUG0Sr85qBH0uI1tFyw2yszpV9G98l9wD9bpXxwNOitr6LZ0NdedQ4j04aqk/Jls1iFwbaxW/1E5xUelMA3l18IvbwOXYQIHR25RQFvI4FbqP9V3AU4pJTNc3PSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UK5+Oe45; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UK5+Oe45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765431642; x=1796967642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dHZwfbO27fdb1dajQoCbayrJbkejyJDJrKztel9oIrs=;
  b=UK5+Oe45YZYsZsPNXSYlEll4zvuRBRK3/M+KZ6uxoViGHsw0hsqH9xxR
   qlnUT908GUWqym2DingwXnZP04vucEFwsq5ofKJtSsuslkAudqSgCYNbt
   jUhzFefeY3btxLw4QGCyih6OwP0xBY/BdqRVezXTJkDZlMWZVtm9GIv1h
   3GYoodnHg4O/w7pru6x3Tzedjk6HmKkub3C4bt1eZ3W2QEMQp6BlGvEQG
   7SwqHnYZrmLfLIvX72EzwTCl5q9DhYU2v+Z8p1GYs7Ini/8TFETLDTX5C
   meHh7AsW4qSKchPQQjwJiVyGMb2JfmL+YraWJixKYsJ+3jf9Dy8t0ONeZ
   g==;
X-CSE-ConnectionGUID: X1XnvROsSzCbzrkKzZFgcg==
X-CSE-MsgGUID: Gy4CGttsRCybOZhPoJRkQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78111663"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78111663"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 21:40:41 -0800
X-CSE-ConnectionGUID: j8LqcfbTRFKbotpudU/YPw==
X-CSE-MsgGUID: 0DEpbUv3QVOpT8kEXhLcMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196715501"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2025 21:40:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTZPo-000000004Ej-4228;
	Thu, 11 Dec 2025 05:40:36 +0000
Date: Thu, 11 Dec 2025 13:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508]
 drivers/ub/urma/uburma/uburma_cmd_tlv.c:80:24: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202512111346.xfjnxdWL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 901128a1ed92d11749cd5ad529be4e30f3196214 [3508/3508] uburma: add uburma command and user object framework headers
config: arm64-randconfig-r112-20251210 (https://download.01.org/0day-ci/archive/20251211/202512111346.xfjnxdWL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111346.xfjnxdWL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111346.xfjnxdWL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ub/urma/uburma/uburma_cmd_tlv.c:80:24: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd_tlv.c:80:24: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd_tlv.c:80:24: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd_tlv.c:115:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd_tlv.c:115:46: sparse:     expected void const *args_addr
   drivers/ub/urma/uburma/uburma_cmd_tlv.c:115:46: sparse:     got void [noderef] __user *
>> drivers/ub/urma/uburma/uburma_cmd_tlv.c:184:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/uburma/uburma_cmd_tlv.c:184:44: sparse:     expected void *args_addr
   drivers/ub/urma/uburma/uburma_cmd_tlv.c:184:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/uburma/uburma_cmd_tlv.c: note: in included file (through drivers/ub/urma/uburma/uburma_cmd_tlv.h):
>> drivers/ub/urma/uburma/uburma_cmd.h:45:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/uburma/uburma_cmd.h:45:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/uburma/uburma_cmd.h:45:41: sparse:     got void const *args_addr
>> drivers/ub/urma/uburma/uburma_cmd.h:45:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/uburma/uburma_cmd.h:45:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/uburma/uburma_cmd.h:45:41: sparse:     got void const *args_addr
>> drivers/ub/urma/uburma/uburma_cmd.h:59:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/uburma/uburma_cmd.h:59:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/uburma/uburma_cmd.h:59:33: sparse:     got void *args_addr
--
   drivers/ub/urma/uburma/uburma_dev_ops.c:47:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_dev_ops.c:47:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_dev_ops.c:47:19: sparse:    struct ubcore_device *
>> drivers/ub/urma/uburma/uburma_dev_ops.c:68:6: sparse: sparse: symbol 'uburma_unregister_mmu' was not declared. Should it be static?
>> drivers/ub/urma/uburma/uburma_dev_ops.c:80:5: sparse: sparse: symbol 'uburma_register_mmu' was not declared. Should it be static?
   drivers/ub/urma/uburma/uburma_dev_ops.c:103:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_dev_ops.c:103:19: sparse:    struct ubcore_device [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_dev_ops.c:103:19: sparse:    struct ubcore_device *

vim +80 drivers/ub/urma/uburma/uburma_cmd_tlv.c

    61	
    62	static struct uburma_cmd_attr *
    63	uburma_create_tlv_attr(struct uburma_cmd_hdr *hdr,
    64			       uint32_t *attr_size)
    65	{
    66		struct uburma_cmd_attr *attr;
    67		int ret;
    68	
    69		if (hdr->args_len % sizeof(struct uburma_cmd_attr) != 0 ||
    70		    hdr->args_len >= UBURMA_CMD_TLV_MAX_LEN) {
    71			uburma_log_err("Invalid args_len: %u.\n",
    72				       hdr->args_len);
    73			return NULL;
    74		}
    75		attr = kzalloc(hdr->args_len, GFP_KERNEL);
    76		if (!attr)
    77			return NULL;
    78	
    79		ret = uburma_copy_from_user(
  > 80			attr, (void __user *)(uintptr_t)hdr->args_addr,
    81			hdr->args_len);
    82		if (ret != 0) {
    83			kfree(attr);
    84			return NULL;
    85		}
    86		*attr_size = hdr->args_len / sizeof(struct uburma_cmd_attr);
    87		return attr;
    88	}
    89	
    90	static int uburma_cmd_tlv_parse_type(struct uburma_cmd_spec *spec,
    91					     struct uburma_cmd_attr *attr)
    92	{
    93		uintptr_t ptr_src, ptr_dst;
    94		uint32_t i;
    95		int ret;
    96	
    97		/* length of uburma spec and from uvs should be strictly checked */
    98		/* as length of uvs ioctl attr should be strictly equal to length of uburma */
    99		if (spec->field_size != attr->field_size ||
   100		    spec->attr_data.bs.el_num != attr->attr_data.bs.el_num) {
   101			uburma_log_err(
   102				"Invalid attr, spec/attr, field_size: %u/%u, el_num: %u/%u, type: %u.\n",
   103				spec->field_size, attr->field_size,
   104				spec->attr_data.bs.el_num,
   105				attr->attr_data.bs.el_num, spec->type);
   106			return -EINVAL;
   107		}
   108	
   109		for (i = 0; i < spec->attr_data.bs.el_num; i++) {
   110			ptr_dst =
   111				(spec->data) + i * spec->attr_data.bs.el_size;
   112			ptr_src =
   113				(attr->data) + i * attr->attr_data.bs.el_size;
   114			ret = uburma_copy_from_user((void *)ptr_dst,
   115						    (void __user *)ptr_src,
   116						    spec->field_size);
   117			if (ret != 0)
   118				return ret;
   119		}
   120	
   121		return ret;
   122	}
   123	
   124	static int uburma_cmd_tlv_parse(struct uburma_cmd_spec *spec,
   125					uint32_t spec_size,
   126					struct uburma_cmd_attr *attr,
   127					uint32_t attr_size)
   128	{
   129		uint32_t spec_idx, attr_idx;
   130		bool match;
   131		int ret;
   132	
   133		/* spec type of this range is only in type */
   134		for (spec_idx = 0; spec_idx < spec_size; spec_idx++) {
   135			match = false;
   136			for (attr_idx = 0; attr_idx < attr_size; attr_idx++) {
   137				if (spec[spec_idx].type ==
   138				    attr[attr_idx].type) {
   139					ret = uburma_cmd_tlv_parse_type(
   140						&spec[spec_idx],
   141						&attr[attr_idx]);
   142					if (ret != 0)
   143						return ret;
   144					match = true;
   145					break;
   146				}
   147			}
   148			if (!match &&
   149			    ((spec[spec_idx].flag.bs.mandatory) != 0)) {
   150				uburma_log_err(
   151					"Failed to match mandatory in type: %u.\n",
   152					spec[spec_idx].type);
   153				return -EINVAL;
   154			}
   155		}
   156	
   157		return 0;
   158	}
   159	
   160	static int uburma_cmd_tlv_append_type(struct uburma_cmd_spec *spec,
   161					      struct uburma_cmd_attr *attr)
   162	{
   163		uintptr_t ptr_src, ptr_dst;
   164		uint32_t i;
   165		int ret;
   166	
   167		/* length of uburma spec and from uvs should be strictly checked */
   168		/* as length of uvs ioctl attr should be strictly equal to length of uburma */
   169		if (spec->field_size != attr->field_size ||
   170		    spec->attr_data.bs.el_num > attr->attr_data.bs.el_num) {
   171			uburma_log_err(
   172				"Invalid attr, spec/attr, field_size: %u/%u, array_size: %u/%u, type: %u.\n",
   173				spec->field_size, attr->field_size,
   174				spec->attr_data.bs.el_num,
   175				attr->attr_data.bs.el_num, spec->type);
   176			return -EINVAL;
   177		}
   178	
   179		for (i = 0; i < spec->attr_data.bs.el_num; i++) {
   180			ptr_src =
   181				(spec->data) + i * spec->attr_data.bs.el_size;
   182			ptr_dst =
   183				(attr->data) + i * attr->attr_data.bs.el_size;
 > 184			ret = uburma_copy_to_user((void __user *)ptr_dst,
   185						  (void *)ptr_src,
   186						  spec->field_size);
   187			if (ret != 0)
   188				return ret;
   189		}
   190	
   191		return ret;
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
