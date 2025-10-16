Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9AC749C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 12:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760617881; cv=none; b=Qs3r9eKBXXWaBdL05H4QLiWtCjTW6ONaMkU2CesjXJUkcWMZ32TbSs9ZZ1TdD6y2jlkLnsngYqt1zoa3k0imoP8LWJhiXBK4vUYwkHdiK1dmgv7PgoP7P7s16EmZSu+9BIQAXnjwlRiP7Vr+V4cmvb31qzndGHwWFsOGw6kYL6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760617881; c=relaxed/simple;
	bh=vsYHOrH4y+ZEuF3g01sa6AO1R/Ojzz1TRINN0l7PyIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R8LMHtBHNU5xo2bFIT1IoluZgRx52Z1JYNdMg7gQTSsrts5nDCzqYrgHHjWiIjJOvChR/6Re9M5/68Fn8uglwLmzSEUCIYBUDc4GumqvThbmdw/TQPQCzSQf+iYgapRvq3jsbA6+ybJMiAL1d92P7ubMRJwAA5yxTVcXEQqgpF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4gdZFCY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4gdZFCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760617879; x=1792153879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vsYHOrH4y+ZEuF3g01sa6AO1R/Ojzz1TRINN0l7PyIU=;
  b=K4gdZFCYXnR4oJ3qFeJ6OC4lKzOpfcFgG3D4c5h9z3oCeRH1FmgY17CP
   L6UCqMc6ioxFFT93GBMbox33GH/a9wr8k95OFlqVl4/UiwKzpVkKPQsdq
   dtGSr+gZg33pHvP+aeTxrlbjMVH1ZiAea77yIsNoJEfdxuhGjloKe65dx
   gZn8xiWhZtB1vdQ7o1HfFglZbqwsmSbkwS8X+UbvFpm//bgjTqVhDXN5N
   BmVCEXCPRk8kVKHTfz/NvDei4A9kei8N5EpqId1VJfoW6zxOsSASE+pGX
   KFDUJMh41Pp1BOslSzjVMPbJ+fFJN5xMMq9hzNpcW6rbCCZfKv5bfDCKN
   w==;
X-CSE-ConnectionGUID: O7++x2f9TY2h7pW9qq8LxA==
X-CSE-MsgGUID: 1dHzTdC5SrKFlYk/8saYMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66638418"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66638418"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 05:31:19 -0700
X-CSE-ConnectionGUID: 0TYk0te6R4+7sMFlbM43BQ==
X-CSE-MsgGUID: BuFTBtnjQE2u2JB9slF48w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="186455028"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 16 Oct 2025 05:31:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9N8V-0004o7-1l;
	Thu, 16 Oct 2025 12:31:15 +0000
Date: Thu, 16 Oct 2025 20:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:broadcom 1/1] drivers/pci/pci.c:1276:53: error: expected ')'
 before 'break'
Message-ID: <202510162044.RqjvRJd9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux broadcom
head:   248969a7aec19ca7f68ecb2a118ffee1a5eb8e9c
commit: 248969a7aec19ca7f68ecb2a118ffee1a5eb8e9c [1/1] PCI: Check for Broadcom placeholder device in pci_dev_wait()
config: x86_64-buildonly-randconfig-004-20251016 (https://download.01.org/0day-ci/archive/20251016/202510162044.RqjvRJd9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510162044.RqjvRJd9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510162044.RqjvRJd9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pci/pci.c: In function 'pci_dev_ready':
   drivers/pci/pci.c:1220:24: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
    1220 |                 if (id == PCI_VENDOR_ID_LSI_LOGIC | 0x02b2 << 16)
   drivers/pci/pci.c: In function 'pci_dev_wait':
>> drivers/pci/pci.c:1276:53: error: expected ')' before 'break'
    1276 |                 if (pci_dev_ready(dev, root, bridge)
         |                    ~                                ^
         |                                                     )
    1277 |                         break;
         |                         ~~~~~                        
>> drivers/pci/pci.c:1299:9: error: expected expression before '}' token
    1299 |         }
         |         ^
>> drivers/pci/pci.c:1259:14: warning: variable 'retrain' set but not used [-Wunused-but-set-variable]
    1259 |         bool retrain = false;
         |              ^~~~~~~


vim +1276 drivers/pci/pci.c

  1255	
  1256	static int pci_dev_wait(struct pci_dev *dev, char *reset_type, int timeout)
  1257	{
  1258		int delay = 1;
> 1259		bool retrain = false;
  1260		struct pci_dev *root, *bridge = NULL;
  1261	
  1262		root = pcie_find_root_port(dev);
  1263	
  1264		if (pci_is_pcie(dev)) {
  1265			bridge = pci_upstream_bridge(dev);
  1266			if (bridge)
  1267				retrain = true;
  1268		}
  1269	
  1270		for (;;) {
  1271			if (pci_dev_is_disconnected(dev)) {
  1272				pci_dbg(dev, "disconnected; not waiting\n");
  1273				return -ENOTTY;
  1274			}
  1275	
> 1276			if (pci_dev_ready(dev, root, bridge)
  1277				break;
  1278	
  1279			if (delay > timeout) {
  1280				pci_warn(dev, "not ready %dms after %s; giving up\n",
  1281					 delay - 1, reset_type);
  1282				return -ENOTTY;
  1283			}
  1284	
  1285			if (delay > PCI_RESET_WAIT) {
  1286				if (retrain) {
  1287					retrain = false;
  1288					if (pcie_failed_link_retrain(bridge) == 0) {
  1289						delay = 1;
  1290						continue;
  1291					}
  1292				}
  1293				pci_info(dev, "not ready %dms after %s; waiting\n",
  1294					 delay - 1, reset_type);
  1295			}
  1296	
  1297			msleep(delay);
  1298			delay *= 2;
> 1299		}
  1300	
  1301		if (delay > PCI_RESET_WAIT)
  1302			pci_info(dev, "ready %dms after %s\n", delay - 1,
  1303				 reset_type);
  1304		else
  1305			pci_dbg(dev, "ready %dms after %s\n", delay - 1,
  1306				reset_type);
  1307	
  1308		return 0;
  1309	}
  1310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
