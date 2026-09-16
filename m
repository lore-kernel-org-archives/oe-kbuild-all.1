Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702C61C28E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 00:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789517244; cv=none; b=MdoBjLyOF9yTFJBgq6C0hV0/V+AMclqAmc5Z5oboBVBaaJCiQ99NB7e6Faj/cZip2XQdf5bv8QgChPlEZ+ORHmU/IrD420ws63Nbgz+rl6WnmQdiE0TMBfqRQMoYhws3X1aV+3gMwQGSW1C6oWsCkbQQFtF+nOXu8qnrm/tJo0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789517244; c=relaxed/simple;
	bh=98ieLHn8tQrpKIjcCLyqtllLjI73LnMe0p0M14uLewk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RBTYsQcsZBfIt2p3O1pqulslXdXWJpfzF67AWqPafe2GG/9UM97hOua32AsA7JBSCI+OPtwV5qrVUKeRlnKyTF1tz5VG4RfOGVOzAG+3Mzie//1V8bet4yfMHwe5P6iPyY2ycrJeAZMuRAKJJbPwOYQ/EzrNNTc7AR80h836BKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mat0Xxx0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mat0Xxx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789517242; x=1821053242;
  h=date:from:to:cc:subject:message-id;
  bh=98ieLHn8tQrpKIjcCLyqtllLjI73LnMe0p0M14uLewk=;
  b=mat0Xxx06yX/2QKimL4Pu+dcRYesYkLWFyy1Iw1Kag8Fh054rW+8oQxO
   +1y/aiPK4GrJfmka4QLykvyPJH14ko1cuCW9niwTBlfkVZ7cNt3hA08Bm
   +Qc08CRqpNb07hH32Hkb3OVgggb7FatI3CC+PB5LWsSsqbfW6RAU3LRYH
   66lmZB36+f6PtrTfHE6t+tRKFJJE+lK8T4/LMhyyfYmhjxoTvYHIkNooZ
   rmpReIYJxodSCO9Abyhsmgdnx8diA/3Wib4EnPV2UY6FzT9ofxjxVZDtO
   oNoC/OxPEpr0liff6/DXJ3M/IM/PmbAmyeidjihPctW+KD2UsepY1+W8P
   g==;
X-CSE-ConnectionGUID: J62cd10LRyGrJrnMpTWbdw==
X-CSE-MsgGUID: aTmkJYvIS1+lZ8PG2yxhUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93593181"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93593181"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 17:07:21 -0700
X-CSE-ConnectionGUID: cOmwoCNiQ0avhOkBzQtDbw==
X-CSE-MsgGUID: VeA8gO95SP+31oUt22VyLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272701085"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Sep 2026 17:07:20 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6dBF-000000005Cz-3Rs1;
	Wed, 16 Sep 2026 00:07:17 +0000
Date: Wed, 16 Sep 2026 08:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-complete
 5/67] Warning: mm/balloon.c:116 function parameter 'allocatable_only' not
 described in '__balloon_page_list_dequeue'
Message-ID: <202609160838.GE9WXQ8o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-complete
head:   0423df59f3f085592c3ff59834eeae067ee75158
commit: bffbc25036a9d12170b0fac9418be694af8622b5 [5/67] mm, virtio-balloon: don't deflate into a withdrawn zone on OOM
config: xtensa-randconfig-001-20260916 (https://download.01.org/0day-ci/archive/20260916/202609160838.GE9WXQ8o-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160838.GE9WXQ8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160838.GE9WXQ8o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/balloon.c:116 function parameter 'allocatable_only' not described in '__balloon_page_list_dequeue'
>> Warning: mm/balloon.c:116 expecting prototype for balloon_page_list_dequeue(). Prototype was for __balloon_page_list_dequeue() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
