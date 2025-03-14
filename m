Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDD73B7A8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 15:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964549; cv=none; b=neIoDGXyS2vzCLLbDb5+QoM0m8pkBJEf51KTryOonQOQ5jfI1ELOfEfAfew8XKOEA2WWxFsJckB865GbNEL+8ECuubIp6gu8BzJbkgiTLW2S7MRlqP8QGJmmzAiei8DSPvSP9quermGVvU1+g/nlS62CKI2qc/gDLfGMC/gwUTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964549; c=relaxed/simple;
	bh=6PtW+UWhbR6NH84rTyjApC6w3ZTanIVePGfQRO4ExX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VzK1YCUjxmbWXanPu2Z6kg+jCMk+RFclkq8cwqgzuT65ztX2pFCdTmgEHqWvfowgAU/dtR7wQEAqAhwDA0ufuG6sRANGD+d6/adCW/4Kl4gSshj+3Ru6cteYIQmiGwLtUjRN2WE20xfnuNyaZUjPThUMtPL+yOUQdqFmQEO5tcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hicIfrIb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hicIfrIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741964547; x=1773500547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6PtW+UWhbR6NH84rTyjApC6w3ZTanIVePGfQRO4ExX0=;
  b=hicIfrIbg0CdPzrCLGbROuv//L8uEVlxpvf8KLauShxOCKnP2V54nXlX
   vmnAdvCFJ7Fh8bmNLN1VGw22i8xf5ca9rmwMZ9G/cLc2QAT78s6vEuti+
   aqeZGSoMsiHknLqpLrGX5qOlN9AqT5Aw5P23L9TZwh6Rpe7Mi8MN1aMlD
   5ZFQfsBcbzYfNixQvXfO04EmvKuNXEkCgqH/0tr85iLTPw6ngktCFanBe
   hk67zJzevjdUUspHuNEqcUQOLSoAnR1TGbXai35/SSlI6w2hzVNqymOQv
   qAeu5hr76aiSmU7uEgIB8TpzmBnCng+8d61JlMGugZU/LF/HUHBgdf96U
   Q==;
X-CSE-ConnectionGUID: gmgj3Ti5R2+OXDKZv+gfhg==
X-CSE-MsgGUID: 2UP7UZ0+R2yo1h1aphCqdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="42849480"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="42849480"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 08:02:26 -0700
X-CSE-ConnectionGUID: ngRQLSg+T8uBfA+qeGO14A==
X-CSE-MsgGUID: x7m8zxQaT8uobDkhRaFAug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126371155"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 14 Mar 2025 08:02:25 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt6YJ-000AZY-0O;
	Fri, 14 Mar 2025 15:02:23 +0000
Date: Fri, 14 Mar 2025 23:01:30 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9918/11207] security/landlock/fs.c:1337:18:
 sparse: sparse: Initializer entry defined twice
Message-ID: <202503142207.TtjVTUqj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da920b7df701770e006928053672147075587fb2
commit: eb3e469c1fda763a2e38d317c01cb55dd80a6e2f [9918/11207] landlock: Log mount-related denials
config: i386-randconfig-063-20250314 (https://download.01.org/0day-ci/archive/20250314/202503142207.TtjVTUqj-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503142207.TtjVTUqj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503142207.TtjVTUqj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/landlock/fs.c:1337:18: sparse: sparse: Initializer entry defined twice
   security/landlock/fs.c:1338:26: sparse:   also defined here
   security/landlock/fs.c:1351:18: sparse: sparse: Initializer entry defined twice
   security/landlock/fs.c:1352:26: sparse:   also defined here

vim +1337 security/landlock/fs.c

  1331	
  1332	static void
  1333	log_fs_change_layout_path(const struct landlock_cred_security *const subject,
  1334				  size_t handle_layer, const struct path *const path)
  1335	{
  1336		landlock_log_denial(subject, &(struct landlock_request) {
> 1337			.type = LANDLOCK_REQUEST_FS_CHANGE_LAYOUT,
  1338			.audit = {
  1339				.type = LSM_AUDIT_DATA_PATH,
  1340				.u.path = *path,
  1341			},
  1342			.layer_plus_one = handle_layer + 1,
  1343		});
  1344	}
  1345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
