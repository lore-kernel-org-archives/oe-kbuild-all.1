Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7551C1F4C8E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 13:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198380; cv=none; b=IA1GsZ8b7fNHr3CYNG9lxqAQtU5sr8c6hRaIu1tNtLac3qCGv0wAnm7O36EWdUJ7qPPy9ruollJPUuT+ZKJIrpMUXsb0bIabxO08JJGZm824cWXk1X2ymFLz0yLNvdNEBAGopbgDfn1svKrzjBSxwwXTP6zkaRAeDnPruM6fXTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198380; c=relaxed/simple;
	bh=/BxBVNvKEdv+1zgutG8bRndkxAwo+bzSs7eaMfWRxRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A2Uag0MC0lp/VKCtIvtFOZKoxbOg/fRa59BSgTrvLVUIgRNf9ee913KibfjDz9bJsuOQntUqKtmZoldpUr8SuBwa9DzZmt+rHdifI4tyacNA308mg9DhNizYrLchAZByM07iyV5Uyg/H1X3bVwZdd2nHlPqk5rbyJCo+3FfzekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+aBczbQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+aBczbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779198379; x=1810734379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/BxBVNvKEdv+1zgutG8bRndkxAwo+bzSs7eaMfWRxRc=;
  b=A+aBczbQi9TzqPu7Vj56siuXov2KtaTBZitAUO5hCcONpAeJJweOFRA1
   /Y2FE0nk3RVvaB0tVKFc08qWNWY4Dg6C5eIS2wnqzga+NYzISTreiGaH1
   j5xygikqVJXE0vHCQaDRsDEUo8pyabTMUfgIex9Nseayxa4EUX9z1pYqk
   ZQoNRbC301D9G3j39zcwRHG4QWn1ZcWUFWmfmfGe2p7gq2mk3UZPvWdB8
   XERccHV5pawscSaEStOrvKF2EbyOZv13PcnHZtuWn6ABv5h5YU66VoW6B
   u4qJUdXqiQrgNxeyYia5fFHXtI36b/FBWpaOFDq0o3XAaC5JR5SmzRE5L
   Q==;
X-CSE-ConnectionGUID: wI89JiD2QPe11CsAEKr5uA==
X-CSE-MsgGUID: WjoAbrUEQiu2z2V20to8+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80040783"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80040783"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 06:46:19 -0700
X-CSE-ConnectionGUID: T68GEFfgRsyuZ+jwDQ7HrQ==
X-CSE-MsgGUID: rAZ2Wu85Q6ibDilJUERhFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="277878839"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 19 May 2026 06:46:17 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPKly-00000000ADB-3yj8;
	Tue, 19 May 2026 13:46:14 +0000
Date: Tue, 19 May 2026 15:46:02 +0200
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>
Subject: [agd5f:drm-next 34/58]
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/amdgpu=5Fdm/tests/amd?=
 =?us-ascii?Q?gpu=5Fdm=5Fhdcp=5Ftest.c:46:9:?= error: implicit declaration
 of function 'process_output'
Message-ID: <202605191559.tcy5KGc1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   99cbcb3453b7d19cab507db9313ada9a38e82d01
commit: 911fa26656c2f68f1a2cc8e8f1dd80d99ae4403d [34/58] drm/amd/display: Add KUnit test for HDCP process_output
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260519/202605191559.tcy5KGc1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191559.tcy5KGc1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191559.tcy5KGc1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.c:163:6: warning: no previous prototype for 'process_output' [-Wmissing-prototypes]
     163 | void process_output(struct hdcp_workqueue *hdcp_work)
         |      ^~~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_hdcp_test.c: In function 'dm_test_process_output_property_validate_always_scheduled':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_hdcp_test.c:46:9: error: implicit declaration of function 'process_output' [-Wimplicit-function-declaration]
      46 |         process_output(work);
         |         ^~~~~~~~~~~~~~


vim +/process_output +46 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_hdcp_test.c

    35	
    36	/*
    37	 * process_output() always schedules property_validate_dwork with delay=0,
    38	 * which queues the work item directly (bypassing the timer).  Use
    39	 * work_pending() rather than delayed_work_pending() to detect this.
    40	 */
    41	static void dm_test_process_output_property_validate_always_scheduled(struct kunit *test)
    42	{
    43		struct hdcp_workqueue *work = alloc_test_workqueue(test);
    44	
    45		/* No flags set: only property_validate_dwork should be enqueued */
  > 46		process_output(work);
    47	
    48		KUNIT_EXPECT_TRUE(test, work_pending(&work->property_validate_dwork.work));
    49		KUNIT_EXPECT_FALSE(test, delayed_work_pending(&work->callback_dwork));
    50		KUNIT_EXPECT_FALSE(test, delayed_work_pending(&work->watchdog_timer_dwork));
    51	
    52		cancel_delayed_work_sync(&work->property_validate_dwork);
    53	}
    54	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
