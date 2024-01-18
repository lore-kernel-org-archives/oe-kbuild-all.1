Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A43B1844
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 01:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705541130; cv=none; b=GY/JMcX6asXEV18Ic5l/aRMaaKCH85MYjHSeLFIsGRnkZkpvUX7zM4lsUAu3PhSerpRuZ8RyODuR4SHvgW2ZGTzchYiJuejtdP9s2o5FUS4eceP5bZ7fNQtE1IUckcwTbMaqEsxPRihuPRiJNdDp0uAyp3CyaUCb4Wi+TePGI8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705541130; c=relaxed/simple;
	bh=rBT6yxncZ2hDr9lSPCHurJlG3D/wI4B2i5apTn58zpo=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition; b=toLWEU2IocKzxTFlsIyqvl2c1pJrQq2IDHJLILEVtrGBifyN0r3TdwTFWOC0tcIRYxubhFY/k7OzLhNXWFIQzxN/yjexc0dy1NL75dJZrlgm31EyL/NW6a2U+YNW3geC4L1iWX/K5zyZBblZvIE+QmkeX4Ug1kgKK8DGF9UcUBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsJo3Xzf; arc=none smtp.client-ip=192.55.52.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsJo3Xzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705541125; x=1737077125;
  h=date:from:cc:subject:message-id:mime-version;
  bh=rBT6yxncZ2hDr9lSPCHurJlG3D/wI4B2i5apTn58zpo=;
  b=MsJo3XzfdW08DTlpcDPE8vU4OI3XxIFwv34U4rQ62/96O+xDxRGidJqX
   txQMrz20N4w8O0b97kcBPxvnxs4C4f5o8j3j0ckbmRv/OR1xwwcEV2eup
   VeeZiy10jqu2HTqE5DcBhYp9k2+p4Y3pu1x5MTXNWszuiU09EZPFIV+2U
   1tDqKu/nCLIxb6MIpS+rnn3y5PU4sWUILf0DTmFPx5wlFKP/GYmSTUeGs
   29c0OKc7p/rByjpMgsdV9m+zrnol3Y+LoF8h8PaG7gNdPfYPf9HiOO+f8
   IFhwNt1RVPfRWyREIEjEpVxqjg6Eq56ALgZligJVAvH0wg7OQaYOh9qRI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="486469696"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="486469696"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 17:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1031501854"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="1031501854"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jan 2024 17:25:23 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQH9l-0002U8-2B
	for oe-kbuild-all@lists.linux.dev;
	Thu, 18 Jan 2024 01:25:21 +0000
Date: Thu, 18 Jan 2024 09:25:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 6736/9999] kernel/audit.c:2409:
 warning: Function parameter or member 'task' not described in
 'audit_set_contid'
Message-ID: <202401180931.YaUdiUU3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: e97c9a30072a51c17c54b6c23614fbdeeff33e47 [6736/9999] BACKPORT: FROMLIST: audit: add container id
config: i386-randconfig-001-20240117 (https://download.01.org/0day-ci/archive/20240118/202401180931.YaUdiUU3-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180931.YaUdiUU3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180931.YaUdiUU3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/audit.c: In function 'audit_log_vformat':
   kernel/audit.c:1924:2: warning: function 'audit_log_vformat' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     len = vsnprintf(skb_tail_pointer(skb), avail, fmt, args);
     ^~~
   kernel/audit.c:1933:3: warning: function 'audit_log_vformat' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      len = vsnprintf(skb_tail_pointer(skb), avail, fmt, args2);
      ^~~
>> kernel/audit.c:2409: warning: Function parameter or member 'task' not described in 'audit_set_contid'


vim +2409 kernel/audit.c

  2399	
  2400	/**
  2401	 * audit_set_contid - set current task's audit contid
  2402	 * @contid: contid value
  2403	 *
  2404	 * Returns 0 on success, -EPERM on permission failure.
  2405	 *
  2406	 * Called (set) from fs/proc/base.c::proc_contid_write().
  2407	 */
  2408	int audit_set_contid(struct task_struct *task, u64 contid)
> 2409	{
  2410		u64 oldcontid;
  2411		int rc = 0;
  2412		struct audit_buffer *ab;
  2413		uid_t uid;
  2414		struct tty_struct *tty;
  2415		char comm[sizeof(current->comm)];
  2416	
  2417		task_lock(task);
  2418		/* Can't set if audit disabled */
  2419		if (!task->audit) {
  2420			task_unlock(task);
  2421			return -ENOPROTOOPT;
  2422		}
  2423		oldcontid = audit_get_contid(task);
  2424		read_lock(&tasklist_lock);
  2425		/* Don't allow the audit containerid to be unset */
  2426		if (!audit_contid_valid(contid))
  2427			rc = -EINVAL;
  2428		/* if we don't have caps, reject */
  2429		else if (!capable(CAP_AUDIT_CONTROL))
  2430			rc = -EPERM;
  2431		/* if task has children or is not single-threaded, deny */
  2432		else if (!list_empty(&task->children))
  2433			rc = -EBUSY;
  2434		else if (!(thread_group_leader(task) && thread_group_empty(task)))
  2435			rc = -EALREADY;
  2436		read_unlock(&tasklist_lock);
  2437		if (!rc)
  2438			task->audit->contid = contid;
  2439		task_unlock(task);
  2440	
  2441		if (!audit_enabled)
  2442			return rc;
  2443	
  2444		ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_CONTAINER_OP);
  2445		if (!ab)
  2446			return rc;
  2447	
  2448		uid = from_kuid(&init_user_ns, task_uid(current));
  2449		tty = audit_get_tty(current);
  2450		audit_log_format(ab,
  2451				 "op=set opid=%d contid=%llu old-contid=%llu pid=%d uid=%u auid=%u tty=%s ses=%u",
  2452				 task_tgid_nr(task), contid, oldcontid,
  2453				 task_tgid_nr(current), uid,
  2454				 from_kuid(&init_user_ns, audit_get_loginuid(current)),
  2455				 tty ? tty_name(tty) : "(none)",
  2456				 audit_get_sessionid(current));
  2457		audit_put_tty(tty);
  2458		audit_log_task_context(ab);
  2459		audit_log_format(ab, " comm=");
  2460		audit_log_untrustedstring(ab, get_task_comm(comm, current));
  2461		audit_log_d_path_exe(ab, current->mm);
  2462		audit_log_format(ab, " res=%d", !rc);
  2463		audit_log_end(ab);
  2464		return rc;
  2465	}
  2466	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
