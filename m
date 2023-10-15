Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1AD14AB8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 22:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzIISUbq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697409071; x=1728945071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=frVPoKdrobcKt1ty/MtKKbHiYSvZfw/Ol4/vX5jlIao=;
  b=nzIISUbqq4d5W0/q7GaMPDZ9/sIP2OlXfdAkMGH3oZLL6lKEcVUrvVLf
   uYgM3hfIMFuQqNjh/2ZBkWmipNoCV5Me7v1NROmusmywSH0/ZTol3b56F
   smyPQL0lu87qM+aWnB5gv+Sau6QoYcZLQ4Y2klUpnUk/1vBonLjthkXXq
   ZyRck4uzT68wx45CbvjJlYE5UQIRj6ufrCj7Brms9Jo9EHPQoWFpWoEjb
   OCvJGkHzaETMh8+nABRyJtE+5XLJEOWNRUa/8sF+YJnq4QFaCKsQIUh9C
   0qpH7YygMdXeDKOJcu4jusJimUDeR05zJzEIgH+DmIrpd2aYz/d5lRqX6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365682560"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="365682560"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 15:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="755460529"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="755460529"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Oct 2023 15:31:09 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs9dX-0007s5-2K;
	Sun, 15 Oct 2023 22:31:04 +0000
Date: Mon, 16 Oct 2023 06:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 82/206] checkpatch: WARNING: Block
 comments should align the * on each line
Message-ID: <202310160615.ObxNRcfU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   c4c1ca0ec7d6b3dcce7304ea88eaaad52f090d90
commit: 3aa7598fb35898e04336c9860fd87bf7e54771fc [82/206] arm64: dts: apple: Add j180d (Mac Pro 2023) device tree
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160615.ObxNRcfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160615.ObxNRcfU-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#523: FILE: arch/arm64/boot/dts/apple/t6022-j180d.dts:506:
+			/*
+			* DANGER ZONE: You can blow your speakers!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
