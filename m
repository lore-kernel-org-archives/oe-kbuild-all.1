Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9547126E2B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZDMqfaR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697458005; x=1728994005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iaLw9V/paC39BFzC/jXtmVjtd8SsAHo5jtVunSFthbw=;
  b=DZDMqfaRFpOS+VoOFQQiZgOvN7fMlFBtcSVVqY8RDZTBUU9Cqt4deTtT
   lCSOwVwkzVpycXO3Fdq3iU3QbwWE2ZRD4VA3OAKxY34xJnEC7FrLrhX4s
   ZFsLgk/smMjTjhq+Jwra+uKgJ/DR9WQJndO15N6+SfNloMOv2xqpskBBa
   ughc29/v/C0MijqBQsecvqxzFS+2yo1bB2P3KX3THej1XWpsSKOzt4JO/
   8JtpPVZOv197SuxG8Vtn2LHzg1la3vkD/hPuqRSz+08baqvr0P1Kk7vCI
   3kQuyvm7dr1TDB0nzPhxGwj/aCIgS/b9tpDMaNT5XdhzXdxtPf9mjCfGQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416579906"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="416579906"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 05:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="3516375"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Oct 2023 05:05:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsMMd-0008ML-39;
	Mon, 16 Oct 2023 12:06:27 +0000
Date: Mon, 16 Oct 2023 20:06:06 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:backing_file 14/21] checkpatch: ERROR: Macros with complex
 values should be enclosed in parentheses
Message-ID: <202310161909.hZLHvNaT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux backing_file
head:   d25adf128a9821b19c3ee85d5a812cba70beed1c
commit: a3ba0ba4040c5dec310c22b384005f08600364db [14/21] ovl: Support escaped overlay.* xattrs
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310161909.hZLHvNaT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161909.hZLHvNaT-lkp@intel.com/

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
