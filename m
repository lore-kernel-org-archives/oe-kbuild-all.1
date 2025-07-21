Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A6E1F12F4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753101569; cv=none; b=f9Tii/JH/c0HB1yqPsYhiBt4MsRql83WQcy5n1YaXwiHncplIuHmmquhK2Yh2GCLeKaNR6evi8QEWcD3AjUd54AvdhK//+XL02h5CSc/m5f9/UDALvdwBp36n4Vw/jfpTFmi+TPIlnBHMfbumM5pfGACw588wWeFjPNwZ2IydbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753101569; c=relaxed/simple;
	bh=b3ULNAqMTaa3GycXLebSSB+FbJo2vAFaNs29OufAzvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXGc04l607aCyfaID1AiK8qZSkvqNZ1kRtYzRg4YI11qTtyn0njj7y1MIz6odwG6pLvcfx/TMl5GHVQjQ0pDyAfeb9+SlwqTiOYmviA5BqY1lZkrtSG2wwEqdvrAP8bbaWYcZc8GFTnKvuRMv83yHBcS5R4XlPkyOA7688LQXR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ik4oBaue; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ik4oBaue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753101567; x=1784637567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b3ULNAqMTaa3GycXLebSSB+FbJo2vAFaNs29OufAzvs=;
  b=Ik4oBaueXbiU8uj+oYTMKXnZ+N39I9Mz4DTxerI6UfwYpwUzML+pyZUX
   +OT4wjLC2hA7YCwvHNf9jy+qNvZY7C9v4HNTot+JuhVJhMsFLmmpQSDg+
   km/yNv2WLOad20IyqI4VHPvK+xVVYg+0Ai4+8rWf41H9luhGIMC/OkRXk
   T1XmD/RhID+E4Wk5XL4jLXhY//1HKel3o7bZNYl7V2HcjaG3WupaDt/pR
   PaOY/456tmBB7Zw+vQnr2WgrUB41YIRusoPy6x/AcszTfxYBEPVB5raxC
   sBkJMfnEVUPfdSQyQo+UnJqyoOFdpC0txOX+3IE12z9EmE7e0aN+GreAd
   Q==;
X-CSE-ConnectionGUID: O/hsViaIQPyySREyLbPOuA==
X-CSE-MsgGUID: wlqxmCxLQlutneca6mlHIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55164354"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="55164354"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 05:39:27 -0700
X-CSE-ConnectionGUID: kbXYQnfiReC4rnUbkH0Quw==
X-CSE-MsgGUID: YzXnD63/RmCeS8EgEgE4eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="159556599"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Jul 2025 05:39:25 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udpnd-000GnX-0Q;
	Mon, 21 Jul 2025 12:39:21 +0000
Date: Mon, 21 Jul 2025 20:38:22 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/4] pidns: move is-ancestor logic to helper
Message-ID: <202507212041.ZFGAHv2Z-lkp@intel.com>
References: <20250721-procfs-pidns-api-v1-1-5cd9007e512d@cyphar.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-procfs-pidns-api-v1-1-5cd9007e512d@cyphar.com>

Hi Aleksa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 4c838c7672c39ec6ec48456c6ce22d14a68f4cda]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Sarai/pidns-move-is-ancestor-logic-to-helper/20250721-164648
base:   4c838c7672c39ec6ec48456c6ce22d14a68f4cda
patch link:    https://lore.kernel.org/r/20250721-procfs-pidns-api-v1-1-5cd9007e512d%40cyphar.com
patch subject: [PATCH RFC 1/4] pidns: move is-ancestor logic to helper
config: x86_64-buildonly-randconfig-002-20250721 (https://download.01.org/0day-ci/archive/20250721/202507212041.ZFGAHv2Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507212041.ZFGAHv2Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507212041.ZFGAHv2Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/pid_namespace.c: In function 'pidns_install':
>> kernel/pid_namespace.c:410:31: warning: unused variable 'ancestor' [-Wunused-variable]
     410 |         struct pid_namespace *ancestor, *new = to_pid_ns(ns);
         |                               ^~~~~~~~


vim +/ancestor +410 kernel/pid_namespace.c

08d89b83697e22 Aleksa Sarai      2025-07-21  405  
f2a8d52e0a4db9 Christian Brauner 2020-05-05  406  static int pidns_install(struct nsset *nsset, struct ns_common *ns)
57e8391d327609 Eric W. Biederman 2010-03-07  407  {
f2a8d52e0a4db9 Christian Brauner 2020-05-05  408  	struct nsproxy *nsproxy = nsset->nsproxy;
57e8391d327609 Eric W. Biederman 2010-03-07  409  	struct pid_namespace *active = task_active_pid_ns(current);
3c0411846118a5 Al Viro           2014-11-01 @410  	struct pid_namespace *ancestor, *new = to_pid_ns(ns);
57e8391d327609 Eric W. Biederman 2010-03-07  411  
5e4a08476b50fa Eric W. Biederman 2012-12-14  412  	if (!ns_capable(new->user_ns, CAP_SYS_ADMIN) ||
f2a8d52e0a4db9 Christian Brauner 2020-05-05  413  	    !ns_capable(nsset->cred->user_ns, CAP_SYS_ADMIN))
57e8391d327609 Eric W. Biederman 2010-03-07  414  		return -EPERM;
57e8391d327609 Eric W. Biederman 2010-03-07  415  
57e8391d327609 Eric W. Biederman 2010-03-07  416  	/*
57e8391d327609 Eric W. Biederman 2010-03-07  417  	 * Only allow entering the current active pid namespace
57e8391d327609 Eric W. Biederman 2010-03-07  418  	 * or a child of the current active pid namespace.
57e8391d327609 Eric W. Biederman 2010-03-07  419  	 *
57e8391d327609 Eric W. Biederman 2010-03-07  420  	 * This is required for fork to return a usable pid value and
57e8391d327609 Eric W. Biederman 2010-03-07  421  	 * this maintains the property that processes and their
57e8391d327609 Eric W. Biederman 2010-03-07  422  	 * children can not escape their current pid namespace.
57e8391d327609 Eric W. Biederman 2010-03-07  423  	 */
08d89b83697e22 Aleksa Sarai      2025-07-21  424  	if (!pidns_is_ancestor(new, active))
57e8391d327609 Eric W. Biederman 2010-03-07  425  		return -EINVAL;
57e8391d327609 Eric W. Biederman 2010-03-07  426  
c2b1df2eb42978 Andy Lutomirski   2013-08-22  427  	put_pid_ns(nsproxy->pid_ns_for_children);
c2b1df2eb42978 Andy Lutomirski   2013-08-22  428  	nsproxy->pid_ns_for_children = get_pid_ns(new);
57e8391d327609 Eric W. Biederman 2010-03-07  429  	return 0;
57e8391d327609 Eric W. Biederman 2010-03-07  430  }
57e8391d327609 Eric W. Biederman 2010-03-07  431  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
