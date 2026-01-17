Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF469326D6F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 04:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768625863; cv=none; b=mYTNVJs09qNhzO3NZYqCrjAo6vAkoKPBasD6af02JTXG03dzmgB4GnNxrvWDOz+5BWUYDVOyFWLAg+7nhUwuvddKwMDAB43qIp84/IOWa1gaT6hj+Ip1yB3fI1bwooEv84+cmf7lXZqxZ9vgiBGKZGp+Pcpug8Kf4CqDlF0bCwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768625863; c=relaxed/simple;
	bh=kwywP6GVSaMsvHLNM8Tc0ap+4n/pTOxAnLx/TLjJILY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RMIqlvYkLt1YlQbwz6lg34hb+Tb2vVV9rYIEbFN03Jfampdtf623poF855vflT/LSmUoH0ufEwV0wZY6IBC9J8GAxOoufQHGOXaTLCQpOjBQ+I0IisU38SjCbcWDGOIcjb9w8W3rv7DU9r6X8pylH3alFKIe/kWpGNyeu42m/RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRWYG7ex; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRWYG7ex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768625862; x=1800161862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kwywP6GVSaMsvHLNM8Tc0ap+4n/pTOxAnLx/TLjJILY=;
  b=lRWYG7ex7VvFNaf3dKQGp0y1NLa1VsLnqcVyNc9wD+RR2s5bP/E6oaMZ
   ymyhFi5GWro8ix9T9+CqfDPY6JdAtLl9SEvHaOnRbj5Go90va5axbvnC5
   zWaEUXwqe/e2f4Cy7Ep2xMoqFIcRwvMxTcMu/fgZxBxBS4M8jVQ2zcJYA
   vZqez4ekDU4PThptjm/vnG63uaSw63DXoGuXD9l5DH5Mv4FQv1HLPH2S+
   Wpsdn4ALTssDxQP8m2It132bnOzxf0Szul3Zs8d23xOWCn36AEUuAvyox
   +nYL18ap18n7delXTTEXhn5sfe1kVF6f3WijrCqtK8i5QuxoLAznmR9Vk
   w==;
X-CSE-ConnectionGUID: 4hag+qKwS2KxEz0O6AnEBg==
X-CSE-MsgGUID: ueGHS283Szm2C45fAx/5KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="81049556"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="81049556"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 20:57:42 -0800
X-CSE-ConnectionGUID: WePKTzxpTxiaBOpZvyT2hA==
X-CSE-MsgGUID: eIvcdobaQ5OqatW3koxfJw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jan 2026 20:57:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgyNV-00000000LZl-3bum;
	Sat, 17 Jan 2026 04:57:37 +0000
Date: Sat, 17 Jan 2026 12:57:27 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Micka=C3=ABl?= =?utf-8?Q?_Sala=C3=BCn"?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: security/landlock/fs.c:1339:18: sparse: sparse: Initializer
 entry defined twice
Message-ID: <202601171241.AOq0Obg0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   39d3389331abd712461f50249722f7ed9d815068
commit: c56f649646ecec3dd1a2e400e6e5ec83439d940f landlock: Log mount-related denials
date:   10 months ago
config: arm-randconfig-r132-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171241.AOq0Obg0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171241.AOq0Obg0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171241.AOq0Obg0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/landlock/fs.c:1339:18: sparse: sparse: Initializer entry defined twice
   security/landlock/fs.c:1340:26: sparse:   also defined here
   security/landlock/fs.c:1353:18: sparse: sparse: Initializer entry defined twice
   security/landlock/fs.c:1354:26: sparse:   also defined here

vim +1339 security/landlock/fs.c

  1333	
  1334	static void
  1335	log_fs_change_topology_path(const struct landlock_cred_security *const subject,
  1336				    size_t handle_layer, const struct path *const path)
  1337	{
  1338		landlock_log_denial(subject, &(struct landlock_request) {
> 1339			.type = LANDLOCK_REQUEST_FS_CHANGE_TOPOLOGY,
  1340			.audit = {
  1341				.type = LSM_AUDIT_DATA_PATH,
  1342				.u.path = *path,
  1343			},
  1344			.layer_plus_one = handle_layer + 1,
  1345		});
  1346	}
  1347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
