Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3394C17A319
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 10:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741515150; cv=none; b=MyLFTl24YW6zmJlvGXxLNPhNKUHT0w9JoAQZRJ2fnAK9jOn3PQV+ox0mem2OvKcn2SfWGQfEDHEdRZrVh/FguZC3fjQPIjC0z2sCnUbvUkjNL6u3tvo9fE9BPm+BoyHBFDrdKBaliE35ZrC3SiGzf3My9X76VIhDlzMcIqkaaaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741515150; c=relaxed/simple;
	bh=0hRp6Evvb4x+fiqny5sMvP4eJnYfZxCPeryZqOSEjQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4N5qQUItmdKqLutr6FVxLm+g3SvYnphcZLK8fkKHIemrvTtqupgptBUBSMk7/CGwP4auyTlMb1OkTHwgCy4X5C8oY/+iJ7jY9XtSbeW64BAUWjAhATlFMwMn0VWtt7z21PV5j10pOFTdiyG1PL1v4hrTg3yGvwYBKhQgkB7qmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maY37+k5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maY37+k5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741515148; x=1773051148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0hRp6Evvb4x+fiqny5sMvP4eJnYfZxCPeryZqOSEjQM=;
  b=maY37+k5UY8zb+TeH+x4x7qE2lyeq2LZzUwzpzH8kF6/td812kcdoEdf
   1mgdcIwUKQIYHvrIX01iKqqntKArp/YI5EfuIaaPmNZsREkWH0TpfhBFH
   4KF6CpKwJLsBEpgcyXWiDZ3KehHLuWnzHDQ2b5dUB2vC4OPopTCMhgyzC
   d3NMmjrVu9+PS5IHQ0YAo5lzjHX0LavilBv21C+ZmyONDM9sJ9y2VeFVU
   hZP1bC/RvsA+GmFchMZIVR99OYkDiStUPdc09urcCQZAo607OgWfDxL6L
   H0q3avETcOQQ7aJFdDii6XzPORAYPRS0MyMiLA2RdaLyx9KTuZOMgLHVc
   A==;
X-CSE-ConnectionGUID: DN5AtywVTqa0q70KIJHf4Q==
X-CSE-MsgGUID: khh7NvVCRvWjVOoKUH/osg==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42659888"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="42659888"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 03:12:27 -0700
X-CSE-ConnectionGUID: i+bF4JeQQHWIZvh7k1deSw==
X-CSE-MsgGUID: NGLCuwx7SxOYEfY6kLw/OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="119701085"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 09 Mar 2025 03:12:27 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trDdw-0002zA-0s;
	Sun, 09 Mar 2025 10:12:24 +0000
Date: Sun, 9 Mar 2025 18:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 15/26] landlock: Log scoped denials
Message-ID: <202503091859.d55xPuZb-lkp@intel.com>
References: <20250308184422.2159360-16-mic@digikod.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250308184422.2159360-16-mic@digikod.net>

Hi Mickaël,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7eb172143d5508b4da468ed59ee857c6e5e01da6]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/lsm-Add-audit_log_lsm_data-helper/20250309-025251
base:   7eb172143d5508b4da468ed59ee857c6e5e01da6
patch link:    https://lore.kernel.org/r/20250308184422.2159360-16-mic%40digikod.net
patch subject: [PATCH v6 15/26] landlock: Log scoped denials
config: i386-buildonly-randconfig-004-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091859.d55xPuZb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091859.d55xPuZb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091859.d55xPuZb-lkp@intel.com/

All errors (new ones prefixed by >>):

   security/landlock/fs.c: In function 'hook_file_set_fowner':
>> security/landlock/fs.c:1816:36: error: 'struct landlock_file_security' has no member named 'fown_layer'
    1816 |                 landlock_file(file)->fown_layer = handle_layer;
         |                                    ^~
   security/landlock/fs.c:1821:36: error: 'struct landlock_file_security' has no member named 'fown_layer'
    1821 |                 landlock_file(file)->fown_layer = 0;
         |                                    ^~
--
   security/landlock/task.c: In function 'hook_file_send_sigiotask':
>> security/landlock/task.c:412:60: error: 'struct landlock_file_security' has no member named 'fown_layer'
     412 |                 .layer_plus_one = landlock_file(fown->file)->fown_layer + 1,
         |                                                            ^~


vim +1816 security/landlock/fs.c

  1792	
  1793	static void hook_file_set_fowner(struct file *file)
  1794	{
  1795		static const struct access_masks signal_scope = {
  1796			.scope = LANDLOCK_SCOPE_SIGNAL,
  1797		};
  1798		const struct landlock_cred_security *new_subject;
  1799		struct landlock_cred_security *fown_subject;
  1800		struct landlock_ruleset *prev_dom;
  1801		size_t handle_layer;
  1802	
  1803		/*
  1804		 * Lock already held by __f_setown(), see commit 26f204380a3c ("fs: Fix
  1805		 * file_set_fowner LSM hook inconsistencies").
  1806		 */
  1807		lockdep_assert_held(&file_f_owner(file)->lock);
  1808	
  1809		fown_subject = &landlock_file(file)->fown_subject;
  1810		prev_dom = fown_subject->domain;
  1811		new_subject = landlock_get_applicable_subject(
  1812			current_cred(), signal_scope, &handle_layer);
  1813		if (new_subject) {
  1814			landlock_get_ruleset(new_subject->domain);
  1815			*fown_subject = *new_subject;
> 1816			landlock_file(file)->fown_layer = handle_layer;
  1817		} else {
  1818			static const struct landlock_cred_security empty = {};
  1819	
  1820			*fown_subject = empty;
  1821			landlock_file(file)->fown_layer = 0;
  1822		}
  1823	
  1824		/* Called in an RCU read-side critical section. */
  1825		landlock_put_ruleset_deferred(prev_dom);
  1826	}
  1827	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
