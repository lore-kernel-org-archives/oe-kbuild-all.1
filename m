Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502C026ED29
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 20:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765138232; cv=none; b=iGDH5vvWuL/Anez/PJ06J4dWWKokDi6opszkSKyiTzCSChqZ3MMlxwsxlvpklY1VoX+rQhHoi5PuhijZVbtyjp1jEnUcvc0HeTbrFhaBr4iWH040uxF/OA9nZCcfad886XVc41yoNgipqNMORjct7PqBkyHrXgoZ7GscXv3v8Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765138232; c=relaxed/simple;
	bh=6rPh9kgjEhOq53m8A5KECJhcAKDyXN2tevis4LvaGj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u3bJ4K+FpUcJXCmUNX5MpbEIHYMUggMJZpJdcaU6s9ouOwpcRMQaUu8+vKrRntWHD81u+BYWRmBKGae+mJy/tLvcyDyuA4kwqxDjJ+qtv8c7olUz6slJqiIG2ehwwQwgOrAPKG9msoafj/4294iRuOqbqdvCERev9Z+flProQCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWvl/9jQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWvl/9jQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765138230; x=1796674230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6rPh9kgjEhOq53m8A5KECJhcAKDyXN2tevis4LvaGj8=;
  b=OWvl/9jQoqoIrgQQsqG5Txoo0fpHNu7yCcSkvKhyS4TP7SARJwMjmCVA
   Epk69Zbn0LtgG/eIItBzsQlEzBjoUlKb2FhVnyVqgYRL6UbXxiGnXsnkd
   dYG8kLSlk/1ZS2d6op+3X+FXd6qe0N1dBKoUXFJZP3WH2juLelw+utxEy
   Y/+tH5Qvysi7QqdNTNzicUBej1hBYX+VmaePStwfTQIg198tk70LnZp09
   g/UsjLY0i/rKUSTHzTskbDoQBT86FKnpFDdot0RHTpG1kmFn4exYyQ0y+
   7oSnQ16FVurvzleddeuOuudker62xqeQqOMw0hd07Gy4EsWva+2mRnavD
   w==;
X-CSE-ConnectionGUID: xIR2HTisT3O7linSBSkJYA==
X-CSE-MsgGUID: VYU2e9agSdOdsJuQL/rxtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="77412371"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="77412371"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 12:10:29 -0800
X-CSE-ConnectionGUID: Sjcs/J5GTWSlKPl4OBIhew==
X-CSE-MsgGUID: amJniU6KTtC5bksonRMPKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="195040967"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Dec 2025 12:10:29 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSL5O-00000000JcB-0pjn;
	Sun, 07 Dec 2025 20:10:26 +0000
Date: Mon, 8 Dec 2025 04:09:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3482/3482] drivers/xcu/xcu_group.c:41:5: sparse:
 sparse: symbol '__xcu_group_attach' was not declared. Should it be static?
Message-ID: <202512080408.Kma3SOA7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: b7261a251299bfdababe53a848084af2ecfcc1ae [3482/3482] xcu: Add base NPU driver support
config: arm64-randconfig-r111-20251206 (https://download.01.org/0day-ci/archive/20251208/202512080408.Kma3SOA7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512080408.Kma3SOA7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512080408.Kma3SOA7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/xcu/xcu_group.c:25:18: sparse: sparse: symbol 'xsched_cu_mgr' was not declared. Should it be static?
>> drivers/xcu/xcu_group.c:41:5: sparse: sparse: symbol '__xcu_group_attach' was not declared. Should it be static?

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
