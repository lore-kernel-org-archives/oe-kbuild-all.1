Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8821BEF9D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 19:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734982560; cv=none; b=kdGE/RRku6rs7Y4OL7H/yjip/WrM6GkwxV+y+75C4Sp4abMAFl7hBP7I82091ch7wCFjciZw28ElSJUgTpGhooa+R67WiSJ7IAL73Kr6DcH9OLtqE/ruUBWazcggqYevw6JTF/BwO4BBpFDTBERFtCIhJSm0JZgopIZR26/7ueA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734982560; c=relaxed/simple;
	bh=rx3jC5fwGkdw93kHrg2ci+6aXZOU0ujpsNP86LILGrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OzjIYx+hMQMCjmvYyrSCCYAFRWrMWo4oLKXJSprdwdR2FWGswso/xNAcbk5AR2P6rFdntFmmgiIkBxc8PTp/qOLhloYdr7fAE7vN4hi9RnqaovFspYnIDVVKtxNmv1TLQkA0o3N5N3trzC505v5yTtOMdEtl91wP0AD/smA+wo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZilX4LhE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZilX4LhE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734982559; x=1766518559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rx3jC5fwGkdw93kHrg2ci+6aXZOU0ujpsNP86LILGrY=;
  b=ZilX4LhESSy9J8CSiHIp4AnylUtpQJo/VT40YaT/9sHjERYKn60SFYz/
   ZA9lRezSc3qbbhcSAf3Rtmwqau+4Dy9PIs75Ae6qmu0VkPaw/swLsbcCC
   ivZuWgrw82tcfBPKQypFnSpiWgyN/4HUlpcRSo0J8Mv9y/+2AzlhEexAm
   i8D2QaN0J/iP4kNeFmkr+LGOMLVxOkKH6Evee+8bdFcG836FiACI2VqLk
   Bo5BNLYiauOeHKPjAvdCqjivWoywM8V0UL1T9KW0Oy1h1aPedov3MPd00
   To2LTkFHunsUPQLzUmMi5IhQ9uHwYgUTTqdJ8mqWiX3zHSF9JiizeLJoc
   w==;
X-CSE-ConnectionGUID: 4iyQt35xRTuePImxWg/kUQ==
X-CSE-MsgGUID: zC4WwRHuQwyyMf7dMWojjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="45946831"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="45946831"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 11:35:57 -0800
X-CSE-ConnectionGUID: BH0V/m0PSx2VVMpYZKwTxw==
X-CSE-MsgGUID: 5fcNGsUNSnGcyF/OM0ehIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="99111103"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Dec 2024 11:35:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPoDY-0000Zz-1i;
	Mon, 23 Dec 2024 19:35:52 +0000
Date: Tue, 24 Dec 2024 03:35:20 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, p.zabel@pengutronix.de,
	airlied@gmail.com, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: Re: [PATCH] gpu: ipu-v3: fix OF node reference leaks in
 ipu_add_client_devices()
Message-ID: <202412240257.hBU9oQRB-lkp@intel.com>
References: <20241215032222.2507759-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215032222.2507759-1-joe@pf.is.s.u-tokyo.ac.jp>

Hi Joe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pza/reset/next]
[also build test WARNING on linus/master pza/imx-drm/next v6.13-rc4 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Hattori/gpu-ipu-v3-fix-OF-node-reference-leaks-in-ipu_add_client_devices/20241215-112258
base:   https://git.pengutronix.de/git/pza/linux reset/next
patch link:    https://lore.kernel.org/r/20241215032222.2507759-1-joe%40pf.is.s.u-tokyo.ac.jp
patch subject: [PATCH] gpu: ipu-v3: fix OF node reference leaks in ipu_add_client_devices()
config: powerpc-randconfig-r072-20241223 (https://download.01.org/0day-ci/archive/20241224/202412240257.hBU9oQRB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240257.hBU9oQRB-lkp@intel.com/

smatch warnings:
drivers/gpu/ipu-v3/ipu-common.c:1189 ipu_add_client_devices() warn: always true condition '(--i >= 0) => (0-u32max >= 0)'
drivers/gpu/ipu-v3/ipu-common.c:1189 ipu_add_client_devices() warn: always true condition '(--i >= 0) => (0-u32max >= 0)'

vim +1189 drivers/gpu/ipu-v3/ipu-common.c

  1138	
  1139	static int ipu_add_client_devices(struct ipu_soc *ipu, unsigned long ipu_base)
  1140	{
  1141		struct device *dev = ipu->dev;
  1142		unsigned i;
  1143		int id, ret;
  1144	
  1145		mutex_lock(&ipu_client_id_mutex);
  1146		id = ipu_client_id;
  1147		ipu_client_id += ARRAY_SIZE(client_reg);
  1148		mutex_unlock(&ipu_client_id_mutex);
  1149	
  1150		for (i = 0; i < ARRAY_SIZE(client_reg); i++) {
  1151			struct ipu_platform_reg *reg = &client_reg[i];
  1152			struct platform_device *pdev;
  1153			struct device_node *of_node;
  1154	
  1155			/* Associate subdevice with the corresponding port node */
  1156			of_node = of_graph_get_port_by_id(dev->of_node, i);
  1157			if (!of_node) {
  1158				dev_info(dev,
  1159					 "no port@%d node in %pOF, not using %s%d\n",
  1160					 i, dev->of_node,
  1161					 (i / 2) ? "DI" : "CSI", i % 2);
  1162				continue;
  1163			}
  1164	
  1165			pdev = platform_device_alloc(reg->name, id++);
  1166			if (!pdev) {
  1167				ret = -ENOMEM;
  1168				of_node_put(of_node);
  1169				goto err_register;
  1170			}
  1171	
  1172			pdev->dev.parent = dev;
  1173	
  1174			reg->pdata.of_node = of_node;
  1175			ret = platform_device_add_data(pdev, &reg->pdata,
  1176						       sizeof(reg->pdata));
  1177			if (!ret)
  1178				ret = platform_device_add(pdev);
  1179			if (ret) {
  1180				platform_device_put(pdev);
  1181				of_node_put(of_node);
  1182				goto err_register;
  1183			}
  1184		}
  1185	
  1186		return 0;
  1187	
  1188	err_register:
> 1189		while (--i >= 0)
  1190			of_node_put(client_reg[i].pdata.of_node);
  1191		platform_device_unregister_children(to_platform_device(dev));
  1192	
  1193		return ret;
  1194	}
  1195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
