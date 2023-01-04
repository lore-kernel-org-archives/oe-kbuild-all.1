Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C01AD32
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jan 2023 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672842539; x=1704378539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IGG8D5+mDJRfKsLfUc6wXABONcDCRi6a9dba8mtLmZ0=;
  b=JD8lwX/6LQhpZy6l4lfmPDMFdCVwe75nDzbs0AzvnNwti5T5xEylapsH
   Ftb8ham/B/uNcwJE6M5fANnlW8UmMZfPBNbLnGuGlS15NW3ncKgqf/q2Q
   7yLKjiaPmzcNS1fAw6edbsE/AIklUM9JzC42gumgiZkaqDe4RwNzf2wdm
   IU9RnDaVOOxnO/FEGiR2qFFlLo19HMi3EravWC6tpEDQ69oxXWivgriMA
   kLoYOy47OmFuJ6k/5/UBb8y5q5KZ3F61ykmRB7GC/v3n4MN9PTU8QRFjv
   9pjeeP+t1hF/YbBVto1givZI2TWhdtZ/RzAte2jyqSJ8e9gA8P6QKs4SK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="320654913"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; 
   d="scan'208";a="320654913"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 06:28:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="632795975"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; 
   d="scan'208";a="632795975"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Jan 2023 06:28:56 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pD4lD-0000SF-1V;
	Wed, 04 Jan 2023 14:28:55 +0000
Date: Wed, 4 Jan 2023 22:28:40 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>
Subject: drivers/gpu/drm/logicvc/logicvc_drm.c:233:26: warning: Local
 variable 'clocks' shadows outer variable [shadowVariable]
Message-ID: <202301042242.bCTJn52G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69b41ac87e4a664de78a395ff97166f0b2943210
commit: efeeaefe9be56e8ae5e5b4e9ff6d2275ec977ec5 drm: Add support for the LogiCVC display controller
date:   7 months ago
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout efeeaefe9be56e8ae5e5b4e9ff6d2275ec977ec5
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/logicvc/logicvc_drm.c:233:26: warning: Local variable 'clocks' shadows outer variable [shadowVariable]
     clk_disable_unprepare(*clocks[i]);
                            ^
   drivers/gpu/drm/logicvc/logicvc_drm.c:221:15: note: Shadowed declaration
    struct clk **clocks[] = {
                 ^
   drivers/gpu/drm/logicvc/logicvc_drm.c:233:26: note: Shadow variable
     clk_disable_unprepare(*clocks[i]);
                            ^

vim +/clocks +233 drivers/gpu/drm/logicvc/logicvc_drm.c

   218	
   219	static int logicvc_clocks_unprepare(struct logicvc_drm *logicvc)
   220	{
   221		struct clk **clocks[] = {
   222			&logicvc->vclk,
   223			&logicvc->vclk2,
   224			&logicvc->lvdsclk,
   225			&logicvc->lvdsclkn,
   226		};
   227		unsigned int i;
   228	
   229		for (i = 0; i < ARRAY_SIZE(clocks); i++) {
   230			if (!*clocks[i])
   231				continue;
   232	
 > 233			clk_disable_unprepare(*clocks[i]);
   234			*clocks[i] = NULL;
   235		}
   236	
   237		return 0;
   238	}
   239	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
