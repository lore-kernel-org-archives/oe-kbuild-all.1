Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A7310FF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 May 2024 04:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716696468; cv=none; b=dJfC3p7dEvhir4AQBgkELLKCPmTji3UN1jIB9wwfk3CSIMKgw/b6LXVUeN6D4QtdatrhPK7hLIic+J2B3lKhlaOO8l24GEV81BBbsHaLvkquyj1qv7oIMOSdZeA3g/eAY/tS2Vt/RH3i5VEXXMJmSag7/hDSGA7HMASqKSalXmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716696468; c=relaxed/simple;
	bh=wLuSyyszDpoWFcx/WF/6eDczlTyQClAC+fHbXXNb9Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mCdOFcFHK8Wd+KBawIebg7LoEE9mBOTwkVyCyCGGwqcAuqdZPHjx6y10x+itj7+/7nBHF9tTeHEgsC0nDcwskfAAG4rnKXPlvh9CBaoJkGMsKWkJWVmQntBiwuyIHtFhlpPaaWhkYabU3UjseXLX82i8Rzs1vvIpnIEeFZxSbQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjUQaXDK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjUQaXDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716696466; x=1748232466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wLuSyyszDpoWFcx/WF/6eDczlTyQClAC+fHbXXNb9Xo=;
  b=XjUQaXDKotJX5OKg7Oc9szFzOeHmKlwd5iITQsehCXggtI6DyyHTAI4r
   rG6AJ5NPNZjFdLc4QhPbhrylE7GPTcDa3M7ThxfT3AaocBhcMX4CBcfZD
   l8Urm76aHT0ni2/Cue0Ekk54KFZmRov2yTGA6uLCUVFU8aBAxjs5Pz1uz
   s5XTlPKzfrORZkn7hvszDRE3V2etki2nUrOsrwzrsKmkEfn7SVdy84iM6
   sDVbA/DeISOXjgu4RPiGHVBHYC9cxGyUEJbdUkUf9TyttEb7MFzp4cPjV
   +Esmx+/Rl1b71gSjSEhQNgXUoJ474K19fwKdrUGffDBCgz/tz0hKkchVc
   g==;
X-CSE-ConnectionGUID: fDhiMQMNR1SldApR8NctvA==
X-CSE-MsgGUID: WyOvN2+nTlOMXC5WCCXjRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="12857108"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="12857108"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 21:07:46 -0700
X-CSE-ConnectionGUID: LQyFBtLXQiOIfKPEWSKsYA==
X-CSE-MsgGUID: 01OCgR5ES2CpsNt9JYJEvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="34913451"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 May 2024 21:07:45 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB5Ac-0007j1-2e;
	Sun, 26 May 2024 04:07:42 +0000
Date: Sun, 26 May 2024 12:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask-types 3/4] include/linux/sched.h:1782:30: error: &
 has lower precedence than ==; == will be evaluated first
Message-ID: <202405261220.GhpHvXLV-lkp@intel.com>
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
config: i386-buildonly-randconfig-005-20240526 (https://download.01.org/0day-ci/archive/20240526/202405261220.GhpHvXLV-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405261220.GhpHvXLV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405261220.GhpHvXLV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:10:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   In file included from arch/x86/include/asm/msr.h:15:
   In file included from include/linux/percpu.h:13:
>> include/linux/sched.h:1782:30: error: & has lower precedence than ==; == will be evaluated first [-Werror,-Wparentheses]
    1782 |         if (*cpumask_bits(new_mask) & 1 == 0)
         |                                     ^~~~~~~~
   include/linux/sched.h:1782:30: note: place parentheses around the '==' expression to silence this warning
    1782 |         if (*cpumask_bits(new_mask) & 1 == 0)
         |                                     ^       
         |                                       (     )
   include/linux/sched.h:1782:30: note: place parentheses around the & expression to evaluate it first
    1782 |         if (*cpumask_bits(new_mask) & 1 == 0)
         |                                     ^
         |             (                          )
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_SPI
   Depends on [n]: SPI [=n]
   Selected by [m]:
   - AD9739A [=m] && IIO [=y] && (SPI [=n] || COMPILE_TEST [=y])


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
