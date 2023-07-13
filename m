Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5454611E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 23:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689289215; x=1720825215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6zPm+Uc/Ey39C955sZd+Lg7Co3jKyMwSfpwPcacUWWE=;
  b=U3RRGw3K3KNRjNwuOzeXRNTCz4WEjbczmpTTC+VCj2YYneLuP1LhHdt2
   /SPU7set104j7M5HsUleGS8pzVDtXLyFkDKLj1Xz0yn9LSL5EIRZ/hgm8
   LnYQm4n5u1jULdp4+F1HGgaGeGdmzld8I/gHj6b2Otyqq81O2cbIPjk09
   jOa0s3hJhvyyGYojVDQT+9JOxP/5klpPhfzyaZo1I5RX6zXNTVBRBE2rB
   EdqF5wrzjfWCYxCqJSqAjzRwecXv8MHTmBljS4WPcSX36g8ANlsAC7Oqx
   M8YDXtKfNcIARIjRlxtoSmg+JFrcsPG5ECAstApWFVyeWE+VJiPKXpaC5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="362796791"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="362796791"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 16:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787640881"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="787640881"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Jul 2023 16:00:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK5IB-0006xv-0U;
	Thu, 13 Jul 2023 23:00:11 +0000
Date: Fri, 14 Jul 2023 06:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyn-drm-trc-10 36/36] lib/dynamic_debug.c:807:7: warning: no
 previous prototype for function 'dynamic_emit_prefix'
Message-ID: <202307140654.07vJchQs-lkp@intel.com>
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
config: i386-randconfig-i004-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140654.07vJchQs-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140654.07vJchQs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140654.07vJchQs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:807:7: warning: no previous prototype for function 'dynamic_emit_prefix' [-Wmissing-prototypes]
   char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
         ^
   lib/dynamic_debug.c:807:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
   ^
   static 
   1 warning generated.


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
