Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16F22C08C4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 07:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760601485; cv=none; b=OxvoKu/MzzbVhPl+OV2CwQCxDFUyEtDEphqbIjXVSo5zjeMLinktkBobughk3PNLMOpTotgfhZDWfexSRFX3M1XKwPf5GlYgToE9ADOriSDXSswqNtNj2/vNZOWUWQxXHeKnHwaHQgPV+Mq3aZG0htLcb9sFY2z4owADGg7TMM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760601485; c=relaxed/simple;
	bh=id0rxMzslDZiLcyD35DRewcLUXVmc1DhkS97OpweEaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ufKQLhXpNpE4WPwHwl7zsl5wHgGkj81E6Fnidmb7LqA+31VV+txQ1XmkB++fmyHC7+VR7htVwITmu/t8cBkO4zBfCzq5PclEid9vBV6K5SxglBG4FVLY3+6BWwtWKZqmtFSjz0ISoMYf82i+iZvA/qESHBHiVo0OyEobOoeIxE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3+9M/cH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3+9M/cH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760601484; x=1792137484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=id0rxMzslDZiLcyD35DRewcLUXVmc1DhkS97OpweEaA=;
  b=A3+9M/cH5uDJGzC0yjv8euz1CD8CzCQv+JAvy1qb9PwTzHnOl/GbrZa+
   9aGdIMQz8Q4rI1SxjZGVbBCKO3ZBvRbfzwrldCMTbhivrYt/q1MyTWQWB
   Vkh2IXeMFK7PoZNc6lSGPBA8cxNlgJ7K/sRNWg0QZd2Bi59x0Xl2Ft0RY
   Z8DBy4DoGSIgvc1ZX8ruJstoQnuHR3w5sAeYRD9kXSSDcMi5LbWwGTENt
   xlPj+DURmHF9SGrDVoKk+ItwMjmw/c3ahY8ndFqCPbmt6tOD22WCakbyZ
   4CWslVYF9UK8Tj0eXDeHb1RRiYvOO6DorxEjUq46QfYA+fSTBysi3T9pL
   w==;
X-CSE-ConnectionGUID: ERmVvsslQw+80fPWbtNOfg==
X-CSE-MsgGUID: Q7QLMiqJRNCJWXJtrPbKoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="80227704"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="80227704"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 00:58:03 -0700
X-CSE-ConnectionGUID: p88/b2/iTIOn7gOe2e1ujg==
X-CSE-MsgGUID: o3Fh9PWqSL+aASgCFPTekw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="182793012"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 16 Oct 2025 00:58:01 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Is2-0004Zn-30;
	Thu, 16 Oct 2025 07:57:58 +0000
Date: Thu, 16 Oct 2025 15:57:26 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jonhunter:tegra/next-fixes 3/3] kernel/printk/internal.h:248:57:
 error: 'console_offload_blocked' undeclared
Message-ID: <202510161511.dApiWAi6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jonhunter/linux tegra/next-fixes
head:   ae173249d9028ef159fba040bdab260d80dda43f
commit: ae173249d9028ef159fba040bdab260d80dda43f [3/3] printk: Avoid scheduling irq_work and kthreads on suspend
config: um-randconfig-001-20251016 (https://download.01.org/0day-ci/archive/20251016/202510161511.dApiWAi6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161511.dApiWAi6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161511.dApiWAi6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/printk/printk.c:62:
   kernel/printk/internal.h: In function 'printk_get_console_flush_type':
>> kernel/printk/internal.h:248:57: error: 'console_offload_blocked' undeclared (first use in this function)
     248 |                         if (printk_kthreads_running && !console_offload_blocked)
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/printk/internal.h:248:57: note: each undeclared identifier is reported only once for each function it appears in


vim +/console_offload_blocked +248 kernel/printk/internal.h

   236	
   237	/*
   238	 * Identify which console flushing methods should be used in the context of
   239	 * the caller.
   240	 */
   241	static inline void printk_get_console_flush_type(struct console_flush_type *ft)
   242	{
   243		memset(ft, 0, sizeof(*ft));
   244	
   245		switch (nbcon_get_default_prio()) {
   246		case NBCON_PRIO_NORMAL:
   247			if (have_nbcon_console && !have_boot_console) {
 > 248				if (printk_kthreads_running && !console_offload_blocked)
   249					ft->nbcon_offload = true;
   250				else
   251					ft->nbcon_atomic = true;
   252			}
   253	
   254			/* Legacy consoles are flushed directly when possible. */
   255			if (have_legacy_console || have_boot_console) {
   256				if (!is_printk_legacy_deferred())
   257					ft->legacy_direct = true;
   258				else if (!console_offload_blocked)
   259					ft->legacy_offload = true;
   260			}
   261			break;
   262	
   263		case NBCON_PRIO_EMERGENCY:
   264			if (have_nbcon_console && !have_boot_console)
   265				ft->nbcon_atomic = true;
   266	
   267			/* Legacy consoles are flushed directly when possible. */
   268			if (have_legacy_console || have_boot_console) {
   269				if (!is_printk_legacy_deferred())
   270					ft->legacy_direct = true;
   271				else if (!console_offload_blocked)
   272					ft->legacy_offload = true;
   273			}
   274			break;
   275	
   276		case NBCON_PRIO_PANIC:
   277			/*
   278			 * In panic, the nbcon consoles will directly print. But
   279			 * only allowed if there are no boot consoles.
   280			 */
   281			if (have_nbcon_console && !have_boot_console)
   282				ft->nbcon_atomic = true;
   283	
   284			if (have_legacy_console || have_boot_console) {
   285				/*
   286				 * This is the same decision as NBCON_PRIO_NORMAL
   287				 * except that offloading never occurs in panic.
   288				 *
   289				 * Note that console_flush_on_panic() will flush
   290				 * legacy consoles anyway, even if unsafe.
   291				 */
   292				if (!is_printk_legacy_deferred())
   293					ft->legacy_direct = true;
   294	
   295				/*
   296				 * In panic, if nbcon atomic printing occurs,
   297				 * the legacy consoles must remain silent until
   298				 * explicitly allowed.
   299				 */
   300				if (ft->nbcon_atomic && !legacy_allow_panic_sync)
   301					ft->legacy_direct = false;
   302			}
   303			break;
   304	
   305		default:
   306			WARN_ON_ONCE(1);
   307			break;
   308		}
   309	}
   310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
