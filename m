Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B427F3CCFA6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 07:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779868240; cv=none; b=ht+iNQoHc0yNko7OzomFOya40ZAJ78g9RpeD817YztXXEMj7v4AkGaY2Aw9UexdLGC1Zj72dRXY3POzpvtMAL0OJcz62sABblRPZrltEmnn12eNhlL6/bIXh9IgmMKvLRAIzKpNPjhOVlLdYPdx0gUzTW2jJ1moykRGK2PByT8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779868240; c=relaxed/simple;
	bh=CblEkSuzOoHVnc2YZSVlOLArlRdciNMSXVPNstdxEt4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KZz1MJjS6zjcuMPwdqbYbOjsg7bU/ytbOgeOxS2ZZU9cfi4Mww0fWHavfp95yPniOd/jwYYIv/eA9WK/VZhXylu0mAYmhenL3kgg1xj/23HxRWlqJSm3rJA99axWHr8WbTsCSJX/l3+LBPoK8nkTdezh/VIxayNH6qv3pMQgFGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSNlznsF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSNlznsF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779868237; x=1811404237;
  h=date:from:to:cc:subject:message-id;
  bh=CblEkSuzOoHVnc2YZSVlOLArlRdciNMSXVPNstdxEt4=;
  b=RSNlznsFb0FaguwBTzqr/J+Q7WhoABN+olU0wMpspg2Pkk97K1ckkQUP
   n9O4PNnfmBH7H6iiJ6ZHxhy1q32SaoSed5DJki6IgB4WUVzMfp5ulPLgt
   5jk9+ro6H24SUKNn3SjjNMuLN8BGyuz1ica7tCLVOBpCAuRUOFb3DBP20
   6PMqh99QYXDlD08aonumvZJNMv5OCpwkrNikMoYglHnU8e0yejwEvhkvI
   X8WtQnTi4RfVWh6PswBLZn7rm7Ijxbdl8ZTeDnyrKehH17kP6coMM5YCj
   qwPG04fFmbydnSrXaJcBfZ64CL0Z/TF1fre05W1esYOuNFwNs7qW6IKWo
   g==;
X-CSE-ConnectionGUID: tEDPuUmLSBy+OPcXvOWbHA==
X-CSE-MsgGUID: a/HDpBp+QOyMTrRs5TV1/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91381891"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="91381891"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 00:50:37 -0700
X-CSE-ConnectionGUID: al6PgYY3RXO5vmTsPxAXGg==
X-CSE-MsgGUID: tGCt7KGFS8GTAGaX77T+hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="247235963"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 May 2026 00:50:35 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS929-000000003cg-0SOR;
	Wed, 27 May 2026 07:50:33 +0000
Date: Wed, 27 May 2026 15:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 28/28]
 drivers/usb/typec/mode_selection.c:261:7: warning: assignment to 'struct
 mode_state *' from 'int' makes pointer from integer without a cast
Message-ID: <202605271521.9fR1378b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Andrei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   d82d1c962ed8d8ed693448d27aa42a88c54f438d
commit: f49f8d90b43e2a0aa7a011c88529f38c409fbf0b [28/28] ANDROID: usb: typec: Implement mode selection
config: arm-randconfig-003-20260527 (https://download.01.org/0day-ci/archive/20260527/202605271521.9fR1378b-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271521.9fR1378b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271521.9fR1378b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/typec/mode_selection.c: In function 'mode_list_clean':
   drivers/usb/typec/mode_selection.c:110:3: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     110 |   kfree(ms);
         |   ^~~~~
   drivers/usb/typec/mode_selection.c: In function 'mode_add_to_list':
   drivers/usb/typec/mode_selection.c:261:9: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     261 |    ms = kzalloc(sizeof(struct mode_state), GFP_KERNEL);
         |         ^~~~~~~
>> drivers/usb/typec/mode_selection.c:261:7: warning: assignment to 'struct mode_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     261 |    ms = kzalloc(sizeof(struct mode_state), GFP_KERNEL);
         |       ^
   drivers/usb/typec/mode_selection.c: In function 'typec_mode_selection_start':
>> drivers/usb/typec/mode_selection.c:292:6: warning: assignment to 'struct altmode_selection *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     292 |  sel = kzalloc(sizeof(struct altmode_selection), GFP_KERNEL);
         |      ^
   cc1: some warnings being treated as errors


vim +261 drivers/usb/typec/mode_selection.c

   250	
   251	static int mode_add_to_list(struct device *dev, void *data)
   252	{
   253		struct list_head *list = (struct list_head *)data;
   254		struct mode_state *ms;
   255	
   256		if (is_typec_altmode(dev)) {
   257			struct typec_altmode *altmode = to_typec_altmode(dev);
   258			const struct typec_altmode *pdev = typec_altmode_get_partner(altmode);
   259	
   260			if (pdev && altmode->ops && altmode->ops->activate) {
 > 261				ms = kzalloc(sizeof(struct mode_state), GFP_KERNEL);
   262				if (!ms)
   263					return -ENOMEM;
   264	
   265				ms->altmode = altmode;
   266				ms->priority = pdev->priority;
   267				INIT_LIST_HEAD(&ms->list);
   268				list_add_tail(&ms->list, list);
   269			}
   270		}
   271	
   272		return 0;
   273	}
   274	
   275	/**
   276	 * typec_mode_selection_start() - Starts the mode selection process.
   277	 * @partner: pointer to the partner structure
   278	 *
   279	 * This function populates mode_list with pointers to
   280	 * `struct mode_state` instances. The sequence is prioritized
   281	 * according to the port's settings.
   282	 */
   283	int typec_mode_selection_start(struct typec_partner *partner,
   284		const unsigned int delay, const unsigned int timeout)
   285	{
   286		int ret;
   287		struct altmode_selection *sel;
   288	
   289		if (partner->sel)
   290			return -EALREADY;
   291	
 > 292		sel = kzalloc(sizeof(struct altmode_selection), GFP_KERNEL);
   293		if (!sel)
   294			return -ENOMEM;
   295	
   296		INIT_LIST_HEAD(&sel->mode_list);
   297		ret = device_for_each_child(
   298			&partner->dev, &sel->mode_list, mode_add_to_list);
   299	
   300		if (ret) {
   301			mode_list_clean(sel);
   302			return ret;
   303		}
   304	
   305		if (!list_empty(&sel->mode_list)) {
   306			partner->sel = sel;
   307			sel->partner = partner;
   308			sel->delay = delay;
   309			sel->timeout = timeout;
   310	
   311			list_sort(NULL, &sel->mode_list, compare_priorities);
   312			mutex_init(&sel->mode_list_lock);
   313			INIT_DELAYED_WORK(&sel->mode_selection_work, mode_selection_work_fn);
   314			schedule_delayed_work(&sel->mode_selection_work,
   315				msecs_to_jiffies(delay));
   316		}
   317	
   318		return 0;
   319	}
   320	EXPORT_SYMBOL_GPL(typec_mode_selection_start);
   321	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
