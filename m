Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9911B1376
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 00:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687911929; x=1719447929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oCosZ2p/dT+fVnjDuxBm1A/tNcqiCEKe1PdaI7JVqDk=;
  b=YoPpmnIgk/xrbb4nSQAxJQV66jsa3Rvf8FxAQ6MCyljru56TSdPEvwF+
   dIOTuEhIYTb/1AGEwE5j1tqjrD5WSK6Evf3B1aM+/6nXzba0XRmderxpj
   LG7pXkxGV16egjpUZD2mddY55I6WsRZKa7JEfSi5U6XRva7Xe4WczGpus
   9ACegzuYlMnAzVeeJRnT9+WkjzeoF/z6v5Y/M2X6n4Bw6tnvx74i3omCs
   Y7KQSuJOAJFTde0bhgywIYjricdtiKHvdxnzMd39+mLnk1ISI2XrAU/nL
   mUAau7z/xQdAcFXJBp5tbIPWl0yq4+XvRyZ8gV7/aesME3ZB2MxTqv0ft
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="360569608"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="360569608"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 17:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="720021317"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="720021317"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Jun 2023 17:25:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEIzv-000CNR-04;
	Wed, 28 Jun 2023 00:25:27 +0000
Date: Wed, 28 Jun 2023 08:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyn-drm-trc-10 30/30] drivers/gpu/drm/drm_print.c:80:24:
 warning: 'debug_trace' defined but not used
Message-ID: <202306280851.vZLq9VpF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyn-drm-trc-10
head:   e7afba1683e5b4e8c906a446dffacf4b972b93e7
commit: e7afba1683e5b4e8c906a446dffacf4b972b93e7 [30/30] add debug_trace knob to drm
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230628/202306280851.vZLq9VpF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306280851.vZLq9VpF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306280851.vZLq9VpF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:11,
                    from drivers/gpu/drm/drm_print.c:28:
>> drivers/gpu/drm/drm_print.c:80:24: warning: 'debug_trace' defined but not used [-Wunused-variable]
      80 | DRM_CLASSMAP_PARAM_REF(debug_trace, __drm_debug_trace, drm_debug_classes, T);
         |                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:185:30: note: in definition of macro 'DYNDBG_CLASSMAP_PARAM_REF'
     185 |         static unsigned long _name = (unsigned long)&_bits;             \
         |                              ^~~~~
   drivers/gpu/drm/drm_print.c:80:1: note: in expansion of macro 'DRM_CLASSMAP_PARAM_REF'
      80 | DRM_CLASSMAP_PARAM_REF(debug_trace, __drm_debug_trace, drm_debug_classes, T);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_print.c:75:24: warning: 'debug' defined but not used [-Wunused-variable]
      75 | DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
         |                        ^~~~~
   include/linux/dynamic_debug.h:185:30: note: in definition of macro 'DYNDBG_CLASSMAP_PARAM_REF'
     185 |         static unsigned long _name = (unsigned long)&_bits;             \
         |                              ^~~~~
   drivers/gpu/drm/drm_print.c:75:1: note: in expansion of macro 'DRM_CLASSMAP_PARAM_REF'
      75 | DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +/debug_trace +80 drivers/gpu/drm/drm_print.c

    79	
  > 80	DRM_CLASSMAP_PARAM_REF(debug_trace, __drm_debug_trace, drm_debug_classes, T);
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
