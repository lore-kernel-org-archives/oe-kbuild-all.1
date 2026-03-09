Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396DE38F95C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 23:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773098438; cv=none; b=DDg1b0UY38LUL6C8YsX8+DYYXZMpc4EGftt2+ofSxd+RikRupIsOh2uR3wyZbM9fGalSVvsBhGP4dyrtfb1lxpjMg0BBH1KgKGDVUkO3lWv+2dmM/KiKW2hy9ZdiLiDvI08huj6oy/1+594dZjTVmW7eTDA2Hx7AsGFQON2kR9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773098438; c=relaxed/simple;
	bh=QVZOar86DZObNcXWzqQqkhJ4ajb1aUCBLMu+ebkHzII=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MpQAuYtdqYIwdkkxsF2uAR7ZhsHcRK/doG9lAz/RMFqdO5HMCjNm5fXA7rGY9kWwptGYWjQqNHTwaMdzDk3FHZfXmKjFVuX7oN7gsHF+7wAcHot7GIznKwoajhVkbw8PasTV5aRo6HmRRe+6q+x0mgHrBkTP4qH+sBFKqUnFbN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5l9wtLV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5l9wtLV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773098437; x=1804634437;
  h=date:from:to:cc:subject:message-id;
  bh=QVZOar86DZObNcXWzqQqkhJ4ajb1aUCBLMu+ebkHzII=;
  b=m5l9wtLVwW1xrQHRsBtnJoUCjVFRFW9SLUCxmWvg/PZzPWxwGwFrf7sn
   vOqa9oW4IYG0cAIY8fj+I7uQgP63zbF698HwwldM+1aoXyfjTP2XoNcwH
   uhfeeP2U32qOLUBQe4SSl2T071Gf080glRtbXG9Fh+ThnpX/rjOUhdmt6
   diMMLiNvnEasa/qWKsuDtLutFVpxT60oaAJKdzZ1lCod5fmMpvodknuai
   k2miQb9gvQpO75LiBvNQXqf4Oq7lZtkgKSEbamwJF+3SocusFNO9q0Uhw
   /Ktq0pOWOS839P88xgmLcAVPrYwbBAH1Q36LlkMu/5sccYC3cmpa4xbDg
   g==;
X-CSE-ConnectionGUID: lyL6DY7/Qya3jpfp8QHCSQ==
X-CSE-MsgGUID: dnKMuMmUSiajBU4630YiLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84845350"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84845350"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 16:20:37 -0700
X-CSE-ConnectionGUID: Vnk6MOZAS/C7neJN6+EQGw==
X-CSE-MsgGUID: pxv9YBkYT6qsv/XVTO3OsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224606528"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Mar 2026 16:20:35 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzjto-000000000xk-1Nq8;
	Mon, 09 Mar 2026 23:20:32 +0000
Date: Tue, 10 Mar 2026 07:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [linux-next:master 4535/4750] drivers/reset/core.c:1218
 __fwnode_reset_control_get() warn: inconsistent indenting
Message-ID: <202603100730.J3pi4xqi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   343f51842f4ed7143872f3aa116a214a5619a4b9
commit: 9035073d0ef1de813c6335239250248bfe0a64aa [4535/4750] reset: convert reset core to using firmware nodes
config: i386-randconfig-141-20260310 (https://download.01.org/0day-ci/archive/20260310/202603100730.J3pi4xqi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100730.J3pi4xqi-lkp@intel.com/

smatch warnings:
drivers/reset/core.c:1218 __fwnode_reset_control_get() warn: inconsistent indenting

vim +1218 drivers/reset/core.c

c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1136  
1c5e05c23f4a64 Philipp Zabel       2021-03-04  1137  struct reset_control *
ba8dbbb14b7e67 Bartosz Golaszewski 2026-03-06  1138  __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int index,
dad35f7d2fc14e Philipp Zabel       2024-09-25  1139  			   enum reset_control_flags flags)
61fc41317666be Philipp Zabel       2012-11-19  1140  {
dad35f7d2fc14e Philipp Zabel       2024-09-25  1141  	bool optional = flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1142  	bool gpio_fallback = false;
8c91302a29bc1b Bartosz Golaszewski 2026-03-06  1143  	struct reset_control *rstc = ERR_PTR(-EINVAL);
c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1144  	struct reset_controller_dev *rcdev;
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1145  	struct fwnode_reference_args args;
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1146  	struct of_phandle_args of_args;
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1147  	int rstc_id = -EINVAL;
61fc41317666be Philipp Zabel       2012-11-19  1148  	int ret;
61fc41317666be Philipp Zabel       2012-11-19  1149  
ba8dbbb14b7e67 Bartosz Golaszewski 2026-03-06  1150  	if (!fwnode)
6c96f05c8bb8bc Hans de Goede       2016-02-23  1151  		return ERR_PTR(-EINVAL);
6c96f05c8bb8bc Hans de Goede       2016-02-23  1152  
6c96f05c8bb8bc Hans de Goede       2016-02-23  1153  	if (id) {
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1154  		index = fwnode_property_match_string(fwnode, "reset-names", id);
bb475230b8e59a Ramiro Oliveira     2017-01-13  1155  		if (index == -EILSEQ)
bb475230b8e59a Ramiro Oliveira     2017-01-13  1156  			return ERR_PTR(index);
6c96f05c8bb8bc Hans de Goede       2016-02-23  1157  		if (index < 0)
bb475230b8e59a Ramiro Oliveira     2017-01-13  1158  			return optional ? NULL : ERR_PTR(-ENOENT);
6c96f05c8bb8bc Hans de Goede       2016-02-23  1159  	}
6c96f05c8bb8bc Hans de Goede       2016-02-23  1160  
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1161  	ret = fwnode_property_get_reference_args(fwnode, "resets", "#reset-cells",
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1162  						 0, index, &args);
bb475230b8e59a Ramiro Oliveira     2017-01-13  1163  	if (ret == -EINVAL)
61fc41317666be Philipp Zabel       2012-11-19  1164  		return ERR_PTR(ret);
c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1165  	if (ret) {
c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1166  		if (!IS_ENABLED(CONFIG_RESET_GPIO))
c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1167  			return optional ? NULL : ERR_PTR(ret);
c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1168  
c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1169  		/*
c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1170  		 * There can be only one reset-gpio for regular devices, so
c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1171  		 * don't bother with the "reset-gpios" phandle index.
c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1172  		 */
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1173  		ret = fwnode_property_get_reference_args(fwnode, "reset-gpios",
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1174  							 "#gpio-cells", 0, 0, &args);
bb475230b8e59a Ramiro Oliveira     2017-01-13  1175  		if (ret)
bb475230b8e59a Ramiro Oliveira     2017-01-13  1176  			return optional ? NULL : ERR_PTR(ret);
61fc41317666be Philipp Zabel       2012-11-19  1177  
c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1178  		gpio_fallback = true;
c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1179  
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1180  		ret = __reset_add_reset_gpio_device(fwnode, &args);
c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1181  		if (ret) {
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1182  			fwnode_handle_put(args.fwnode);
1f10008aff7190 Bartosz Golaszewski 2026-03-06  1183  			return ERR_PTR(ret);
61fc41317666be Philipp Zabel       2012-11-19  1184  		}
61fc41317666be Philipp Zabel       2012-11-19  1185  	}
61fc41317666be Philipp Zabel       2012-11-19  1186  
1f10008aff7190 Bartosz Golaszewski 2026-03-06  1187  	guard(mutex)(&reset_list_mutex);
1f10008aff7190 Bartosz Golaszewski 2026-03-06  1188  
c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1189  	rcdev = __reset_find_rcdev(&args, gpio_fallback);
61fc41317666be Philipp Zabel       2012-11-19  1190  	if (!rcdev) {
b790c8ea5593d6 Geert Uytterhoeven  2018-10-08  1191  		rstc = ERR_PTR(-EPROBE_DEFER);
1f10008aff7190 Bartosz Golaszewski 2026-03-06  1192  		goto out_put;
61fc41317666be Philipp Zabel       2012-11-19  1193  	}
61fc41317666be Philipp Zabel       2012-11-19  1194  
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1195  	if (WARN_ON(args.nargs != rcdev->fwnode_reset_n_cells)) {
b790c8ea5593d6 Geert Uytterhoeven  2018-10-08  1196  		rstc = ERR_PTR(-EINVAL);
1f10008aff7190 Bartosz Golaszewski 2026-03-06  1197  		goto out_put;
e677774f502635 Maxime Ripard       2016-01-14  1198  	}
e677774f502635 Maxime Ripard       2016-01-14  1199  
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1200  	if (rcdev->of_xlate && is_of_node(fwnode)) {
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1201  		ret = of_parse_phandle_with_args(to_of_node(fwnode),
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1202  					 gpio_fallback ? "reset-gpios" : "resets",
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1203  					 gpio_fallback ? "#gpio-cells" : "#reset-cells",
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1204  					 gpio_fallback ? 0 : index,
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1205  					 &of_args);
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1206  		if (ret) {
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1207  			rstc = ERR_PTR(ret);
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1208  			goto out_put;
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1209  		}
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1210  
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1211  		rstc_id = rcdev->of_xlate(rcdev, &of_args);
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1212  		of_node_put(of_args.np);
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1213  	} else if (rcdev->fwnode_xlate) {
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1214  		rstc_id = rcdev->fwnode_xlate(rcdev, &args);
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1215  	}
61fc41317666be Philipp Zabel       2012-11-19  1216  	if (rstc_id < 0) {
b790c8ea5593d6 Geert Uytterhoeven  2018-10-08  1217  		rstc = ERR_PTR(rstc_id);
1f10008aff7190 Bartosz Golaszewski 2026-03-06 @1218  			goto out_put;
61fc41317666be Philipp Zabel       2012-11-19  1219  	}
61fc41317666be Philipp Zabel       2012-11-19  1220  
dad35f7d2fc14e Philipp Zabel       2024-09-25  1221  	flags &= ~RESET_CONTROL_FLAGS_BIT_OPTIONAL;
dad35f7d2fc14e Philipp Zabel       2024-09-25  1222  
8c91302a29bc1b Bartosz Golaszewski 2026-03-06  1223  	scoped_guard(mutex, &rcdev->lock)
dad35f7d2fc14e Philipp Zabel       2024-09-25  1224  		rstc = __reset_control_get_internal(rcdev, rstc_id, flags);
61fc41317666be Philipp Zabel       2012-11-19  1225  
c721f189e89c0d Krzysztof Kozlowski 2024-01-29  1226  out_put:
9035073d0ef1de Bartosz Golaszewski 2026-03-06  1227  	fwnode_handle_put(args.fwnode);
61fc41317666be Philipp Zabel       2012-11-19  1228  
61fc41317666be Philipp Zabel       2012-11-19  1229  	return rstc;
61fc41317666be Philipp Zabel       2012-11-19  1230  }
ba8dbbb14b7e67 Bartosz Golaszewski 2026-03-06  1231  EXPORT_SYMBOL_GPL(__fwnode_reset_control_get);
61fc41317666be Philipp Zabel       2012-11-19  1232  

:::::: The code at line 1218 was first introduced by commit
:::::: 1f10008aff7190e300e93ed33a0eb2d236c0b87d reset: use lock guards in reset core

:::::: TO: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
:::::: CC: Philipp Zabel <p.zabel@pengutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
