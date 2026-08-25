Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADD048C8AF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 17:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787680524; cv=none; b=VM4t/ZWE3hX6YWh/GgazDKCpEJpidBBOVqtxlaC3g4ZrDVLsPEEw7w6THflmQdzJToMD5C0JNY5aAdUWdQx13yaCZOAA4M/t9IfPFTJoM0MdDYHcTZ/uI8yOoVOLHEG1Fv11ns4BeTDNGa5ng3vvLor0/yHm3Li/giYXRw5SlzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787680524; c=relaxed/simple;
	bh=qUM5+Db4ms8imXOgcOv7lO8c4aJZfcjpfk7LFx1XVro=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NeoLuCwCScWZNzkVi2COarNwF5rT5DeekrjFNaZTJJERaZ9CtnFCAieHdnNEe79ue2qHJ6/Kio9iAhD77vpGarJXnQYeW6A6E0wSR6xNG56EIPbZJ/orMVrqMFv+YcrQ6fDW7QmtiS0OBDDoa9QiMhOq9NFpEvNaTPvWxyvdLbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4HBJ+25; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4HBJ+25"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787680522; x=1819216522;
  h=date:from:to:cc:subject:message-id;
  bh=qUM5+Db4ms8imXOgcOv7lO8c4aJZfcjpfk7LFx1XVro=;
  b=C4HBJ+25Zo/ABJ+JGGy76K29IdefcFcsla4uNMY7LL3QeWXXowS8oDFd
   ucZh5ZNIYyrgLtJgnJGgrXHKlFczyaD6z/VtTLoSJQjy9JpjN3vIHzoGL
   TfU0HOz7tZro58+fqrIsWLxB9VWKOtmE4EL/HOB/PQWbvU/Ma3hlb4lXW
   rXVVnULbAGyrGPtIVDdjn4vVh5OJ/7Y7XdEMB9NnmdbVUuwmQCt6xc5vj
   +kvu4rnEG4a2+VwfPvVbUdyX2vuDvutfuTWqrM9Q/qSRgMF3Ia+OF9bHZ
   Q6xxcjH8GkSHrawTdBEt01e6VP2Lv4tMpDqUTSxY3s/7ZH2y8iAvLNSuO
   Q==;
X-CSE-ConnectionGUID: DZ+FRjDEQ1Kky5grY5hugg==
X-CSE-MsgGUID: mVolDGW9RjCiYGFKMBpo6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88211887"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="88211887"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 10:55:21 -0700
X-CSE-ConnectionGUID: hLDXzledTEGj7sUCVEXgiw==
X-CSE-MsgGUID: Uv++N0kIQdGkAnmybn9spw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="272588205"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Aug 2026 10:55:20 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyvMj-000000006CZ-3UBM;
	Tue, 25 Aug 2026 17:55:17 +0000
Date: Wed, 26 Aug 2026 01:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/android/binder.c:7476:6: warning: no previous prototype for
 'binder_remove_trace_events'
Message-ID: <202608260139.rDJMqSuB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alice,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e8191d2503961aad2d6a0184db0c9cd1a0660e97
commit: 43c26111cafa87d81570c63d96c497e13ec883da [1/1] ANDROID: binder: unload C Binder trace events
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260826/202608260139.rDJMqSuB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260826/202608260139.rDJMqSuB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608260139.rDJMqSuB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/android/binder.c:7476:6: warning: no previous prototype for 'binder_remove_trace_events' [-Wmissing-prototypes]
    7476 | void binder_remove_trace_events(struct module *module)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder.c:7502:5: warning: no previous prototype for 'unload_binder' [-Wmissing-prototypes]
    7502 | int unload_binder(void)
         |     ^~~~~~~~~~~~~
--
>> kernel/trace/trace_events.c:2807:6: warning: no previous prototype for 'remove_event_from_tracers' [-Wmissing-prototypes]
    2807 | void remove_event_from_tracers(struct trace_event_call *call)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/binder_remove_trace_events +7476 drivers/android/binder.c

  7475	
> 7476	void binder_remove_trace_events(struct module *module)
  7477	{
  7478		struct trace_event_call *call, *tmp;
  7479		const char *name;
  7480	
  7481		mutex_lock(&event_mutex);
  7482		mutex_lock(&trace_types_lock);
  7483		down_write(&trace_event_sem);
  7484		list_for_each_entry_safe(call, tmp, &ftrace_events, list) {
  7485			name = trace_event_name(call);
  7486			if (!name || strncmp(name, "binder_", 7))
  7487				continue;
  7488			if (call->module != module)
  7489				continue;
  7490			remove_event_from_tracers(call);
  7491			list_del_init(&call->list);
  7492		}
  7493		up_write(&trace_event_sem);
  7494		mutex_unlock(&trace_types_lock);
  7495		mutex_unlock(&event_mutex);
  7496	}
  7497	EXPORT_SYMBOL_GPL(binder_remove_trace_events);
  7498	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
