Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EAB38DEC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 00:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766362994; cv=none; b=enwfHd/8dv4PgUz+OcgUOw/i4kiS3xWOGZsrVjSi+brsN/68JexETbqcrzJzqpveG2DRNJU5u3ndPgeBFLZUwJK7iHoeCstdonCDGK4VEHZhiVsCxsBD5GeGDgrG6mnbTodt7tBecgZbobgETcR6KZMD4CIXDyihPggdHHD+WwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766362994; c=relaxed/simple;
	bh=s8vWacWSmnci+8DJBQC4FNct7rj3aoCb9Vy2kDuaVCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PR16ZQyk/7sQmSlPMROgg/lrf91tagJQpNqpaeVJt2g1j4ChSO2Hev7O12gqXD9RNPI0US3BzOwtyw31H+O1OdVsp4AYjudYtpJKwi6AMfbu1loOwQpK/lQOaZ1vRFI0B/QWMMTtdLHJXJcvPafZVa5r4+DuZPVF3YCGDwl+w+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ee30Ok6B; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ee30Ok6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766362992; x=1797898992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s8vWacWSmnci+8DJBQC4FNct7rj3aoCb9Vy2kDuaVCM=;
  b=Ee30Ok6BaX4Rh1HMbJfg+OzrOWIDTF7v+YrI+6nxglHEAWHENUPDvJHt
   AmsZTiGQA3PzipbkZvDBpcBjJPxwVD/0wCFcMlTjcdgGt1h+TcdwtilLX
   u26/DY1OFa6g+3WMcFV+UnFeXh+GnPSvPbX/5VMEGDyEGhSSz1zC6zVbc
   tyUDgLClBdDgotPPNJbdBis/8yAWOEkT4mA0ZVqHiHPbHt9oZrycGHKks
   oGrsRztfwRfA5DmpG+bdXO6DikMAkvV/JktRlU8zawHjnZQmnauxlC2AE
   BsJcWdCJto7oNJMndeFmtf7akssjIOIce1uqKiP1EFci0Bo3biYZyQd0E
   g==;
X-CSE-ConnectionGUID: RW5lv6fzRsiGfwlHkxrT/w==
X-CSE-MsgGUID: knMO3nOkTzyCjMM9pqWLfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67218120"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="67218120"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 16:23:11 -0800
X-CSE-ConnectionGUID: 0uztbY2zRGyWvbghDQsp0g==
X-CSE-MsgGUID: ooPWp/eFSe+yfmpaz6NVvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="204455344"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 21 Dec 2025 16:23:11 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXThc-000000005Hw-0Qgt;
	Mon, 22 Dec 2025 00:23:08 +0000
Date: Mon, 22 Dec 2025 01:23:05 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 5/5]
 kernel/trace/trace_events.c:2807:6: warning: no previous prototype for
 'remove_event_from_tracers'
Message-ID: <202512220136.0m7wDjsW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   54e1389bda8399711722cd321abe212a2327e9a3
commit: 43c26111cafa87d81570c63d96c497e13ec883da [5/5] ANDROID: binder: unload C Binder trace events
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251222/202512220136.0m7wDjsW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220136.0m7wDjsW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220136.0m7wDjsW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_events.c:2807:6: warning: no previous prototype for 'remove_event_from_tracers' [-Wmissing-prototypes]
    2807 | void remove_event_from_tracers(struct trace_event_call *call)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/remove_event_from_tracers +2807 kernel/trace/trace_events.c

  2806	
> 2807	void remove_event_from_tracers(struct trace_event_call *call)
  2808	{
  2809		struct trace_event_file *file;
  2810		struct trace_array *tr;
  2811	
  2812		do_for_each_event_file_safe(tr, file) {
  2813			if (file->event_call != call)
  2814				continue;
  2815	
  2816			remove_event_file_dir(file);
  2817			/*
  2818			 * The do_for_each_event_file_safe() is
  2819			 * a double loop. After finding the call for this
  2820			 * trace_array, we use break to jump to the next
  2821			 * trace_array.
  2822			 */
  2823			break;
  2824		} while_for_each_event_file();
  2825	}
  2826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
