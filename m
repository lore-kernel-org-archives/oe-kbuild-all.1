Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9962F5A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 22:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742683027; cv=none; b=kP6GsqL7ZLwk/7m5IhpbpzSzd+oHu8KNAMgIIRzNN1qxXz3A2/uVGaFHUoZJNyFqnzNVzMiuwgkXlK3Fj8B7V98QIXf708oW72hmJE8yMeijgbbUrWlyWZ0ji3O43aAdWHQutlMUKv+4CySBsl25MPHKynPaDGZvMU73DZ2L7/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742683027; c=relaxed/simple;
	bh=DrCR7agS9YnrF/a9V7GYLpphSV6rTWDoU9BxtkGiRqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mUuUGQo6Pb8jf9cZQC4KocKtcrUaMA8O0/pEXpcRFAsQ3riaAmHiI40Ir3ufHOU4UBDgooAusnE5TAkK1VP3BGA9q6UnZ+RFsAx+kIbYdQVDircm8e/Kkc8Ajw89xPUI4W+Bq3jTsr0eJ6l89fYAejwpJBzWxb4zXlgCbX1VDpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQgdF9wE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQgdF9wE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742683025; x=1774219025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DrCR7agS9YnrF/a9V7GYLpphSV6rTWDoU9BxtkGiRqk=;
  b=YQgdF9wE8+zxZ7cgrYP3Ko5bpkRRtxW3MKtUz2PTFW1wCRW4jc7Y57fR
   aMaow0+C3hLI+usMA94kXtLvY4rBMzsU+u/glmn1uRfK736rEFLVELzXK
   LaV6mcYK+0kH5nzz/ujG1WmgvxRozvT1JKWE2zBauIK72dDC5jSC1Ny+P
   aagjzy2LtQWcfzaskYr5sexA8odZFVr9xVDuR01dfeVHkyL18OiE3O5w3
   8sQ/3p8IJh4Eml/B5fViXDwe70mSpzG3rTsw5ex5IZ3TJSM0NFRqLP5ep
   2rkR+g2+LtOX0aq5TYEmW9gJWVj+qENiNPflOo0xCJRRDCCJ59bKD34Rq
   w==;
X-CSE-ConnectionGUID: twiYeuAZSVCzAagX9NK4fQ==
X-CSE-MsgGUID: x2Rr/lXWTXO5okk3zvsStg==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="44044053"
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="44044053"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 15:37:04 -0700
X-CSE-ConnectionGUID: YMwTVnSpQgOa0lj7PnmwUg==
X-CSE-MsgGUID: ui8mLc8kRKSfZdV/rqzcqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="127849161"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Mar 2025 15:37:02 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw7SZ-0002R5-2z;
	Sat, 22 Mar 2025 22:36:56 +0000
Date: Sun, 23 Mar 2025 06:36:04 +0800
From: kernel test robot <lkp@intel.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
	Avraham Stern <avraham.stern@intel.com>,
	Daniel Gabay <daniel.gabay@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Shaul Triebitz <shaul.triebitz@intel.com>
Subject: [linux-next:master 7538/13068]
 drivers/net/wireless/intel/iwlwifi/mld/mld.h:299:23: error: 'struct
 <anonymous>' has no member named 'in_d3'
Message-ID: <202503230634.MuKt4UYF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9388ec571cb1adba59d1cded2300eeb11827679c
commit: d1e879ec600f9b3bdd253167533959facfefb17b [7538/13068] wifi: iwlwifi: add iwlmld sub-driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250323/202503230634.MuKt4UYF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250323/202503230634.MuKt4UYF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503230634.MuKt4UYF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/intel/iwlwifi/mld/mld.c:16:
   drivers/net/wireless/intel/iwlwifi/mld/mld.h: In function 'iwl_cleanup_mld':
>> drivers/net/wireless/intel/iwlwifi/mld/mld.h:299:23: error: 'struct <anonymous>' has no member named 'in_d3'
     299 |         mld->fw_status.in_d3 = false;
         |                       ^
   In file included from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/net/mac80211.h:16,
                    from drivers/net/wireless/intel/iwlwifi/mld/mld.c:6:
   drivers/net/wireless/intel/iwlwifi/mld/hcmd.h: In function 'iwl_mld_send_cmd':
>> drivers/net/wireless/intel/iwlwifi/mld/hcmd.h:13:35: error: 'struct <anonymous>' has no member named 'in_d3'
      13 |         if (WARN_ON(mld->fw_status.in_d3))
         |                                   ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   In file included from drivers/net/wireless/intel/iwlwifi/mld/mlo.h:13,
                    from drivers/net/wireless/intel/iwlwifi/mld/mld.c:17:
   drivers/net/wireless/intel/iwlwifi/mld/iface.h: At top level:
   drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: warning: "CONFIG_PM_SLEEP" is not defined, evaluates to 0 [-Wundef]
     170 | #if CONFIG_PM_SLEEP
         |     ^~~~~~~~~~~~~~~
--
   In file included from drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:9:
   drivers/net/wireless/intel/iwlwifi/mld/mld.h: In function 'iwl_cleanup_mld':
>> drivers/net/wireless/intel/iwlwifi/mld/mld.h:299:23: error: 'struct <anonymous>' has no member named 'in_d3'
     299 |         mld->fw_status.in_d3 = false;
         |                       ^
   In file included from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/net/mac80211.h:16,
                    from drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:6:
   drivers/net/wireless/intel/iwlwifi/mld/hcmd.h: In function 'iwl_mld_send_cmd':
>> drivers/net/wireless/intel/iwlwifi/mld/hcmd.h:13:35: error: 'struct <anonymous>' has no member named 'in_d3'
      13 |         if (WARN_ON(mld->fw_status.in_d3))
         |                                   ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   In file included from drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:12:
   drivers/net/wireless/intel/iwlwifi/mld/iface.h: At top level:
   drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: warning: "CONFIG_PM_SLEEP" is not defined, evaluates to 0 [-Wundef]
     170 | #if CONFIG_PM_SLEEP
         |     ^~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:1978:12: warning: 'iwl_mld_resume' defined but not used [-Wunused-function]
    1978 | static int iwl_mld_resume(struct ieee80211_hw *hw)
         |            ^~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:1956:1: warning: 'iwl_mld_suspend' defined but not used [-Wunused-function]
    1956 | iwl_mld_suspend(struct ieee80211_hw *hw, struct cfg80211_wowlan *wowlan)
         | ^~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:1942:13: warning: 'iwl_mld_set_wakeup' defined but not used [-Wunused-function]
    1942 | static void iwl_mld_set_wakeup(struct ieee80211_hw *hw, bool enabled)
         |             ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/wireless/intel/iwlwifi/mld/fw.c:6:
   drivers/net/wireless/intel/iwlwifi/mld/mld.h: In function 'iwl_cleanup_mld':
>> drivers/net/wireless/intel/iwlwifi/mld/mld.h:299:23: error: 'struct <anonymous>' has no member named 'in_d3'
     299 |         mld->fw_status.in_d3 = false;
         |                       ^
   In file included from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/alpha/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/leds.h:12,
                    from drivers/net/wireless/intel/iwlwifi/mld/mld.h:8:
   drivers/net/wireless/intel/iwlwifi/mld/hcmd.h: In function 'iwl_mld_send_cmd':
>> drivers/net/wireless/intel/iwlwifi/mld/hcmd.h:13:35: error: 'struct <anonymous>' has no member named 'in_d3'
      13 |         if (WARN_ON(mld->fw_status.in_d3))
         |                                   ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
--
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/hcmd.c:10:
   drivers/net/wireless/intel/iwlwifi/mld/tests/../mld.h: In function 'iwl_cleanup_mld':
>> drivers/net/wireless/intel/iwlwifi/mld/tests/../mld.h:299:23: error: 'struct <anonymous>' has no member named 'in_d3'
     299 |         mld->fw_status.in_d3 = false;
         |                       ^
--
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/utils.c:17:
   drivers/net/wireless/intel/iwlwifi/mld/tests/../mld.h: In function 'iwl_cleanup_mld':
>> drivers/net/wireless/intel/iwlwifi/mld/tests/../mld.h:299:23: error: 'struct <anonymous>' has no member named 'in_d3'
     299 |         mld->fw_status.in_d3 = false;
         |                       ^
   In file included from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:258,
                    from include/kunit/test.h:20,
                    from drivers/net/wireless/intel/iwlwifi/mld/tests/utils.c:7:
   drivers/net/wireless/intel/iwlwifi/mld/tests/../hcmd.h: In function 'iwl_mld_send_cmd':
>> drivers/net/wireless/intel/iwlwifi/mld/tests/../hcmd.h:13:35: error: 'struct <anonymous>' has no member named 'in_d3'
      13 |         if (WARN_ON(mld->fw_status.in_d3))
         |                                   ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/utils.c:18:
   drivers/net/wireless/intel/iwlwifi/mld/tests/../iface.h: At top level:
   drivers/net/wireless/intel/iwlwifi/mld/tests/../iface.h:170:5: warning: "CONFIG_PM_SLEEP" is not defined, evaluates to 0 [-Wundef]
     170 | #if CONFIG_PM_SLEEP
         |     ^~~~~~~~~~~~~~~


vim +299 drivers/net/wireless/intel/iwlwifi/mld/mld.h

   286	
   287	/* memset the part of the struct that requires cleanup on restart */
   288	#define CLEANUP_STRUCT(_ptr)                             \
   289		memset((void *)&(_ptr)->zeroed_on_hw_restart, 0, \
   290		       sizeof((_ptr)->zeroed_on_hw_restart))
   291	
   292	/* Cleanup function for struct iwl_mld_vif, will be called in restart */
   293	static inline void
   294	iwl_cleanup_mld(struct iwl_mld *mld)
   295	{
   296		CLEANUP_STRUCT(mld);
   297		CLEANUP_STRUCT(&mld->scan);
   298	
 > 299		mld->fw_status.in_d3 = false;
   300	
   301		iwl_mld_low_latency_restart_cleanup(mld);
   302	
   303		/* Empty the list of async notification handlers so we won't process
   304		 * notifications from the dead fw after the reconfig flow.
   305		 */
   306		iwl_mld_purge_async_handlers_list(mld);
   307	}
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
