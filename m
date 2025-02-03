Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E4720408D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 12:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584199; cv=none; b=sTOT1VNo9xiqbNOvJ96vwCVzKgo7q1e/tMiuz6cV6ROHhWjhcaY4JQyhxgk3cPy70+R1eYmdNNXSkOmJ9m6wYx1xoDt+qBZlNpIWoGsxufpln1T2qXlybYfgJ/K8/ufjSrXNHUJK+Jf5eiyZbnJQPJBdJNohn7GwPfmodtS3BbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584199; c=relaxed/simple;
	bh=KKdKlMKu3RcZ6LK4/o/M0YcNKeIw0tL5iA+jq4NM+W0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GrN9OMgDbfywtTJ+3G94wb4jKNK7bRS1vnetWuFAruSN6ozjg6ICsWwzkTk/1Zx8W6DIg6FrC8PJDk0a2QI0dS87ZTecqPLh2xhuiHG83PehcPwJ13DRd/lR8WdsUpPokZ0ZAPyZ2u8wKs85vyERQ6dBdPyFL5QmvJB8dWNrD50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FiqP99cS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiqP99cS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738584198; x=1770120198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KKdKlMKu3RcZ6LK4/o/M0YcNKeIw0tL5iA+jq4NM+W0=;
  b=FiqP99cSooW7eDwj/S1Q4MxfUlD6YRyjNBcdBQbYR0FicWE3dcZtFvW0
   YyAVC0citMgLJZprUIpP26/8w2Yrf+mxV4i7dmuOGcJjud5RgMj/MoHWj
   Ylpy+c3hMthoGhGQjBgcQlw//apOGEeD2+7ujCdo2K+KkTlXUeBRLHX/v
   MgzrJDp21bGu64vhFfff3AnaK1dQPHbYC9x5VswgecLNuKW5adpmeY6QP
   dRyxRFaFWiuCw6mMqg4FUDIPL9Pm91ZSOdqASddiiHzFuyeWwCJliS1G2
   q4sNxbOPMW+H//lj43h3rybO4ZhFJDuaolrVv+ut59z0Cus6JBo2j1/VX
   A==;
X-CSE-ConnectionGUID: lQYIzlemQEaOoQK8+Spe2w==
X-CSE-MsgGUID: sKXuhliJQ2WfTW7LuZVZ9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39175437"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39175437"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:03:17 -0800
X-CSE-ConnectionGUID: Rvcj7r+9SVOKytrfmkW7dg==
X-CSE-MsgGUID: THHj9QY8Q8S60Rn6i7QK1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110025366"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 04:03:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tevAX-000qsx-1D;
	Mon, 03 Feb 2025 12:03:13 +0000
Date: Mon, 3 Feb 2025 20:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 57/57]
 drivers/soc/mediatek/mtk-mutex.c:1062:15: warning: variable 'sof_id' set but
 not used
Message-ID: <202502031914.YGP7AWsU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   11792abed5949b15f434d0a53e21e51d5c56e28c
commit: 8039abd30dc699d1936f13fdc3edd18fc9a1952d [57/57] BACKPORT: FROMLIST: soc: mediatek: mutex: add mutex support for MT8196
config: arm-randconfig-001-20250203 (https://download.01.org/0day-ci/archive/20250203/202502031914.YGP7AWsU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031914.YGP7AWsU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031914.YGP7AWsU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/mediatek/mtk-mutex.c:1062:15: warning: variable 'sof_id' set but not used [-Wunused-but-set-variable]
    1062 |         unsigned int sof_id;
         |                      ^
   1 warning generated.


vim +/sof_id +1062 drivers/soc/mediatek/mtk-mutex.c

  1055	
  1056	void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
  1057				   enum mtk_ddp_comp_id id)
  1058	{
  1059		struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
  1060							 mutex[mutex->id]);
  1061		unsigned int reg;
> 1062		unsigned int sof_id;
  1063		unsigned int offset;
  1064		bool is_output_comp = true;
  1065	
  1066		WARN_ON(&mtx->mutex[mutex->id] != mutex);
  1067	
  1068		switch (id) {
  1069		case DDP_COMPONENT_DSI0:
  1070			sof_id = MUTEX_SOF_DSI0;
  1071			break;
  1072		case DDP_COMPONENT_DSI1:
  1073			sof_id = MUTEX_SOF_DSI0;
  1074			break;
  1075		case DDP_COMPONENT_DSI2:
  1076			sof_id = MUTEX_SOF_DSI2;
  1077			break;
  1078		case DDP_COMPONENT_DSI3:
  1079			sof_id = MUTEX_SOF_DSI3;
  1080			break;
  1081		case DDP_COMPONENT_DPI0:
  1082			sof_id = MUTEX_SOF_DPI0;
  1083			break;
  1084		case DDP_COMPONENT_DPI1:
  1085			sof_id = MUTEX_SOF_DPI1;
  1086			break;
  1087		case DDP_COMPONENT_DP_INTF0:
  1088			sof_id = MUTEX_SOF_DP_INTF0;
  1089			break;
  1090		case DDP_COMPONENT_DP_INTF1:
  1091			sof_id = MUTEX_SOF_DP_INTF1;
  1092			break;
  1093		case DDP_COMPONENT_DVO0:
  1094			sof_id = MUTEX_SOF_DVO0;
  1095			break;
  1096		default:
  1097			is_output_comp = false;
  1098			break;
  1099		}
  1100	
  1101		if (!is_output_comp || mtx->data->need_sof_mod) {
  1102			if (mtx->data->mutex_mod[id] < 32) {
  1103				offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
  1104							    mutex->id);
  1105				reg = readl_relaxed(mtx->regs + offset);
  1106				reg &= ~(1 << mtx->data->mutex_mod[id]);
  1107				writel_relaxed(reg, mtx->regs + offset);
  1108			} else {
  1109				offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg,
  1110							     mutex->id);
  1111				reg = readl_relaxed(mtx->regs + offset);
  1112				reg &= ~(1 << (mtx->data->mutex_mod[id] - 32));
  1113				writel_relaxed(reg, mtx->regs + offset);
  1114			}
  1115		}
  1116	
  1117		if (is_output_comp) {
  1118			offset = DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id);
  1119			reg = readl_relaxed(mtx->regs + offset);
  1120			reg &= ~(1 << mtx->data->mutex_sof[id]);
  1121			writel_relaxed(reg, mtx->regs + offset);
  1122		}
  1123	}
  1124	EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
  1125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
