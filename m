Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B7628DF36
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 18:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750357117; cv=none; b=Itq0oWlI3B/3W3oTLoKSTZTRfk/dmFtSeS5vXx1LbqiZ5qaLMvjx4EElP2DSLr+dzvP4wBVxPzea1CmnTu9Wt4ltVYqrZXQaPBQBxgobjdygCSpV2hjwrMnYXZjfEGeKhlxahAUlbxa58jnuj4EVtxjEvMVz/fGT6ib0Hc2V/V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750357117; c=relaxed/simple;
	bh=q0SowtkB7lcWo0xL2dGV3Mon5LAGfuONUvmeTZokBMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lWZHmQ0gy5Uc/vsjtBBVTWYpgVQVBbCEEdumKZrktCKwahypD1hNX0wcJASFYzHQ50I7gqo3/W90KjncKL3ohH303A2uYTNMpGySncb9BMlZX34kw1gwoywWVMMUc7bm7KqySJZRqOuU66HL+gMwtWqfmyKroZBiQ9hiUmX5bUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzyPQ4Sh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzyPQ4Sh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750357116; x=1781893116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q0SowtkB7lcWo0xL2dGV3Mon5LAGfuONUvmeTZokBMg=;
  b=FzyPQ4ShNVhZLP2TSji/q0+zIq7KhoSKivXeKq/9fyYQfeNlO1WAnK66
   FIoXz7P/at1a1Anqqo1hYESN0taegPRw+vKcqWfIQr5iHWS/x31fKFjpx
   ujG+fVQjHpWXKldvYqL5wE0jEEwHZQWmAWYqEBO1jCS85y3a+IMofdl8J
   O9AU8fwkcN1qK+0UVxWuw6J2OJpoHy2YsdbY2AtjPQMFk0SiLYcqCMhsz
   b5MELFddg7fGqF4xUNildjKvXlgCHxSrQS53wMmm4ClpoqOnAGwHzohaQ
   rZLvIOQKqBpeaCBCPF+j1pDCtmqB+px77in5EGJU6W/c1+Lue+AKrxTVu
   A==;
X-CSE-ConnectionGUID: /yZtiJxyQImHpDTBZVkplw==
X-CSE-MsgGUID: GZNgb/wTTzaHSb61n1gFGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70055016"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="70055016"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:18:30 -0700
X-CSE-ConnectionGUID: wFM5Zu0/QPW88gfJsYG/lQ==
X-CSE-MsgGUID: AJ8GKtJyRZCax7wmcc06+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150204391"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Jun 2025 11:18:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSJqE-000L0M-34;
	Thu, 19 Jun 2025 18:18:26 +0000
Date: Fri, 20 Jun 2025 02:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chenrenhui <chenrenhui1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2974/2974] fs/fuse/dev.c:288:5: warning: no
 previous prototype for 'fuse_get_unique_from_fc'
Message-ID: <202506200216.30IOXkDh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0bb9efd4883938dec34f710bce07ec3ecf5a04bd
commit: d738472f4834780c8f85e0eb7c76562bf5484276 [2974/2974] fuse: support fastpath via fast_ipc
config: arm64-randconfig-001-20250620 (https://download.01.org/0day-ci/archive/20250620/202506200216.30IOXkDh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200216.30IOXkDh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200216.30IOXkDh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/fuse/fuse_i.h:23,
                    from fs/fuse/dev.c:9:
   include/linux/backing-dev.h:430:49: warning: 'struct cgroup_subsys' declared inside parameter list will not be visible outside of this definition or declaration
     430 | static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
         |                                                 ^~~~~~~~~~~~~
>> fs/fuse/dev.c:288:5: warning: no previous prototype for 'fuse_get_unique_from_fc' [-Wmissing-prototypes]
     288 | u64 fuse_get_unique_from_fc(struct fuse_conn *fc)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/fuse/dev.c:318:9: warning: no previous prototype for 'fuse_simple_request_fast' [-Wmissing-prototypes]
     318 | ssize_t fuse_simple_request_fast(struct fuse_mount *fm, struct fuse_args *args)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c: In function 'fuse_read_copy':
>> fs/fuse/dev.c:2627:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    2627 |  int err = 0;
         |      ^~~
--
   In file included from fs/fuse/fuse_i.h:23,
                    from fs/fuse/file.c:9:
   include/linux/backing-dev.h:430:49: warning: 'struct cgroup_subsys' declared inside parameter list will not be visible outside of this definition or declaration
     430 | static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
         |                                                 ^~~~~~~~~~~~~
>> fs/fuse/file.c:1542:9: warning: no previous prototype for 'fuse_direct_io_fast' [-Wmissing-prototypes]
    1542 | ssize_t fuse_direct_io_fast(struct kiocb *iocb, struct iov_iter *iter,
         |         ^~~~~~~~~~~~~~~~~~~
   fs/fuse/file.c: In function 'fuse_direct_read_iter':
>> fs/fuse/file.c:1797:3: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    1797 |   struct fuse_io_priv io = FUSE_IO_PRIV_SYNC(iocb);
         |   ^~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CPPC_CPUFREQ_SYSFS_INTERFACE
   Depends on [n]: CPU_FREQ [=y] && (ARM || ARM64 [=y]) && ACPI_CPPC_CPUFREQ [=n]
   Selected by [m]:
   - CPU_FREQ_GOV_SEEP [=m] && CPU_FREQ [=y] && (ACPI_CPPC_CPUFREQ [=n] || ARM64 [=y])


vim +/fuse_get_unique_from_fc +288 fs/fuse/dev.c

   287	
 > 288	u64 fuse_get_unique_from_fc(struct fuse_conn *fc)
   289	{
   290		fc->reqctr += FUSE_REQ_ID_STEP;
   291		return fc->reqctr;
   292	}
   293	
   294	static void __fuse_ipc_send(struct fuse_req *req, struct task_struct *tsk,
   295			struct fuse_ipc_info *ipc_info)
   296	{
   297		ssize_t ret;
   298	
   299		FUSE_DEBUG("[cpu/%d][%s/%d] fuse ipc  send begin: unique: %d,opcode: %d\n",
   300				   smp_processor_id(), current->comm, current->pid,
   301				   req->in.h.unique, req->in.h.opcode);
   302		ret = fast_ipc_do_call(ipc_info->bind_info, tsk);
   303	
   304		FUSE_DEBUG("[cpu/%d][%s/%d] end\n", smp_processor_id(), current->comm,
   305				   current->pid);
   306	
   307		if (ret) {
   308			pr_warn("[cpu/%d][%s/%d] fuse_simple_request send failed: ",
   309					smp_processor_id(), current->comm, current->pid);
   310			pr_warn("unique: %lld, opcode: %d, return value: %ld\n",
   311					req->in.h.unique, req->in.h.opcode, ret);
   312			req->out.h.error = ret;
   313		}
   314	}
   315	
   316	static void fuse_adjust_compat(struct fuse_conn *fc, struct fuse_args *args);
   317	
 > 318	ssize_t fuse_simple_request_fast(struct fuse_mount *fm, struct fuse_args *args)
   319	{
   320		struct fuse_conn *fc = fm->fc;
   321		struct fuse_req *req;
   322		ssize_t ret;
   323		struct fuse_ipc_info *ipc_info;
   324		cpumask_t old_mask;
   325		cpumask_t new_mask;
   326	
   327		ipc_info = this_cpu_ptr(fc->percpu_ipc_info);
   328	
   329		old_mask = current->cpus_mask;
   330		cpumask_clear(&new_mask);
   331		cpumask_set_cpu(raw_smp_processor_id(), &new_mask);
   332		set_cpus_allowed_ptr(current, &new_mask);
   333	
   334		mutex_lock(&ipc_info->mutex_lock);
   335	
   336		req = fuse_get_req_sync(fm, ipc_info, args);
   337		if (IS_ERR(req)) {
   338			mutex_unlock(&ipc_info->mutex_lock);
   339			return PTR_ERR(req);
   340		}
   341	
   342		/* Needs to be done after fuse_get_req() so that fc->minor is valid */
   343		fuse_adjust_compat(fc, args);
   344	
   345		req->in.h.opcode = args->opcode;
   346		req->in.h.nodeid = args->nodeid;
   347		req->args = args;
   348		req->in.h.unique = fuse_get_unique_from_fc(req->fm->fc);
   349		req->in.h.len = sizeof(struct fuse_in_header) +
   350				fuse_len_args(req->args->in_numargs,
   351							  (struct fuse_arg *) req->args->in_args);
   352	
   353		if (!args->noreply)
   354			__set_bit(FR_ISREPLY, &req->flags);
   355	
   356		__fuse_ipc_send(req, current, ipc_info);
   357	
   358		set_cpus_allowed_ptr(current, &old_mask);
   359		ret = req->out.h.error;
   360		if (!ret && args->out_argvar) {
   361			WARN_ON(args->out_numargs == 0);
   362			ret = args->out_args[args->out_numargs - 1].size;
   363		}
   364		fuse_drop_waiting(fc);
   365	
   366		mutex_unlock(&ipc_info->mutex_lock);
   367	
   368		return ret;
   369	}
   370	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
