Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2BB33E37D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 12:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761914633; cv=none; b=YCTWxHzGXmzxT+JWFzG2QDy1IcLmDMqNNOgLipIgW4fPCdwKrO8KfE8kpWDAvNM2TueSf69oOnBcco7Ja7/DlhlXd69eYibCW7hOf3lXpLAFsITmVzD+N+SWzq5Qf1UeNxzYKegIA0r9JhTEPCcSHto6UofEbneLYNP0ICOliyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761914633; c=relaxed/simple;
	bh=sF35hppqD3HWncobGIVIUzqVORCZRJuB6R7SU1cG6+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnFqfnxJSWvrt+ZeS03UcpLRGByBKXH3GireDGyzK17ec9TbFN2lkyv4plAwIj4x4AzU9qt7nGJCBj6s6jNLMyMii7+BDPKLxffyjl9mNzYbNeg8gq5bVggzIDYknNtBVZCopnjdqhSHmWgljkCgZctZlOszObJ9CcaUIEH+87Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=unknown smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7ZerLHE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7ZerLHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761914611; x=1793450611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sF35hppqD3HWncobGIVIUzqVORCZRJuB6R7SU1cG6+U=;
  b=G7ZerLHExSTL338dfFQvB7+B4BS/4twlDelEy0UwtSkGtXqtwOXvSCph
   e1cWswyHMmdBBPQrgov1afSR3hw5e/T5/uZBfCFGG0BhaZzLH2jhDs+fJ
   LbMF17U6O33iUG9ykMjvEEVfle0eyUMy4oW/CsoNS7cTBTd9WFGdP2Z9z
   MSCRMS2gXlbhdXYbWjQzMkql+WTdsYJ0N6ZyYcFve92vArTJEyKOpErSE
   S4UmK4wXBqq0+rLmhbANLxVoEOufW4WgZOclud2JoY4Lu84usiU+wxJAb
   C0uf+cLhodNOGmUxvOs3kyNuCdgJGT9YxltXuGDHrlf6TIi/cojlGrgFX
   w==;
X-CSE-ConnectionGUID: B+7Z/22ERb+VA3kOb6NyvA==
X-CSE-MsgGUID: Q52HpIP0TYO1UM9wMsoHNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="66687380"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="66687380"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 05:43:21 -0700
X-CSE-ConnectionGUID: AwmRUQfkS8mQ6Q97oh0umQ==
X-CSE-MsgGUID: Ko1mJjW+QF6FrzORNVX+vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="185500706"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 31 Oct 2025 05:43:19 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEoSz-000N6m-10;
	Fri, 31 Oct 2025 12:42:55 +0000
Date: Fri, 31 Oct 2025 20:40:29 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Wu <wusamuel@google.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, tuhaowen@uniontech.com,
	Samuel Wu <wusamuel@google.com>,
	Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] PM: Support aborting sleep during filesystem sync
Message-ID: <202510312048.Ylb5GU76-lkp@intel.com>
References: <20251030210110.298612-1-wusamuel@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030210110.298612-1-wusamuel@google.com>

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Wu/PM-Support-aborting-sleep-during-filesystem-sync/20251031-050330
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20251030210110.298612-1-wusamuel%40google.com
patch subject: [PATCH v6] PM: Support aborting sleep during filesystem sync
config: arm64-randconfig-r061-20251031 (https://download.01.org/0day-ci/archive/20251031/202510312048.Ylb5GU76-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510312048.Ylb5GU76-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510312048.Ylb5GU76-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/power/main.c: In function 'pm_init':
>> kernel/power/main.c:1159:17: error: implicit declaration of function 'pm_start_fs_sync_workqueue'; did you mean 'pm_start_workqueue'? [-Wimplicit-function-declaration]
    1159 |         error = pm_start_fs_sync_workqueue();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 pm_start_workqueue


vim +1159 kernel/power/main.c

  1153	
  1154	static int __init pm_init(void)
  1155	{
  1156		int error = pm_start_workqueue();
  1157		if (error)
  1158			return error;
> 1159		error = pm_start_fs_sync_workqueue();
  1160		if (error)
  1161			return error;
  1162		hibernate_image_size_init();
  1163		hibernate_reserved_size_init();
  1164		pm_states_init();
  1165		power_kobj = kobject_create_and_add("power", NULL);
  1166		if (!power_kobj)
  1167			return -ENOMEM;
  1168		error = sysfs_create_groups(power_kobj, attr_groups);
  1169		if (error)
  1170			return error;
  1171		pm_print_times_init();
  1172		return pm_autosleep_init();
  1173	}
  1174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
