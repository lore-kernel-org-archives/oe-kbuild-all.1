Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CAE3B2FEB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 13:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134342; cv=none; b=A31bDqrHa5OyAZ7P/imcXuYFND8zxtzMhzjdQnNsUu3zeuz1y1HMPmKLakP7fe1TILwjSJG4WJRr67MgU6qJ47CGMT26kbRzklg5LZvCQacjxNLv6a7EF/h44Cbf+KQnFGrGSuCGM0v6be+S/7xNADU+SrVoYTY2xBMdeWMctgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134342; c=relaxed/simple;
	bh=tp/T2ozKnVjzJhpcyXsPhhhRQL4Iz9Kea111WcQWmxU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HYhQa5pU5o+O6H+JO9zyPLtM8Sr0+Md8QUElQ/BsC4SwWS8qYV8/RhaqYm8PLXpgbzx+6qNgcLO4Nl4KMSH4u03OCyy4fk4YvhOFXS/IH0gw5gN9sJVA3RgNm4tDT5MRvMsUkpEucQRrMbzu7COLLBDmfLoU1D5esykQzjpNvLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyZgNNR/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyZgNNR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782134341; x=1813670341;
  h=date:from:to:cc:subject:message-id;
  bh=tp/T2ozKnVjzJhpcyXsPhhhRQL4Iz9Kea111WcQWmxU=;
  b=LyZgNNR/4dIclou0m9jgitDxAKrH3DUiwESYty17kEeh5sB3OgpevIZ5
   Hc3PMuwWQpkitbCQGUQCJMQMyh8s7ZiN23T6bufTYeeVLqMXWRIGfFkJN
   RY9XerIvSH6jF1p1U4Mz6Gn+W5TkmM7eQg6NBqc+EhmS6otpDnBEqwCIC
   CgT4tI/se7GqAncI8sLgp3tlF3cP0XhoIDC47F0By+xfOeS/TBHdKJrmB
   1ifOkfh3LCdzdkfaQkgGnD4PRdp8CzICCzUHOlHpYRBQlTV9lVaeFZoqL
   ymDqf8ODkc9Y4B0D/O6Eyz3PBzSxn8lP+u6/AWG7ujLLUaO5IVmQ2hc5D
   A==;
X-CSE-ConnectionGUID: ftlA53IGS7Koqvq6uL5Jyw==
X-CSE-MsgGUID: zMMcPT/uSXyFU2LfX/1ayA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="86772469"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="86772469"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 06:19:00 -0700
X-CSE-ConnectionGUID: P6yq07nXQ1OJXryLligTzA==
X-CSE-MsgGUID: b5RarAYYRle1EdgFPWt6lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="287337164"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Jun 2026 06:19:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbeYC-000000001DR-48qT;
	Mon, 22 Jun 2026 13:18:56 +0000
Date: Mon, 22 Jun 2026 21:18:28 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v2 2/17]
 fs/configfs/mount.c:104: undefined reference to `init_net'
Message-ID: <202606222128.1XTBm6OB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v2
head:   e2bc6e23c907dceafa9ce30beca26cdc05bb664d
commit: ef10e19014b14b7ac73434044abbe473fa34b2df [2/17] fs/configfs: dynamically allocate super_info
config: arm-randconfig-003-20260622 (https://download.01.org/0day-ci/archive/20260622/202606222128.1XTBm6OB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222128.1XTBm6OB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606222128.1XTBm6OB-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/configfs/mount.o: in function `configfs_get_super_info':
>> fs/configfs/mount.c:104: undefined reference to `init_net'
   arm-linux-gnueabi-ld: fs/configfs/mount.o: in function `configfs_put_super_info':
   fs/configfs/mount.c:116: undefined reference to `init_net'
   arm-linux-gnueabi-ld: fs/configfs/mount.o: in function `configfs_fill_super':
   fs/configfs/mount.c:160: undefined reference to `init_net'
   arm-linux-gnueabi-ld: fs/configfs/mount.o: in function `configfs_init':
   fs/configfs/mount.c:238: undefined reference to `init_net'


vim +104 fs/configfs/mount.c

    75	
    76	struct configfs_super_info *configfs_get_super_info(struct net *net_ns)
    77	{
    78		struct configfs_super_info *info;
    79		u64 ns_id = configfs_ns_id(net_ns);
    80		int err;
    81	
    82		xa_lock(&configfs_super_xa);
    83		info = xa_load(&configfs_super_xa, ns_id);
    84		if (info) {
    85			if (!refcount_inc_not_zero((&info->ref)))
    86				info = ERR_PTR(-EBUSY);
    87			xa_unlock(&configfs_super_xa);
    88			return info;
    89		}
    90		info = kzalloc_obj(*info);
    91		if (!info) {
    92			xa_unlock(&configfs_super_xa);
    93			return ERR_PTR(-ENOMEM);
    94		}
    95	
    96		info->net_ns = get_net(net_ns);
    97		configfs_fill_super_info(info);
    98		err = __xa_insert(&configfs_super_xa, ns_id,
    99				  info, GFP_KERNEL);
   100		xa_unlock(&configfs_super_xa);
   101		if (err < 0) {
   102			put_net(info->net_ns);
   103			kfree(info);
 > 104			return ERR_PTR(err);
   105		}
   106		return info;
   107	}
   108	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
