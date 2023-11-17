Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF9D3DB9C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 20:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHGMiJd4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700251348; x=1731787348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z0wr30eRrsY1dHVJibb0/t27Xj4QUVlgYD1R6Crmwlo=;
  b=QHGMiJd4qTV/HEx2oK15r46u0c15Bk36kTNWPSxFrcC17TtV8H3Z0NMk
   GuqFm6iVzl/IHAe4vGmTqh5hL+WEbHe6LNorQqn026GbEhw/c5F62phAU
   G0uKKSBEzPTEQdna4cijDJt5FIJLDPTk+tOHccbTDinY4Ozh6JXN8G4/9
   GbqKD9XdhwOmEKXaRvuLg+ggxJ1vtjd8B+/BeWudTKrk7W4wCnly2Q7Ym
   5d4+jSqvMX3KcC83OEJZ9ubI69yxnNtetdrtm3cbPWK8mqymk5KJUTzVM
   YJ5RzaJ4r+JuOwMnSzIz7GCle663cyGLdjL1CqJpAIdVXJOm/3GoS+jcJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="376407225"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="376407225"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 12:02:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="1013029748"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="1013029748"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Nov 2023 12:02:23 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r452j-000367-1k;
	Fri, 17 Nov 2023 20:02:21 +0000
Date: Sat, 18 Nov 2023 04:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>,
	Kees Cook <keescook@chromium.org>, Serge Hallyn <serge@hallyn.com>,
	Mickael Salaun <mic@digikod.net>,
	John Johansen <john.johansen@canonical.com>
Subject: [robertosassu:dev-staging 1/18] security/smack/smack_lsm.c:4937:21:
 sparse: sparse: symbol 'smack_lsmid' was not declared. Should it be static?
Message-ID: <202311180302.MSKLHPBi-lkp@intel.com>
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
config: parisc-randconfig-r133-20231117 (https://download.01.org/0day-ci/archive/20231118/202311180302.MSKLHPBi-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231118/202311180302.MSKLHPBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180302.MSKLHPBi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   security/smack/smack_lsm.c:1910:61: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cred const *cred @@     got struct cred const [noderef] __rcu *cred @@
   security/smack/smack_lsm.c:1910:61: sparse:     expected struct cred const *cred
   security/smack/smack_lsm.c:1910:61: sparse:     got struct cred const [noderef] __rcu *cred
>> security/smack/smack_lsm.c:4937:21: sparse: sparse: symbol 'smack_lsmid' was not declared. Should it be static?
   security/smack/smack_lsm.c:5133:30: sparse: sparse: cast removes address space '__rcu' of expression
   security/smack/smack_lsm.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/smack_lsmid +4937 security/smack/smack_lsm.c

  4936	
> 4937	const struct lsm_id smack_lsmid = {
  4938		.name = "smack",
  4939		.id = LSM_ID_SMACK,
  4940	};
  4941	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
