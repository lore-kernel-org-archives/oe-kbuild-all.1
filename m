Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0F18C24
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="av0YaIoc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697800747; x=1729336747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=otx+Zz/LY19UTVsVa3Npz5zr1ue4E3U/OyiF31M7JVo=;
  b=av0YaIoc3UAjTZ+G4CR1WcFjAWgG4zbhafVMbTE36kQswZ8r4tWzJSlQ
   6bMqQSiLuL/NqVn74BmuWekBbbWv7RJtVcVH+JqyvycyV8TmwGPuNf34O
   d0grfbOqgVAO2znKcQqBS3jbtppLJKgmQ0TImeriUK9AjyVt9hcZDUK+V
   bPu4ETezPPqpE6Dknd7BWogq6lphqg/AJBjwT2WKJq4DiTlY+wmNKEWFP
   ZTgzhVUbjUdDHZM4oHR7v/bEIvWwqfLozjc9+2BGGkEjHNF/+h+0yIH6d
   z5TUBXKso7kJDl6rvsO4VkKvyNlg1SxIHs3xbFdwM0EEBZVyDSO+OvwRV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385354704"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="385354704"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 04:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="873877190"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="873877190"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Oct 2023 04:19:05 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtnWx-0003RW-2b;
	Fri, 20 Oct 2023 11:19:03 +0000
Date: Fri, 20 Oct 2023 19:18:28 +0800
From: kernel test robot <lkp@intel.com>
To: Georgia Garcia <georgia.garcia@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	John Johansen <john.johansen@canonical.com>
Subject: [linux-next:master 10379/13906] security/apparmor/lsm.c:651:5:
 warning: no previous declaration for 'apparmor_uring_override_creds'
Message-ID: <202310201911.QT2YAa39-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2030579113a1b1b5bfd7ff24c0852847836d8fd1
commit: c4371d90633b73cf6e86aff43ff2b5d95ad2b9eb [10379/13906] apparmor: add io_uring mediation
config: x86_64-randconfig-072-20231020 (https://download.01.org/0day-ci/archive/20231020/202310201911.QT2YAa39-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201911.QT2YAa39-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201911.QT2YAa39-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/lsm.c:651:5: warning: no previous declaration for 'apparmor_uring_override_creds' [-Wmissing-declarations]
    int apparmor_uring_override_creds(const struct cred *new)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> security/apparmor/lsm.c:675:5: warning: no previous declaration for 'apparmor_uring_sqpoll' [-Wmissing-declarations]
    int apparmor_uring_sqpoll(void)
        ^~~~~~~~~~~~~~~~~~~~~


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
