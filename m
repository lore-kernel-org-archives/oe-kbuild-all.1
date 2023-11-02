Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C7C21352
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 21:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/vpB+nz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698959669; x=1730495669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pbQZSDNEeQaJMdSI2/QQXRsYTC9yM7K/wGrQJ3tLpzk=;
  b=O/vpB+nzgR+KX59qqsqd8N9Hk+Qk3whQ16EmmqL8WzdCre+4Vj3C1ewU
   BhZn7HBZXyz5LUNyA7VBlTnSnGJlIq+eI+qEPr31fEvzi19+NsIlToOQG
   sqUkdd6oBKBVCzHcZXyv/d3BQUEYR4jHULCOc0hPY9/nEhknnLyE6pbkB
   gEkVfFt+mfJeJ6nuS03l33m2Q8eu/O64jodh48o3wVWAdlDT4AY0c/fwa
   DxV5JxuhADof2L8BaHoy+OAOfN6H44ktJsj1n7G1C3N0Wk9nMKr1h5bn2
   yGBPem9tmdYS9L8P0W8D4jybzn1J81odRt5AFZalUvLdKWPcHFzE+oScp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="385996238"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="385996238"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 14:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="2582836"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Nov 2023 14:14:26 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyf1D-0001rg-2Z;
	Thu, 02 Nov 2023 21:14:23 +0000
Date: Fri, 3 Nov 2023 05:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>,
	Kees Cook <keescook@chromium.org>, Serge Hallyn <serge@hallyn.com>,
	Mickael Salaun <mic@digikod.net>,
	John Johansen <john.johansen@canonical.com>
Subject: [pcmoore-lsm:dev-staging 1/16] security/apparmor/lsm.c:1219:21:
 sparse: sparse: symbol 'apparmor_lsmid' was not declared. Should it be
 static?
Message-ID: <202311030525.TxcqNPhs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git dev-staging
head:   bb92b5b887051b8448e0a06d39b9c89d42e347f8
commit: 08a8af0d456ecddadee1071cb614f3b7873e808e [1/16] LSM: Identify modules by more than name
config: x86_64-randconfig-121-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030525.TxcqNPhs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030525.TxcqNPhs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030525.TxcqNPhs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/apparmor/lsm.c:1219:21: sparse: sparse: symbol 'apparmor_lsmid' was not declared. Should it be static?
--
>> security/loadpin/loadpin.c:212:21: sparse: sparse: symbol 'loadpin_lsmid' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
