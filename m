Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA5C2EAFF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 19:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iryDbi4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697744969; x=1729280969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M8rlzNrX8FPeNrHjWucjUDvE/iPmadA5+huwexaICAQ=;
  b=iryDbi4N8WAhtWBPVYNKiOCT1XxJYVojvCdGvaK13cagRQnnn+rsJt78
   rnaDy6UbLNlpf9jMv3KdMf8GAb5wj6fS+MJ6mtNJfjowRor6mcU5qWkyJ
   LET0v/wR6aY/y+Qr99TmE8fPwudkmI4+dNb841VPnwffwk9xNa5wI+Wqs
   rBMNDDu6bfrQgma6scyF1wFSS7swJ7wY+h8/bG7tPakHwP5zefoTynftB
   TCyyTpqyaExj8vI/hUILtNnlbToHEW8L8bU0h5rEcBXA4/zwGZ4yV4H5x
   spb7zMeQoxhGYiRo73M00NUxJ7So2FJEh5grjyN/2pFxRWQEVnbtM6R28
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="366587513"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="366587513"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 12:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="733693430"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="733693430"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Oct 2023 12:49:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtZ1J-0002XP-0z;
	Thu, 19 Oct 2023 19:49:25 +0000
Date: Fri, 20 Oct 2023 03:48:32 +0800
From: kernel test robot <lkp@intel.com>
To: Georgia Garcia <georgia.garcia@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
	John Johansen <john.johansen@canonical.com>
Subject: [jj-apparmor:apparmor-next 33/35] security/apparmor/lsm.c:651:5:
 warning: no previous prototype for 'apparmor_uring_override_creds'
Message-ID: <202310200316.9QWiBDoj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   157a3537d6bc28ceb9a11fc8cb67f2152d860146
commit: c4371d90633b73cf6e86aff43ff2b5d95ad2b9eb [33/35] apparmor: add io_uring mediation
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310200316.9QWiBDoj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200316.9QWiBDoj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200316.9QWiBDoj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/lsm.c:651:5: warning: no previous prototype for 'apparmor_uring_override_creds' [-Wmissing-prototypes]
     651 | int apparmor_uring_override_creds(const struct cred *new)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> security/apparmor/lsm.c:675:5: warning: no previous prototype for 'apparmor_uring_sqpoll' [-Wmissing-prototypes]
     675 | int apparmor_uring_sqpoll(void)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/apparmor_uring_override_creds +651 security/apparmor/lsm.c

   643	
   644	/**
   645	 * apparmor_uring_override_creds - check the requested cred override
   646	 * @new: the target creds
   647	 *
   648	 * Check to see if the current task is allowed to override it's credentials
   649	 * to service an io_uring operation.
   650	 */
 > 651	int apparmor_uring_override_creds(const struct cred *new)
   652	{
   653		struct aa_profile *profile;
   654		struct aa_label *label;
   655		int error;
   656		DEFINE_AUDIT_DATA(ad, LSM_AUDIT_DATA_NONE, AA_CLASS_IO_URING,
   657				  OP_URING_OVERRIDE);
   658	
   659		ad.uring.target = cred_label(new);
   660		label = __begin_current_label_crit_section();
   661		error = fn_for_each(label, profile,
   662				profile_uring(profile, AA_MAY_OVERRIDE_CRED,
   663					      cred_label(new), CAP_SYS_ADMIN, &ad));
   664		__end_current_label_crit_section(label);
   665	
   666		return error;
   667	}
   668	
   669	/**
   670	 * apparmor_uring_sqpoll - check if a io_uring polling thread can be created
   671	 *
   672	 * Check to see if the current task is allowed to create a new io_uring
   673	 * kernel polling thread.
   674	 */
 > 675	int apparmor_uring_sqpoll(void)
   676	{
   677		struct aa_profile *profile;
   678		struct aa_label *label;
   679		int error;
   680		DEFINE_AUDIT_DATA(ad, LSM_AUDIT_DATA_NONE, AA_CLASS_IO_URING,
   681				  OP_URING_SQPOLL);
   682	
   683		label = __begin_current_label_crit_section();
   684		error = fn_for_each(label, profile,
   685				profile_uring(profile, AA_MAY_CREATE_SQPOLL,
   686					      NULL, CAP_SYS_ADMIN, &ad));
   687		__end_current_label_crit_section(label);
   688	
   689		return error;
   690	}
   691	#endif /* CONFIG_IO_URING */
   692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
