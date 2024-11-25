Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA111426C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 07:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732519740; cv=none; b=heXd/+bx7H+JqJ0lNoUCP3j0YE8ik9DAk9t6DeMj132VrpY5F9uTLWVthHtuDx7I3km/Zulwd9q4iMEX2hGRnMyqT90Bbc6vl1cqWloLpRS5rWHS/U6GkJsPHBv/jrYXVwZ1Ex8rXJIabz48pnBp6KJqlNUQl8VykT4xnH3J43Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732519740; c=relaxed/simple;
	bh=Aefq+xNynFU5FPpecac20EKUADxaVfRv/N9wzc/ij8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tr/pV5PJtvp2DA1hOWSGwaC+lrAd2nQ8knmDwZsGtAAyXplUJdw0u9/AN8UvNrH8QkaFTPSL9uXcJHisqGWqaZ7mRAAXEVoEhtmYfmmv7B7Dxd6SdCgTTwDOXuD0Lz8vgCELZbJuNsxgoMHxLJAlPc1BRzMudi48+HJbebmpkHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RL7SBVZ9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RL7SBVZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732519738; x=1764055738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aefq+xNynFU5FPpecac20EKUADxaVfRv/N9wzc/ij8Y=;
  b=RL7SBVZ9LP0eT0igrjedBYVFEFFLRtLlKHJlbwU25OjeM+2nw5asBqQc
   5DsDyOml8Vte1c+3QKiet4mLRS21cYBUoNCd9htIxh7zUwLfGX8oJNTOE
   6jIvq6nOPNaui0h8E/iFKW1u++P5RgWrwndpogWG9NVZXMj5l8cwU8hga
   OCtd3tuOeP1nnIexw4m37zox2iJ46hF4h23j+GeXHrY4npgUjMfR1pNV1
   /GFKUqD6Z0wpWlQ2xiIRG3xxUJ4XMDVuFkHxSgzrpuSNSSgsOyrhlWb8N
   1eNGA1aOCxW5JlCb1di0Gjr7kaGQTsXimQ9iwM7PNdesu9MyxLda+H80j
   w==;
X-CSE-ConnectionGUID: by5b853kRbe09NrbWKk3jg==
X-CSE-MsgGUID: lre/4dKBQqSSDTydGa3hSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43109186"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43109186"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 23:28:58 -0800
X-CSE-ConnectionGUID: w+ddMpLIQ+e4ELvdj8gvzQ==
X-CSE-MsgGUID: CmbzYUtdQVCn1NUFX8bBcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91073099"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Nov 2024 23:28:57 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFTWg-00061p-0x;
	Mon, 25 Nov 2024 07:28:54 +0000
Date: Mon, 25 Nov 2024 15:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/base/core.c:1542:5: sparse: sparse: symbol
 'fw_devlink_relax_cycle' was not declared. Should it be static?
Message-ID: <202411251553.blO9jafd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux linux-5.10-gen-rkr3.4
head:   39141d792534c5703bb834861c47718008c85001
commit: 1df699c140a778ed678d7d4b2fa8ffb2c62573e1 UPSTREAM: driver core: Handle cycles in device links created by fw_devlink
date:   3 years, 9 months ago
config: i386-randconfig-062-20241112 (https://download.01.org/0day-ci/archive/20241125/202411251553.blO9jafd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251553.blO9jafd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251553.blO9jafd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/core.c:1542:5: sparse: sparse: symbol 'fw_devlink_relax_cycle' was not declared. Should it be static?

vim +/fw_devlink_relax_cycle +1542 drivers/base/core.c

  1527	
  1528	/**
  1529	 * fw_devlink_relax_cycle - Convert cyclic links to SYNC_STATE_ONLY links
  1530	 * @con: Device to check dependencies for.
  1531	 * @sup: Device to check against.
  1532	 *
  1533	 * Check if @sup depends on @con or any device dependent on it (its child or
  1534	 * its consumer etc).  When such a cyclic dependency is found, convert all
  1535	 * device links created solely by fw_devlink into SYNC_STATE_ONLY device links.
  1536	 * This is the equivalent of doing fw_devlink=permissive just between the
  1537	 * devices in the cycle. We need to do this because, at this point, fw_devlink
  1538	 * can't tell which of these dependencies is not a real dependency.
  1539	 *
  1540	 * Return 1 if a cycle is found. Otherwise, return 0.
  1541	 */
> 1542	int fw_devlink_relax_cycle(struct device *con, void *sup)
  1543	{
  1544		struct device_link *link;
  1545		int ret;
  1546	
  1547		if (con == sup)
  1548			return 1;
  1549	
  1550		ret = device_for_each_child(con, sup, fw_devlink_relax_cycle);
  1551		if (ret)
  1552			return ret;
  1553	
  1554		list_for_each_entry(link, &con->links.consumers, s_node) {
  1555			if ((link->flags & ~DL_FLAG_INFERRED) ==
  1556			    (DL_FLAG_SYNC_STATE_ONLY | DL_FLAG_MANAGED))
  1557				continue;
  1558	
  1559			if (!fw_devlink_relax_cycle(link->consumer, sup))
  1560				continue;
  1561	
  1562			ret = 1;
  1563	
  1564			if (!(link->flags & DL_FLAG_INFERRED))
  1565				continue;
  1566	
  1567			pm_runtime_drop_link(link);
  1568			link->flags = DL_FLAG_MANAGED | FW_DEVLINK_FLAGS_PERMISSIVE;
  1569			dev_dbg(link->consumer, "Relaxing link with %s\n",
  1570				dev_name(link->supplier));
  1571		}
  1572		return ret;
  1573	}
  1574	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
