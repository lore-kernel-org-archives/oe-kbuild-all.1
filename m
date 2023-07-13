Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ECE20F8A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 21:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689284244; x=1720820244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pNgmBHPnbs9D6MT0FLSZxfZg2vozvIXRglB42j8IaD4=;
  b=jTcAv9BRhY39Y+gF4DGvgS+A3CvxlqTxk0ZsI9ULMygSYazPSr6mXqfB
   Y+lQohwJl4FrEldzrEgty7wVCrA+4niBa9V+kCbX8Kyx1f200oMjJW/Ki
   b5dejmva9H7Li9DHlG6BDPUbDv5RCqo4SRHX0t2v8eCR2SSJdO04GxUIR
   HACSPlT5+nMz2gswTLb7/IgEu1kB3WZQK8O3992Bc05ch6LU9z5ayLpR4
   BzdV9Huo1RB6YyCLfRpM6gGO9JMFBvs7lqp8VhNkEHcRC8FP4pB/0IIlP
   NGUjei8beHJj/S+DiGQ/iwZ5M0xODubq5VJHB8OcdvwVZ7iIZoj0F+OMO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="396129898"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="396129898"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 14:37:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="835765473"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="835765473"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Jul 2023 14:37:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK3zp-0006ux-1F;
	Thu, 13 Jul 2023 21:37:09 +0000
Date: Fri, 14 Jul 2023 05:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyn-drm-trc-10 36/36] lib/dynamic_debug.c:807:7: warning: no
 previous prototype for 'dynamic_emit_prefix'
Message-ID: <202307140501.MyadgRks-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyn-drm-trc-10
head:   0ac81485512308a83a792852b7b037c05108cc67
commit: 0ac81485512308a83a792852b7b037c05108cc67 [36/36] export-emit-prefix
config: sparc-randconfig-r024-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140501.MyadgRks-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140501.MyadgRks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140501.MyadgRks-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:807:7: warning: no previous prototype for 'dynamic_emit_prefix' [-Wmissing-prototypes]
     807 | char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
         |       ^~~~~~~~~~~~~~~~~~~


vim +/dynamic_emit_prefix +807 lib/dynamic_debug.c

   806	
 > 807	char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
   808	{
   809		if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_ANY))
   810			return __dynamic_emit_prefix(desc, buf);
   811		return buf;
   812	}
   813	EXPORT_SYMBOL(dynamic_emit_prefix);
   814	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
