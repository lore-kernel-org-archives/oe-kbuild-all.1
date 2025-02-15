Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F911E5B8E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 15:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739632920; cv=none; b=cy7D0aNbPcB4bg9l17CkmkPRUH0wqpTqj6YefV1+rX2gAW9iYpMencRNXt4ebNF/lO5LLmCZy807YBDWwYGvBrFlKA4Hu1+wG3l2p0/dR+6eUdXtC3glqbY2IRbSSZfiWLe5by7oD/v+OSF7HOofErPnr8mDW2h4Ful1oPgJwbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739632920; c=relaxed/simple;
	bh=ekwD6GMaNgudTM4dXR6Cw41nqdsYAyi3TGMs3kwKoSg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/8A7Y1QdCnKZbcfQYDmjcElUufWGiAmstJf+0F437rr5ejqNWKpseeTNpINa0jAVP46AhfrarVcPhU2CTqkmIIhxtT9rW4mRJo6kekiOekF7PFNE20ck2vc5BPNX/VFQODJzhjzXlsZGc9u9cKUHlIwjiRzCLB2kuyTWX7ArEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZ1DVjJ6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZ1DVjJ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739632918; x=1771168918;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ekwD6GMaNgudTM4dXR6Cw41nqdsYAyi3TGMs3kwKoSg=;
  b=fZ1DVjJ6KYbtIG+UmCi4dwVIC2WV2fSTIGvPH6e2FyNkLzyrmYl1j2Ab
   G92ZflLaA1d47Y5ZEmIQ64PMKPizRVEXJlMphcPZq9o5syJzI8Bhd92Ax
   egR+eQZlNr8Ggr5By4lhn/m6LMDmg7bad4pOP5odSvMRqRgASMZV7Ajxm
   v/UpzfUrkyXCZXha9ejlPmSuOLBPTZSVsIg8YHVR7FZSAwul8RqQeZwU7
   K65f8qURtUGaT6goOsEyUmp4M768VvtCWlFy04ctk2SPqFAmZYLt5JYRT
   Io6ADoL4sRUJUaYZG6sQqHHgMpuEoIgWhwJEHDVwnr0SgzRGL3ln4uv+C
   w==;
X-CSE-ConnectionGUID: 1aaFCKtfRiKs5UzBlfopQw==
X-CSE-MsgGUID: GCdIq8wZRF+TkhjP0V3/8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="65720030"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="65720030"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 07:21:57 -0800
X-CSE-ConnectionGUID: JOOgsabNQXONlohRp9RYZw==
X-CSE-MsgGUID: GWSL0J+GRC+0RWpwN1Ow3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114620291"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Feb 2025 07:21:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjJzO-001Aw1-05
	for oe-kbuild-all@lists.linux.dev;
	Sat, 15 Feb 2025 15:21:54 +0000
Date: Sat, 15 Feb 2025 23:21:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/preempt-rt 3/3] fs/hostfs/hostfs_kern.c:972:9:
 warning: initialization of 'const char *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202502152330.v8sgLle7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   da3aec3fdaa3fcb8c9f9760d4edef06741ccfc6e
commit: be80de30b347dc2eae35dd5f7905ad9c9167dc08 [3/3] hostfs: fix the host directory parse when mounting.
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250215/202502152330.v8sgLle7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502152330.v8sgLle7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502152330.v8sgLle7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/hostfs/hostfs_kern.c:972:9: error: implicit declaration of function 'fsparam_string_empty'; did you mean 'fsparam_string'? [-Werror=implicit-function-declaration]
     972 |         fsparam_string_empty("hostfs",          Opt_hostfs),
         |         ^~~~~~~~~~~~~~~~~~~~
         |         fsparam_string
>> fs/hostfs/hostfs_kern.c:972:9: warning: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   fs/hostfs/hostfs_kern.c:972:9: note: (near initialization for 'hostfs_param_specs[0].name')
   fs/hostfs/hostfs_kern.c:972:9: error: initializer element is not constant
   fs/hostfs/hostfs_kern.c:972:9: note: (near initialization for 'hostfs_param_specs[0].name')
>> fs/hostfs/hostfs_kern.c:973:9: warning: braces around scalar initializer
     973 |         {}
         |         ^
   fs/hostfs/hostfs_kern.c:973:9: note: (near initialization for 'hostfs_param_specs[0].type')
   cc1: some warnings being treated as errors


vim +972 fs/hostfs/hostfs_kern.c

   970	
   971	static const struct fs_parameter_spec hostfs_param_specs[] = {
 > 972		fsparam_string_empty("hostfs",		Opt_hostfs),
 > 973		{}
   974	};
   975	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
