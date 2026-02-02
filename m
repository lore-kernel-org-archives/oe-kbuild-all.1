Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A905A26B2D2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 06:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770012936; cv=none; b=D1If2QRGJJJGFG18aelFr34sqN/TNATewc0MKDqFuSFHR97/pk1uHwFRW3DnARKXM8wZiz9WhTvdjspNombalGPJ1+jeiG6tiUZnp28DjW2WUuvRRyFwgQnCeiwQ1IKlzWYTOmHs8WRQZMSuGxLcHjXYVdK5aDU3upex+fx3d40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770012936; c=relaxed/simple;
	bh=9dRmePvfUHENkDYPM46Ml2u4VNSx4gz7LOxgZg4aJTA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DIgNk21W9H1kNDYufW9JGlUmuiwgYq74eAjpPU3DJVsQYe4WtbzJ/LHawckKF4Up2cvsr0lUCS3kOEQFPA9znmy3VDkYdK69mbVZ2/UUkTgT6sSIRzrorXSlW4z8d8P9kd+uePshczfJVOc26tcTCMgApShr8VmIHXtFDLaO3io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0rU3gtZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0rU3gtZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770012934; x=1801548934;
  h=date:from:to:cc:subject:message-id;
  bh=9dRmePvfUHENkDYPM46Ml2u4VNSx4gz7LOxgZg4aJTA=;
  b=E0rU3gtZ2ZdoXbNZ+Ppmmj81YM+dnRJ1fquIDm2uUnvaizpM64odXjpG
   W8ENavhLCWlMLx2fth4mb7AJZKffx8RNoDy6ZlT1ncFYWcytlVUtNM8gn
   VePg1rWhnfy9lj4XJXBZBhwPjQZ949ZJ8biK36xJa18nJzIVghc+Aorm7
   Lb+W+UA+cjprYWFTNtgfRQYWZNHgz5j2cNvHedXsBG0dz5rd6Ax2wYdDV
   C6ZI5r3fk4BTqhdoKyaRJzELmkulVxDoz2PHBdbWVwS6j09FWSRKBnY5W
   m5Y2vMKMj2FVSp/TXYyPp86cTj1aMxYjzl5MXI0Cz7MBzupdiZQecPBQ/
   w==;
X-CSE-ConnectionGUID: mcE2ydm7T/+PXgb5qx+mOA==
X-CSE-MsgGUID: nO6WfoWHQkW4jS7jFTE/PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="73768026"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="73768026"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 22:15:33 -0800
X-CSE-ConnectionGUID: ztrXXCnRQ9iNyzxieQUEtQ==
X-CSE-MsgGUID: WyptCHD3RPOQqKMe8qsNIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="213901592"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 01 Feb 2026 22:15:32 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmnDe-0000000033R-3PmK;
	Mon, 02 Feb 2026 06:15:30 +0000
Date: Mon, 02 Feb 2026 07:15:07 +0100
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Georgia Garcia <georgia.garcia@canonical.com>
Subject: [jj-apparmor:apparmor-next 24/29] Warning:
 security/apparmor/label.c:1347 function parameter 'inview' not described in
 'label_components_match'
Message-ID: <202602020737.vGCZFds1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   173a18bf6c87bb337d2fe8d59b5a41b3cfa38fda
commit: 796c146fa6c8289afc9e18004c21bfe05c75a487 [24/29] apparmor: split xxx_in_ns into its two separate semantic use cases
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260202/202602020737.vGCZFds1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602020737.vGCZFds1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602020737.vGCZFds1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/apparmor/label.c:1347 function parameter 'inview' not described in 'label_components_match'
>> Warning: security/apparmor/label.c:1404 function parameter 'inview' not described in 'aa_label_match'
>> Warning: security/apparmor/label.c:1347 function parameter 'inview' not described in 'label_components_match'
>> Warning: security/apparmor/label.c:1404 function parameter 'inview' not described in 'aa_label_match'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
