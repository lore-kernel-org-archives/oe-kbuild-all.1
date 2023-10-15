Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5987315D4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 02:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnfUoSNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697338344; x=1728874344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=emewBMpd6QyVC+XzyBHjt6awCou+wcsoHF6wO5Vo1Vk=;
  b=ZnfUoSNCvKX586IzcSDkDOL3+q7UtMBUZ69/AJIQUX82AdydOfyyNHHU
   S1SacI+xQa7KF+iUc+HS+f0i5hzO8YUZ92900CHxXT2Ie9jkQdws1iZdc
   5LmUD0r7CVoriJ7diTh6D508sEiSPl37FMHqOy3ABw7RQFzP7/u+j9Duu
   k3Z5YBht1Ts+5zRW6//8U+T6jhD46njC03AGpefoj6L2fH+XdC0qOlhZA
   gqdYBtTZ5AWW9lrtWLa6eUaX/eAjvcW4/1UsLH5k+wS4cvuNjzCG2m2IA
   Lq314+T3urMRYw/X0pkJzPnAH6+sZA9WpdQYz55d/szpvp87aXAXGpF4O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389220929"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="389220929"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 19:52:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="705144331"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="705144331"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Oct 2023 19:52:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrrEn-0006x5-0s;
	Sun, 15 Oct 2023 02:52:17 +0000
Date: Sun, 15 Oct 2023 10:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:backing_file 14/22] checkpatch: ERROR: Macros with complex
 values should be enclosed in parentheses
Message-ID: <202310151000.j6hCcwxK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux backing_file
head:   3f6f4728c87b06cbb4d7917bf25bcf95b3ee4973
commit: 8755e7e9df46c594c7ba5b5eae9e3f43a5c4eaae [14/22] ovl: Support escaped overlay.* xattrs
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310151000.j6hCcwxK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151000.j6hCcwxK-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#46: FILE: fs/overlayfs/overlayfs.h:37:
+#define OVL_XATTR_ESCAPE_TRUSTED_PREFIX OVL_XATTR_TRUSTED_PREFIX OVL_XATTR_ESCAPE_PREFIX

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#48: FILE: fs/overlayfs/overlayfs.h:39:
+#define OVL_XATTR_ESCAPE_USER_PREFIX OVL_XATTR_USER_PREFIX OVL_XATTR_ESCAPE_PREFIX

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
