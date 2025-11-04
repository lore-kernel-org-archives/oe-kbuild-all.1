Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5694D27456
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 01:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762218048; cv=none; b=azaZ37Q3hp2WacbaqJNWnXz32Ctl9g3KDKrEYWS9+rYbSHEsdoDFUCFHc/TR6uI8/uYdztj8Qg7PJZac4bBjX9li+NRAppycBXXrrZblNK3Hja8KnIln6J1luFMsYSsgvYaBIdQblGui5QhokicPLaGTgY2VAxrPg31CdWJ5fxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762218048; c=relaxed/simple;
	bh=ABftNU8H/SpYBLo9Fhi6tdQd2v13vqcj2I5CNpHJUr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZKL6JX/T9SkgAHWDgZjeV/hdlBWRmpYYcbRSZ5g3Ao2jnGvAFiEXHAxEeEQw7JVar6rGrWFPFxg8EASSJz7xiRjIxiff80Y1ILsIf1jVZCkjswuPLxJmkHMfdDX/SOjiA4kR1ioRkhzMXyywOnT+umLvAUtmt8B+MFDEt1zTkCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oA03UPq2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oA03UPq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762218046; x=1793754046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ABftNU8H/SpYBLo9Fhi6tdQd2v13vqcj2I5CNpHJUr8=;
  b=oA03UPq2LduHhGyNTr6IoZA4TiwIISoteRAn1Nkh9B9bHKhUzqErppw/
   u5lYQwgmpqhD4MLhJYD9hHMXIhIy399puJwxxSgIZd4muC2ViLjCo5gEa
   u2gMeWhDj0hczqSEPq34WLtl6w2GByEyoZj5dm4f+Z4XhgPFT/U4svCgQ
   1w40+racgwHQi5xW7CZpaSjNVopMWIe3XINERIQ868mZ+EuabbU4tV/Pi
   UJRUOa9g3J5JOWCa84krBPqsM5NcWu1YM202wuxeO8OBNq6Fw1Ga+HxFo
   lxo64NoSeS+cwgxS6QLw4pv/kN7RLC2qvWa26kMCKiQLi0keQidKWBOhq
   A==;
X-CSE-ConnectionGUID: mBmIed7TRNKoBpdw3oNxSw==
X-CSE-MsgGUID: USNUB0npSvaVJaV0T8MReg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64337213"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="64337213"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 16:59:34 -0800
X-CSE-ConnectionGUID: Wbb4GI+EREak9yHf7EgUqA==
X-CSE-MsgGUID: 6Slib5k+SKSeOiiWcmk9QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="186961151"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Nov 2025 16:59:33 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG5Nb-000QhU-1j;
	Tue, 04 Nov 2025 00:59:21 +0000
Date: Tue, 4 Nov 2025 08:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/enum.c:1097:6:
 warning: no previous prototype for function 'ub_enum_clear_ent_list'
Message-ID: <202511040855.Fu1HC1a9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a29fc03bd0ddaf7388cf31604ef5bd9807585109
commit: 1a64cb7c7288cac262e7b3fd8d4dcd49b8a5bde5 [3075/3075] ub:ubus: Support for UB Bus Controller Enumeration
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251104/202511040855.Fu1HC1a9-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040855.Fu1HC1a9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040855.Fu1HC1a9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/ubus/enum.c:996:5: warning: no previous prototype for function 'ub_cfg_read_guid' [-Wmissing-prototypes]
     996 | int ub_cfg_read_guid(struct ub_entity *uent)
         |     ^
   drivers/ub/ubus/enum.c:996:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     996 | int ub_cfg_read_guid(struct ub_entity *uent)
         | ^
         | static 
>> drivers/ub/ubus/enum.c:1097:6: warning: no previous prototype for function 'ub_enum_clear_ent_list' [-Wmissing-prototypes]
    1097 | void ub_enum_clear_ent_list(struct list_head *dev_list)
         |      ^
   drivers/ub/ubus/enum.c:1097:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1097 | void ub_enum_clear_ent_list(struct list_head *dev_list)
         | ^
         | static 
   drivers/ub/ubus/enum.c:1187:5: warning: no previous prototype for function 'ub_enum_probe' [-Wmissing-prototypes]
    1187 | int ub_enum_probe(void)
         |     ^
   drivers/ub/ubus/enum.c:1187:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1187 | int ub_enum_probe(void)
         | ^
         | static 
   drivers/ub/ubus/enum.c:1211:6: warning: no previous prototype for function 'ub_enum_remove' [-Wmissing-prototypes]
    1211 | void ub_enum_remove(void)
         |      ^
   drivers/ub/ubus/enum.c:1211:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1211 | void ub_enum_remove(void)
         | ^
         | static 
   4 warnings generated.


vim +/ub_enum_clear_ent_list +1097 drivers/ub/ubus/enum.c

   995	
 > 996	int ub_cfg_read_guid(struct ub_entity *uent)
   997	{
   998		u32 val = 0;
   999		int i, ret;
  1000	
  1001		for (i = 0; i < UB_GUID_DW_NUM; i++) {
  1002			ret = ub_cfg_read_dword(uent, UB_GUID + i * sizeof(u32), &val);
  1003			if (ret)
  1004				return ret;
  1005	
  1006			uent->guid.dw[i] = val;
  1007		}
  1008	
  1009		return 0;
  1010	}
  1011	
  1012	static void ub_enum_destroy_entity(struct ub_entity *uent)
  1013	{
  1014		message_remove_device(uent);
  1015	
  1016		if (is_primary(uent))
  1017			ub_ubc_put(uent->ubc);
  1018	
  1019		kfree(uent);
  1020	}
  1021	
  1022	static struct ub_entity *ub_enum_create_uent(struct ub_bus_controller *ubc)
  1023	{
  1024		struct ub_entity *uent;
  1025		int ret;
  1026	
  1027		uent = ub_alloc_ent();
  1028		if (!uent)
  1029			return NULL;
  1030	
  1031		uent->pue = uent;
  1032		uent->entity_idx = 0;
  1033		uent->ubc = ub_ubc_get(ubc);
  1034		uent->upi = UB_CP_UPI;
  1035		ret = message_probe_device(uent);
  1036		if (ret) {
  1037			dev_err(&ubc->dev, "enum msg probe dev failed, ret=%d\n", ret);
  1038			goto err_out;
  1039		}
  1040	
  1041		return uent;
  1042	err_out:
  1043		ub_ubc_put(ubc);
  1044		kfree(uent);
  1045		return NULL;
  1046	}
  1047	
  1048	static struct ub_entity *ub_enum_create_bus_controller(struct ub_bus_controller *ubc)
  1049	{
  1050		struct ub_entity *uent;
  1051		int ret;
  1052	
  1053		uent = ub_enum_create_uent(ubc);
  1054		if (!uent)
  1055			return (struct ub_entity *)ERR_PTR(-ENOMEM);
  1056	
  1057		ubc->uent = uent;
  1058		ret = ub_cfg_read_guid(uent);
  1059		if (ret) {
  1060			dev_err(&ubc->dev, "read guid failed, ret=%d\n", ret);
  1061			goto err_out;
  1062		}
  1063	
  1064		uent->topo_rank = 0;
  1065		uent->dev.parent = &ubc->dev;
  1066	
  1067		return uent;
  1068	err_out:
  1069		ub_enum_destroy_entity(uent);
  1070		return (struct ub_entity *)ERR_PTR(ret);
  1071	}
  1072	
  1073	static void ub_enum_topo_ent_uninit(struct ub_entity *uent)
  1074	{
  1075		if (is_primary(uent)) {
  1076			ub_route_clear(uent); /* alloc in route_config */
  1077			ub_cna_free(uent); /* alloc in na_cfg */
  1078			ub_ports_unset(uent); /* alloc in scan_device */
  1079		}
  1080	}
  1081	
  1082	static int ub_enum_and_configure_ent(struct ub_entity *uent, void *buf)
  1083	{
  1084		int ret;
  1085	
  1086		ret = ub_enum_ent(uent, buf);
  1087		if (ret)
  1088			return ret;
  1089	
  1090		ret = ub_enum_na_cfg(uent, buf);
  1091		if (ret)
  1092			ub_ports_unset(uent);
  1093	
  1094		return ret;
  1095	}
  1096	
> 1097	void ub_enum_clear_ent_list(struct list_head *dev_list)
  1098	{
  1099		struct ub_entity *uent, *tmp;
  1100		struct ub_port *port;
  1101	
  1102		list_for_each_entry_safe_reverse(uent, tmp, dev_list, node) {
  1103			list_del(&uent->node);
  1104			for_each_uent_port(port, uent)
  1105				ub_port_disconnect(port);
  1106	
  1107			ub_cna_free(uent);
  1108			ub_ports_unset(uent);
  1109			ub_enum_destroy_entity(uent);
  1110		}
  1111	}
  1112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
