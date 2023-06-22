Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B213E3AA87
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 23:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687474970; x=1719010970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8U5cBONn6u8gXOL05XPk0eFpQuEKu1bh0NYku+xYU20=;
  b=R0mCtXrNXQcbjwzW8eD7r2q8/+qXx6ZMngydncbYKrYqi4OpTF6noc/A
   EioNfjnTEMHGMVtCwo/7c+5S+REV12sf03lpoCC/dmbPEHwZe7P8IuYI6
   aD8tToFxhohzP9MOYLWBfc5RqbRY2CFMh3JMSPlL9faDPZ9QGW/D2UHCh
   OP6inZP82rEncxAPrrahklbq7O0YW4nT44j8PlugTkrE8ObnoztYBazRO
   t/fNBRpXlBuHOHwiYiKBT6ddT4FmMgdw1gW+lBk0qPo6LSMLlD8CDWMVc
   rAS0Dlb0vDCxzoEscJb9hdaP7gm/TQHmJZ1wHU71uaSytvanWK9A9tgPW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="350397741"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="350397741"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 16:02:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="804991316"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="804991316"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jun 2023 16:02:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCTKB-0007nr-1Z;
	Thu, 22 Jun 2023 23:02:47 +0000
Date: Fri, 23 Jun 2023 07:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyn-drm-trc-10 26/26] drivers/gpu/drm/drm_print.c:80:37:
 warning: '__drm_debug_trace' initialized and declared 'extern'
Message-ID: <202306230610.UX4PHOMk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyn-drm-trc-10
head:   cb8e93d85f4cee9f39004f067efad7856e051019
commit: cb8e93d85f4cee9f39004f067efad7856e051019 [26/26] add debug_trace knob to drm
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230623/202306230610.UX4PHOMk-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230610.UX4PHOMk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230610.UX4PHOMk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/mips/include/asm/bug.h:42,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:11,
                    from drivers/gpu/drm/drm_print.c:28:
   drivers/gpu/drm/drm_print.c:75:31: warning: '__drm_debug' initialized and declared 'extern'
      75 | DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
         |                               ^~~~~~~~~~~
   include/linux/dynamic_debug.h:184:30: note: in definition of macro 'DYNDBG_CLASSMAP_PARAM_REF'
     184 |         extern unsigned long _bits = DYNDBG_CLASSMAP_PARAM_DEFAULT;     \
         |                              ^~~~~
   drivers/gpu/drm/drm_print.c:75:1: note: in expansion of macro 'DRM_CLASSMAP_PARAM_REF'
      75 | DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_print.c:80:37: warning: '__drm_debug_trace' initialized and declared 'extern'
      80 | DRM_CLASSMAP_PARAM_REF(debug_trace, __drm_debug_trace, drm_debug_classes, T);
         |                                     ^~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:184:30: note: in definition of macro 'DYNDBG_CLASSMAP_PARAM_REF'
     184 |         extern unsigned long _bits = DYNDBG_CLASSMAP_PARAM_DEFAULT;     \
         |                              ^~~~~
   drivers/gpu/drm/drm_print.c:80:1: note: in expansion of macro 'DRM_CLASSMAP_PARAM_REF'
      80 | DRM_CLASSMAP_PARAM_REF(debug_trace, __drm_debug_trace, drm_debug_classes, T);
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +80 drivers/gpu/drm/drm_print.c

    79	
  > 80	DRM_CLASSMAP_PARAM_REF(debug_trace, __drm_debug_trace, drm_debug_classes, T);
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
