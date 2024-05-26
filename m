Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4222C15CB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 May 2024 02:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716692017; cv=none; b=ghUNgkSTvw7hz1qaBAL8BDiLeyLxfEzCzBp7T+dcvysj5w/pa09FKtEN4VLddBbUlopqv1818PZHRVeofcPfMeNKNqpRTcbzDHHX+chn2qRrIcfNQxLtiXH7eGX1JQw7NSEIyAoTYCEnvAHAp7vrrcjH4SxtYVLHVz0RegR2Mn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716692017; c=relaxed/simple;
	bh=r25LJ/8JoZSa06PjLnMpqz87zDPa7x/m6g+FNxHxYXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oG4t0yi/n6tKgMJhSCl1OEpIOgn9YVR+42Rcb/5YcdOVZrB9zfMgjqwgJVicFcN2mwtgUK4Aj3OcgUJ23DR6CV/tKikOLhCdL95Klke1ihmNNn4x8yx+wWWNoZ5PgFmCbVs6ZUj4Gk5qV9TAVAgyq+Dq1HYHzG6FnkOEY70T7Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORBtiy86; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORBtiy86"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716692015; x=1748228015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r25LJ/8JoZSa06PjLnMpqz87zDPa7x/m6g+FNxHxYXA=;
  b=ORBtiy86muJtmKwb9vVA4nWdDmUmQq1PoBzplDSVkn66NH3QB5cfwm4E
   POWw37VqjBtT4+hwIHqDrstk/TIEiHteKMZnBz86gu3o2/SG8qsdAvybV
   9NUl3xzzla0ELacx/AwLeHWrod+zphfkzfvojf0gI0KnIsf7GQxyeZbvQ
   7OmEY2T03k/jO0zcjvtpAyM+bZ2iMMyPse4h8t9jRbw1aH4AUA7znu58h
   ctqw22FwRL5Q5Tmo2aQ0vNXdIxp9msIid/DsN7Ssj9B+LGf9aELXVBUV2
   Y/DnBmrx5nmTfuuowrhuiQS3DYUm312iNOQA5Z/DfgVTn8Ze41CZl52zR
   w==;
X-CSE-ConnectionGUID: pZO8a9oSQN6vGIaluKoXBg==
X-CSE-MsgGUID: La9x4npuQ3Ow6AFr0vri2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="13151350"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="13151350"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 19:53:35 -0700
X-CSE-ConnectionGUID: 0NYFb857TeWPp2JV2gFx8w==
X-CSE-MsgGUID: CEytRMYHRwmRoPL5fhxbYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="38830697"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 25 May 2024 19:53:33 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB40p-0007fX-13;
	Sun, 26 May 2024 02:53:31 +0000
Date: Sun, 26 May 2024 10:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask-types 3/4] include/linux/sched.h:1782:37: warning:
 suggest parentheses around comparison in operand of '&'
Message-ID: <202405261030.Hgb5O4eu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask-types
head:   0e790100d68d8aa5a00d342cbe08e772ebe45e8f
commit: 0b7f10cfa75080d995928b24638294d53fae43de [3/4] cpumask_types
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240526/202405261030.Hgb5O4eu-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405261030.Hgb5O4eu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405261030.Hgb5O4eu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/parisc/kernel/asm-offsets.c:18:
   include/linux/sched.h: In function 'set_cpus_allowed_ptr':
>> include/linux/sched.h:1782:37: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
    1782 |         if (*cpumask_bits(new_mask) & 1 == 0)
         |                                     ^
--
   In file included from include/linux/percpu.h:13,
                    from include/linux/radix-tree.h:16,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:18,
                    from include/linux/clk-provider.h:9,
                    from lib/vsprintf.c:23:
   include/linux/sched.h: In function 'set_cpus_allowed_ptr':
>> include/linux/sched.h:1782:37: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
    1782 |         if (*cpumask_bits(new_mask) & 1 == 0)
         |                                     ^
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1683:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1683 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
   In file included from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from lib/string_helpers.c:13:
   include/linux/sched.h: In function 'set_cpus_allowed_ptr':
>> include/linux/sched.h:1782:37: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
    1782 |         if (*cpumask_bits(new_mask) & 1 == 0)
         |                                     ^
   lib/string_helpers.c: In function 'string_get_size':
   lib/string_helpers.c:124:46: warning: '%03u' directive output may be truncated writing between 3 and 10 bytes into a region of size 7 [-Wformat-truncation=]
     124 |                 snprintf(tmp, sizeof(tmp), ".%03u", remainder);
         |                                              ^~~~
   lib/string_helpers.c:124:44: note: directive argument in the range [0, 4294966295]
     124 |                 snprintf(tmp, sizeof(tmp), ".%03u", remainder);
         |                                            ^~~~~~~
   lib/string_helpers.c:124:17: note: 'snprintf' output between 5 and 12 bytes into a destination of size 8
     124 |                 snprintf(tmp, sizeof(tmp), ".%03u", remainder);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/parisc/kernel/asm-offsets.c:18:
   include/linux/sched.h: In function 'set_cpus_allowed_ptr':
>> include/linux/sched.h:1782:37: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
    1782 |         if (*cpumask_bits(new_mask) & 1 == 0)
         |                                     ^


vim +1782 include/linux/sched.h

  1762	
  1763	/**
  1764	 * set_cpus_allowed_ptr - set CPU affinity mask of a task
  1765	 * @p: the task
  1766	 * @new_mask: CPU affinity mask
  1767	 *
  1768	 * Return: zero if successful, or a negative error code
  1769	 */
  1770	extern int set_cpus_allowed_ptr(struct task_struct *p, const struct cpumask *new_mask);
  1771	extern int dup_user_cpus_ptr(struct task_struct *dst, struct task_struct *src, int node);
  1772	extern void release_user_cpus_ptr(struct task_struct *p);
  1773	extern int dl_task_check_affinity(struct task_struct *p, const struct cpumask *mask);
  1774	extern void force_compatible_cpus_allowed_ptr(struct task_struct *p);
  1775	extern void relax_compatible_cpus_allowed_ptr(struct task_struct *p);
  1776	#else
  1777	static inline void do_set_cpus_allowed(struct task_struct *p, const struct cpumask *new_mask)
  1778	{
  1779	}
  1780	static inline int set_cpus_allowed_ptr(struct task_struct *p, const struct cpumask *new_mask)
  1781	{
> 1782		if (*cpumask_bits(new_mask) & 1 == 0)
  1783			return -EINVAL;
  1784		return 0;
  1785	}
  1786	static inline int dup_user_cpus_ptr(struct task_struct *dst, struct task_struct *src, int node)
  1787	{
  1788		if (src->user_cpus_ptr)
  1789			return -EINVAL;
  1790		return 0;
  1791	}
  1792	static inline void release_user_cpus_ptr(struct task_struct *p)
  1793	{
  1794		WARN_ON(p->user_cpus_ptr);
  1795	}
  1796	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
