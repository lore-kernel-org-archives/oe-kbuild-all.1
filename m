Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6E21A38DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 01:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710466977; cv=none; b=Ro+KAtwxCnnZbruQDzfIlhjvhsMzFhdOfUvpFVnnKGFiMJl9fSX/mYodaL4wwgpndlXn7jqg9eeTD/X4DRcTg0DD1dJIFdZ2LJ8lkkb2n3j2D5C6CVcH+YXEXyOTAdNjyP5QNMcCiK9k9Bm0q1mjIXhFYLeVXM6OR8VNF6V2RwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710466977; c=relaxed/simple;
	bh=pphOd1xOP+3LhMuFVvJSMMfc4KEueKPxEtlbOBmHjjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MLMsviMBUjCBG55+MHaBAqMCfF3N3ZmMJUuZb8rIRJX6UecVWq9tUG8GFAvT8HXTNhQK8JDtys1bJT+fTVaCb5O3VdcvA8QFt6Gb1x3++l5TG28UaNR1Jv3C4dKNsD04bP7TKn5GaAoBp1OD93/JKmwksm8wBAYNtbHiPYqsA7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPkIehxG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPkIehxG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710466975; x=1742002975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pphOd1xOP+3LhMuFVvJSMMfc4KEueKPxEtlbOBmHjjk=;
  b=RPkIehxGIpvCbVpNNnLMWdmbZJLhGgpUAiMl/EOHM+l0yBPEjDh3YuS/
   6EBAClUobXVWK5OvfT0X8WnDJSG3sBRRhcdhtZ0/+Pro1bzZey7wsdsoO
   w2nnut6wjECKKG4Lfxtw7NjFLoZp5QRd2nvjWP5Ka2EWXs6U/XjhOqDzP
   tyh8J9ZBbjthk1ur+5H6Ml8BIKDsmEwqSYeITkMrelWd//fuCBpliNJ1b
   J3Fv2vKvk2QsiACFCJ5i3gw8QBZOGeJc0/y2Dh+am3AlGXBXWb95KD8zo
   NArvZO/E5AJ876XMvBRcd9Sk3+e2TVFoV3DoV6OPChI/O/UycU81aJQ3v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="8259431"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="8259431"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 18:42:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="12576771"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Mar 2024 18:42:51 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkwav-000Dxv-0f;
	Fri, 15 Mar 2024 01:42:49 +0000
Date: Fri, 15 Mar 2024 09:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26634/27507] kernel/signal.c:3637:29:
 warning: variable 'p' set but not used
Message-ID: <202403150909.f3GpR6w1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: ccae92c345b515d8124a565b3cb5cc7b5df9c691 [26634/27507] rue/mm: memory expedite reclaim mechanism for memory QoS
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240315/202403150909.f3GpR6w1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403150909.f3GpR6w1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403150909.f3GpR6w1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/signal.c: In function '__do_sys_kill':
>> kernel/signal.c:3637:29: warning: variable 'p' set but not used [-Wunused-but-set-variable]
    3637 |         struct task_struct *p;
         |                             ^


vim +/p +3637 kernel/signal.c

  3628	
  3629	/**
  3630	 *  sys_kill - send a signal to a process
  3631	 *  @pid: the PID of the process
  3632	 *  @sig: signal to be sent
  3633	 */
  3634	SYSCALL_DEFINE2(kill, pid_t, pid, int, sig)
  3635	{
  3636		struct kernel_siginfo info;
> 3637		struct task_struct *p;
  3638		int ret;
  3639	
  3640		prepare_kill_siginfo(sig, &info);
  3641	
  3642		ret = kill_something_info(sig, &info, pid);
  3643		if (!ret) {
  3644			rcu_read_lock();
  3645			p = find_task_by_vpid(pid);
  3646	#ifdef CONFIG_FAIR_GROUP_SCHED
  3647			if (p)
  3648				exp_thread_group_exit(p);
  3649	#endif
  3650			rcu_read_unlock();
  3651		}
  3652		return ret;
  3653	}
  3654	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
