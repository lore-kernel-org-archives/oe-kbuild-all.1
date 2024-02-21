Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FC58528F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 18:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708540050; cv=none; b=c1b+58nujmegYHKf30rkPh7xHykRzBQQusZEaMB4Er6f6bGkq4U7Fwa/q2gJDS5DSXYHTgr1VC950AHKyderuHpDr4eWyLkboNHpOIpttuftjo/gR9nJb/rQlgCRWzmQ6yvsR7fM56+XopF8kNJG8s5HwBO+qSDYIhyu+EFK32w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708540050; c=relaxed/simple;
	bh=EEarxAWYPeyQK+fI2YDqDaNQcx05SdyCt5V6ZqWBZ/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZSaKloQgMK9JuyhYB32nlCh1Sw83VO+wtu1ptM+vb6OTjwxEYEtsPxj08pprJOZeWqT+hKall7wjf/eIQG0wdoCkddaZXnKU19t+bGKJ3qnQgnCapzz1dQ4/AvC7v3u2W4BCTCNnFRRA6TY6hjNqhh/XIng2+/gsnvbkSA1gl3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R98q5LfJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R98q5LfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708540049; x=1740076049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EEarxAWYPeyQK+fI2YDqDaNQcx05SdyCt5V6ZqWBZ/Q=;
  b=R98q5LfJsYzccL4kLYrUaa/+0p+/UzzjV5EKyf9gvBOy/Z0bhw9lqmEp
   9HinqfwfBpaJiLWnVlDZ6myE2sgKfhcDV+3D1UtACMDBCqBkZufo8Czud
   TPcDYJGp8jtwjnIjMI4PhzQKlem8JZeUC6kOnf0p6vQGfMQAbfcJ3+nLN
   U6OPKLMVlLb1Q2jEWAYLWjL9nzqczz/ffLsGjKQrxgtY8tl+bsvJaiuTD
   1zzZrII+GQZ9rXmajZhBPwQiYNZjeP0ptSAXf8wwfJ72/KNpm7VVjcVME
   3eyI/ssq8aGp8wdRnsJUOuGfoK8tDamqplgE1Zyl+fBXnSgamfFq1TC31
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13341737"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="13341737"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 10:27:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="28357649"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Feb 2024 10:27:25 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcrJ0-0005ag-2T;
	Wed, 21 Feb 2024 18:27:03 +0000
Date: Thu, 22 Feb 2024 02:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/cgroup/sli.c:744:37: warning: 'sli_enabled_fops' defined but
 not used
Message-ID: <202402220217.rfLTlMTq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: b879b1b64bf83919b5ebff080d4a2f6dda524181 sli: Introduce memory and sched latency stat infrastructure
date:   2 years, 4 months ago
config: x86_64-buildonly-randconfig-006-20240221 (https://download.01.org/0day-ci/archive/20240222/202402220217.rfLTlMTq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220217.rfLTlMTq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220217.rfLTlMTq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:250,
                    from arch/x86/include/asm/string_64.h:6,
                    from arch/x86/include/asm/string.h:5,
                    from include/linux/string.h:20,
                    from include/linux/seq_file.h:6,
                    from kernel/cgroup/sli.c:1:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/string.h:6:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   kernel/cgroup/sli.c: In function 'get_schedlat_count_idx':
   kernel/cgroup/sli.c:249:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     249 |                 idx = SCHEDLAT_0_1;
         |                     ^
   kernel/cgroup/sli.c:251:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     251 |                 idx = SCHEDLAT_1_5;
         |                     ^
   kernel/cgroup/sli.c:253:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     253 |                 idx = SCHEDLAT_5_10;
         |                     ^
   kernel/cgroup/sli.c:255:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     255 |                 idx = SCHEDLAT_10_20;
         |                     ^
   kernel/cgroup/sli.c:257:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     257 |                 idx = SCHEDLAT_20_30;
         |                     ^
   kernel/cgroup/sli.c:259:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     259 |                 idx = SCHEDLAT_30_40;
         |                     ^
   kernel/cgroup/sli.c:261:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     261 |                 idx = SCHEDLAT_40_50;
         |                     ^
   kernel/cgroup/sli.c:263:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     263 |                 idx = SCHEDLAT_50_60;
         |                     ^
   kernel/cgroup/sli.c:265:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     265 |                 idx = SCHEDLAT_60_70;
         |                     ^
   kernel/cgroup/sli.c:267:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     267 |                 idx = SCHEDLAT_70_80;
         |                     ^
   kernel/cgroup/sli.c:269:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     269 |                 idx = SCHEDLAT_80_90;
         |                     ^
   kernel/cgroup/sli.c:271:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     271 |                 idx = SCHEDLAT_90_100;
         |                     ^
   kernel/cgroup/sli.c: In function 'sli_memlat_thr_write':
   kernel/cgroup/sli.c:423:17: warning: the comparison will always evaluate as 'true' for the address of 'member' will never be NULL [-Waddress]
     423 |         for ( ; memlat_member_offset[i].member ; i++) {
         |                 ^~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/sli.c:18:14: note: 'member' declared here
      18 |         char member[LINE_SIZE];
         |              ^~~~~~
   kernel/cgroup/sli.c: In function 'sli_schedlat_stat':
   kernel/cgroup/sli.c:456:44: warning: implicit conversion from 'enum sli_schedlat_stat_item' to 'enum sli_memlat_stat_item' [-Wenum-conversion]
     456 |         threshold = get_schedlat_threshold(sidx);
         |                                            ^~~~
   kernel/cgroup/sli.c:457:14: warning: implicit conversion from 'enum sli_memlat_count' to 'enum sli_schedlat_count' [-Wenum-conversion]
     457 |         cidx = get_schedlat_count_idx(delta);
         |              ^
   kernel/cgroup/sli.c: In function 'sli_schedlat_stat_show':
   kernel/cgroup/sli.c:596:56: warning: implicit conversion from 'enum sli_schedlat_stat_item' to 'enum sli_memlat_stat_item' [-Wenum-conversion]
     596 |                 seq_printf(m,"%s:\n",get_schedlat_name(sidx));
         |                                                        ^~~~
   kernel/cgroup/sli.c: In function 'sli_schedlat_thr_write':
   kernel/cgroup/sli.c:679:17: warning: the comparison will always evaluate as 'true' for the address of 'member' will never be NULL [-Waddress]
     679 |         for ( ; schedlat_member_offset[i].member ; i++) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/sli.c:18:14: note: 'member' declared here
      18 |         char member[LINE_SIZE];
         |              ^~~~~~
   kernel/cgroup/sli.c: At top level:
>> kernel/cgroup/sli.c:744:37: warning: 'sli_enabled_fops' defined but not used [-Wunused-const-variable=]
     744 | static const struct file_operations sli_enabled_fops = {
         |                                     ^~~~~~~~~~~~~~~~
>> kernel/cgroup/sli.c:695:37: warning: 'sli_schedlat_thr_fops' defined but not used [-Wunused-const-variable=]
     695 | static const struct file_operations sli_schedlat_thr_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~
>> kernel/cgroup/sli.c:439:37: warning: 'sli_memlat_thr_fops' defined but not used [-Wunused-const-variable=]
     439 | static const struct file_operations sli_memlat_thr_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/cgroup/sli.c:12:
   include/linux/sli.h:79:13: warning: 'sli_schedlat_syscall_schedin' defined but not used [-Wunused-function]
      79 | static void sli_schedlat_syscall_schedin(struct task_struct *task){}
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sli.h:78:13: warning: 'sli_schedlat_syscall_schedout' defined but not used [-Wunused-function]
      78 | static void sli_schedlat_syscall_schedout(struct task_struct *task){}
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sli.h:77:13: warning: 'sli_schedlat_syscall_exit' defined but not used [-Wunused-function]
      77 | static void sli_schedlat_syscall_exit(struct task_struct *task,unsigned long n){}
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sli.h:76:13: warning: 'sli_schedlat_syscall_enter' defined but not used [-Wunused-function]
      76 | static void sli_schedlat_syscall_enter(struct task_struct *task){}
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sli_enabled_fops +744 kernel/cgroup/sli.c

   655	
   656	static ssize_t sli_schedlat_thr_write(struct file *file, 
   657			const char __user *buf, size_t count, loff_t *offs)
   658	{
   659		char line[LINE_SIZE];
   660		u64 value;
   661		char *ptr;
   662		int i = 0;
   663	
   664		memset(line, 0, LINE_SIZE);
   665	
   666		count = min_t(size_t, count, LINE_SIZE - 1);
   667	
   668		if (strncpy_from_user(line, buf, count) < 0)
   669			return -EINVAL;
   670	
   671		if (strlen(line) < 1)
   672			return -EINVAL;
   673	
   674		if (!kstrtou64(line, 0, &value)) {
   675			sli_schedlat_thr_set(value);
   676			return count;
   677		}
   678	
 > 679		for ( ; schedlat_member_offset[i].member ; i++) {
   680			int lenstr = strlen(schedlat_member_offset[i].member);
   681	
   682			ptr = strnstr(line, schedlat_member_offset[i].member, lenstr);
   683			if (lenstr && ptr) {
   684				if (kstrtou64(ptr+lenstr, 0, &value))
   685					return -EINVAL;
   686	
   687				*((u64 *)((char *)&schedlat_threshold + schedlat_member_offset[i].offset)) = value;
   688				return count;
   689			}
   690		}
   691	
   692		return -EINVAL;
   693	}
   694	
 > 695	static const struct file_operations sli_schedlat_thr_fops = {
   696		.open		= sli_schedlat_thr_open,
   697		.read		= seq_read,
   698		.write		= sli_schedlat_thr_write,
   699		.release	= single_release,
   700	};
   701	
   702	static int sli_enabled_show(struct seq_file *m, void *v)
   703	{
   704		seq_printf(m, "%d\n", !static_key_enabled(&sli_no_enabled));
   705		return 0;
   706	}
   707	
   708	static int sli_enabled_open(struct inode *inode, struct file *file)
   709	{
   710		return single_open(file, sli_enabled_show, NULL);
   711	}
   712	
   713	static ssize_t sli_enabled_write(struct file *file, const char __user *ubuf,
   714					    size_t count, loff_t *ppos)
   715	{
   716		char val = -1;
   717		int ret = count;
   718	
   719		if (count < 1 || *ppos) {
   720			ret = -EINVAL;
   721			goto out;
   722		}
   723	
   724		if (copy_from_user(&val, ubuf, 1)) {
   725			ret = -EFAULT;
   726			goto out;
   727		}
   728	
   729		switch (val) {
   730		case '0':
   731			static_branch_enable(&sli_no_enabled);
   732			break;
   733		case '1':
   734			static_branch_disable(&sli_no_enabled);
   735			break;
   736		default:
   737			ret = -EINVAL;
   738		}
   739	
   740	out:
   741		return ret;
   742	}
   743	
 > 744	static const struct file_operations sli_enabled_fops = {
   745		.open       = sli_enabled_open,
   746		.read       = seq_read,
   747		.write      = sli_enabled_write,
   748		.llseek     = seq_lseek,
   749		.release    = single_release,
   750	};
   751	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
