Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4293432274C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 11:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758627672; cv=none; b=JCPBwvE3vGm0jfI+JejzowFNfWUBltWfteM3XGfBl9m00jHLsTNBeQKM/evONp+jH69D9xsJet9DsnV+kChjkoBYWfrTiopj5yjgfTh0S/NOJSn2nfO2kpMlxgzTVgx7Jpb8E+U9RubZ36stJrgCV3O03JaIA9nXtfgFMKvfU3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758627672; c=relaxed/simple;
	bh=jMMpEa7yqb0yz3MRY9LllUZfLO9SOGpRE3frEQeI0Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UKz/ciIJsIt9e54kziUTH0TQCAbRON0PnNXbKqHldrZYD3NVzvPsu4jBoGuyzi0QK6xkbyXEU48YrsGSq9ktT3/dq6HGZ1oyiiLt0eMd7k0JVLiW7BsI3N2EzY5aNWjjLuxAXq3/tcMWdZAAXQSPVXw0W2xYtcaZHCXGzrparZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OF+LfaxV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OF+LfaxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758627670; x=1790163670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMMpEa7yqb0yz3MRY9LllUZfLO9SOGpRE3frEQeI0Ws=;
  b=OF+LfaxVAkKGvlhY5QZIsS2Bmc/Jh3R3tVJo4N356UTdYDV4nmRfp9Ns
   Ehxg0zAzafZkaVOZebIGQreO+9qpwE5e+U4/eETKpZhunNwJhH9TDJJd+
   e5IsdR5t9ouDg/0yqybHsQvHRe1LkKgQAKLyLifQMl1O8ai+ViCByCnxL
   48xBMiAhhm/PS/fUJ44w0vK5uT3f4J8fYFmgH8ZFgNuMQD7RhcGCYtUla
   I9hm10wVZVeWnPSpPW2nVPJUhRLa49xOs/9ZZ7HkraVmW8hVO1MKpxD+v
   u3WsIeQd4TbeGlSVw7c+oh52HoUwq9firq6yizgF+cDP87DJGKzDR48fm
   A==;
X-CSE-ConnectionGUID: jrh34nI/S/q2bupqqDEUeA==
X-CSE-MsgGUID: SGc1LIlTTpS1V/ddD/A82A==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60604012"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="60604012"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:41:09 -0700
X-CSE-ConnectionGUID: WQn7umHUTNajLKCrx5isTA==
X-CSE-MsgGUID: Ypsced1XT4225SvsUy1blw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="181040834"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2025 04:41:08 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v11OL-0000000049Z-3yVb;
	Tue, 23 Sep 2025 11:41:05 +0000
Date: Tue, 23 Sep 2025 13:40:33 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/146] htmldocs:
 Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst:92: ERROR: Unexpected
 indentation. [docutils]
Message-ID: <202509231318.LGV25gvA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c73db7ebb024f59416db0cf136dc2d4b9dbc3695
commit: 53fbcd216be5d41a00acbcfde4378f5258c752ee [0/146] Documentation/hw-vuln: Add documentation for Cross-Thread Return Predictions
reproduce: (https://download.01.org/0day-ci/archive/20250923/202509231318.LGV25gvA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231318.LGV25gvA-lkp@intel.com/

All errors (new ones prefixed by >>):

   Documentation/ABI/testing/sysfs-devices-removable:2: ERROR: Unexpected indentation. [docutils]
   Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-platform-intel-pmc:2: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/bootconfig.h' failed with return code 1
   Documentation/admin-guide/device-mapper/writecache.rst:23: ERROR: Unexpected indentation. [docutils]
>> Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst:92: ERROR: Unexpected indentation. [docutils]
   Documentation/admin-guide/media/ipu3.rst:590: WARNING: Footnote [#] is not referenced. [ref.footnote]
   Documentation/admin-guide/media/ipu3.rst:596: WARNING: Footnote [#] is not referenced. [ref.footnote]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/pstore_zone.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/pstore_blk.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/rio_drv.h' failed with return code 2


vim +92 Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst

    89	
    90	The mitigation for the KVM_CAP_X86_DISABLE_EXITS capability can be turned on
    91	using the boolean module parameter mitigate_smt_rsb, e.g.:
  > 92	        kvm.mitigate_smt_rsb=1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
