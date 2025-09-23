Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB6421348
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 21:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758664773; cv=none; b=U64Lb5p+/T+QhK1sIR8lna0wJvkD88lVo2TEFUn6bIHxOWjlZDE+X2OaHelqx3N2V+3k96S2EVbbsrbse+jfV4t7geL9CaACT7F4xXpSiZk+Q8DwWXZf+HbK1hJQwseOLZvOmIh3BX8s0z4//TZFfjeqQ1w4vuV7hqzwASe3c24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758664773; c=relaxed/simple;
	bh=/NhHP9uoHjk5qhUTBefoU77NtaWX7lLxUqHS35Zz1Os=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A1mRXPKLlVmbZttxm5quGs6Dztn5xm6Dn0OA+xdusRwEbuzh0ud4Yb/yqs0ZHXn+szcfxI5O8ypjAyv97YESyFRf/wQUkJ9TPnDN6u8T+FEG7dFoYj9MHDzyC5NMOBnTuPt497mxJPynhbBFd3wVDc8+I4OluLsx2JCTzpvO69I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLsjOqu4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLsjOqu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758664772; x=1790200772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/NhHP9uoHjk5qhUTBefoU77NtaWX7lLxUqHS35Zz1Os=;
  b=PLsjOqu4sVfCzkszKwzJetuFPq8Crgl1EmfPaj8bSTY9Fo6ynUg4SrBh
   ush2SZ7Pea1FGHqGXO6YQQrUi16Gt2pxGIrGo3G2NOCr3PIRwx3T3lnl8
   4+HOKZrI5n6HLf8z77GDNbs8A19BASpESQD2iiLf2vTZ5rcyw6Lmnfp49
   0qJ99g4W9BEn7mvoFGpawW6hfqwV+g1nYki7QGNK92tOzt9KsvkrdLTNJ
   LRlE4fByDEjRpsb0HyIYYJ57RlVEnk4KssnBW44TPXpLSMA+RAnMuLWc7
   JytfUot6D0yh/78pY0hH0Hc1FTCSrKpL4OKc0qg02sDo2FUkrFFBAPV5o
   Q==;
X-CSE-ConnectionGUID: 9f1xLk5mQJ+YZXa2MXuvsA==
X-CSE-MsgGUID: m8RIIUE5RuGr7HQO0ZfzMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61066356"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="61066356"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 14:59:31 -0700
X-CSE-ConnectionGUID: H5MS6BP4Tr+miLEf9Y7YtA==
X-CSE-MsgGUID: KVmUVl7gRXu01TBvTVN7wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="176953563"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Sep 2025 14:59:30 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1B2l-0003a5-0g;
	Tue, 23 Sep 2025 21:59:27 +0000
Date: Wed, 24 Sep 2025 05:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 7/7]
 drivers/usb/typec/mode_selection.c:110:17: error: implicit declaration of
 function 'kfree'
Message-ID: <202509240551.evrU4m7h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   fb36873b20e70f9ad9a76e4a405cd7142e4dbc01
commit: f49f8d90b43e2a0aa7a011c88529f38c409fbf0b [7/7] ANDROID: usb: typec: Implement mode selection
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250924/202509240551.evrU4m7h-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240551.evrU4m7h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240551.evrU4m7h-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/typec/mode_selection.c: In function 'mode_list_clean':
>> drivers/usb/typec/mode_selection.c:110:17: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     110 |                 kfree(ms);
         |                 ^~~~~
   drivers/usb/typec/mode_selection.c: In function 'mode_add_to_list':
>> drivers/usb/typec/mode_selection.c:261:30: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     261 |                         ms = kzalloc(sizeof(struct mode_state), GFP_KERNEL);
         |                              ^~~~~~~
>> drivers/usb/typec/mode_selection.c:261:28: error: assignment to 'struct mode_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     261 |                         ms = kzalloc(sizeof(struct mode_state), GFP_KERNEL);
         |                            ^
   drivers/usb/typec/mode_selection.c: In function 'typec_mode_selection_start':
>> drivers/usb/typec/mode_selection.c:292:13: error: assignment to 'struct altmode_selection *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     292 |         sel = kzalloc(sizeof(struct altmode_selection), GFP_KERNEL);
         |             ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +/kfree +110 drivers/usb/typec/mode_selection.c

   103	
   104	static void mode_list_clean(struct altmode_selection *sel)
   105	{
   106		struct mode_state *ms, *tmp;
   107	
   108		list_for_each_entry_safe(ms, tmp, &sel->mode_list, list) {
   109			list_del(&ms->list);
 > 110			kfree(ms);
   111		}
   112	}
   113	
   114	/**
   115	 * mode_selection_next() - Process mode selection results and schedule next
   116	 * action
   117	 * @sel: pointer to the altmode_selection structure
   118	 * @ms: pointer to active mode_state object that is on top in
   119	 * mode_list.
   120	 *
   121	 * The mutex protecting mode_list must be held by the caller when invoking this
   122	 * function.
   123	 *
   124	 * This function evaluates the outcome of the previous mode entry or exit
   125	 * attempt. Based on this result, it determines the next mode to process and
   126	 * schedules `mode_selection_work_fn()` if further actions are required.
   127	 *
   128	 * If the previous mode entry was successful, the mode selection sequence is
   129	 * considered complete.
   130	 *
   131	 * If the previous mode entry failed, this function schedules
   132	 * `mode_selection_work_fn()` to attempt exiting the mode that was partially
   133	 * activated but not fully entered.
   134	 *
   135	 * If the previous operation was an exit (after a failed entry attempt),
   136	 * the internal list of candidate modes is advanced to determine the next mode
   137	 * to enter.
   138	 */
   139	static void mode_selection_next(struct altmode_selection *sel,
   140		struct mode_state *ms, const int error)
   141	
   142		__must_hold(&sel->mode_list_lock)
   143	{
   144		if (ms->state == MS_STATE_FAILED) {
   145			list_del(&ms->list);
   146			kfree(ms);
   147		} else if (error) {
   148			ms->state = MS_STATE_FAILED;
   149			dev_dbg(&sel->partner->dev, "%s: entry error %pe\n",
   150					ms->altmode->desc, ERR_PTR(error));
   151		} else {
   152			dev_dbg(&sel->partner->dev, "%s altmode is active\n", ms->altmode->desc);
   153			mode_list_clean(sel);
   154		}
   155	
   156		if (!list_empty(&sel->mode_list))
   157			schedule_delayed_work(&sel->mode_selection_work,
   158				msecs_to_jiffies(sel->delay));
   159	}
   160	
   161	void typec_altmode_entry_complete(struct typec_altmode *altmode,
   162					const int error)
   163	{
   164		const struct typec_altmode *pdev = typec_altmode_get_partner(altmode);
   165		struct altmode_selection *sel;
   166		struct mode_state *ms;
   167	
   168		if (!pdev)
   169			return;
   170		sel = to_typec_partner(pdev->dev.parent)->sel;
   171	
   172		mutex_lock(&sel->mode_list_lock);
   173	
   174		ms = list_first_entry_or_null(&sel->mode_list, struct mode_state, list);
   175		if (ms) {
   176			if (ms->altmode->svid == altmode->svid &&
   177				ms->state == MS_STATE_INPROGRESS) {
   178				cancel_delayed_work(&sel->mode_selection_work);
   179				mode_selection_next(sel, ms, error);
   180			}
   181		}
   182	
   183		mutex_unlock(&sel->mode_list_lock);
   184	}
   185	EXPORT_SYMBOL_GPL(typec_altmode_entry_complete);
   186	
   187	/**
   188	 * mode_selection_work_fn() - Activate entry into the upcoming mode
   189	 * @work: work structure
   190	 *
   191	 * This function works in conjunction with `mode_selection_next()`.
   192	 * It attempts to activate the next mode in the selection sequence.
   193	 *
   194	 * If the mode activation fails, `mode_selection_next()` will be called to
   195	 * initiate a new selection cycle.
   196	 *
   197	 * Otherwise, the state is set to MS_STATE_INPROGRESS, and
   198	 * `mode_selection_work_fn()` is scheduled for a subsequent entry after a timeout
   199	 * period. The alternate mode driver is expected to call back with the actual
   200	 * mode entry result. Upon this callback, `mode_selection_next()` will determine
   201	 * the subsequent mode and re-schedule `mode_selection_work_fn()`.
   202	 */
   203	static void mode_selection_work_fn(struct work_struct *work)
   204	{
   205		struct altmode_selection *sel = container_of(work, struct altmode_selection,
   206							  mode_selection_work.work);
   207		struct mode_state *ms;
   208		int error = 0;
   209	
   210		mutex_lock(&sel->mode_list_lock);
   211	
   212		ms = list_first_entry_or_null(
   213			&sel->mode_list, struct mode_state, list);
   214		if (ms) {
   215			if (ms->state == MS_STATE_IDLE) {
   216				error = ms->altmode->ops->activate(ms->altmode, 1);
   217	
   218				if (!error) {
   219					ms->state = MS_STATE_INPROGRESS;
   220					schedule_delayed_work(&sel->mode_selection_work,
   221						msecs_to_jiffies(sel->timeout));
   222					goto unlock_and_exit;
   223				}
   224	
   225				dev_dbg(&sel->partner->dev, "%s: activation error %pe\n",
   226						ms->altmode->desc, ERR_PTR(error));
   227				ms->state = MS_STATE_FAILED;
   228			} else if (ms->state == MS_STATE_FAILED)
   229				error = ms->altmode->ops->activate(ms->altmode, 0);
   230			else
   231				error = -ETIMEDOUT;
   232	
   233			mode_selection_next(sel, ms, error);
   234		}
   235	
   236	unlock_and_exit:
   237		mutex_unlock(&sel->mode_list_lock);
   238	}
   239	
   240	static int compare_priorities(void *priv,
   241		const struct list_head *a, const struct list_head *b)
   242	{
   243		struct mode_state *msa = container_of(a, struct mode_state, list);
   244		struct mode_state *msb = container_of(b, struct mode_state, list);
   245	
   246		if (msa->priority < msb->priority)
   247			return -1;
   248		return 1;
   249	}
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
