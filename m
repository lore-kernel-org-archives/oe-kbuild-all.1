Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EC217751
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 18:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693332050; x=1724868050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Li1t9Xs9+ZlNzSrfJujiGlWo959VLxYmazSAAODNF44=;
  b=YwjlRUjJsWtnbT5HwC2tBjOAnr7ndsMsOS9cnWio54CPIDFs9rNRwpyn
   HZfoCF+d6ktYGdkVXT9gzA+oc7lGQdQ/b7SgUmwizO5vKTEZeFMgIhZjl
   wz5hM/O1cex4Se83ctF1u2qf96PKoQ7zG+nOYliMJiUoh3BHgcLBgnjKc
   dvmy8iTO9W84ORrG+9rMXa5TlOXF1x7nPJgAUyP9wHVY0UWvaYUlM4dQ5
   2Etqf9Z0ANu56wIYNoW6C1lZoctRf7UlRhXkMu1+D6dp8PE9DH9echGgZ
   k2RDhnNTn+sjKkXo4GfHDLOS0yAUH8sCma4Cgs9B4p3RVAB4GMzy+RVbu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="461819604"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="461819604"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 11:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="853381425"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="853381425"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2023 11:00:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb31C-0008yp-1F;
	Tue, 29 Aug 2023 18:00:46 +0000
Date: Wed, 30 Aug 2023 02:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, william.gray@linaro.org,
	lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, alexandre.torgue@foss.st.com,
	fabrice.gasnier@foss.st.com, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] counter: stm32-timer-cnt: add support for events
Message-ID: <202308300133.jtLeSGia-lkp@intel.com>
References: <20230829134029.2402868-9-fabrice.gasnier@foss.st.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829134029.2402868-9-fabrice.gasnier@foss.st.com>

Hi Fabrice,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5 next-20230829]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabrice-Gasnier/counter-chrdev-fix-getting-array-extensions/20230829-230111
base:   linus/master
patch link:    https://lore.kernel.org/r/20230829134029.2402868-9-fabrice.gasnier%40foss.st.com
patch subject: [PATCH 8/8] counter: stm32-timer-cnt: add support for events
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230830/202308300133.jtLeSGia-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300133.jtLeSGia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300133.jtLeSGia-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/counter/stm32-timer-cnt.c: In function 'stm32_count_watch_validate':
>> drivers/counter/stm32-timer-cnt.c:524:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     524 |                 if (watch->channel >= priv->nchannels) {
         |                    ^
   drivers/counter/stm32-timer-cnt.c:528:9: note: here
     528 |         case COUNTER_EVENT_OVERFLOW_UNDERFLOW:
         |         ^~~~


vim +524 drivers/counter/stm32-timer-cnt.c

   516	
   517	static int stm32_count_watch_validate(struct counter_device *counter,
   518					      const struct counter_watch *watch)
   519	{
   520		struct stm32_timer_cnt *const priv = counter_priv(counter);
   521	
   522		switch (watch->event) {
   523		case COUNTER_EVENT_CAPTURE:
 > 524			if (watch->channel >= priv->nchannels) {
   525				dev_err(counter->parent, "Invalid channel %d\n", watch->channel);
   526				return -EINVAL;
   527			}
   528		case COUNTER_EVENT_OVERFLOW_UNDERFLOW:
   529			return 0;
   530		default:
   531			return -EINVAL;
   532		}
   533	}
   534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
