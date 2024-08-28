Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3684864A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 03:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724815238; cv=none; b=AbsUKhnFxCc4ADdDmfoLzlRgIGoe8T89cTILdHbKEVt93PW0njoE6b87xjzOX541RuCiprpMkkCRAAmLEudmOrv46uUneI0WNO7wj6GQcNDuHLzG5HG0kow+JqlSpaf+uiK3hDGP2tK+IvR2h8jOMuH1YCntbNFgiWP6YbSe7MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724815238; c=relaxed/simple;
	bh=HvJjMVoeXzJcsa8qRTSkMFeVZYNus8Sf7Se56IboCf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tcFLTGQIOSTT3svS+WnT2/tddh3I0xIV2RIlmpipw4AhfG9TPgG5UcmuucFXCClsNsmsHgWMCI5KVLF5VnuS2C54c9NO5+I7q4n7LIbE8lqJU0/LuLRtI0yZGx42pHvVciptCbbNrBRoj/B66Kd9C4Yx5qGzzGJ9zIph4EkwK40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMmHuv0/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMmHuv0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724815236; x=1756351236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HvJjMVoeXzJcsa8qRTSkMFeVZYNus8Sf7Se56IboCf4=;
  b=nMmHuv0/ghP8NvCUwjZCEdNlhnN3jI1YTsdeBlrNpsplLn5jwXDLl3Q+
   cRHNVMhp0AdTMM0BwMsGNd1I4tOLzhc3sPypp4TVq5dHY8IUI3j29NlGa
   DQlZm9mlP6PndLvkRA21p7v8p8qcqeOVO0ylcTpW81BaWyejGyKibKuC3
   mRnrCQ3hrzN+oZHgRqKgaDmtyR2TGniqmivNxrj3EG1PI8KOgKDrlq2GD
   7W7GE50tUibNjb0ObpKSeKiirRsORNt7NG4zw4satgjFCJulNjQJhhHwI
   t+JkBvvzlE8BbCgVsXRy4ECX3gD1T4H3fF8huZm3fO65jyYXpHNnWAagz
   g==;
X-CSE-ConnectionGUID: S7CDrYJZTWSMCMLW7X/77Q==
X-CSE-MsgGUID: HPoKzLXzTCelPyi+0et1MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="48707508"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="48707508"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 20:20:35 -0700
X-CSE-ConnectionGUID: GIn+g6s+QZG93lNQkIY9qQ==
X-CSE-MsgGUID: vKWFAliCQ9O7JBrHgbsOpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="63120617"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Aug 2024 20:20:32 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj9EU-000KPw-07;
	Wed, 28 Aug 2024 03:20:30 +0000
Date: Wed, 28 Aug 2024 11:20:09 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9880/10950]
 kernel/tkernel/onionhook/hook_frame.c:49:6: warning: no previous prototype
 for function 'data_release'
Message-ID: <202408281150.Rheqx2le-lkp@intel.com>
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240828/202408281150.Rheqx2le-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281150.Rheqx2le-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281150.Rheqx2le-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/tkernel/onionhook/hook_frame.c:49:6: warning: no previous prototype for function 'data_release' [-Wmissing-prototypes]
      49 | void data_release(struct kref *ref)
         |      ^
   kernel/tkernel/onionhook/hook_frame.c:49:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      49 | void data_release(struct kref *ref)
         | ^
         | static 
   1 warning generated.
--
>> kernel/tkernel/aegis/module.c:15:6: warning: no previous prototype for function 'hook_disable' [-Wmissing-prototypes]
      15 | void hook_disable(void)
         |      ^
   kernel/tkernel/aegis/module.c:15:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      15 | void hook_disable(void)
         | ^
         | static 
>> kernel/tkernel/aegis/module.c:65:5: warning: no previous prototype for function 'hook_sysfs_init' [-Wmissing-prototypes]
      65 | int hook_sysfs_init(void)
         |     ^
   kernel/tkernel/aegis/module.c:65:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      65 | int hook_sysfs_init(void)
         | ^
         | static 
>> kernel/tkernel/aegis/module.c:80:6: warning: no previous prototype for function 'hook_sysfs_exit' [-Wmissing-prototypes]
      80 | void hook_sysfs_exit(void)
         |      ^
   kernel/tkernel/aegis/module.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      80 | void hook_sysfs_exit(void)
         | ^
         | static 
   3 warnings generated.
--
>> kernel/tkernel/aegis/list.c:20:15: warning: no previous prototype for function 'percpu_total_num' [-Wmissing-prototypes]
      20 | unsigned long percpu_total_num(long __percpu *num)
         |               ^
   kernel/tkernel/aegis/list.c:20:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      20 | unsigned long percpu_total_num(long __percpu *num)
         | ^
         | static 
>> kernel/tkernel/aegis/list.c:33:15: warning: no previous prototype for function 'percpu_total_num_atomic64' [-Wmissing-prototypes]
      33 | unsigned long percpu_total_num_atomic64(atomic64_t __percpu *num)
         |               ^
   kernel/tkernel/aegis/list.c:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      33 | unsigned long percpu_total_num_atomic64(atomic64_t __percpu *num)
         | ^
         | static 
>> kernel/tkernel/aegis/list.c:46:5: warning: no previous prototype for function 'clear_hookinfo_list' [-Wmissing-prototypes]
      46 | int clear_hookinfo_list(struct hook_info *info)
         |     ^
   kernel/tkernel/aegis/list.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      46 | int clear_hookinfo_list(struct hook_info *info)
         | ^
         | static 
>> kernel/tkernel/aegis/list.c:73:6: warning: no previous prototype for function 'clear_cpu_list' [-Wmissing-prototypes]
      73 | void clear_cpu_list(void)
         |      ^
   kernel/tkernel/aegis/list.c:73:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      73 | void clear_cpu_list(void)
         | ^
         | static 
>> kernel/tkernel/aegis/list.c:176:5: warning: no previous prototype for function 'hook_info_proc_create' [-Wmissing-prototypes]
     176 | int hook_info_proc_create(void)
         |     ^
   kernel/tkernel/aegis/list.c:176:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     176 | int hook_info_proc_create(void)
         | ^
         | static 
>> kernel/tkernel/aegis/list.c:206:6: warning: no previous prototype for function 'hook_info_proc_delete' [-Wmissing-prototypes]
     206 | void hook_info_proc_delete(void)
         |      ^
   kernel/tkernel/aegis/list.c:206:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     206 | void hook_info_proc_delete(void)
         | ^
         | static 
>> kernel/tkernel/aegis/list.c:211:5: warning: no previous prototype for function 'hook_info_percpu_create' [-Wmissing-prototypes]
     211 | int hook_info_percpu_create(void)
         |     ^
   kernel/tkernel/aegis/list.c:211:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     211 | int hook_info_percpu_create(void)
         | ^
         | static 
>> kernel/tkernel/aegis/list.c:254:5: warning: no previous prototype for function 'hook_info_percpu_delete' [-Wmissing-prototypes]
     254 | int hook_info_percpu_delete(void)
         |     ^
   kernel/tkernel/aegis/list.c:254:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     254 | int hook_info_percpu_delete(void)
         | ^
         | static 
>> kernel/tkernel/aegis/list.c:269:5: warning: no previous prototype for function 'hook_info_func_register' [-Wmissing-prototypes]
     269 | int hook_info_func_register(void)
         |     ^
   kernel/tkernel/aegis/list.c:269:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     269 | int hook_info_func_register(void)
         | ^
         | static 
>> kernel/tkernel/aegis/list.c:301:6: warning: no previous prototype for function 'init_wait_queue' [-Wmissing-prototypes]
     301 | void init_wait_queue(void)
         |      ^
   kernel/tkernel/aegis/list.c:301:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     301 | void init_wait_queue(void)
         | ^
         | static 
   10 warnings generated.
--
>> kernel/tkernel/aegis/hook_info.c:87:6: warning: no previous prototype for function 'hookinfo_total_numb' [-Wmissing-prototypes]
      87 | void hookinfo_total_numb(int type)
         |      ^
   kernel/tkernel/aegis/hook_info.c:87:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      87 | void hookinfo_total_numb(int type)
         | ^
         | static 
>> kernel/tkernel/aegis/hook_info.c:92:6: warning: no previous prototype for function 'hookinfo_drop_stats' [-Wmissing-prototypes]
      92 | void hookinfo_drop_stats(int type)
         |      ^
   kernel/tkernel/aegis/hook_info.c:92:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      92 | void hookinfo_drop_stats(int type)
         | ^
         | static 
>> kernel/tkernel/aegis/hook_info.c:97:6: warning: no previous prototype for function 'clear_task_environ' [-Wmissing-prototypes]
      97 | void clear_task_environ(struct exec_info *exec_info)
         |      ^
   kernel/tkernel/aegis/hook_info.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | void clear_task_environ(struct exec_info *exec_info)
         | ^
         | static 
>> kernel/tkernel/aegis/hook_info.c:114:5: warning: no previous prototype for function 'get_task_environ' [-Wmissing-prototypes]
     114 | int get_task_environ(struct exec_info *exec_info,
         |     ^
   kernel/tkernel/aegis/hook_info.c:114:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     114 | int get_task_environ(struct exec_info *exec_info,
         | ^
         | static 
>> kernel/tkernel/aegis/hook_info.c:200:5: warning: no previous prototype for function 'get_task_para' [-Wmissing-prototypes]
     200 | int get_task_para(int argc, struct user_arg_ptr *argv)
         |     ^
   kernel/tkernel/aegis/hook_info.c:200:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     200 | int get_task_para(int argc, struct user_arg_ptr *argv)
         | ^
         | static 
>> kernel/tkernel/aegis/hook_info.c:291:6: warning: no previous prototype for function 'get_pidns_inum' [-Wmissing-prototypes]
     291 | void get_pidns_inum(struct exec_info *exec_info)
         |      ^
   kernel/tkernel/aegis/hook_info.c:291:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     291 | void get_pidns_inum(struct exec_info *exec_info)
         | ^
         | static 
>> kernel/tkernel/aegis/hook_info.c:305:6: warning: no previous prototype for function 'get_task_ids' [-Wmissing-prototypes]
     305 | void get_task_ids(struct exec_info *exec_info)
         |      ^
   kernel/tkernel/aegis/hook_info.c:305:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     305 | void get_task_ids(struct exec_info *exec_info)
         | ^
         | static 
>> kernel/tkernel/aegis/hook_info.c:317:6: warning: no previous prototype for function 'get_task_pwd' [-Wmissing-prototypes]
     317 | void get_task_pwd(struct exec_info *exec_info)
         |      ^
   kernel/tkernel/aegis/hook_info.c:317:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     317 | void get_task_pwd(struct exec_info *exec_info)
         | ^
         | static 
>> kernel/tkernel/aegis/hook_info.c:340:6: warning: no previous prototype for function 'get_task_start_time' [-Wmissing-prototypes]
     340 | void get_task_start_time(struct exec_info *exec_info)
         |      ^
   kernel/tkernel/aegis/hook_info.c:340:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     340 | void get_task_start_time(struct exec_info *exec_info)
         | ^
         | static 
>> kernel/tkernel/aegis/hook_info.c:345:6: warning: no previous prototype for function 'info_ptr_hold_ref' [-Wmissing-prototypes]
     345 | void info_ptr_hold_ref(struct exec_info *exec_info)
         |      ^
   kernel/tkernel/aegis/hook_info.c:345:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     345 | void info_ptr_hold_ref(struct exec_info *exec_info)
         | ^
         | static 
>> kernel/tkernel/aegis/hook_info.c:607:5: warning: no previous prototype for function 'para_len_sum_handler' [-Wmissing-prototypes]
     607 | int para_len_sum_handler(struct ctl_table *table, int write,
         |     ^
   kernel/tkernel/aegis/hook_info.c:607:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     607 | int para_len_sum_handler(struct ctl_table *table, int write,
         | ^
         | static 
>> kernel/tkernel/aegis/hook_info.c:640:5: warning: no previous prototype for function 'secur_sysctl_handler' [-Wmissing-prototypes]
     640 | int secur_sysctl_handler(struct ctl_table *table, int write,
         |     ^
   kernel/tkernel/aegis/hook_info.c:640:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     640 | int secur_sysctl_handler(struct ctl_table *table, int write,
         | ^
         | static 
   12 warnings generated.


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
