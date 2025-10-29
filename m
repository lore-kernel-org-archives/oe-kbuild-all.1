Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B37302150
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 06:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761718784; cv=none; b=F2VYtoPA1DU3ni/+CwFG1c5WFnII+9qlvvv9ycF23f8KGCZohixhwCSt1ZN/BCQB8NbcjPzKNAhtLWMstpjH844T6zMeP5w0BE9EdCJim1nJfgLnzyXT2214cV2uJtwH+4m40rX4lPO3oqSJNlJaFcq98Oh6EbGXcLBk2LERyIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761718784; c=relaxed/simple;
	bh=Mx0PDJvmjGIWpZaUbpIBJ98/kqhIDC5yeWNiMGVQNCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=massbE2B8ur7vMTWigYnC7frlv6bjAR19rhIvTaUmbh9Zn8pGTiR2TNyDk19Hz0+FupMzj6vCcPEeme6veVmrwLT6NhvTJ+ii2eL1LLW/k2aDFBgnpBoCOx1aByrkMjDDA0IxIYYQFH36zsi9PqEnQtRZwfwdNqCXfUIlExS/hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZtBUP2Ek; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZtBUP2Ek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761718783; x=1793254783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mx0PDJvmjGIWpZaUbpIBJ98/kqhIDC5yeWNiMGVQNCA=;
  b=ZtBUP2EkkDtoSCkr/wDicHEtbyOTX8h8uKdtZ9hqx9OHnpn7B+Iy/XYD
   ju3B1kSXDViMpGXzGz45rpO6bToiA8FpNrhoHvaGjvOaoJjPBX3Px0ps9
   nUcFe50SeFQ0nPL23tPspL8qdNPyOoB5X+ifWcXnwXvWK27fqqjtfRfLB
   C+HQ7EDYeoHUo/xHuAvuea0dOY4ZSfwNTMSvW45sHBFr2aKBLglc28/DR
   WvRkY+w7TgINeJqHsN3aiYxIIqd9PgIdBUoluE2SF2mPKXfBYbh5/v1hA
   L7z7JQFWsDHSCO3aB6c62IxZQ9Nvx5tQdLF9fp7TJ1keQgrhDuKTGkPhj
   Q==;
X-CSE-ConnectionGUID: 9lDoRA/AQw270bDjyI7wCg==
X-CSE-MsgGUID: yoVreHWIRe69l0l2wurO5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63870003"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="63870003"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 23:19:41 -0700
X-CSE-ConnectionGUID: kjod67tSRhSnMFQv+AyFZw==
X-CSE-MsgGUID: sc46g6PZTRqtEo3D8MZ8hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="186316817"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Oct 2025 23:19:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDzWF-000KH7-31;
	Wed, 29 Oct 2025 06:19:19 +0000
Date: Wed, 29 Oct 2025 14:15:06 +0800
From: kernel test robot <lkp@intel.com>
To: Xiao Ni <xni@redhat.com>, linux-raid@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, yukuai@fnnas.com, song@kernel.org
Subject: Re: [PATCH 1/1] md: avoid repeated calls to del_gendisk
Message-ID: <202510291426.ewU26n4f-lkp@intel.com>
References: <20251028133737.98300-1-xni@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028133737.98300-1-xni@redhat.com>

Hi Xiao,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc3 next-20251029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiao-Ni/md-avoid-repeated-calls-to-del_gendisk/20251028-214651
base:   linus/master
patch link:    https://lore.kernel.org/r/20251028133737.98300-1-xni%40redhat.com
patch subject: [PATCH 1/1] md: avoid repeated calls to del_gendisk
config: microblaze-randconfig-r051-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291426.ewU26n4f-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291426.ewU26n4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291426.ewU26n4f-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/md/md.c: In function 'mddev_unlock':
>> drivers/md/md.c:945:50: error: expected ')' before 'del_gendisk'
       !test_and_set_bit(MD_DO_DELETE, &mddev->flags)
                                                     ^
                                                     )
       del_gendisk(mddev->gendisk);
       ~~~~~~~~~~~                                    
   drivers/md/md.c:944:6: note: to match this '('
      if (test_bit(MD_DELETED, &mddev->flags) &&
         ^
>> drivers/md/md.c:947:2: error: expected expression before '}' token
     }
     ^


vim +945 drivers/md/md.c

   877	
   878	void mddev_unlock(struct mddev *mddev)
   879	{
   880		struct md_rdev *rdev;
   881		struct md_rdev *tmp;
   882		LIST_HEAD(delete);
   883	
   884		if (!list_empty(&mddev->deleting))
   885			list_splice_init(&mddev->deleting, &delete);
   886	
   887		if (mddev->to_remove) {
   888			/* These cannot be removed under reconfig_mutex as
   889			 * an access to the files will try to take reconfig_mutex
   890			 * while holding the file unremovable, which leads to
   891			 * a deadlock.
   892			 * So hold set sysfs_active while the remove in happeing,
   893			 * and anything else which might set ->to_remove or my
   894			 * otherwise change the sysfs namespace will fail with
   895			 * -EBUSY if sysfs_active is still set.
   896			 * We set sysfs_active under reconfig_mutex and elsewhere
   897			 * test it under the same mutex to ensure its correct value
   898			 * is seen.
   899			 */
   900			const struct attribute_group *to_remove = mddev->to_remove;
   901			mddev->to_remove = NULL;
   902			mddev->sysfs_active = 1;
   903			mutex_unlock(&mddev->reconfig_mutex);
   904	
   905			if (mddev->kobj.sd) {
   906				if (to_remove != &md_redundancy_group)
   907					sysfs_remove_group(&mddev->kobj, to_remove);
   908				if (mddev->pers == NULL ||
   909				    mddev->pers->sync_request == NULL) {
   910					sysfs_remove_group(&mddev->kobj, &md_redundancy_group);
   911					if (mddev->sysfs_action)
   912						sysfs_put(mddev->sysfs_action);
   913					if (mddev->sysfs_completed)
   914						sysfs_put(mddev->sysfs_completed);
   915					if (mddev->sysfs_degraded)
   916						sysfs_put(mddev->sysfs_degraded);
   917					mddev->sysfs_action = NULL;
   918					mddev->sysfs_completed = NULL;
   919					mddev->sysfs_degraded = NULL;
   920				}
   921			}
   922			mddev->sysfs_active = 0;
   923		} else
   924			mutex_unlock(&mddev->reconfig_mutex);
   925	
   926		md_wakeup_thread(mddev->thread);
   927		wake_up(&mddev->sb_wait);
   928	
   929		list_for_each_entry_safe(rdev, tmp, &delete, same_set) {
   930			list_del_init(&rdev->same_set);
   931			kobject_del(&rdev->kobj);
   932			export_rdev(rdev, mddev);
   933		}
   934	
   935		if (!legacy_async_del_gendisk) {
   936			/*
   937			 * Call del_gendisk after release reconfig_mutex to avoid
   938			 * deadlock (e.g. call del_gendisk under the lock and an
   939			 * access to sysfs files waits the lock)
   940			 * And MD_DELETED is only used for md raid which is set in
   941			 * do_md_stop. dm raid only uses md_stop to stop. So dm raid
   942			 * doesn't need to check MD_DELETED when getting reconfig lock
   943			 */
   944			if (test_bit(MD_DELETED, &mddev->flags) &&
 > 945				!test_and_set_bit(MD_DO_DELETE, &mddev->flags)
   946				del_gendisk(mddev->gendisk);
 > 947		}
   948	}
   949	EXPORT_SYMBOL_GPL(mddev_unlock);
   950	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
