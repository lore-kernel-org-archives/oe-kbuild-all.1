Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE0224DCE5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 13:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754312953; cv=none; b=WH8CK2ukPm8q8Ub+i7lQVZqDGw8EkF0Wu3xC84Umc5pzhWAvyXHvt2qUHGq3O5TFitjmdk2pDw+W88vCAuBv/Yo8nZs0kziE6SHYa6FQ2Fy4vPMw1kzEJGOqVlSC4gMPR8je2caHzPf/laCQJ44DSyNhF1kppdIsKTvQ9EYBhn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754312953; c=relaxed/simple;
	bh=ekt5EbJsxUTptoEG0vjHN2V1TrxKFKBOYAKh+sxrUBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QeR3XFx1qq5AJftb6YIzVUN12w6x4zVP6FM95CsPcO7SfIpJ449FKGz1qmDTp2JDWG5qm5hk+zMCRYEW1usRl4p5ttRE+QsB1MzOaX7Ug0dZVoQQLQ+wUVX38BHl12E0PP4xwMxAmPMnh96Re7iqi3qANwoI1c116llv0Wgib/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qh0Yxixm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qh0Yxixm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754312952; x=1785848952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ekt5EbJsxUTptoEG0vjHN2V1TrxKFKBOYAKh+sxrUBg=;
  b=Qh0Yxixm2XGTIsr8fUQQC9T6Q0hpdQwOxx8OwMlU7Epre1hQEZBomf4k
   sp42kubV1KxKhi8Nm52t3AT+Oy6rnKJ8LD+fPhAZhf8cJayWmjBUbu2F3
   rbWTUWhlk7Xqa8yZxaXucawUtY62oNnMwL2zYQNcez23yAhNMLe+QssOM
   yHmRdmzxvIUIR9vb1i1bzn0zq3cG2wQhCjAyjHmu6lRGoex55t+VPHYvE
   qUO8im46D6Oi6h/ryAuZHX+HBdXekWvR5QRYrAgJSEtRVmpxz6pGOlY4A
   vW485f3XGKvkNpnXTVjeq8aUP0uxecb61w5qplzm7oQtokTckoMFc4MCH
   A==;
X-CSE-ConnectionGUID: 40eyxHI6QxylUG9gF+z2vA==
X-CSE-MsgGUID: 4xLl/GmYSZea+AfYrjwiHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56719820"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56719820"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 06:09:11 -0700
X-CSE-ConnectionGUID: H0p1ow49Q2aVEJ6jTBqJKw==
X-CSE-MsgGUID: 9e4/eRFqSC2y71JJu1hwBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169548335"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 04 Aug 2025 06:09:10 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiuw7-0001nT-1F;
	Mon, 04 Aug 2025 13:09:07 +0000
Date: Mon, 4 Aug 2025 15:08:42 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743]
 kernel/trace/bpf_trace.c:1273:5: warning: no previous prototype for
 'bpf_event_notify'
Message-ID: <202508041528.hcdsgsEh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ba07135cf74b1424e2f7f0c60e59c5b206ab320c
commit: 00d0f1b149a5201c072e868915c76f909c11c38f [1743/1743] bpf: support raw tracepoints in modules
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250804/202508041528.hcdsgsEh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041528.hcdsgsEh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041528.hcdsgsEh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/bpf_trace.c:1273:5: warning: no previous prototype for 'bpf_event_notify' [-Wmissing-prototypes]
    1273 | int bpf_event_notify(struct notifier_block *nb, unsigned long op, void *module)
         |     ^~~~~~~~~~~~~~~~
>> kernel/trace/bpf_trace.c:1312:12: warning: no previous prototype for 'bpf_event_init' [-Wmissing-prototypes]
    1312 | int __init bpf_event_init(void)
         |            ^~~~~~~~~~~~~~


vim +/bpf_event_notify +1273 kernel/trace/bpf_trace.c

  1271	
  1272	#ifdef CONFIG_MODULES
> 1273	int bpf_event_notify(struct notifier_block *nb, unsigned long op, void *module)
  1274	{
  1275		struct bpf_trace_module *btm, *tmp;
  1276		struct module *mod = module;
  1277	
  1278		if (mod->num_bpf_raw_events == 0 ||
  1279		    (op != MODULE_STATE_COMING && op != MODULE_STATE_GOING))
  1280			return 0;
  1281	
  1282		mutex_lock(&bpf_module_mutex);
  1283	
  1284		switch (op) {
  1285		case MODULE_STATE_COMING:
  1286			btm = kzalloc(sizeof(*btm), GFP_KERNEL);
  1287			if (btm) {
  1288				btm->module = module;
  1289				list_add(&btm->list, &bpf_trace_modules);
  1290			}
  1291			break;
  1292		case MODULE_STATE_GOING:
  1293			list_for_each_entry_safe(btm, tmp, &bpf_trace_modules, list) {
  1294				if (btm->module == module) {
  1295					list_del(&btm->list);
  1296					kfree(btm);
  1297					break;
  1298				}
  1299			}
  1300			break;
  1301		}
  1302	
  1303		mutex_unlock(&bpf_module_mutex);
  1304	
  1305		return 0;
  1306	}
  1307	
  1308	static struct notifier_block bpf_module_nb = {
  1309		.notifier_call = bpf_event_notify,
  1310	};
  1311	
> 1312	int __init bpf_event_init(void)
  1313	{
  1314		register_module_notifier(&bpf_module_nb);
  1315		return 0;
  1316	}
  1317	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
