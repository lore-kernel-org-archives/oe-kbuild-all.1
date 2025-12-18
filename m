Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C70028489E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 16:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766076920; cv=none; b=akwCt01S/gopZPLsdXmipE9HDVzC0L2ZdK6qcGOwingzdnV85mP6s06LSoz4YYTAD0YnPla25zp+jbmFZEBzNtqtOGSiiVZ0Xtc4lxEcwPsauSpjbpFMAafiqQBaRCeE8SrxovWS4cxdBWfn4qyNl9jQbc9wsiT69k0uKTLZg9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766076920; c=relaxed/simple;
	bh=Tap2PN4ZECD/jSx2FLDhV2uXzYSFQYIZaOJ0DVO0grs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ShSs6CG/W1mdWHWKaJOrE97YfHjA9tHHTJh2mmgttW+uuKwsUURKnkPmuuP4T1MhDeIFxG3ADBE3HVua2AaVE+vejTg7oMQTZ4mmd/IcIMUrd2lmnh57yUlIUM+7gdFaJPpZi2OEjQHRus4IBc8hKqFdrxXSGIhooq7mU4W7mK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lu6fI1ts; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lu6fI1ts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766076918; x=1797612918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tap2PN4ZECD/jSx2FLDhV2uXzYSFQYIZaOJ0DVO0grs=;
  b=lu6fI1tsaFX6iKlHGt69cMNRmoRrKSVHbxL0Y0Bbqa6BL7gfRgypZ1YH
   jfwiBiyf+gj4aMvoNMV02rTZgFaZa26FC5rYcKECL++8luf/8NbGWSvh4
   xYDpkvpr//GUgLALwNXgTwK7FLde0/Ow76KjLSARAZavPkXee+9dHwjo6
   UNoqlZRWlSPbu9MaxTjtS+Th7OMuQeN14+KMg8UTATW3zsVr9RLtb/EEg
   gxbmGLvEd+OILzgYakcCiHSKkWN14hUW5k9XH+oTJKIsB2Tn1HNztyVpG
   5oYY63B3wN5xmyn0bGHRIWtsNOI8lxE43MuqEJs7CVpjD9VJbJ89CZXVr
   Q==;
X-CSE-ConnectionGUID: /s1vlrugSKqoLDkEdNXj3A==
X-CSE-MsgGUID: 9AYBzP4lQvaxEKmt1E10eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71886587"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="71886587"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 08:55:17 -0800
X-CSE-ConnectionGUID: +FyiMQk7SZ+wXydzK7uGjw==
X-CSE-MsgGUID: xYeSw5LJTGykMWOkAE2KVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="222051528"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 08:55:16 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWHHW-000000002L7-1H90;
	Thu, 18 Dec 2025 16:55:14 +0000
Date: Fri, 19 Dec 2025 00:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/4]
 kernel/stop_machine.c:384: warning: Function parameter or member 'done' not
 described in 'stop_one_cpu_async'
Message-ID: <202512190050.64I58AQg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: d9f0cedbafdc416f29e7a5b63e3d61caf3c7696c [0/4] ANDROID: stop_machine: stop_one_cpu_async
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251219/202512190050.64I58AQg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190050.64I58AQg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190050.64I58AQg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/stop_machine.c:384: warning: Function parameter or member 'done' not described in 'stop_one_cpu_async'


vim +384 kernel/stop_machine.c

   365	
   366	/**
   367	 * stop_one_cpu_async - stop a cpu and wait for completion in a separated
   368	 *			function: stop_wait_work()
   369	 * @cpu: cpu to stop
   370	 * @fn: function to execute
   371	 * @arg: argument to @fn
   372	 * @work_buf: pointer to cpu_stop_work structure
   373	 *
   374	 * CONTEXT:
   375	 * Might sleep.
   376	 *
   377	 * RETURNS:
   378	 * 0 if cpu_stop_work was queued successfully and @fn will be called.
   379	 * ENOENT if @fn(@arg) was not executed because @cpu was offline.
   380	 */
   381	int stop_one_cpu_async(unsigned int cpu, cpu_stop_fn_t fn, void *arg,
   382			       struct cpu_stop_work *work_buf,
   383			       struct cpu_stop_done *done)
 > 384	{
   385		cpu_stop_init_done(done, 1);
   386	
   387		work_buf->done = done;
   388		work_buf->fn = fn;
   389		work_buf->arg = arg;
   390	
   391		if (cpu_stop_queue_work(cpu, work_buf))
   392			return 0;
   393	
   394		work_buf->done = NULL;
   395	
   396		return -ENOENT;
   397	}
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
