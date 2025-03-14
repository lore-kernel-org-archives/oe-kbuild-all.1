Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF90D530
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 01:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741917261; cv=none; b=BSoZjYofJKNlXIjdh97URfyfhQyDN9olaRKS1SfEKDxJK2kSOB2k4qeRl/N5y1OlcCkzcDCRS8aNPWFv2sBi712FO3MVW8rRE0b00MAFVEk7x6c/pSR8sHdxmNA9uUGusJiPYjPfPSxJPpt/Slt0s0gX8VTBAN+E19GONcBGt6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741917261; c=relaxed/simple;
	bh=d6UedEBxlYw29JZkLkLO68fPare5RDy4oG92I2lYui8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BQff3nNniVsHexsIrXS7j2EBKcBk30wSwaT/+ySgF3jJI8aBhyL29ket4E3stpriJn81y23S6yiisunOLqVUeSj9VTe1Bo6W6rbrrEScTjNvamUs/zMzRUfUZdL9K4Xc6MQD68a+1smeMRDoyW4ifujY9k3pCdQsGQgXkoFaklo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWAx6blM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWAx6blM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741917259; x=1773453259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d6UedEBxlYw29JZkLkLO68fPare5RDy4oG92I2lYui8=;
  b=bWAx6blMxORMWLkqSnGKZWzt1XojeVEx/kU1X8hnH4GXBaD5AQA6uMeu
   VuFVXtEFXqBsbTyW4TkbknbV9ZL192YEjpuxMUTAyoKPZFyM17KKNLLLf
   qhfLn6Auq38WLCWu05HlVuLMF0IO58q8srNKrrPsu/pgPHqondhmlmwxH
   QZFBrz55De1/kSwqV7QO08VhYaAmKoR6wUAAiUk8OneA5Ya+Tra4P4mb5
   do1QN72vLh5umQuW7PHe5nNSjQMjZ4GOj+SWNsGp7ElA+7tRUG1Sd0suY
   CcCl325Zgn1wK5L0FF6Q8xz5SPmwGnN7/4JdCPyHRDZNyNx/P3PlEPY7n
   Q==;
X-CSE-ConnectionGUID: xh2aDacDQp+Lk6eeCEtJOA==
X-CSE-MsgGUID: dYvqTANkRZ2QZL2+kaH9RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54433746"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="54433746"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 18:54:18 -0700
X-CSE-ConnectionGUID: C4kh3GfnTQ6zpiA9g9lQ6g==
X-CSE-MsgGUID: wGboTCjtQoebKeKmMeH3wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126199192"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 13 Mar 2025 18:54:17 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsuFb-000A4a-24;
	Fri, 14 Mar 2025 01:54:15 +0000
Date: Fri, 14 Mar 2025 09:53:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 3/3] fs/fs-writeback.c:138:6:
 warning: no previous prototype for 'wb_wakeup'
Message-ID: <202503140959.QKcmQiug-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   ca5266bc32d9bcf538401ef062b30e072e28c88a
commit: 55cf94258af72fd493779ab2b7a4278d5c8d1d21 [3/3] ANDROID: writeback: export symbols to do a hierarchical writeback control
config: arm-randconfig-002-20250314 (https://download.01.org/0day-ci/archive/20250314/202503140959.QKcmQiug-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503140959.QKcmQiug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503140959.QKcmQiug-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fs-writeback.c:138:6: warning: no previous prototype for 'wb_wakeup' [-Wmissing-prototypes]
     138 | void wb_wakeup(struct bdi_writeback *wb)
         |      ^~~~~~~~~
>> fs/fs-writeback.c:1349:6: warning: no previous prototype for 'redirty_tail_locked' [-Wmissing-prototypes]
    1349 | void redirty_tail_locked(struct inode *inode, struct bdi_writeback *wb)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/wb_wakeup +138 fs/fs-writeback.c

   137	
 > 138	void wb_wakeup(struct bdi_writeback *wb)
   139	{
   140		spin_lock_irq(&wb->work_lock);
   141		if (test_bit(WB_registered, &wb->state))
   142			mod_delayed_work(bdi_wq, &wb->dwork, 0);
   143		spin_unlock_irq(&wb->work_lock);
   144	}
   145	EXPORT_SYMBOL_GPL(wb_wakeup);
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
