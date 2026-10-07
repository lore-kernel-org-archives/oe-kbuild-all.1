Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9923812F6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 06:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791353433; cv=none; b=X8u6IJSCiVIDOHu7e/wCup1SAherZPPxWoDxkhKp5kFjOdWAOAYL2P+H82LK9h6gvljYBBH7iZpnd/eI9ae2P/pr0NXY2QeZ+mYz2qDm5ctfJrff4qjvtNQXwjzbMY3HFYBla/ApuZ21qhnjRU32NlGcE1vrsx1iTv9HDuucbpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791353433; c=relaxed/simple;
	bh=VsL2cxkopJ7f8ma2Fbyh3WirSZ1wzKkkeVCx37H8kJU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SRLNA+vktJFdfH24ritdVdaR3H3LXK2lEk36BhEDGRs0fFm6in8B/7KjzPUk+QZfojS32tOUfWZwmO/H5eVt7vvl7/SngCyGcqeLvpw2Wm0v9wsmRnh+VNof3czdmKDOqKT5u1BMr8VO4TDYPEMVid7998HDgQx/bAQaTKIz98I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dufkCvnx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dufkCvnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791353431; x=1822889431;
  h=date:from:to:cc:subject:message-id;
  bh=VsL2cxkopJ7f8ma2Fbyh3WirSZ1wzKkkeVCx37H8kJU=;
  b=dufkCvnx1qyshMcd7M5AmwVB+Fml5Sv1ago0wU5h+nWn8KRjY0NtPq2v
   urWU5gmI8VmKR4kaeuZuHCj4GSRORXfJ9Fz5OUnFjPC3vqAMQrPByIrww
   ZtwIWlHHghVEHCariGLipKlo5NuPeiJ2D2EKXSUOXbjn/Q557dE69iVgG
   6vgj6E9T8OibpaYqKWOZnLSeNxH/Wk9Fngk5DD7KkC3xSJi0MNtKiLa+y
   P2/YSFxbZgjWmHGEmdTIZ+q5HA2PAiQzb8dh1SGA2uKkbyTzwcE+Ok2sr
   PgdcxPuKh3THFOPqtunr3KtC0J73UhnJx9RzYZNCr9o3boVGSG4H9UMKS
   Q==;
X-CSE-ConnectionGUID: cFZ5nShyS6yKp+94+4GDig==
X-CSE-MsgGUID: 4xER2TesRbCLenjaOdC+9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="107001"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="107001"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 23:10:31 -0700
X-CSE-ConnectionGUID: 6j3mzyEARa+b0ycH1dHGyA==
X-CSE-MsgGUID: g49TJuCjTwmyV9DOW7lr/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="276865057"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Oct 2026 23:10:30 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEKrD-000000002ah-2e79;
	Wed, 07 Oct 2026 06:10:27 +0000
Date: Wed, 07 Oct 2026 08:09:31 +0200
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net
Subject: [mszeredi-fuse:extent-map-v3 26/29] s390x-linux-gnu-ld:
 fs/fuse/backing.c:168:undefined reference to `put_dax'
Message-ID: <202610070824.RHvhqH4C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git extent-map-v3
head:   abdbd9557c238384900ebd545f426a609e0162ae
commit: fe425484d457f923142f91e234d8ab6551f2358f [26/29] fuse: add support for opening dax device as backing
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261007/202610070824.RHvhqH4C-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070824.RHvhqH4C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070824.RHvhqH4C-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-gnu-ld: fs/fuse/backing.o: in function `fuse_backing_open_file':
   fs/fuse/backing.c:156:(.text+0xe8): undefined reference to `dax_dev_find'
>> s390x-linux-gnu-ld: fs/fuse/backing.c:168:(.text+0x118): undefined reference to `put_dax'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
