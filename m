Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E069D358A4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 19:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXE+EoNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699558284; x=1731094284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sMKI1TaxNv5r1Gdm7RjDgnsaoNMSP67YWeMg2QqShLk=;
  b=BXE+EoNeNK2rv4ZdcQ1Zs+AlDawHzc+OjeDExWU6FvZTgAToWSCsY73g
   A5zY4/urVlgBnGmWbyuOmP8MkUExF/Et6HO3bYPyxtAKayhe10gC2+r9z
   3gjx3adj+Q499RYBEdJWH9HfShl7g7+SNa2bOKDQjgoAWkICSEWi2G56/
   lEb1uDRHQCOxi2BmNiutbtCWUy54ON6Fffa8MPeM8+/bM5GKkhbXAPOe+
   Ge2aOAWGFJOZXH3fI9kSpkWY0WJXFlNyqGlaMt32qEecVFpkqh7uvVnzx
   Lawx+Y52XRupu5Ek3PYTT733v3WdinP07D+mbtunt10nIMsab1qDrzfrb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389865495"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="389865495"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 11:31:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="763522259"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="763522259"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Nov 2023 11:31:21 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1AkJ-00095U-1T;
	Thu, 09 Nov 2023 19:31:19 +0000
Date: Fri, 10 Nov 2023 03:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>,
	Kees Cook <keescook@chromium.org>, Serge Hallyn <serge@hallyn.com>,
	Mickael Salaun <mic@digikod.net>,
	John Johansen <john.johansen@canonical.com>
Subject: [robertosassu:dev-staging 1/18] security/selinux/hooks.c:6954:21:
 sparse: sparse: symbol 'selinux_lsmid' was not declared. Should it be
 static?
Message-ID: <202311100355.eeC5cmYC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux dev-staging
head:   ba7ce019d3e965aeb0d76d19d3f038b350b28bb2
commit: f347278284b81a0c1b1f46a0cbf1fe6a32493635 [1/18] LSM: Identify modules by more than name
config: x86_64-randconfig-123-20231109 (https://download.01.org/0day-ci/archive/20231110/202311100355.eeC5cmYC-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100355.eeC5cmYC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100355.eeC5cmYC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   security/selinux/hooks.c:5389:22: sparse: sparse: restricted __be16 degrades to integer
   security/selinux/hooks.c:5390:22: sparse: sparse: restricted __be16 degrades to integer
>> security/selinux/hooks.c:6954:21: sparse: sparse: symbol 'selinux_lsmid' was not declared. Should it be static?

vim +/selinux_lsmid +6954 security/selinux/hooks.c

  6953	
> 6954	const struct lsm_id selinux_lsmid = {
  6955		.name = "selinux",
  6956		.id = LSM_ID_SELINUX,
  6957	};
  6958	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
