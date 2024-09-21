Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D701552E3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 09:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726911344; cv=none; b=pkGQ9Nj+fQ1q4Zoz5xhQRRxWy1y/9A1+6tXTsNOJcrB/riN3sWOB+eWehi+2/QaO4hu0HHFW+YLWRiVLTPLM7x9TJxeaWwgM/YRxeztZBbfUFUCEx0+g5WT0Wx0fEu5uOQcI9om+gsGfCbFb/Iby0qEzzGdaNh+hohCH0gF6lvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726911344; c=relaxed/simple;
	bh=o+oDz+ts62tXwZerqntcEo242CSfJi6wO5XHgKr6gNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gde+6bgDDQNPN5Yohgos2nBhYGvAPs0tF6F7/a09TdqpkrzJzg74fzVjh0rw95BdECRSYsaPZMltBywUek2xh+15p40GBFNV/hXLl48L4O7h5BMJqg3cZIaJ0fycg34c2uJH5r+2krGP1CnRdeoUnaFULCq2zqT17W0kzqeocEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/pz/GBe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/pz/GBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726911343; x=1758447343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o+oDz+ts62tXwZerqntcEo242CSfJi6wO5XHgKr6gNg=;
  b=d/pz/GBeBlmo7QOYNb1azLgDffG5y0QLIYJcVxWXDaEnjKYf9aa081Sy
   dA/a5pH8QkKSiaY0s2M0zU+niMErhc6iDlWEvDBpEZL8uMxVA51e6pXD7
   E5spJ8UESJAwYLpiIi5elOIgj0CNm34Li8/xYV3qqDTiO5p/vShk8XVtc
   6mTCC2fmKFUOmjyujaPdd7ylNapQbB+ILixx1w68M3voiw+l05wBn1TYE
   asAK5G0ZZsC58w6zVhA7N1tu6y761j57GoR6S9tWyaT4l5Z8zZ3uuPHS8
   fmnsS/soSHpshTlHFvI+m1RwLQvB9Rtl8KN/ntcPKELzdka4EDBe8xqJg
   g==;
X-CSE-ConnectionGUID: FR3D7Br/S+OZarme19qn0w==
X-CSE-MsgGUID: YT4HCC0AScGEQdHAcz0rZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="26039802"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="26039802"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 02:35:41 -0700
X-CSE-ConnectionGUID: 9f2jXhUmSYGnJXxckg1svw==
X-CSE-MsgGUID: GPFoGCphQ4mtavp+e5lrzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="101403370"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Sep 2024 02:35:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srwWf-000FJl-1B;
	Sat, 21 Sep 2024 09:35:37 +0000
Date: Sat, 21 Sep 2024 17:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev, selinux@vger.kernel.org
Subject: [pcmoore-selinux:main 1/1] README.orig: warning: ignored by one of
 the .gitignore files
Message-ID: <202409211757.TTyKOuGQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git main
head:   2150c7af635defde2d4ffcc46750484f36ffb127
commit: f32b1ec059a1e3c85a67f0710fdd60aa51a808c1 [1/1] selinux: add a SELinux specific README.md and SECURITY.md
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20240921/202409211757.TTyKOuGQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409211757.TTyKOuGQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409211757.TTyKOuGQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> README.orig: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
