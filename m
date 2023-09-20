Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFFA3CCF1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 18:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695234967; x=1726770967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a8ELTmMI9Unx8eS9T0XpqRrj0jV6ZoJovZMopr1k63g=;
  b=lkMs5ulz8p6Q2TWzpUS5zdEO5EcB2qKJRbWrnG9GXGuT2CHNd1zQO8Ll
   dCEAMIx4kn5evr3ExNUZw0IIzq3NXYHP7U+A/DY+UuihYlA7EYVUsl5mT
   KQFj6Oc5UD0J3IxjM80FaerfQi+17tN+Fv0zcyFRBFH+Na0y4KXuPZ19/
   EpUiilmHFCawNjtXiPRWb3z6buSHXq6f/+6/6R2lxe91FrCpjxgQDJmpP
   4PtMZe/Y7Y0q2ihNp20l46khQH8GfUMYVn2M1qSMaBDwE2E7FpiOulzsC
   +Dn/yX6l3mR2TTOPhrF22tvktCKljQFRUMLBoiUHUJ1aypxFEnCc3t++L
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360558047"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="360558047"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 11:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="890047778"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="890047778"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2023 11:35:15 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj23O-00092C-1r;
	Wed, 20 Sep 2023 18:36:02 +0000
Date: Thu, 21 Sep 2023 02:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	syzbot+0434ac83f907a1dbdd1e@syzkaller.appspotmail.com
Subject: Re: [PATCH] Input: powermate - fix use-after-free in
 powermate_config_complete
Message-ID: <202309210232.d7MpKEIm-lkp@intel.com>
References: <20230916-topic-powermate_use_after_free-v1-1-2ffa46652869@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916-topic-powermate_use_after_free-v1-1-2ffa46652869@gmail.com>

Hi Javier,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0bb80ecc33a8fb5a682236443c1e740d5c917d1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Carrasco/Input-powermate-fix-use-after-free-in-powermate_config_complete/20230917-052943
base:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
patch link:    https://lore.kernel.org/r/20230916-topic-powermate_use_after_free-v1-1-2ffa46652869%40gmail.com
patch subject: [PATCH] Input: powermate - fix use-after-free in powermate_config_complete
config: powerpc-ppc6xx_defconfig (https://download.01.org/0day-ci/archive/20230921/202309210232.d7MpKEIm-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210232.d7MpKEIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210232.d7MpKEIm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/input/misc/powermate.c: In function 'powermate_config_complete':
>> drivers/input/misc/powermate.c:201:21: error: 'status' undeclared (first use in this function); did you mean 'kstatfs'?
     201 |                 if (status == -ENOENT || status == -ESHUTDOWN)
         |                     ^~~~~~
         |                     kstatfs
   drivers/input/misc/powermate.c:201:21: note: each undeclared identifier is reported only once for each function it appears in


vim +201 drivers/input/misc/powermate.c

   192	
   193	/* Called when our asynchronous control message completes. We may need to issue another immediately */
   194	static void powermate_config_complete(struct urb *urb)
   195	{
   196		struct powermate_device *pm = urb->context;
   197		unsigned long flags;
   198	
   199		if (urb->status) {
   200			printk(KERN_ERR "powermate: config urb returned %d\n", urb->status);
 > 201			if (status == -ENOENT || status == -ESHUTDOWN)
   202				return;
   203		}
   204	
   205		spin_lock_irqsave(&pm->lock, flags);
   206		powermate_sync_state(pm);
   207		spin_unlock_irqrestore(&pm->lock, flags);
   208	}
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
