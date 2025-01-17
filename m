Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C101FDE11
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 13:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737120887; cv=none; b=aQKVq5owoYECnQAu11kxo/EKdy7VWZGGftMp5BDTpWIAyYntehUm+QyF9fuf7gRZ6NXZmWU3FhZ33hb/r+NOVKrUsppSxC2KbPQiLiSVxmOWNcmHRuGfLOKrZB7PMPKDtHconTkh4hTBNMSuYgLvP3mdRCC7G2zKMjJgkiRZe/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737120887; c=relaxed/simple;
	bh=X/ubcbx+ds9qKqQXfOyP4oObV8ozA8PgtuKeM2Bm86g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a94W8SyPDtoHQlHNV3G5riIo4wiPrvd8NQKZvrjSt7vNqvhIMxO+NWlmZILjeHLq4wXMahQQYd2Ekq/aNbGwzYLeWQfogatB9SOkQ4lurGOjRrCLWJ30tleW5DJs/D9qJ03Y9o+5DcJQQC+n8gHuzITMa/+DYHL8nXhSMNZbJGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRYxQouY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRYxQouY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737120886; x=1768656886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X/ubcbx+ds9qKqQXfOyP4oObV8ozA8PgtuKeM2Bm86g=;
  b=bRYxQouYOm+T47n5TY3Rt3gHDxr/+S9tikZrT4Og7L6MgcZQvLN+Z5NI
   vGjGATN4bL0p6G+MYNjpdJwyzWtkhsIT9W4olej9Hrl3D7qKr5/q7oOca
   XR7fMqRKtFw0iyhbpC32OeFty3m3eRjaaj/JljNww9EF6V8A3GnF5oxvw
   7a2aDDe68NOEj5mWvmL/cNpjuzzgpc/SVras1EbuR9La5mpVvpp6XL7qI
   sbPZslCom/yR5hedpTKSpI4oNZlMNlW0GxJKe592+AgVyG9w0GdVqXUQP
   6RDK90mia0naIATKXcRl1r4s4SM2H1aMf/XiqKdc2Xf0f4PlQy4rHXvee
   g==;
X-CSE-ConnectionGUID: kgtGMIMbQ7GwlnMDz0Tp+Q==
X-CSE-MsgGUID: 2XGcBBj1QJmfYs+AsaMALQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="41223598"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="41223598"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:34:46 -0800
X-CSE-ConnectionGUID: muDP9im7T/COgxfdQhxnSA==
X-CSE-MsgGUID: wTUS/H4DTEyAUqUsRgKl2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105596081"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jan 2025 05:34:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYmUj-000TGF-2m;
	Fri, 17 Jan 2025 13:34:41 +0000
Date: Fri, 17 Jan 2025 21:33:46 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jan Beulich <jbeulich@suse.com>
Subject: vmlinux.o: warning: objtool: __fentry__+0x4: RET before UNTRAIN
Message-ID: <202501172136.eM0YvWhn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9bffa1ad25b8b3b95d8f463e5c24dabe3c87d54d
commit: a2796dff62d6c6bfc5fbebdf2bee0d5ac0438906 x86/xen: don't do PV iret hypercall through hypercall page
date:   5 weeks ago
config: x86_64-buildonly-randconfig-001-20250117 (https://download.01.org/0day-ci/archive/20250117/202501172136.eM0YvWhn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501172136.eM0YvWhn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172136.eM0YvWhn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __fentry__+0x4: RET before UNTRAIN

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
