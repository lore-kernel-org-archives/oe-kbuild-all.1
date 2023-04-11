Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28839457
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 19:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681241728; x=1712777728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EJ824psBvBtevTlhgkWnnSQMUr+auJl6D6lRqPKBNQM=;
  b=F18C4Ygnj6g4VbMM0xkTw6FswGC3NYnncXpd84hvdzBrAyB9hP+xZhT9
   Ln82+0HAFUeviN6P6QshXYZW2pGDYqDgByYMsF57BYGBGj0VbWt6MfaY/
   k8uaVkiQoCpIeB6kYH+OMdo8Slv3hXDfadfIx1jiicaTNpPNWLOa2iAAI
   p0+qdYTfBtpYmovYIpBJSh8vg4kbOGfRqgqqpzE0jI0ptaIEbz+LWALcH
   zjNBuLDuLz7pifpTQICqN/DRGhJSytonpXBA/gHhyvhbj7DzVefbRs1Qd
   yqkm/8Rq656SJ7wEltHWDGoFtC++GgA/Rdkh8/3IiIiWZPdeSFNFAEtgS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="345506948"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="345506948"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 12:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="800042247"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="800042247"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2023 12:35:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmJm1-000We5-0W;
	Tue, 11 Apr 2023 19:35:25 +0000
Date: Wed, 12 Apr 2023 03:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:sendpage-1 15/18] ERROR: modpost:
 "skb_splice_from_iter" [net/ipv6/ipv6.ko] undefined!
Message-ID: <202304120339.u1Bsd6QA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git sendpage-1
head:   bba6f6c58ac9c8f61b66951059e4060b61cbd46b
commit: 699df3521ed5e2b2311aa1bb79181ff1e5de511e [15/18] ip6, udp6: Support MSG_SPLICE_PAGES
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230412/202304120339.u1Bsd6QA-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=699df3521ed5e2b2311aa1bb79181ff1e5de511e
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs sendpage-1
        git checkout 699df3521ed5e2b2311aa1bb79181ff1e5de511e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304120339.u1Bsd6QA-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "skb_splice_from_iter" [net/ipv6/ipv6.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
