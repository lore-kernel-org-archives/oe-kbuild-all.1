Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9241A08BC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 04:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764044585; cv=none; b=e+GbfYyNUZ4sUq9CLgdBRbJrAl5k6IvlNA+ibqmM3T7fyqMUg7MidQUVgDN+0g5YsDlHE5s0telGlHdvqAE4gzkmLmbaYcAO0U3YhhqepwGfOSZS0pBkV/dVW4S1R5QtbBorBnR0+IF6Xi7NdWQDPcfFVOVEMWZ7Lx99PBrrVrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764044585; c=relaxed/simple;
	bh=ygL1/sIfceCauYSLLHJSb6yUSJwKdAwhK7DDrJAf9Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kUqPvIlQXCsDAHmmQW86Nv/maO4OAWUePt+r7V03KuDcGr3n51th5/LRE+u7leNn0moDE6eXhdY5rwlhIX3hm0Q74pX4sk4YquFjhLg2gwXS04cG9SgdrKoJNQjGzNR7ItbCdllj5B6E11rWCDeRb1wqA5MXVKr2HIR59yByL6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghgqdFrB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghgqdFrB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764044582; x=1795580582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ygL1/sIfceCauYSLLHJSb6yUSJwKdAwhK7DDrJAf9Zc=;
  b=ghgqdFrBnhx7DCt7FBS+Pgp+Di0ttJmIzXtoNz/c3F3qI70qy0+sa4Ta
   I4mu3SacEVH6ozh+qVDUH18ObZQZd69zljy8IQOOQVu7IPB9uwIUlnK8v
   N4NyQH9lxMP2t2hiy8I4Hk9NVtGf97TeTbAUe2BnBk8060gihvD7upqnv
   p4hTgnDi8F6zmKfdlqARvmKixHSYJVb0XowzCi09EKpxdA8sqmNbsaJru
   +Vu/XKWlLHMbgHzQmd5HwhG/0KhyI/YdPEjq1HSYX/saBLEX3NT6CmNqu
   pfWBtsHpDOyRpZzCLz21oMszQhxADumx+R+0KfNAQ6jtfhaYklsw9tsMV
   Q==;
X-CSE-ConnectionGUID: GHMWxYz6Swmwff4vbU/6qw==
X-CSE-MsgGUID: 90IVzrCtS2Wa7RkchLKq4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77531048"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="77531048"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 20:23:02 -0800
X-CSE-ConnectionGUID: bq9pVGcFSx6oS/Ra6zh4ow==
X-CSE-MsgGUID: vcbWZIS2R6KMn8eS+Blr6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="197645102"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Nov 2025 20:23:01 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNkZu-000000001Mj-3CKI;
	Tue, 25 Nov 2025 04:22:58 +0000
Date: Tue, 25 Nov 2025 12:22:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3316/3316] drivers/xcu/xcu_group.c:41:5: warning:
 no previous prototype for '__xcu_group_attach'
Message-ID: <202511251246.qIzuARuC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6eee8b9188fae0b31126a98baa2a545eafb40d6b
commit: b7261a251299bfdababe53a848084af2ecfcc1ae [3316/3316] xcu: Add base NPU driver support
config: x86_64-buildonly-randconfig-002-20251125 (https://download.01.org/0day-ci/archive/20251125/202511251246.qIzuARuC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251246.qIzuARuC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251246.qIzuARuC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/xcu/xcu_group.c:41:5: warning: no previous prototype for '__xcu_group_attach' [-Wmissing-prototypes]
      41 | int __xcu_group_attach(struct xcu_group *new_group,
         |     ^~~~~~~~~~~~~~~~~~


vim +/__xcu_group_attach +41 drivers/xcu/xcu_group.c

    40	
  > 41	int __xcu_group_attach(struct xcu_group *new_group,
    42							struct xcu_group *previous_group)
    43	{
    44		int id = new_group->id;
    45	
    46		if (id == -1)
    47			id = idr_alloc(&previous_group->next_layer, new_group, 0,
    48						INT_MAX, GFP_KERNEL);
    49		else
    50			id = idr_alloc(&previous_group->next_layer, new_group, id,
    51						id + 1, GFP_KERNEL);
    52	
    53		if (id < 0) {
    54			XSCHED_ERR("Fail to attach xcu_group: id conflict @ %s\n",
    55					__func__);
    56			return -EEXIST;
    57		}
    58		new_group->id = id;
    59		new_group->previous_layer = previous_group;
    60	
    61		return 0;
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
