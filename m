Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053CB14F9F8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455476; cv=none; b=qgxKi91uNcUlf0AsyueCddupgJfB+a7mQ4+tnn61SEQdgYMBMrRlphzJmRjZTLrKQctfZMY0nMr8ZXxYAJ0NC+WZxhAKK6n/l6AVrE4vSdSz/OsnkgTAG5G+XYCoAi4sUaiCsTiltE2pxxr5Zmhr0BLtJ312xSA98h7yj+RiqWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455476; c=relaxed/simple;
	bh=rX5ZpiM11BccfJqAINHjjaW8PfgIZ9CIgfmRX2P9VQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K8tm99DOQLkt1s+9T56hEl0T+3/Ue8P3ZCO77rMyuKUMzapacslwyZF+pjZ80D1Lf0dBXiq/vV/MuJcZ2h2zJooaoKtOYOUZ/9z5/ZjfmEWax3N9Rul+dv5TBEBdKc9GA+74EjsfSs6JaQDkk5igtX1WKxHBgd/WNGOpiZSNJI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJzw+UUd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJzw+UUd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730455473; x=1761991473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rX5ZpiM11BccfJqAINHjjaW8PfgIZ9CIgfmRX2P9VQg=;
  b=kJzw+UUdQ5hyDa8K/asUldmn8loOvr69r7DYw8oJP5+e98pAEPcC21TK
   mpBnfUO/3vpRB0t8l/QyaXD6mstRiXn6GouQBRFebFT7y3l2fdVavL5QH
   rD53U+UTvNJZAxjbGgQhvsmJTWgcVPp0rBPWHnQ5cPOIIUvdMPEXB/1gy
   v3QZ33T+6glnv5NC9Z+jyMYi6334ASXcQ8yZL3SketG9vf8I8L1JUxj8b
   tYP5KJiLKJUMq/q0aCm0LN0kzRzoRNIqLhcveNZyEY1reZTy6oeG42gxz
   Ez6RACJXA/f5TnAC8wY1TcFU1AikRn6S2DtDSpStFt+IdRdU6RLmaLw+q
   A==;
X-CSE-ConnectionGUID: fGO+s9PXT/+R7K7DfL4Mxg==
X-CSE-MsgGUID: m4ZHaE6ySX2kHtfaa840tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="34018954"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="34018954"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:04:32 -0700
X-CSE-ConnectionGUID: CM8vLYyJSCiqFx1WWtveUg==
X-CSE-MsgGUID: 8vBRDWz2SB2W4+0EJ5146g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="82835201"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Nov 2024 03:04:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6oW5-000hOH-0j;
	Fri, 01 Nov 2024 10:04:29 +0000
Date: Fri, 1 Nov 2024 18:04:08 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [linux-next:master 8660/8858] security/smack/smack_lsm.c:4861:
 warning: Function parameter or struct member 'cp' not described in
 'smack_lsmprop_to_secctx'
Message-ID: <202411011723.I59qZ7Ke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c88416ba074a8913cf6d61b789dd834bbca6681c
commit: 95a3c11eb6709db6a0e06ef17bfbcc32c7cc7b27 [8660/8858] lsm: replace context+len with lsm_context
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241101/202411011723.I59qZ7Ke-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011723.I59qZ7Ke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011723.I59qZ7Ke-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/smack/smack_lsm.c:4861: warning: Function parameter or struct member 'cp' not described in 'smack_lsmprop_to_secctx'
>> security/smack/smack_lsm.c:4861: warning: Excess function parameter 'secdata' description in 'smack_lsmprop_to_secctx'
>> security/smack/smack_lsm.c:4861: warning: Excess function parameter 'seclen' description in 'smack_lsmprop_to_secctx'


vim +4861 security/smack/smack_lsm.c

e114e473771c84 Casey Schaufler 2008-02-04  4850  
6f2f724f0e116d Casey Schaufler 2024-10-09  4851  /**
6f2f724f0e116d Casey Schaufler 2024-10-09  4852   * smack_lsmprop_to_secctx - return the smack label
6f2f724f0e116d Casey Schaufler 2024-10-09  4853   * @prop: includes incoming Smack data
6f2f724f0e116d Casey Schaufler 2024-10-09  4854   * @secdata: destination
6f2f724f0e116d Casey Schaufler 2024-10-09  4855   * @seclen: how long it is
6f2f724f0e116d Casey Schaufler 2024-10-09  4856   *
6f2f724f0e116d Casey Schaufler 2024-10-09  4857   * Exists for audit code.
6f2f724f0e116d Casey Schaufler 2024-10-09  4858   */
95a3c11eb6709d Casey Schaufler 2024-10-23  4859  static int smack_lsmprop_to_secctx(struct lsm_prop *prop,
95a3c11eb6709d Casey Schaufler 2024-10-23  4860  				   struct lsm_context *cp)
6f2f724f0e116d Casey Schaufler 2024-10-09 @4861  {
95a3c11eb6709d Casey Schaufler 2024-10-23  4862  	return smack_to_secctx(prop->smack.skp, cp);
6f2f724f0e116d Casey Schaufler 2024-10-09  4863  }
6f2f724f0e116d Casey Schaufler 2024-10-09  4864  

:::::: The code at line 4861 was first introduced by commit
:::::: 6f2f724f0e116d9ea960ff3dd645add12e60e176 lsm: add lsmprop_to_secctx hook

:::::: TO: Casey Schaufler <casey@schaufler-ca.com>
:::::: CC: Paul Moore <paul@paul-moore.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
