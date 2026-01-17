Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728AB2AE77
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 01:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768612114; cv=none; b=TqViM/iWj5uVcia0WaY+aBusKTr/qTz4ZBHhJSTRxDnuv8fu9ystoCPmnPEC1Br0dsNTbx+Man6BeFmoPHEXyQ+Fb/9u8ifsr6mIw3qqsCofFLj9m0fAF0NflyuXzYT0mGitWAfSrIlFEKM+v5n28+H5TrtjAN+qlZp7FMVidiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768612114; c=relaxed/simple;
	bh=xS8Vmuoyn0BEzxS4CrkGyeon95d5dRG6hQ1F43B3+Y0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rDzcwY3IaJdMb6EckRvkqz7POkpYGLn/98vkXsmOTx+Savaf8ZG8k1kM1jX6N0m58Bqcx17P9MChyKmN52E45LwkKJCankHMA8etaQK4H+0KUYKHmxY0LCspY6DTHWXNxQxqVHaEzBb0yjllh/XEHraek5xZeLMnSSG81tV2nrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQUN/6SW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQUN/6SW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768612113; x=1800148113;
  h=date:from:to:cc:subject:message-id;
  bh=xS8Vmuoyn0BEzxS4CrkGyeon95d5dRG6hQ1F43B3+Y0=;
  b=OQUN/6SWLMjXeDy7DyLGpBCqVGmZgUD922fym7D9NB3ZCOdXNl7RhHzG
   AB9mDvp/JL0B4WTBktdTc4GSXq5bmip+ayI0W88KoUVEgxdVbwY7QE1BF
   dOYtpVnQH5+lX3076icC4+n8VERlIp05F+LRlreSIOQ5vBZHt+oWrXpoc
   uR2pgd5N0kmuqPzo6oLj1LGFCTAmlviHRy0j7nq8KtGINajfskePgtWR9
   TJPG1B5sy/bFgptDYxT9l7NgQwBOuEnPwCuDJVmdnmMYsOq4Z2XuBwzli
   HGXDzWpjPES+Qr4vKWB4yQWO4bQVKq9DY7VI2f4aBhPhvucJu+zv1OvVm
   w==;
X-CSE-ConnectionGUID: hSnCc6oGRXGZkMRa0gWVog==
X-CSE-MsgGUID: kRf65RtNT+uiam3tyqSJSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69830112"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="69830112"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 17:08:32 -0800
X-CSE-ConnectionGUID: MTfsNFVnQdqTqieK9X3MDQ==
X-CSE-MsgGUID: /zrcKNGmReG/pOetuuB89w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="236065611"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jan 2026 17:08:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgunk-00000000LPE-0dCg;
	Sat, 17 Jan 2026 01:08:28 +0000
Date: Sat, 17 Jan 2026 09:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/usb/typec/mode_selection.c:38: warning: Excess struct member 'enter'
 description in 'mode_state'
Message-ID: <202601170929.rSJwnrf4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Andrei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   84595e7cd483e40c6b65961e7ffdc2b89af11413
commit: f49f8d90b43e2a0aa7a011c88529f38c409fbf0b [1/1] ANDROID: usb: typec: Implement mode selection
config: x86_64-randconfig-161-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170929.rSJwnrf4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170929.rSJwnrf4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170929.rSJwnrf4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/mode_selection.c:38: warning: Excess struct member 'enter' description in 'mode_state'
>> drivers/usb/typec/mode_selection.c:143: warning: Function parameter or struct member 'error' not described in 'mode_selection_next'
>> drivers/usb/typec/mode_selection.c:285: warning: Function parameter or struct member 'delay' not described in 'typec_mode_selection_start'
>> drivers/usb/typec/mode_selection.c:285: warning: Function parameter or struct member 'timeout' not described in 'typec_mode_selection_start'


vim +38 drivers/usb/typec/mode_selection.c

    23	
    24	/**
    25	 * struct mode_state - State tracking for a specific Type-C mode
    26	 * @altmode:
    27	 * @priority: The mode priority. Lower values indicate a more preferred mode
    28	 * @enter: Flag indicating if the driver is currently attempting to enter or
    29	 * exit the mode
    30	 * @state: The current mode selection state
    31	 * @list: List head to link this mode state into a prioritized list
    32	 */
    33	struct mode_state {
    34		struct typec_altmode *altmode;
    35		u8 priority;
    36		enum ms_state state;
    37		struct list_head list;
  > 38	};
    39	
    40	struct altmode_selection {
    41		struct list_head mode_list;
    42		struct mutex mode_list_lock;
    43		struct delayed_work mode_selection_work;
    44		struct typec_partner *partner;
    45	
    46		unsigned int timeout;
    47		unsigned int delay;
    48	};
    49	
    50	static int increment_duplicated_priority(struct device *dev, void *data)
    51	{
    52		if (is_typec_altmode(dev)) {
    53			struct typec_altmode **alt_target = (struct typec_altmode **)data;
    54			struct typec_altmode *alt = to_typec_altmode(dev);
    55	
    56			if (alt != *alt_target && alt->priority == (*alt_target)->priority) {
    57				alt->priority++;
    58				*alt_target = alt;
    59				return 1;
    60			}
    61		}
    62		return 0;
    63	}
    64	
    65	static int find_duplicated_priority(struct device *dev, void *data)
    66	{
    67		if (is_typec_altmode(dev)) {
    68			struct typec_altmode **alt_target = (struct typec_altmode **)data;
    69			struct typec_altmode *alt = to_typec_altmode(dev);
    70	
    71			if (alt != *alt_target && alt->priority == (*alt_target)->priority)
    72				return 1;
    73		}
    74		return 0;
    75	}
    76	
    77	int typec_mode_set_priority(struct typec_altmode *alt, const u8 priority)
    78	{
    79		struct typec_port *port = to_typec_port(alt->dev.parent);
    80		const u8 old_priority = alt->priority;
    81		int res = 1;
    82	
    83		alt->priority = priority;
    84		while (res) {
    85			res = device_for_each_child(&port->dev, &alt, find_duplicated_priority);
    86			if (res) {
    87				alt->priority++;
    88				if (alt->priority == 0) {
    89					alt->priority = old_priority;
    90					return -EOVERFLOW;
    91				}
    92			}
    93		}
    94	
    95		res = 1;
    96		alt->priority = priority;
    97		while (res)
    98			res = device_for_each_child(&port->dev, &alt,
    99					increment_duplicated_priority);
   100	
   101		return 0;
   102	}
   103	
   104	static void mode_list_clean(struct altmode_selection *sel)
   105	{
   106		struct mode_state *ms, *tmp;
   107	
   108		list_for_each_entry_safe(ms, tmp, &sel->mode_list, list) {
   109			list_del(&ms->list);
   110			kfree(ms);
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
 > 143	{
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
