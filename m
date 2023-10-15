Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D12EEA1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 23:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkOJBZWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697412893; x=1728948893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WHSCs0WEqWWspxnCeD8mWuWawzhOrqifG/pH/BGgf6w=;
  b=BkOJBZWaDFDFZuY3OWGGESVZwjHA2DAmu0aMcu5+5E6TB96Rxk/sC4r6
   08NHSt//Otpl7/VnXYKmJU/urvKUErq+2/9qBU2P3qSjFZNIvHtkOOleY
   c2Uy9GzXPZXJCcf6qLGAm2/HJBC81TmJBsYXFyO5A5wWBrqQE7wk5lL8I
   +vi5y3T8WkJ+2X6HSJTCHjUjJcOUlnsuK/y0tdHr2rHmYl3xI0E20n3dy
   2OC0ihsRN2FgYcRFNyaf3aQohvMher3L6WQoBGlS8Uei19pBNAaFHx33G
   vozT7qKET09Gr7EmnPvxLvIlsXSuf205N84lXpEiv47rzAIsIPmxX1yDN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364783079"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="364783079"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 16:34:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1086876201"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="1086876201"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Oct 2023 16:34:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsAdD-0007vP-1N;
	Sun, 15 Oct 2023 23:34:48 +0000
Date: Mon, 16 Oct 2023 07:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-3b 26/34] checkpatch: ERROR: Macros with complex
 values should be enclosed in parentheses
Message-ID: <202310160740.7HweUh59-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-3b
head:   5abd981a4880b734bd589e9d30373f917a5abc89
commit: 330b2c57d71fbc308c326692c284d92dff8fac98 [26/34] dyndbg: split __dyndbg_sites section out from __dyndbg
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160740.7HweUh59-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160740.7HweUh59-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#151: FILE: lib/dynamic_debug.c:193:
+#define desc_modname(d)		(d)->site->_modname

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#152: FILE: lib/dynamic_debug.c:194:
+#define desc_filename(d)	(d)->site->_filename

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#153: FILE: lib/dynamic_debug.c:195:
+#define desc_function(d)	(d)->site->_function

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
