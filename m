Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284C6295DB8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763218819; cv=none; b=Uvu96/RUiHExjIrM7EWW/37WhAJ/IVlSdUYky2PWTm8qTC5bJnSlhLNulqCOQ4W4Rxlcaepx9+ZKDRHHM+nlkMjmg0aXsyh3fH3sbMqORElyovJIUcvceg7A9V+ln0rIorvs8jiCxop2qaNn5VYP7FAAr6hxVcZc+OAJa7KTyv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763218819; c=relaxed/simple;
	bh=XDWdocHfQloavNKb4xANy2r8i/azAuxX8SQjytnQr88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nZhJevPMDQgCqG2QVFFOVODkNeUYbPuyfzSfh+pkCxui/wD+zdGQuPPsZzSyWog0cJzpqPuqM78ohBR6+eF0W0eP63WuAI4A+4+dOFpM0na99un8tRliNWeMPE60Lk+sOLJ8L5/sVGU4LbH7zg0sddcdgOrPFxcUvjrjDhr18dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhIKVgQL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhIKVgQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763218818; x=1794754818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XDWdocHfQloavNKb4xANy2r8i/azAuxX8SQjytnQr88=;
  b=KhIKVgQLJ7hjTLRt0Xx6Gd6dveaLuz8mME4FefgVvmo0PFfV7dao+r9w
   NJdLkpF4IaGnciyWA4zI2gQ6ohY38AdCe5ME+3qWWLsAfC1GIhcDDM764
   D0T0G1LmBvIykBsK1y1aCkMmDdmIrPHl5C67Pp4R3bQpXRvtFlyuGIwkB
   5if5GxiSDMtss1c4CcCgjFTIt2eHWg/Vl8eAh1nLXdZPKHk6jWEWzSLQD
   8UO4YIjU3LR04qHTvB3fCdAfGGwh5KcqeeZTBAVJ8GsN30eV7Z2ZvNvxv
   +h1jOW8dxGcSZ/cfctu5i6HbmJY2SXpnRMGrZuhkQOWdK3XXo+DyC8bNd
   Q==;
X-CSE-ConnectionGUID: 289nQnBdReqFWT1PmhfULg==
X-CSE-MsgGUID: iWdQZmQ2SYqFzkaR4o/UsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="82916810"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="82916810"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 07:00:16 -0800
X-CSE-ConnectionGUID: Ibfk+bKvTxOaVq67692VtQ==
X-CSE-MsgGUID: Nwe88DSNQsCShfo5KdykoA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Nov 2025 07:00:14 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKHl6-00082q-1w;
	Sat, 15 Nov 2025 15:00:12 +0000
Date: Sat, 15 Nov 2025 22:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.ovl.cred.guard 46/47] fs/overlayfs/util.c:70:9:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202511152246.Kow0dUgA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard
head:   74fa97e66e24a79a77ee469a7e8305f2013edd1f
commit: 05caf92703741e332e658d583bddc36d18d0067b [46/47] ovl: detect double credential overrides
config: powerpc-randconfig-r113-20251115 (https://download.01.org/0day-ci/archive/20251115/202511152246.Kow0dUgA-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511152246.Kow0dUgA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511152246.Kow0dUgA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/overlayfs/util.c:70:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/overlayfs/util.c:70:9: sparse:    struct cred const [noderef] __rcu *
   fs/overlayfs/util.c:70:9: sparse:    struct cred const *

vim +70 fs/overlayfs/util.c

    64	
    65	const struct cred *ovl_override_creds(struct super_block *sb)
    66	{
    67		struct ovl_fs *ofs = OVL_FS(sb);
    68	
    69		/* Detect callchains where we override credentials multiple times. */
  > 70		VFS_WARN_ON_ONCE(current->cred == ofs->creator_cred);
    71		return override_creds(ofs->creator_cred);
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
