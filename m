Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40272853F3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 02:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767924898; cv=none; b=IAK/96Dq+6An+erEsaO9MSlTqSpyE5yySDRH5V8OCjfcD74EStQKv3o2RPmtlw3bxX4hZDBa1chbdnfb9CoarA/GvjV95V4ciW42KuygBXU1nq4u7biX1v2FggmRsFkeJ9wgHDGpAqbtBMGZgLp2YWRUP8bDdlS/4qqQQCxW+lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767924898; c=relaxed/simple;
	bh=AvEMkIWWq8iZBzj1n/zxxNppwUJjV0/aT7sx3CCzKCs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C+bbNEA5o3Ahg4ReGRy6KAmqYaV4m7vFaqWiEBLYvOC5dR9KGmK024l+z9jlX9YKwZD8I2unNfpEZll/yWhNMXLfnnmk3R6bOGDMhKLzFzMRcLMXU5ECLFZwYgdcj84earJBreGdKql6M68aKHvktJt6yfsTMsC6lhBvJImcaiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljyDmvz/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljyDmvz/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767924896; x=1799460896;
  h=date:from:to:cc:subject:message-id;
  bh=AvEMkIWWq8iZBzj1n/zxxNppwUJjV0/aT7sx3CCzKCs=;
  b=ljyDmvz/SUtokqJVE1VRHhnSwA9Uz+18krHmyfhrgZCteXP/80UJ6YKW
   +s5ifWqt8HMhOZ5J9ulDGIf8/zSXhup3sYZi/ZQzdnu53cCS9XuAXbLKj
   RBYlr2ocL/Kw8JQMsjEOfcii++4CjzgHo4HSdRCLwudrP/7G9WMngwrpP
   FBwDvA+g7W56QwWlEyYoJKYEmD67S2Waclo3inJkTtTXOX+rpjbqR9l24
   PHkjPdnGqOW69QGHXERSh7Ljzn4tSn4wbBiNk1rUEmS6T/nyn8rpkR3bV
   L0LvH+32eeBvaSuTZSJEiAEP3aGb6PprUc9YqRCJ/k17NhEp94Ov2TGiJ
   Q==;
X-CSE-ConnectionGUID: TncAXkToRYqGuj3K7KLLrg==
X-CSE-MsgGUID: B/N79gnkTy60p2NWlSNC7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="73166502"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="73166502"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 18:14:54 -0800
X-CSE-ConnectionGUID: YAiqOdmMTriWX84qktnl8A==
X-CSE-MsgGUID: wt2ZDzWGSSmxTr2nnuM9yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203782279"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2026 18:14:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve21J-000000005K0-1s9c;
	Fri, 09 Jan 2026 02:14:33 +0000
Date: Fri, 09 Jan 2026 10:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, NeilBrown <neil@brown.name>,
 Jeff Layton <jlayton@kernel.org>
Subject: [cel:nfsd-testing 39/41] nfsctl.c:undefined reference to
 `nfsd4_cancel_copy_by_sb'
Message-ID: <202601091018.3j76XsxT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   2e04c850fae081223bb6707b782cba843a5b43f5
commit: 9980cc2f56eef78e7a6fe4a49e179340c8319df6 [39/41] nfsd: cancel async COPY operations when admin revokes filesystem state
config: arm-versatile_defconfig (https://download.01.org/0day-ci/archive/20260109/202601091018.3j76XsxT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091018.3j76XsxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091018.3j76XsxT-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/nfsd/nfsctl.o: in function `write_unlock_fs':
>> nfsctl.c:(.text+0xaf4): undefined reference to `nfsd4_cancel_copy_by_sb'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
