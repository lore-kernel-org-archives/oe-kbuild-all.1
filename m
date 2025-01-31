Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF751531D2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 20:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355351; cv=none; b=MYId90k6YltVWWdkdcPRhOMe9stsgvdF3+9c4Q+7NMFom4u8aPR6S30VD7f4bDkKmObukE8/JwGtPjHBJXUEIZkzmVznJvDhpn2zZH9oz0Mx66OZ8jWT9O5c6BPV1Q7ZzFicmjRG9XzElixLSIMQDn1hIK4pohA8tqV/rjrZMWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355351; c=relaxed/simple;
	bh=ilR/6l/hHXkOxkNe82MOd7EqNVikSfG9aCfX+SxqhSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eh/8sp6JYBnWEL5mupOZkr9b2C2QLF+aRP7W05eYXQr5XcpCce+qKmRNWus6fOlY/I/VjZkp/yMWG8QGi4IwrRP1oElG8/qkh82kWPCAckPayCsEyZcbXQLvKIvjqqI8krAp7Le7OOrlaeVPLypXiY3QB5evyU2Vt6/b7IMZH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KuIotyH2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KuIotyH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738355348; x=1769891348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ilR/6l/hHXkOxkNe82MOd7EqNVikSfG9aCfX+SxqhSM=;
  b=KuIotyH2aXaKA6pJL792GEYZdHx9GgfSFC07Sk3yjAdRREPeb7HwRDxZ
   AjFGRXoJQCiz7CsTf0/8wuy15qB1uHfp03Iw1I0uEBNMEkHEyXZX5U1ys
   WLhXVte/stfPyiQi019n4LLDBzziWVSN01WydO0skd5l2XXnWU96+ZQHK
   0X/4sEYHQZa3HbWIlq/ZjK+5jQDHhJoA+bhor8uNp/4zH1aLHrED66HU6
   omf/Z/OZlH5XPDEhHlajarj43iLbovOIPfITr3a3AEgDyG8tkZa9+gxPB
   vzff/GlH4UaKiogCHPSsTp93Yd0yojHkKKoACmxjTQ4TfriiLGNgJTb8m
   A==;
X-CSE-ConnectionGUID: V2RXIbqlQ0Ol32QtK5fxzg==
X-CSE-MsgGUID: Yhg0iqchQBeYphKhzNNLlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="49193179"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="49193179"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 12:29:08 -0800
X-CSE-ConnectionGUID: j/ENElRLSJmGBm92cjkK0Q==
X-CSE-MsgGUID: Qr+NwlJKTGiVMKjiSjXlgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113740720"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jan 2025 12:29:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdxdQ-000n5v-1j;
	Fri, 31 Jan 2025 20:29:04 +0000
Date: Sat, 1 Feb 2025 04:28:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v3 22/58] drivers/acpi/property.c:924:
 warning: Function parameter or struct member 'nargs_prop' not described in
 '__acpi_node_get_property_reference'
Message-ID: <202502010413.uaKDT0fo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v3
head:   3c36c2e5ee25e308dc9d70db4ea160fc24a975a9
commit: fe65c996b0f6886e45c3290c452aaae198b9ce0a [22/58] ACPI: property: Add support for nargs_prop in acpi_fwnode_get_reference_args()
config: x86_64-buildonly-randconfig-003-20250201 (https://download.01.org/0day-ci/archive/20250201/202502010413.uaKDT0fo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010413.uaKDT0fo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010413.uaKDT0fo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/property.c:924: warning: Function parameter or struct member 'nargs_prop' not described in '__acpi_node_get_property_reference'


vim +924 drivers/acpi/property.c

9880702d123f20 Rafael J. Wysocki 2023-11-06   884  
ffdcd955c3078a Mika Westerberg   2014-10-21   885  /**
b60e4ea4a400bd Mika Westerberg   2016-09-29   886   * __acpi_node_get_property_reference - returns handle to the referenced object
b60e4ea4a400bd Mika Westerberg   2016-09-29   887   * @fwnode: Firmware node to get the property from
504a33749971c3 Rafael J. Wysocki 2015-08-27   888   * @propname: Name of the property
ffdcd955c3078a Mika Westerberg   2014-10-21   889   * @index: Index of the reference to return
b60e4ea4a400bd Mika Westerberg   2016-09-29   890   * @num_args: Maximum number of arguments after each reference
ffdcd955c3078a Mika Westerberg   2014-10-21   891   * @args: Location to store the returned reference with optional arguments
bef52aa0f3de1b Sakari Ailus      2023-11-09   892   *	  (may be NULL)
ffdcd955c3078a Mika Westerberg   2014-10-21   893   *
ffdcd955c3078a Mika Westerberg   2014-10-21   894   * Find property with @name, verifify that it is a package containing at least
ffdcd955c3078a Mika Westerberg   2014-10-21   895   * one object reference and if so, store the ACPI device object pointer to the
60ba032ed76e85 Rafael J. Wysocki 2014-11-05   896   * target object in @args->adev.  If the reference includes arguments, store
60ba032ed76e85 Rafael J. Wysocki 2014-11-05   897   * them in the @args->args[] array.
ffdcd955c3078a Mika Westerberg   2014-10-21   898   *
60ba032ed76e85 Rafael J. Wysocki 2014-11-05   899   * If there's more than one reference in the property value package, @index is
60ba032ed76e85 Rafael J. Wysocki 2014-11-05   900   * used to select the one to return.
ffdcd955c3078a Mika Westerberg   2014-10-21   901   *
b60e4ea4a400bd Mika Westerberg   2016-09-29   902   * It is possible to leave holes in the property value set like in the
b60e4ea4a400bd Mika Westerberg   2016-09-29   903   * example below:
b60e4ea4a400bd Mika Westerberg   2016-09-29   904   *
b60e4ea4a400bd Mika Westerberg   2016-09-29   905   * Package () {
b60e4ea4a400bd Mika Westerberg   2016-09-29   906   *     "cs-gpios",
b60e4ea4a400bd Mika Westerberg   2016-09-29   907   *     Package () {
b60e4ea4a400bd Mika Westerberg   2016-09-29   908   *        ^GPIO, 19, 0, 0,
b60e4ea4a400bd Mika Westerberg   2016-09-29   909   *        ^GPIO, 20, 0, 0,
b60e4ea4a400bd Mika Westerberg   2016-09-29   910   *        0,
b60e4ea4a400bd Mika Westerberg   2016-09-29   911   *        ^GPIO, 21, 0, 0,
b60e4ea4a400bd Mika Westerberg   2016-09-29   912   *     }
b60e4ea4a400bd Mika Westerberg   2016-09-29   913   * }
b60e4ea4a400bd Mika Westerberg   2016-09-29   914   *
c343bc2ce2c627 Sakari Ailus      2017-09-26   915   * Calling this function with index %2 or index %3 return %-ENOENT. If the
c343bc2ce2c627 Sakari Ailus      2017-09-26   916   * property does not contain any more values %-ENOENT is returned. The NULL
c343bc2ce2c627 Sakari Ailus      2017-09-26   917   * entry must be single integer and preferably contain value %0.
b60e4ea4a400bd Mika Westerberg   2016-09-29   918   *
ffdcd955c3078a Mika Westerberg   2014-10-21   919   * Return: %0 on success, negative error code on failure.
ffdcd955c3078a Mika Westerberg   2014-10-21   920   */
99a85464693faa Sakari Ailus      2017-07-21   921  int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
fe65c996b0f688 Sunil V L         2025-01-24   922  	const char *propname, size_t index, const char *nargs_prop, size_t num_args,
977d5ad39f3ea1 Sakari Ailus      2018-07-17   923  	struct fwnode_reference_args *args)
ffdcd955c3078a Mika Westerberg   2014-10-21  @924  {
ffdcd955c3078a Mika Westerberg   2014-10-21   925  	const union acpi_object *element, *end;
ffdcd955c3078a Mika Westerberg   2014-10-21   926  	const union acpi_object *obj;
99a85464693faa Sakari Ailus      2017-07-21   927  	const struct acpi_device_data *data;
9880702d123f20 Rafael J. Wysocki 2023-11-06   928  	struct fwnode_handle *ref_fwnode;
fe65c996b0f688 Sunil V L         2025-01-24   929  	struct acpi_device *ref_adev;
ffdcd955c3078a Mika Westerberg   2014-10-21   930  	struct acpi_device *device;
ffdcd955c3078a Mika Westerberg   2014-10-21   931  	int ret, idx = 0;
ffdcd955c3078a Mika Westerberg   2014-10-21   932  
b60e4ea4a400bd Mika Westerberg   2016-09-29   933  	data = acpi_device_data_of_node(fwnode);
b60e4ea4a400bd Mika Westerberg   2016-09-29   934  	if (!data)
c343bc2ce2c627 Sakari Ailus      2017-09-26   935  		return -ENOENT;
b60e4ea4a400bd Mika Westerberg   2016-09-29   936  
504a33749971c3 Rafael J. Wysocki 2015-08-27   937  	ret = acpi_data_get_property(data, propname, ACPI_TYPE_ANY, &obj);
ffdcd955c3078a Mika Westerberg   2014-10-21   938  	if (ret)
51858a2777f025 Sakari Ailus      2017-10-11   939  		return ret == -EINVAL ? -ENOENT : -EINVAL;
ffdcd955c3078a Mika Westerberg   2014-10-21   940  
88af7bbdea37af Sakari Ailus      2022-07-11   941  	switch (obj->type) {
88af7bbdea37af Sakari Ailus      2022-07-11   942  	case ACPI_TYPE_LOCAL_REFERENCE:
88af7bbdea37af Sakari Ailus      2022-07-11   943  		/* Plain single reference without arguments. */
60ba032ed76e85 Rafael J. Wysocki 2014-11-05   944  		if (index)
babc92da5928f8 Sakari Ailus      2022-01-14   945  			return -ENOENT;
ffdcd955c3078a Mika Westerberg   2014-10-21   946  
99ece713773bfa Rafael J. Wysocki 2021-12-03   947  		device = acpi_fetch_acpi_dev(obj->reference.handle);
99ece713773bfa Rafael J. Wysocki 2021-12-03   948  		if (!device)
99ece713773bfa Rafael J. Wysocki 2021-12-03   949  			return -EINVAL;
ffdcd955c3078a Mika Westerberg   2014-10-21   950  
bef52aa0f3de1b Sakari Ailus      2023-11-09   951  		if (!args)
bef52aa0f3de1b Sakari Ailus      2023-11-09   952  			return 0;
bef52aa0f3de1b Sakari Ailus      2023-11-09   953  
977d5ad39f3ea1 Sakari Ailus      2018-07-17   954  		args->fwnode = acpi_fwnode_handle(device);
ffdcd955c3078a Mika Westerberg   2014-10-21   955  		args->nargs = 0;
9880702d123f20 Rafael J. Wysocki 2023-11-06   956  
9880702d123f20 Rafael J. Wysocki 2023-11-06   957  		return 0;
9880702d123f20 Rafael J. Wysocki 2023-11-06   958  	case ACPI_TYPE_STRING:
9880702d123f20 Rafael J. Wysocki 2023-11-06   959  		if (index)
9880702d123f20 Rafael J. Wysocki 2023-11-06   960  			return -ENOENT;
9880702d123f20 Rafael J. Wysocki 2023-11-06   961  
9880702d123f20 Rafael J. Wysocki 2023-11-06   962  		ref_fwnode = acpi_parse_string_ref(fwnode, obj->string.pointer);
9880702d123f20 Rafael J. Wysocki 2023-11-06   963  		if (!ref_fwnode)
9880702d123f20 Rafael J. Wysocki 2023-11-06   964  			return -EINVAL;
9880702d123f20 Rafael J. Wysocki 2023-11-06   965  
9880702d123f20 Rafael J. Wysocki 2023-11-06   966  		args->fwnode = ref_fwnode;
9880702d123f20 Rafael J. Wysocki 2023-11-06   967  		args->nargs = 0;
9880702d123f20 Rafael J. Wysocki 2023-11-06   968  
ffdcd955c3078a Mika Westerberg   2014-10-21   969  		return 0;
88af7bbdea37af Sakari Ailus      2022-07-11   970  	case ACPI_TYPE_PACKAGE:
ffdcd955c3078a Mika Westerberg   2014-10-21   971  		/*
ffdcd955c3078a Mika Westerberg   2014-10-21   972  		 * If it is not a single reference, then it is a package of
9880702d123f20 Rafael J. Wysocki 2023-11-06   973  		 * references, followed by number of ints as follows:
ffdcd955c3078a Mika Westerberg   2014-10-21   974  		 *
ffdcd955c3078a Mika Westerberg   2014-10-21   975  		 *  Package () { REF, INT, REF, INT, INT }
ffdcd955c3078a Mika Westerberg   2014-10-21   976  		 *
9880702d123f20 Rafael J. Wysocki 2023-11-06   977  		 * Here, REF may be either a local reference or a string. The
9880702d123f20 Rafael J. Wysocki 2023-11-06   978  		 * index argument is then used to determine which reference the
9880702d123f20 Rafael J. Wysocki 2023-11-06   979  		 * caller wants (along with the arguments).
ffdcd955c3078a Mika Westerberg   2014-10-21   980  		 */
88af7bbdea37af Sakari Ailus      2022-07-11   981  		break;
88af7bbdea37af Sakari Ailus      2022-07-11   982  	default:
51858a2777f025 Sakari Ailus      2017-10-11   983  		return -EINVAL;
88af7bbdea37af Sakari Ailus      2022-07-11   984  	}
88af7bbdea37af Sakari Ailus      2022-07-11   985  
51858a2777f025 Sakari Ailus      2017-10-11   986  	if (index >= obj->package.count)
51858a2777f025 Sakari Ailus      2017-10-11   987  		return -ENOENT;
ffdcd955c3078a Mika Westerberg   2014-10-21   988  
ffdcd955c3078a Mika Westerberg   2014-10-21   989  	element = obj->package.elements;
ffdcd955c3078a Mika Westerberg   2014-10-21   990  	end = element + obj->package.count;
ffdcd955c3078a Mika Westerberg   2014-10-21   991  
ffdcd955c3078a Mika Westerberg   2014-10-21   992  	while (element < end) {
88af7bbdea37af Sakari Ailus      2022-07-11   993  		switch (element->type) {
88af7bbdea37af Sakari Ailus      2022-07-11   994  		case ACPI_TYPE_LOCAL_REFERENCE:
99ece713773bfa Rafael J. Wysocki 2021-12-03   995  			device = acpi_fetch_acpi_dev(element->reference.handle);
99ece713773bfa Rafael J. Wysocki 2021-12-03   996  			if (!device)
c343bc2ce2c627 Sakari Ailus      2017-09-26   997  				return -EINVAL;
ffdcd955c3078a Mika Westerberg   2014-10-21   998  
b60e4ea4a400bd Mika Westerberg   2016-09-29   999  			element++;
ffdcd955c3078a Mika Westerberg   2014-10-21  1000  
1aef25d9d1edbc Sakari Ailus      2022-07-11  1001  			ret = acpi_get_ref_args(idx == index ? args : NULL,
1aef25d9d1edbc Sakari Ailus      2022-07-11  1002  						acpi_fwnode_handle(device),
1aef25d9d1edbc Sakari Ailus      2022-07-11  1003  						&element, end, num_args);
1aef25d9d1edbc Sakari Ailus      2022-07-11  1004  			if (ret < 0)
1aef25d9d1edbc Sakari Ailus      2022-07-11  1005  				return ret;
ffdcd955c3078a Mika Westerberg   2014-10-21  1006  
1aef25d9d1edbc Sakari Ailus      2022-07-11  1007  			if (idx == index)
ffdcd955c3078a Mika Westerberg   2014-10-21  1008  				return 0;
ffdcd955c3078a Mika Westerberg   2014-10-21  1009  
9880702d123f20 Rafael J. Wysocki 2023-11-06  1010  			break;
9880702d123f20 Rafael J. Wysocki 2023-11-06  1011  		case ACPI_TYPE_STRING:
9880702d123f20 Rafael J. Wysocki 2023-11-06  1012  			ref_fwnode = acpi_parse_string_ref(fwnode,
9880702d123f20 Rafael J. Wysocki 2023-11-06  1013  							   element->string.pointer);
9880702d123f20 Rafael J. Wysocki 2023-11-06  1014  			if (!ref_fwnode)
9880702d123f20 Rafael J. Wysocki 2023-11-06  1015  				return -EINVAL;
fe65c996b0f688 Sunil V L         2025-01-24  1016  			if (nargs_prop) {
fe65c996b0f688 Sunil V L         2025-01-24  1017  				ref_adev = to_acpi_device_node(ref_fwnode);
fe65c996b0f688 Sunil V L         2025-01-24  1018  				if (!acpi_dev_get_property(ref_adev, nargs_prop,
fe65c996b0f688 Sunil V L         2025-01-24  1019  							   ACPI_TYPE_INTEGER, &obj)) {
fe65c996b0f688 Sunil V L         2025-01-24  1020  					num_args = obj->integer.value;
fe65c996b0f688 Sunil V L         2025-01-24  1021  				}
fe65c996b0f688 Sunil V L         2025-01-24  1022  			}
9880702d123f20 Rafael J. Wysocki 2023-11-06  1023  
9880702d123f20 Rafael J. Wysocki 2023-11-06  1024  			element++;
9880702d123f20 Rafael J. Wysocki 2023-11-06  1025  
9880702d123f20 Rafael J. Wysocki 2023-11-06  1026  			ret = acpi_get_ref_args(idx == index ? args : NULL,
9880702d123f20 Rafael J. Wysocki 2023-11-06  1027  						ref_fwnode, &element, end,
9880702d123f20 Rafael J. Wysocki 2023-11-06  1028  						num_args);
9880702d123f20 Rafael J. Wysocki 2023-11-06  1029  			if (ret < 0)
9880702d123f20 Rafael J. Wysocki 2023-11-06  1030  				return ret;
9880702d123f20 Rafael J. Wysocki 2023-11-06  1031  
9880702d123f20 Rafael J. Wysocki 2023-11-06  1032  			if (idx == index)
9880702d123f20 Rafael J. Wysocki 2023-11-06  1033  				return 0;
9880702d123f20 Rafael J. Wysocki 2023-11-06  1034  
88af7bbdea37af Sakari Ailus      2022-07-11  1035  			break;
88af7bbdea37af Sakari Ailus      2022-07-11  1036  		case ACPI_TYPE_INTEGER:
b60e4ea4a400bd Mika Westerberg   2016-09-29  1037  			if (idx == index)
b60e4ea4a400bd Mika Westerberg   2016-09-29  1038  				return -ENOENT;
b60e4ea4a400bd Mika Westerberg   2016-09-29  1039  			element++;
88af7bbdea37af Sakari Ailus      2022-07-11  1040  			break;
88af7bbdea37af Sakari Ailus      2022-07-11  1041  		default:
c343bc2ce2c627 Sakari Ailus      2017-09-26  1042  			return -EINVAL;
ffdcd955c3078a Mika Westerberg   2014-10-21  1043  		}
504a33749971c3 Rafael J. Wysocki 2015-08-27  1044  
b60e4ea4a400bd Mika Westerberg   2016-09-29  1045  		idx++;
b60e4ea4a400bd Mika Westerberg   2016-09-29  1046  	}
504a33749971c3 Rafael J. Wysocki 2015-08-27  1047  
c343bc2ce2c627 Sakari Ailus      2017-09-26  1048  	return -ENOENT;
504a33749971c3 Rafael J. Wysocki 2015-08-27  1049  }
b60e4ea4a400bd Mika Westerberg   2016-09-29  1050  EXPORT_SYMBOL_GPL(__acpi_node_get_property_reference);
b31384fa5de37a Rafael J. Wysocki 2014-11-04  1051  

:::::: The code at line 924 was first introduced by commit
:::::: ffdcd955c3078af3ce117edcfce80fde1a512bed ACPI: Add support for device specific properties

:::::: TO: Mika Westerberg <mika.westerberg@linux.intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
