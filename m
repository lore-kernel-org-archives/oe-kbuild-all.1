Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D38C4C7B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jan 2024 02:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDoeM0UT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704422159; x=1735958159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i7gagSoQ1uEbAhbyTorSSJTag0Kkj1uRjNiiCkg3HGo=;
  b=QDoeM0UTHdhPZi2JiYvyniiKW68E4BSDJx8doVRRrTAQ0OcFsJHBziXk
   lEXRJm/qN7cI1jUx6KU279f1MujYz1qmrfcx43NLNOEB6IxwR827DKpiZ
   iAwiFEtQETBXdcNaQyJqUj/mF3fQ+QV/U0css7EgrvAReQwCpXgMaMDVF
   KpViwKwyrBBvZrSMIj9CjaX5LSZhXMEHwKXrI6rQ8TaHZk6Tvg9XO2S8R
   8LoSXxeFirmr9KyQgClJyRVXp/47cUy9xE8XgaWS33hn/Xtqyups5cFbK
   gurlUMRtCpUUUWykHEMLlVFeIwBqSkKWlYbuyoAis5lVZjA6UfYDBWSsd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="394592247"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="394592247"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 18:35:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="924104951"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="924104951"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2024 18:35:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLa3u-0000gK-1u;
	Fri, 05 Jan 2024 02:35:54 +0000
Date: Fri, 5 Jan 2024 10:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v3.1 34/34] htmldocs:
 Documentation/admin-guide/dynamic-debug-howto.rst:263: WARNING: Unexpected
 indentation.
Message-ID: <202401051027.YWz1KDND-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v3.1
head:   6fac03425371bbd6c52668e35d5146f3e8964852
commit: 6fac03425371bbd6c52668e35d5146f3e8964852 [34/34] docs/dyndbg: explain the +T:named.flags in DRM terms - RFC
reproduce: (https://download.01.org/0day-ci/archive/20240105/202401051027.YWz1KDND-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401051027.YWz1KDND-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/dynamic-debug-howto.rst:263: WARNING: Unexpected indentation.
>> Documentation/admin-guide/dynamic-debug-howto.rst:265: WARNING: Block quote ends without a blank line; unexpected unindent.
>> Documentation/admin-guide/dynamic-debug-howto.rst:274: WARNING: Definition list ends without a blank line; unexpected unindent.

vim +263 Documentation/admin-guide/dynamic-debug-howto.rst

   259	
   260	   echo <<CMD_BLK > /proc/dynamic_debug/control
   261	    class DRM_UT_KMS +T:0		# user wants KMS in global
   262	    open drm_bulk			# misc bucket
 > 263	     class DRM_UT_CORE +T:drm_bulk	# assemble misc contents
   264	     class DRM_UT_DRIVER +T:drm_bulk
 > 265	    open drm_screens			# screen changes
   266	     class DRM_UT_LEASE +T:drm_screens	# assemble the contents
   267	     class DRM_UT_DP    +T:drm_screens
   268	     class DRM_UT_DRMRES +T:drm_screens
   269	     class DRM_UT_STATE  +T:drm_screens
   270	    open trash
   271	     class junk +T:trash
   272	    open drm_vblank			# isolate hi-rate
   273	     class DRM_UT_VBL   +T
 > 274	    open 0				# restore global default
   275	   CMD_BLK
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
