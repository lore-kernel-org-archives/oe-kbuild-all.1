Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E76A260566
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 23:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764889847; cv=none; b=H9j5gjA2o2PB0K0IWGYKSMnkY7w3r8Ilhu17QjKhYby5yhvbQZ3NsAmtbwdIiNn5MXbEfboNc6GefXsx4YSEqjqoKfJVGSYt1nFmHOhctkg9TxczJh2QOoxgzXsCwgOtE9bb7mzPgTD4tGLmb/OodZrq80rPcRG2mHKX6L8Oq98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764889847; c=relaxed/simple;
	bh=TengBotBMy9mbKziswqwiCBvwWtKhY1zWUm/ntHQU2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zxx7CEzJjZ14/ctEXeEJwLg/5dk9xpQdDcD0iE+fX3o8klE9ESIZhb5lQY12yd6yaNEQhtL6l5X69BwfkDodUrHjjpTOUYnfAiAeJ+3jrWgoyiyGH0rWuUbGZKcXW+jDOZ8+luRfN7wgj9MKaXDPfoAcem5MIyo7Si2HwcsbsfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byO1UsFJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byO1UsFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764889844; x=1796425844;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TengBotBMy9mbKziswqwiCBvwWtKhY1zWUm/ntHQU2I=;
  b=byO1UsFJLsQQcKt0DMzTB0NqEBih/8Rft/S7FxuJrYvxFwc7eANoq3GZ
   1qloODuGe2orq43tuMCFMBEK961j7ujPB7Ucap4K2NfkyKEEUrXXHiDeD
   1HhhDLve5OafvY6D2tka65EHGnM4lk4J6eymBbnyPOIlNupdlNFeg55KV
   JPwdiqvsexGT6NbZ2MCHOLabJKnK/dsiKH9Wt6fGHVCFj3+AaJGWWbp/M
   2kWu77IDNimla0Z9biHsxUE/nS1wveyH3taB9tRcNHM5L7UzHtR9p/HIi
   NvrMhNtU07jCi1ocMzqlcxSLY7c9nQ7DbRlxYtAc86THtjskRZIImPefZ
   A==;
X-CSE-ConnectionGUID: D+b547RySDehrhFLMPVc5g==
X-CSE-MsgGUID: yqxXPS9dRBeYp2a08TLe1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66816981"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="66816981"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 15:10:43 -0800
X-CSE-ConnectionGUID: OjDzuvL5QgmHvRI+nWvqsw==
X-CSE-MsgGUID: fmnLEK+9QMCr7yKzZaSkaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="225777273"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Dec 2025 15:10:41 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRIT8-00000000EL5-1kd4;
	Thu, 04 Dec 2025 23:10:38 +0000
Date: Fri, 5 Dec 2025 07:09:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: drivers/android/binder.c:4145:8: error: invalid operand for
 instruction
Message-ID: <202512050700.azkjhR15-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   500920fa76819b4909a32081e153bce80ce74824
commit: e2ffa15b9baa447e444d654ffd47123ba6443ae4 kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on clang < 17
date:   2 months ago
config: powerpc-randconfig-r051-20251205 (https://download.01.org/0day-ci/archive/20251205/202512050700.azkjhR15-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512050700.azkjhR15-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512050700.azkjhR15-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/android/binder.c:4145:8: error: invalid operand for instruction
                           if (get_user(cookie, (binder_uintptr_t __user *)ptr))
                               ^
   arch/powerpc/include/asm/uaccess.h:317:5: note: expanded from macro 'get_user'
                     __get_user(x, _gu_addr) :                             \
                     ^
   arch/powerpc/include/asm/uaccess.h:305:2: note: expanded from macro '__get_user'
           __get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);      \
           ^
   arch/powerpc/include/asm/uaccess.h:273:10: note: expanded from macro '__get_user_size_allowed'
           case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;  \
                   ^
   arch/powerpc/include/asm/uaccess.h:256:4: note: expanded from macro '__get_user_asm2'
                   "       li %1+1,0\n"                    \
                    ^
   <inline asm>:7:5: note: instantiated into assembly here
           li 31+1,0
              ^
   1 error generated.


vim +4145 drivers/android/binder.c

44d8047f1d87ad drivers/android/binder.c         Todd Kjos              2018-08-28  4040  
fb07ebc3e82a98 drivers/staging/android/binder.c Bojan Prtvar           2013-09-02  4041  static int binder_thread_write(struct binder_proc *proc,
fb07ebc3e82a98 drivers/staging/android/binder.c Bojan Prtvar           2013-09-02  4042  			struct binder_thread *thread,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4043  			binder_uintptr_t binder_buffer, size_t size,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4044  			binder_size_t *consumed)
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4045  {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4046  	uint32_t cmd;
342e5c90b60134 drivers/android/binder.c         Martijn Coenen         2017-02-03  4047  	struct binder_context *context = proc->context;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4048  	void __user *buffer = (void __user *)(uintptr_t)binder_buffer;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4049  	void __user *ptr = buffer + *consumed;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4050  	void __user *end = buffer + size;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4051  
26549d17741035 drivers/android/binder.c         Todd Kjos              2017-06-29  4052  	while (ptr < end && thread->return_error.cmd == BR_OK) {
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4053  		int ret;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4054  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4055  		if (get_user(cmd, (uint32_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4056  			return -EFAULT;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4057  		ptr += sizeof(uint32_t);
975a1ac9a9fe65 drivers/staging/android/binder.c Arve Hjønnevåg         2012-10-16  4058  		trace_binder_command(cmd);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4059  		if (_IOC_NR(cmd) < ARRAY_SIZE(binder_stats.bc)) {
0953c7976c36ce drivers/android/binder.c         Badhri Jagan Sridharan 2017-06-29  4060  			atomic_inc(&binder_stats.bc[_IOC_NR(cmd)]);
0953c7976c36ce drivers/android/binder.c         Badhri Jagan Sridharan 2017-06-29  4061  			atomic_inc(&proc->stats.bc[_IOC_NR(cmd)]);
0953c7976c36ce drivers/android/binder.c         Badhri Jagan Sridharan 2017-06-29  4062  			atomic_inc(&thread->stats.bc[_IOC_NR(cmd)]);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4063  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4064  		switch (cmd) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4065  		case BC_INCREFS:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4066  		case BC_ACQUIRE:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4067  		case BC_RELEASE:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4068  		case BC_DECREFS: {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4069  			uint32_t target;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4070  			const char *debug_string;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4071  			bool strong = cmd == BC_ACQUIRE || cmd == BC_RELEASE;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4072  			bool increment = cmd == BC_INCREFS || cmd == BC_ACQUIRE;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4073  			struct binder_ref_data rdata;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4074  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4075  			if (get_user(target, (uint32_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4076  				return -EFAULT;
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017-06-29  4077  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4078  			ptr += sizeof(uint32_t);
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4079  			ret = -1;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4080  			if (increment && !target) {
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017-06-29  4081  				struct binder_node *ctx_mgr_node;
6c20032c22d982 drivers/android/binder.c         Andrew Bridges         2020-10-27  4082  
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017-06-29  4083  				mutex_lock(&context->context_mgr_node_lock);
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017-06-29  4084  				ctx_mgr_node = context->binder_context_mgr_node;
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4085  				if (ctx_mgr_node) {
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4086  					if (ctx_mgr_node->proc == proc) {
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4087  						binder_user_error("%d:%d context manager tried to acquire desc 0\n",
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4088  								  proc->pid, thread->pid);
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4089  						mutex_unlock(&context->context_mgr_node_lock);
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4090  						return -EINVAL;
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4091  					}
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4092  					ret = binder_inc_ref_for_node(
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4093  							proc, ctx_mgr_node,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4094  							strong, NULL, &rdata);
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4095  				}
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017-06-29  4096  				mutex_unlock(&context->context_mgr_node_lock);
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017-06-29  4097  			}
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4098  			if (ret)
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4099  				ret = binder_update_ref_for_handle(
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4100  						proc, target, increment, strong,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4101  						&rdata);
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4102  			if (!ret && rdata.desc != target) {
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4103  				binder_user_error("%d:%d tried to acquire reference to desc %d, got %d instead\n",
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4104  					proc->pid, thread->pid,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4105  					target, rdata.desc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4106  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4107  			switch (cmd) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4108  			case BC_INCREFS:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4109  				debug_string = "IncRefs";
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4110  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4111  			case BC_ACQUIRE:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4112  				debug_string = "Acquire";
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4113  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4114  			case BC_RELEASE:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4115  				debug_string = "Release";
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4116  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4117  			case BC_DECREFS:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4118  			default:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4119  				debug_string = "DecRefs";
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4120  				break;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4121  			}
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4122  			if (ret) {
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4123  				binder_user_error("%d:%d %s %d refcount change on invalid ref %d ret %d\n",
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4124  					proc->pid, thread->pid, debug_string,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4125  					strong, target, ret);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4126  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4127  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4128  			binder_debug(BINDER_DEBUG_USER_REFS,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4129  				     "%d:%d %s ref %d desc %d s %d w %d\n",
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4130  				     proc->pid, thread->pid, debug_string,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4131  				     rdata.debug_id, rdata.desc, rdata.strong,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4132  				     rdata.weak);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4133  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4134  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4135  		case BC_INCREFS_DONE:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4136  		case BC_ACQUIRE_DONE: {
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4137  			binder_uintptr_t node_ptr;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4138  			binder_uintptr_t cookie;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4139  			struct binder_node *node;
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4140  			bool free_node;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4141  
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4142  			if (get_user(node_ptr, (binder_uintptr_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4143  				return -EFAULT;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4144  			ptr += sizeof(binder_uintptr_t);
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21 @4145  			if (get_user(cookie, (binder_uintptr_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4146  				return -EFAULT;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4147  			ptr += sizeof(binder_uintptr_t);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4148  			node = binder_get_node(proc, node_ptr);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4149  			if (node == NULL) {
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4150  				binder_user_error("%d:%d %s u%016llx no match\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4151  					proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4152  					cmd == BC_INCREFS_DONE ?
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4153  					"BC_INCREFS_DONE" :
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4154  					"BC_ACQUIRE_DONE",
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4155  					(u64)node_ptr);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4156  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4157  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4158  			if (cookie != node->cookie) {
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4159  				binder_user_error("%d:%d %s u%016llx node %d cookie mismatch %016llx != %016llx\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4160  					proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4161  					cmd == BC_INCREFS_DONE ?
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4162  					"BC_INCREFS_DONE" : "BC_ACQUIRE_DONE",
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4163  					(u64)node_ptr, node->debug_id,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4164  					(u64)cookie, (u64)node->cookie);
adc1884222276d drivers/android/binder.c         Todd Kjos              2017-06-29  4165  				binder_put_node(node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4166  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4167  			}
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4168  			binder_node_inner_lock(node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4169  			if (cmd == BC_ACQUIRE_DONE) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4170  				if (node->pending_strong_ref == 0) {
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4171  					binder_user_error("%d:%d BC_ACQUIRE_DONE node %d has no pending acquire request\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4172  						proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4173  						node->debug_id);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4174  					binder_node_inner_unlock(node);
adc1884222276d drivers/android/binder.c         Todd Kjos              2017-06-29  4175  					binder_put_node(node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4176  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4177  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4178  				node->pending_strong_ref = 0;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4179  			} else {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4180  				if (node->pending_weak_ref == 0) {
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4181  					binder_user_error("%d:%d BC_INCREFS_DONE node %d has no pending increfs request\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4182  						proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4183  						node->debug_id);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4184  					binder_node_inner_unlock(node);
adc1884222276d drivers/android/binder.c         Todd Kjos              2017-06-29  4185  					binder_put_node(node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4186  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4187  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4188  				node->pending_weak_ref = 0;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4189  			}
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4190  			free_node = binder_dec_node_nilocked(node,
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4191  					cmd == BC_ACQUIRE_DONE, 0);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4192  			WARN_ON(free_node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4193  			binder_debug(BINDER_DEBUG_USER_REFS,
adc1884222276d drivers/android/binder.c         Todd Kjos              2017-06-29  4194  				     "%d:%d %s node %d ls %d lw %d tr %d\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4195  				     proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4196  				     cmd == BC_INCREFS_DONE ? "BC_INCREFS_DONE" : "BC_ACQUIRE_DONE",
adc1884222276d drivers/android/binder.c         Todd Kjos              2017-06-29  4197  				     node->debug_id, node->local_strong_refs,
adc1884222276d drivers/android/binder.c         Todd Kjos              2017-06-29  4198  				     node->local_weak_refs, node->tmp_refs);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4199  			binder_node_inner_unlock(node);
adc1884222276d drivers/android/binder.c         Todd Kjos              2017-06-29  4200  			binder_put_node(node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4201  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4202  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4203  		case BC_ATTEMPT_ACQUIRE:
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4204  			pr_err("BC_ATTEMPT_ACQUIRE not supported\n");
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4205  			return -EINVAL;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4206  		case BC_ACQUIRE_RESULT:
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4207  			pr_err("BC_ACQUIRE_RESULT not supported\n");
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4208  			return -EINVAL;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4209  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4210  		case BC_FREE_BUFFER: {
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4211  			binder_uintptr_t data_ptr;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4212  			struct binder_buffer *buffer;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4213  
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4214  			if (get_user(data_ptr, (binder_uintptr_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4215  				return -EFAULT;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4216  			ptr += sizeof(binder_uintptr_t);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4217  
53d311cfa19ad3 drivers/android/binder.c         Todd Kjos              2017-06-29  4218  			buffer = binder_alloc_prepare_to_free(&proc->alloc,
19c987241ca121 drivers/android/binder.c         Todd Kjos              2017-06-29  4219  							      data_ptr);
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4220  			if (IS_ERR_OR_NULL(buffer)) {
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4221  				if (PTR_ERR(buffer) == -EPERM) {
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4222  					binder_user_error(
92d2261214a52f drivers/android/binder.c         Tiffany Y. Yang        2025-04-01  4223  						"%d:%d BC_FREE_BUFFER matched unreturned or currently freeing buffer at offset %lx\n",
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4224  						proc->pid, thread->pid,
92d2261214a52f drivers/android/binder.c         Tiffany Y. Yang        2025-04-01  4225  						(unsigned long)data_ptr - proc->alloc.vm_start);
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4226  				} else {
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4227  					binder_user_error(
92d2261214a52f drivers/android/binder.c         Tiffany Y. Yang        2025-04-01  4228  						"%d:%d BC_FREE_BUFFER no match for buffer at offset %lx\n",
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4229  						proc->pid, thread->pid,
92d2261214a52f drivers/android/binder.c         Tiffany Y. Yang        2025-04-01  4230  						(unsigned long)data_ptr - proc->alloc.vm_start);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4231  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4232  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4233  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4234  			binder_debug(BINDER_DEBUG_FREE_BUFFER,
92d2261214a52f drivers/android/binder.c         Tiffany Y. Yang        2025-04-01  4235  				     "%d:%d BC_FREE_BUFFER at offset %lx found buffer %d for %s transaction\n",
92d2261214a52f drivers/android/binder.c         Tiffany Y. Yang        2025-04-01  4236  				     proc->pid, thread->pid,
92d2261214a52f drivers/android/binder.c         Tiffany Y. Yang        2025-04-01  4237  				     (unsigned long)data_ptr - proc->alloc.vm_start,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4238  				     buffer->debug_id,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4239  				     buffer->transaction ? "active" : "finished");
32e9f56a96d8d0 drivers/android/binder.c         Todd Kjos              2021-10-15  4240  			binder_free_buf(proc, thread, buffer, false);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4241  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4242  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4243  
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4244  		case BC_TRANSACTION_SG:
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4245  		case BC_REPLY_SG: {
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4246  			struct binder_transaction_data_sg tr;
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4247  
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4248  			if (copy_from_user(&tr, ptr, sizeof(tr)))
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4249  				return -EFAULT;
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4250  			ptr += sizeof(tr);
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4251  			binder_transaction(proc, thread, &tr.transaction_data,
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4252  					   cmd == BC_REPLY_SG, tr.buffers_size);
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4253  			break;
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4254  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4255  		case BC_TRANSACTION:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4256  		case BC_REPLY: {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4257  			struct binder_transaction_data tr;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4258  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4259  			if (copy_from_user(&tr, ptr, sizeof(tr)))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4260  				return -EFAULT;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4261  			ptr += sizeof(tr);
4bfac80af3a63f drivers/android/binder.c         Martijn Coenen         2017-02-03  4262  			binder_transaction(proc, thread, &tr,
4bfac80af3a63f drivers/android/binder.c         Martijn Coenen         2017-02-03  4263  					   cmd == BC_REPLY, 0);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4264  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4265  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4266  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4267  		case BC_REGISTER_LOOPER:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4268  			binder_debug(BINDER_DEBUG_THREADS,
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4269  				     "%d:%d BC_REGISTER_LOOPER\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4270  				     proc->pid, thread->pid);
b3e6861283790d drivers/android/binder.c         Todd Kjos              2017-06-29  4271  			binder_inner_proc_lock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4272  			if (thread->looper & BINDER_LOOPER_STATE_ENTERED) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4273  				thread->looper |= BINDER_LOOPER_STATE_INVALID;
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4274  				binder_user_error("%d:%d ERROR: BC_REGISTER_LOOPER called after BC_ENTER_LOOPER\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4275  					proc->pid, thread->pid);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4276  			} else if (proc->requested_threads == 0) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4277  				thread->looper |= BINDER_LOOPER_STATE_INVALID;
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4278  				binder_user_error("%d:%d ERROR: BC_REGISTER_LOOPER called without request\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4279  					proc->pid, thread->pid);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4280  			} else {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4281  				proc->requested_threads--;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4282  				proc->requested_threads_started++;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4283  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4284  			thread->looper |= BINDER_LOOPER_STATE_REGISTERED;
b3e6861283790d drivers/android/binder.c         Todd Kjos              2017-06-29  4285  			binder_inner_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4286  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4287  		case BC_ENTER_LOOPER:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4288  			binder_debug(BINDER_DEBUG_THREADS,
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4289  				     "%d:%d BC_ENTER_LOOPER\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4290  				     proc->pid, thread->pid);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4291  			if (thread->looper & BINDER_LOOPER_STATE_REGISTERED) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4292  				thread->looper |= BINDER_LOOPER_STATE_INVALID;
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4293  				binder_user_error("%d:%d ERROR: BC_ENTER_LOOPER called after BC_REGISTER_LOOPER\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4294  					proc->pid, thread->pid);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4295  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4296  			thread->looper |= BINDER_LOOPER_STATE_ENTERED;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4297  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4298  		case BC_EXIT_LOOPER:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4299  			binder_debug(BINDER_DEBUG_THREADS,
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4300  				     "%d:%d BC_EXIT_LOOPER\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4301  				     proc->pid, thread->pid);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4302  			thread->looper |= BINDER_LOOPER_STATE_EXITED;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4303  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4304  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4305  		case BC_REQUEST_DEATH_NOTIFICATION:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4306  		case BC_CLEAR_DEATH_NOTIFICATION: {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4307  			uint32_t target;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4308  			binder_uintptr_t cookie;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4309  			struct binder_ref *ref;
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4310  			struct binder_ref_death *death = NULL;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4311  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4312  			if (get_user(target, (uint32_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4313  				return -EFAULT;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4314  			ptr += sizeof(uint32_t);
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4315  			if (get_user(cookie, (binder_uintptr_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4316  				return -EFAULT;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4317  			ptr += sizeof(binder_uintptr_t);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4318  			if (cmd == BC_REQUEST_DEATH_NOTIFICATION) {
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4319  				/*
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4320  				 * Allocate memory for death notification
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4321  				 * before taking lock
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4322  				 */
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4323  				death = kzalloc(sizeof(*death), GFP_KERNEL);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4324  				if (death == NULL) {
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4325  					WARN_ON(thread->return_error.cmd !=
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4326  						BR_OK);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4327  					thread->return_error.cmd = BR_ERROR;
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4328  					binder_enqueue_thread_work(
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4329  						thread,
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4330  						&thread->return_error.work);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4331  					binder_debug(
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4332  						BINDER_DEBUG_FAILED_TRANSACTION,
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4333  						"%d:%d BC_REQUEST_DEATH_NOTIFICATION failed\n",
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4334  						proc->pid, thread->pid);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4335  					break;
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4336  				}
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4337  			}
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4338  			binder_proc_lock(proc);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4339  			ref = binder_get_ref_olocked(proc, target, false);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4340  			if (ref == NULL) {
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4341  				binder_user_error("%d:%d %s invalid ref %d\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4342  					proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4343  					cmd == BC_REQUEST_DEATH_NOTIFICATION ?
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4344  					"BC_REQUEST_DEATH_NOTIFICATION" :
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4345  					"BC_CLEAR_DEATH_NOTIFICATION",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4346  					target);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4347  				binder_proc_unlock(proc);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4348  				kfree(death);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4349  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4350  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4351  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4352  			binder_debug(BINDER_DEBUG_DEATH_NOTIFICATION,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4353  				     "%d:%d %s %016llx ref %d desc %d s %d w %d for node %d\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4354  				     proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4355  				     cmd == BC_REQUEST_DEATH_NOTIFICATION ?
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4356  				     "BC_REQUEST_DEATH_NOTIFICATION" :
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4357  				     "BC_CLEAR_DEATH_NOTIFICATION",
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4358  				     (u64)cookie, ref->data.debug_id,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4359  				     ref->data.desc, ref->data.strong,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4360  				     ref->data.weak, ref->node->debug_id);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4361  
ab51ec6bdf0b7a drivers/android/binder.c         Martijn Coenen         2017-06-29  4362  			binder_node_lock(ref->node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4363  			if (cmd == BC_REQUEST_DEATH_NOTIFICATION) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4364  				if (ref->death) {
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4365  					binder_user_error("%d:%d BC_REQUEST_DEATH_NOTIFICATION death notification already set\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4366  						proc->pid, thread->pid);
ab51ec6bdf0b7a drivers/android/binder.c         Martijn Coenen         2017-06-29  4367  					binder_node_unlock(ref->node);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4368  					binder_proc_unlock(proc);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4369  					kfree(death);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4370  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4371  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4372  				binder_stats_created(BINDER_STAT_DEATH);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4373  				INIT_LIST_HEAD(&death->work.entry);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4374  				death->cookie = cookie;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4375  				ref->death = death;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4376  				if (ref->node->proc == NULL) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4377  					ref->death->work.type = BINDER_WORK_DEAD_BINDER;
bb74562a7f8398 drivers/android/binder.c         Martijn Coenen         2017-08-31  4378  
1b77e9dcc3da93 drivers/android/binder.c         Martijn Coenen         2017-08-31  4379  					binder_inner_proc_lock(proc);
1b77e9dcc3da93 drivers/android/binder.c         Martijn Coenen         2017-08-31  4380  					binder_enqueue_work_ilocked(
bb74562a7f8398 drivers/android/binder.c         Martijn Coenen         2017-08-31  4381  						&ref->death->work, &proc->todo);
bb74562a7f8398 drivers/android/binder.c         Martijn Coenen         2017-08-31  4382  					binder_wakeup_proc_ilocked(proc);
1b77e9dcc3da93 drivers/android/binder.c         Martijn Coenen         2017-08-31  4383  					binder_inner_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4384  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4385  			} else {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4386  				if (ref->death == NULL) {
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4387  					binder_user_error("%d:%d BC_CLEAR_DEATH_NOTIFICATION death notification not active\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4388  						proc->pid, thread->pid);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4389  					binder_node_unlock(ref->node);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4390  					binder_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4391  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4392  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4393  				death = ref->death;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4394  				if (death->cookie != cookie) {
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4395  					binder_user_error("%d:%d BC_CLEAR_DEATH_NOTIFICATION death notification cookie mismatch %016llx != %016llx\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4396  						proc->pid, thread->pid,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4397  						(u64)death->cookie,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4398  						(u64)cookie);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4399  					binder_node_unlock(ref->node);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4400  					binder_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4401  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4402  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4403  				ref->death = NULL;
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4404  				binder_inner_proc_lock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4405  				if (list_empty(&death->work.entry)) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4406  					death->work.type = BINDER_WORK_CLEAR_DEATH_NOTIFICATION;
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4407  					if (thread->looper &
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4408  					    (BINDER_LOOPER_STATE_REGISTERED |
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4409  					     BINDER_LOOPER_STATE_ENTERED))
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4410  						binder_enqueue_thread_work_ilocked(
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4411  								thread,
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4412  								&death->work);
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4413  					else {
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4414  						binder_enqueue_work_ilocked(
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4415  								&death->work,
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4416  								&proc->todo);
1b77e9dcc3da93 drivers/android/binder.c         Martijn Coenen         2017-08-31  4417  						binder_wakeup_proc_ilocked(
408c68b17aea2f drivers/android/binder.c         Martijn Coenen         2017-08-31  4418  								proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4419  					}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4420  				} else {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4421  					BUG_ON(death->work.type != BINDER_WORK_DEAD_BINDER);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4422  					death->work.type = BINDER_WORK_DEAD_BINDER_AND_CLEAR;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4423  				}
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4424  				binder_inner_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4425  			}
ab51ec6bdf0b7a drivers/android/binder.c         Martijn Coenen         2017-06-29  4426  			binder_node_unlock(ref->node);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4427  			binder_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4428  		} break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4429  		case BC_DEAD_BINDER_DONE: {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4430  			struct binder_work *w;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4431  			binder_uintptr_t cookie;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4432  			struct binder_ref_death *death = NULL;
10f62861b4a2f2 drivers/staging/android/binder.c Seunghun Lee           2014-05-01  4433  
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4434  			if (get_user(cookie, (binder_uintptr_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4435  				return -EFAULT;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4436  
7a64cd887fdb97 drivers/android/binder.c         Lisa Du                2016-02-17  4437  			ptr += sizeof(cookie);
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4438  			binder_inner_proc_lock(proc);
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4439  			list_for_each_entry(w, &proc->delivered_death,
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4440  					    entry) {
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4441  				struct binder_ref_death *tmp_death =
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4442  					container_of(w,
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4443  						     struct binder_ref_death,
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4444  						     work);
10f62861b4a2f2 drivers/staging/android/binder.c Seunghun Lee           2014-05-01  4445  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4446  				if (tmp_death->cookie == cookie) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4447  					death = tmp_death;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4448  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4449  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4450  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4451  			binder_debug(BINDER_DEBUG_DEAD_BINDER,
8ca86f1639ec58 drivers/android/binder.c         Todd Kjos              2018-02-07  4452  				     "%d:%d BC_DEAD_BINDER_DONE %016llx found %pK\n",
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4453  				     proc->pid, thread->pid, (u64)cookie,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4454  				     death);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4455  			if (death == NULL) {
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4456  				binder_user_error("%d:%d BC_DEAD_BINDER_DONE %016llx not found\n",
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4457  					proc->pid, thread->pid, (u64)cookie);
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4458  				binder_inner_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4459  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4460  			}
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4461  			binder_dequeue_work_ilocked(&death->work);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4462  			if (death->work.type == BINDER_WORK_DEAD_BINDER_AND_CLEAR) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4463  				death->work.type = BINDER_WORK_CLEAR_DEATH_NOTIFICATION;
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4464  				if (thread->looper &
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4465  					(BINDER_LOOPER_STATE_REGISTERED |
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4466  					 BINDER_LOOPER_STATE_ENTERED))
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4467  					binder_enqueue_thread_work_ilocked(
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4468  						thread, &death->work);
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4469  				else {
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4470  					binder_enqueue_work_ilocked(
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4471  							&death->work,
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4472  							&proc->todo);
408c68b17aea2f drivers/android/binder.c         Martijn Coenen         2017-08-31  4473  					binder_wakeup_proc_ilocked(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4474  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4475  			}
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4476  			binder_inner_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4477  		} break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4478  
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4479  		case BC_REQUEST_FREEZE_NOTIFICATION: {
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4480  			struct binder_handle_cookie handle_cookie;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4481  			int error;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4482  
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4483  			if (copy_from_user(&handle_cookie, ptr, sizeof(handle_cookie)))
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4484  				return -EFAULT;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4485  			ptr += sizeof(handle_cookie);
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4486  			error = binder_request_freeze_notification(proc, thread,
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4487  								   &handle_cookie);
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4488  			if (error)
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4489  				return error;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4490  		} break;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4491  
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4492  		case BC_CLEAR_FREEZE_NOTIFICATION: {
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4493  			struct binder_handle_cookie handle_cookie;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4494  			int error;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4495  
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4496  			if (copy_from_user(&handle_cookie, ptr, sizeof(handle_cookie)))
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4497  				return -EFAULT;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4498  			ptr += sizeof(handle_cookie);
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4499  			error = binder_clear_freeze_notification(proc, thread, &handle_cookie);
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4500  			if (error)
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4501  				return error;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4502  		} break;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4503  
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4504  		case BC_FREEZE_NOTIFICATION_DONE: {
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4505  			binder_uintptr_t cookie;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4506  			int error;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4507  
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4508  			if (get_user(cookie, (binder_uintptr_t __user *)ptr))
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4509  				return -EFAULT;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4510  
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4511  			ptr += sizeof(cookie);
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4512  			error = binder_freeze_notification_done(proc, thread, cookie);
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4513  			if (error)
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4514  				return error;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4515  		} break;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4516  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4517  		default:
da4864962d768b drivers/android/binder.c         Carlos Llamas          2022-05-09  4518  			pr_err("%d:%d unknown command %u\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4519  			       proc->pid, thread->pid, cmd);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4520  			return -EINVAL;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4521  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4522  		*consumed = ptr - buffer;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4523  	}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4524  	return 0;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4525  }
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4526  

:::::: The code at line 4145 was first introduced by commit
:::::: da49889deb34d351cdd113f9d1607dbb830cb5bb staging: binder: Support concurrent 32 bit and 64 bit processes.

:::::: TO: Arve Hjønnevåg <arve@android.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
