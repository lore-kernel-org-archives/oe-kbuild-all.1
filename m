Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C5663AB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MEvr2pXN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703665667; x=1735201667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uE3s1NgT+5tnRbGK0EF6QFU0nmVFtQpf+ojVJtOhkfY=;
  b=MEvr2pXN4Rwf+jLxcDSv7QL9udAiRnB+aljvSFQ3YCtxoKIQ2DUL+Fw7
   5tZKHYPbgE5Rg2M3Qb4r2Shnfemg8to2ZeUc9btid3gGFsyosIc+vKTuj
   gHSSRvJykk5eqLj2+1EXUmvM8MzJpQy+fMIWUnzowo0Y7beQaEs8DCIMV
   9OAXgHD4SZ20eNeuTlcUu1W43JsHSTDK8+evJsIBhMUJ23EztRRwJwOo3
   nxWU4Pn5R6l+DJrnZZoMB/9yAy06hHhgQ+eYUM0NlbVjbvlaJFOwngZ85
   3yeAohA/RPsFWI/dXMAj+REQ9r3BYxyY0CHOObTAv1lazNhc59ySjmUVe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="17987836"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="17987836"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 00:26:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="20231848"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Dec 2023 00:26:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIPF7-000FE5-2m;
	Wed, 27 Dec 2023 08:26:21 +0000
Date: Wed, 27 Dec 2023 16:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v3.0 20/24] lib/dynamic_debug.c:621:7: warning: no
 previous prototype for function 'skip_spaces_and_coma'
Message-ID: <202312271606.qFySoNyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v3.0
head:   1f42080421213a7819e069d5b6d22cef0b6c9c61
commit: 34cd8a2374f70a56e599ee3e5d786c989d3cb096 [20/24] dyndbg: add skip_spaces_and_coma()
config: arm-randconfig-002-20231227 (https://download.01.org/0day-ci/archive/20231227/202312271606.qFySoNyo-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231227/202312271606.qFySoNyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312271606.qFySoNyo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:621:7: warning: no previous prototype for function 'skip_spaces_and_coma' [-Wmissing-prototypes]
     621 | char *skip_spaces_and_coma(const char *str)
         |       ^
   lib/dynamic_debug.c:621:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     621 | char *skip_spaces_and_coma(const char *str)
         | ^
         | static 
   1 warning generated.


vim +/skip_spaces_and_coma +621 lib/dynamic_debug.c

   620	
 > 621	char *skip_spaces_and_coma(const char *str)
   622	{
   623		str = skip_spaces(str);
   624		if (*str == ',')
   625			str = skip_spaces(++str);
   626		return (char *)str;
   627	}
   628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
