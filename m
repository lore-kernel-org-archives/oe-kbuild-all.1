Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535A017C21E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 00:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765586808; cv=none; b=KB3qqPuuYHr6gLaKOwctWCsE/aICUU1piubb//il89uMNFpK+Fn4I+PLFZEY90yVWmlt4REldFX/6CWk5BK7aYgFDDHOUsyRFI6yEjQ9/QnJNdZtloNXkumuFUcWOVgoc77+F3iSqEIlYm0KJIz2VMFCVtAzD29BE3zpEGqueyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765586808; c=relaxed/simple;
	bh=YPqTQKgOxDbKrecCc6qGD+p4JjnI9J1Ya/8s3rDQ2To=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dzFawl1r4Nwe6qOKKyrMND6+Kty1sQMKx+75iNGjrSCkPI8GdV93wyoAKZFPfvL+l3uiBcKBALkcpxLoljvc/c11kcwJdaE8c9Bst/8IFEDWkpAsKJfKvqvMl7zqCOY2WfgH2hFAixO/c85SNvcej7R09dbwY3zeAM2cos/K0Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fayxjyr1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fayxjyr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765586806; x=1797122806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YPqTQKgOxDbKrecCc6qGD+p4JjnI9J1Ya/8s3rDQ2To=;
  b=fayxjyr1JnG7WVrvpdfZPn72Xp4yqjWXhkwGBvTjD2m9+HY1NJbwV1+U
   9vocQbTz3zIUnDE++AYFF2lwrTF8l0GJ2CL9dGCaiAUFeQdcsVy7g9u4P
   rtnMl3Z7hZ0tqKFHzOuMfEoX/ga1vIpHg4e2h5QBPCnP8WP/CaTYP0Hvd
   oGvLeH+4w8zuAuMV3A1NECpyg+w9CqzbckB5nHFUZXMiW7n0NOC4BYE2j
   0brm4cwUovpKLowmHIeUd0IB9D85cyp9ssX2mec/YMVIoz19lqct8RdYF
   aOBKkk5UR5nz3dM+FHeO3dEZq4yDHLnjm8yUnEzRiHe7o3dn7BwMj1vfK
   g==;
X-CSE-ConnectionGUID: p/yHFzpHSVCsNdaOVeXV7Q==
X-CSE-MsgGUID: czQCt6uRQBKDC0YlGkWSjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="79048678"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="79048678"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 16:46:46 -0800
X-CSE-ConnectionGUID: ZngOtC7lRjOwjSt7MMkdLA==
X-CSE-MsgGUID: IRi0TcaaQzG2L89ynt6cLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="227880561"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2025 16:46:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUDmU-000000006rD-2VmX;
	Sat, 13 Dec 2025 00:46:42 +0000
Date: Sat, 13 Dec 2025 08:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] net/ax25/ax25_dev.o:
 warning: objtool: missing symbol for section .exit.text
Message-ID: <202512130829.PYuFPQHp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Duoming,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df8d11fbcbb07177c2500e63d7f5a36063977596
commit: 5ba8a3eb026f02aa75f4a22099250bfd4db659cb [1941/1941] ax25: add refcount in ax25_dev to avoid UAF bugs
config: x86_64-buildonly-randconfig-004-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130829.PYuFPQHp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130829.PYuFPQHp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130829.PYuFPQHp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ax25/ax25_dev.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
