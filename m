Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1779C2CA6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 20:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724790020; cv=none; b=JdG5RdA6tPWvYiM1Ks8xDyOVseHdbbiclx9M/9faXfjMmIYaB6cjnt+3RZnKFSv1ngyxxDIHru2Us6QW2Gu50brE6eHIn7bJU8istW24AGDd5eMWWjRG6BmWLV048TPtE+Eg+9y5evxYX0JnF/+0gTBOc/aUzmmxZ9vWgAT8mBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724790020; c=relaxed/simple;
	bh=EvCytNfkenwJP6eCoW5lc0XF6c3zg+SCegqnJBoKXHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UwkwCktZ+6aFKurusz0YAr2dNlLBg8tkLhcEjuJBaZub4fz7Cse3BdvaRdXUfxqa9iVD0FjbphKIe3wNNGh8nEruaEASBG4xrRyEDX2eQ7KIah1I8LldhrOL7YNQte6F+gjV7aiZX6jiqcWIdcUuaMeo0U4T4DXF2EGXAQ3+1Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EK20KZAg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EK20KZAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724790018; x=1756326018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EvCytNfkenwJP6eCoW5lc0XF6c3zg+SCegqnJBoKXHM=;
  b=EK20KZAg+/PZC2cMODYk8M7WFBxvrxOHOVY3nmlDJwkFqwWX9KOtGQTf
   +R3BWH1dm1yj0os3zQoYJY6YldqOnn4byyfzTbrZxq1gKYefceIPrzLj/
   AJvTIyCikRAPSfxE4agjWzeIxWixWHcOnwkOhe1T26RzHQYtHUhTBp2ct
   gWC9J2QpsSQa0wXvRpdeym+okpGPdB27CSTqD9mQIQsEoglqktP02cwKM
   kkSTnWrvB+w4VMc+qt069hBWEJspDmh2GehILjLRmUkgGeFNKlb5dISH8
   n9Nfzyfocxg6JSZv54I1ZmX1fYdeUyOhRaK8VRL6TqFHOd0lkti6E6LQ0
   Q==;
X-CSE-ConnectionGUID: G0vFQRXhTLyXh/88EavYGA==
X-CSE-MsgGUID: 9OaXFJNWTSyP0DcDlwGmFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34702447"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="34702447"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 13:20:17 -0700
X-CSE-ConnectionGUID: kwlwdVyKQvyMN/r+/NdwEw==
X-CSE-MsgGUID: p0gpK5PxQBirI/sVWE1Gog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="93703602"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Aug 2024 13:20:14 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj2fj-000K3A-1A;
	Tue, 27 Aug 2024 20:20:11 +0000
Date: Wed, 28 Aug 2024 04:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9880/10950]
 kernel/tkernel/onionhook/hook_frame.c:49:6: warning: no previous prototype
 for 'data_release'
Message-ID: <202408280457.KX18NHiB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   c99409f7fe0f14dae19af75e7e896e7a17b92946
commit: 62b6061f5714aa71e2d5fdb14db9d1341bb82dd4 [9880/10950] [PATCH] security: add security hook point
config: x86_64-oc_stream_base_config (https://download.01.org/0day-ci/archive/20240828/202408280457.KX18NHiB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280457.KX18NHiB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280457.KX18NHiB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/tkernel/onionhook/hook_frame.c:49:6: warning: no previous prototype for 'data_release' [-Wmissing-prototypes]
      49 | void data_release(struct kref *ref)
         |      ^~~~~~~~~~~~
--
>> kernel/tkernel/aegis/module.c:15:6: warning: no previous prototype for 'hook_disable' [-Wmissing-prototypes]
      15 | void hook_disable(void)
         |      ^~~~~~~~~~~~
>> kernel/tkernel/aegis/module.c:65:5: warning: no previous prototype for 'hook_sysfs_init' [-Wmissing-prototypes]
      65 | int hook_sysfs_init(void)
         |     ^~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/module.c:80:6: warning: no previous prototype for 'hook_sysfs_exit' [-Wmissing-prototypes]
      80 | void hook_sysfs_exit(void)
         |      ^~~~~~~~~~~~~~~
--
>> kernel/tkernel/aegis/list.c:20:15: warning: no previous prototype for 'percpu_total_num' [-Wmissing-prototypes]
      20 | unsigned long percpu_total_num(long __percpu *num)
         |               ^~~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/list.c:33:15: warning: no previous prototype for 'percpu_total_num_atomic64' [-Wmissing-prototypes]
      33 | unsigned long percpu_total_num_atomic64(atomic64_t __percpu *num)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/list.c:46:5: warning: no previous prototype for 'clear_hookinfo_list' [-Wmissing-prototypes]
      46 | int clear_hookinfo_list(struct hook_info *info)
         |     ^~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/list.c:73:6: warning: no previous prototype for 'clear_cpu_list' [-Wmissing-prototypes]
      73 | void clear_cpu_list(void)
         |      ^~~~~~~~~~~~~~
>> kernel/tkernel/aegis/list.c:176:5: warning: no previous prototype for 'hook_info_proc_create' [-Wmissing-prototypes]
     176 | int hook_info_proc_create(void)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/list.c:206:6: warning: no previous prototype for 'hook_info_proc_delete' [-Wmissing-prototypes]
     206 | void hook_info_proc_delete(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/list.c:211:5: warning: no previous prototype for 'hook_info_percpu_create' [-Wmissing-prototypes]
     211 | int hook_info_percpu_create(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/list.c:254:5: warning: no previous prototype for 'hook_info_percpu_delete' [-Wmissing-prototypes]
     254 | int hook_info_percpu_delete(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/list.c:269:5: warning: no previous prototype for 'hook_info_func_register' [-Wmissing-prototypes]
     269 | int hook_info_func_register(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/list.c:301:6: warning: no previous prototype for 'init_wait_queue' [-Wmissing-prototypes]
     301 | void init_wait_queue(void)
         |      ^~~~~~~~~~~~~~~
--
>> kernel/tkernel/aegis/hook_info.c:87:6: warning: no previous prototype for 'hookinfo_total_numb' [-Wmissing-prototypes]
      87 | void hookinfo_total_numb(int type)
         |      ^~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/hook_info.c:92:6: warning: no previous prototype for 'hookinfo_drop_stats' [-Wmissing-prototypes]
      92 | void hookinfo_drop_stats(int type)
         |      ^~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/hook_info.c:97:6: warning: no previous prototype for 'clear_task_environ' [-Wmissing-prototypes]
      97 | void clear_task_environ(struct exec_info *exec_info)
         |      ^~~~~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/hook_info.c:114:5: warning: no previous prototype for 'get_task_environ' [-Wmissing-prototypes]
     114 | int get_task_environ(struct exec_info *exec_info,
         |     ^~~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/hook_info.c:200:5: warning: no previous prototype for 'get_task_para' [-Wmissing-prototypes]
     200 | int get_task_para(int argc, struct user_arg_ptr *argv)
         |     ^~~~~~~~~~~~~
>> kernel/tkernel/aegis/hook_info.c:291:6: warning: no previous prototype for 'get_pidns_inum' [-Wmissing-prototypes]
     291 | void get_pidns_inum(struct exec_info *exec_info)
         |      ^~~~~~~~~~~~~~
>> kernel/tkernel/aegis/hook_info.c:305:6: warning: no previous prototype for 'get_task_ids' [-Wmissing-prototypes]
     305 | void get_task_ids(struct exec_info *exec_info)
         |      ^~~~~~~~~~~~
>> kernel/tkernel/aegis/hook_info.c:317:6: warning: no previous prototype for 'get_task_pwd' [-Wmissing-prototypes]
     317 | void get_task_pwd(struct exec_info *exec_info)
         |      ^~~~~~~~~~~~
>> kernel/tkernel/aegis/hook_info.c:340:6: warning: no previous prototype for 'get_task_start_time' [-Wmissing-prototypes]
     340 | void get_task_start_time(struct exec_info *exec_info)
         |      ^~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/hook_info.c:345:6: warning: no previous prototype for 'info_ptr_hold_ref' [-Wmissing-prototypes]
     345 | void info_ptr_hold_ref(struct exec_info *exec_info)
         |      ^~~~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/hook_info.c:607:5: warning: no previous prototype for 'para_len_sum_handler' [-Wmissing-prototypes]
     607 | int para_len_sum_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/aegis/hook_info.c:640:5: warning: no previous prototype for 'secur_sysctl_handler' [-Wmissing-prototypes]
     640 | int secur_sysctl_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/data_release +49 kernel/tkernel/onionhook/hook_frame.c

    48	
  > 49	void data_release(struct kref *ref)
    50	{
    51		struct security_moni_info *data = container_of(ref, struct security_moni_info, refcount);
    52	
    53		kfree(data);
    54	}
    55	EXPORT_SYMBOL(data_release);
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
