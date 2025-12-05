Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394D22D321B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 13:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764940739; cv=none; b=JXKQ84DbatzS4mWI2tCai69VUheGaf1o5qjflYcG/Tk3K+dUytPEci0CtxsVBN1dxvZIkdtp050C4L/7pSbJmOjHovb8K6p1gUUE9CyOg9najk3koiY8UD1YzV3ExOyWi6KdLGwe8JdiSen8QId0eDp9n/wlhk4wICY7NlPLOgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764940739; c=relaxed/simple;
	bh=7mbESpfFa/8K1RdGNT3ZEnG1zCohky2mnxorDVpfpPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=caOCufNqgKPEEGgNUNK9FPQfmYtUc/o+UUl28qskC2mt98JWa+j4O+9vk/E8zh4CovU8DpTShkMsp39fiLL28g+f57XMPGn+1c95L45A8azQkH2gsvgzjByY/3gBoH0z8sFMuagSW9v5UsLlu3K3j7BJF0pXzB7W/IEOPjQrqDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqAUo33x; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqAUo33x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764940734; x=1796476734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7mbESpfFa/8K1RdGNT3ZEnG1zCohky2mnxorDVpfpPU=;
  b=CqAUo33xg/56pVkB03Feo+zRv6WaxZ1LJlaInV8GkrpZ0RKHgegu7W9u
   NHhRwToWW6jd1qTvNACXE8E3ndAQWMUGepMeu7CdHr0lzti1NWR7VISor
   JxmmnUjS5pXhjJfd14zSq2DuFN9VgZcC6w9FRbgDhRPEd1153PumdCVEf
   yZ3xwtbxV5HL2JqhZ4BgiWvxjOtJZrusMnK0w/wkSkkbQPokMYvD5NAQl
   +Yi0flpv/8sU/p2SBD9ztC7Nblm2I57Xh451ZYtFkiFcBw6hoJT/fCOT8
   gUlvhrAdpPZtoolg9smJuc8PGJbpVRPsXcQe6vmHIHqrzG4dYl9MTD+33
   w==;
X-CSE-ConnectionGUID: Lo1FU7nzRt2//S9fV5cMfw==
X-CSE-MsgGUID: eZY6GVmGSnqI7oY6J6VNcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70824196"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="70824196"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 05:18:50 -0800
X-CSE-ConnectionGUID: ls2ta+rdQtegzh/cRUiiQA==
X-CSE-MsgGUID: 3+l0ZZQ1T2OMW0q2sKn+RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="195216205"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Dec 2025 05:18:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRVhu-00000000F1V-0i81;
	Fri, 05 Dec 2025 13:18:46 +0000
Date: Fri, 5 Dec 2025 21:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, c00514209 <chenwen54@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3479/3479]
 drivers/ub/urma/ubcore/ubcore_device.c:323:1: warning: no previous prototype
 for 'ubcore_find_mue_device_legacy'
Message-ID: <202512052152.oJkyjVVl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: b303cf2411a212c47f1dc4616f77ea9ae016696d [3479/3479] ubcore: add genl, netlink and vtp support to ubcore module.
config: arm64-randconfig-r061-20251205 (https://download.01.org/0day-ci/archive/20251205/202512052152.oJkyjVVl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512052152.oJkyjVVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512052152.oJkyjVVl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_device.c:323:1: warning: no previous prototype for 'ubcore_find_mue_device_legacy' [-Wmissing-prototypes]
     323 | ubcore_find_mue_device_legacy(enum ubcore_transport_type type)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1194:5: warning: no previous prototype for 'ubcore_register_device' [-Wmissing-prototypes]
    1194 | int ubcore_register_device(struct ubcore_device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1261:6: warning: no previous prototype for 'ubcore_unregister_device' [-Wmissing-prototypes]
    1261 | void ubcore_unregister_device(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1301:6: warning: no previous prototype for 'ubcore_stop_requests' [-Wmissing-prototypes]
    1301 | void ubcore_stop_requests(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1354:5: warning: no previous prototype for 'ubcore_dispatch_event' [-Wmissing-prototypes]
    1354 | int ubcore_dispatch_event(struct ubcore_event *event)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1388:6: warning: no previous prototype for 'ubcore_dispatch_async_event' [-Wmissing-prototypes]
    1388 | void ubcore_dispatch_async_event(struct ubcore_event *event)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1820:25: warning: no previous prototype for 'ubcore_get_eid_list' [-Wmissing-prototypes]
    1820 | struct ubcore_eid_info *ubcore_get_eid_list(struct ubcore_device *dev,
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:1872:6: warning: no previous prototype for 'ubcore_free_eid_list' [-Wmissing-prototypes]
    1872 | void ubcore_free_eid_list(struct ubcore_eid_info *eid_list)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:2010:6: warning: no previous prototype for 'ubcore_net_exit' [-Wmissing-prototypes]
    2010 | void ubcore_net_exit(struct net *net)
         |      ^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:2111:6: warning: no previous prototype for 'ubcore_dispatch_mgmt_event' [-Wmissing-prototypes]
    2111 | void ubcore_dispatch_mgmt_event(struct ubcore_mgmt_event *event)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c: In function 'ubcore_register_device':
   drivers/ub/urma/ubcore/ubcore_device.c:474:35: warning: array subscript 4 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     474 |      cap->max_tp_cnt < g_ht_params[UBCORE_HT_TP].size)
         |                        ~~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:415:31: note: while referencing 'g_ht_params'
     415 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:475:14: warning: array subscript 4 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     475 |   g_ht_params[UBCORE_HT_TP].size = cap->max_tp_cnt;
         |   ~~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:415:31: note: while referencing 'g_ht_params'
     415 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:477:36: warning: array subscript 5 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     477 |      cap->max_tpg_cnt < g_ht_params[UBCORE_HT_TPG].size)
         |                         ~~~~~~~~~~~^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:415:31: note: while referencing 'g_ht_params'
     415 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:478:14: warning: array subscript 5 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     478 |   g_ht_params[UBCORE_HT_TPG].size = cap->max_tpg_cnt;
         |   ~~~~~~~~~~~^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:415:31: note: while referencing 'g_ht_params'
     415 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:446:13: warning: array subscript 6 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     446 |  g_ht_params[UBCORE_HT_RM_VTP].size = vtp_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:415:31: note: while referencing 'g_ht_params'
     415 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:447:13: warning: array subscript 7 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     447 |  g_ht_params[UBCORE_HT_RC_VTP].size = vtp_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:415:31: note: while referencing 'g_ht_params'
     415 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:448:13: warning: array subscript 8 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     448 |  g_ht_params[UBCORE_HT_UM_VTP].size = vtp_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:415:31: note: while referencing 'g_ht_params'
     415 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:455:13: warning: array subscript 9 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     455 |  g_ht_params[UBCORE_HT_RM_VTPN].size = vtpn_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:415:31: note: while referencing 'g_ht_params'
     415 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:456:13: warning: array subscript 10 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     456 |  g_ht_params[UBCORE_HT_RC_VTPN].size = vtpn_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:415:31: note: while referencing 'g_ht_params'
     415 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:457:13: warning: array subscript 11 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     457 |  g_ht_params[UBCORE_HT_UM_VTPN].size = vtpn_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:415:31: note: while referencing 'g_ht_params'
     415 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:458:13: warning: array subscript 12 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     458 |  g_ht_params[UBCORE_HT_CP_VTPN].size = vtpn_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:415:31: note: while referencing 'g_ht_params'
     415 | static struct ubcore_ht_param g_ht_params[] = {
         |                               ^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:459:13: warning: array subscript 14 is above array bounds of 'struct ubcore_ht_param[4]' [-Warray-bounds]
     459 |  g_ht_params[UBCORE_HT_VTPN].size = vtpn_size;
         |  ~~~~~~~~~~~^~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_device.c:415:31: note: while referencing 'g_ht_params'
--
>> drivers/ub/urma/ubcore/ubcore_vtp.c:170:6: warning: no previous prototype for 'ubcore_add_vtp_work_list' [-Wmissing-prototypes]
     170 | void ubcore_add_vtp_work_list(struct ubcore_vtp_work *vtp_work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_vtp.c:177:6: warning: no previous prototype for 'ubcore_del_vtp_work_list' [-Wmissing-prototypes]
     177 | void ubcore_del_vtp_work_list(struct ubcore_vtp_work *vtp_work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/ub/urma/ubcore/ubcore_msg.c:206:1: warning: no previous prototype for 'ubcore_asyn_send_ue2mue_msg' [-Wmissing-prototypes]
     206 | ubcore_asyn_send_ue2mue_msg(struct ubcore_device *dev, struct ubcore_req *req)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/ubcore_find_mue_device_legacy +323 drivers/ub/urma/ubcore/ubcore_device.c

   321	
   322	struct ubcore_device *
 > 323	ubcore_find_mue_device_legacy(enum ubcore_transport_type type)
   324	{
   325		if (g_ub_mue == NULL) {
   326			ubcore_log_info("mue is not registered yet\n");
   327			return NULL;
   328		}
   329	
   330		if (g_ub_mue->transport_type != type) {
   331			ubcore_log_info("mue of tran type:%d, not registered yet\n",
   332					(int)type);
   333			return NULL;
   334		}
   335	
   336		ubcore_get_device(g_ub_mue);
   337		return g_ub_mue;
   338	}
   339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
