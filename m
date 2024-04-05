Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7B116C454
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712317188; cv=none; b=SNBXmzPuvnk6cAnRNkII9QR/ZMidxVeHvobqdzfCFWO15xP0obyf+wKp1j4qaKDEBs8wotElztuAa/gZ0RQyOyXeNf15nbIUGcOg1ANLsYMZPcg39K/gaNKvv7Vj+l9FntSr6Ze76mwf/lzA6KGvEmfO7pJQnubm66sBeQcIY2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712317188; c=relaxed/simple;
	bh=fIRoCn8uR/VAmSYF7cqVQKLVRZmktoCYXwLJHrA/nHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fz4L56BJ7VRfkj3h75TTb1Vz077/AiYgCAql2Z1a6hEHpgjv1gFxumbpfGo/Yw5+v1yW0qbsD0730JthF1/JZ879TwYD3GcLL43Uf/Y2zxv6DuKcw0xvdsJNIEwzofzWtfHpC0Iw8PaxZkLMIQvWmb8i1SkLpFDoK3UIwKHzuFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkPcoJB5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkPcoJB5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712317186; x=1743853186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fIRoCn8uR/VAmSYF7cqVQKLVRZmktoCYXwLJHrA/nHo=;
  b=YkPcoJB5VJvWxmX2YOOOmk/sL9mDomEAygIRuJ0TDq+6svLqoZd3QY80
   OsRY1y+65tHFx5YPoNmp2QChzd5Rg9ul3vfZGJC5JvltIpXBeHVSwsU1A
   dnclcOVdyyppw0eAKdVSbuUfl/IDvF0jLvlrFwgPhbu+uC5yNod3tIkw8
   sopa7PEWDWJ3ZjYm9NLaciemc3j06bNI9J7RcaWjunMJfYBuUnFljO1E9
   /r0QyDSCI06eo1TpCFalu+f24w5C2X5f8zdeFr1u532PyJdDgWIf/sPtM
   Feihr8SSeo6dkmGvhX35eVtoYtpZV1AzGEnFa/XwUjq46WsvVqu8RNtZw
   Q==;
X-CSE-ConnectionGUID: 8wdUkG5FSnm8utKgjtnXfg==
X-CSE-MsgGUID: C62+dhS2SP2K7klr+72JaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7481519"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7481519"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 04:39:44 -0700
X-CSE-ConnectionGUID: 59YLQPFYR0evuBuOAuVjdQ==
X-CSE-MsgGUID: 3LeumesdRvCrUYxIu2I7og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19169280"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Apr 2024 04:39:43 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rshv2-0002Dg-21;
	Fri, 05 Apr 2024 11:39:40 +0000
Date: Fri, 5 Apr 2024 19:38:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 19/37] kernel/module/stats.c:393:35: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202404051924.XqqCjbV8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   449fd46baa282dd51ed0f757f111cd2cb11d03d9
commit: 02b8fcd817e5dbfce4b90bc975bbb4b7c0934cd9 [19/37] kernel: convert to read/write iterators
config: openrisc-randconfig-r132-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051924.XqqCjbV8-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240405/202404051924.XqqCjbV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051924.XqqCjbV8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/module/stats.c:393:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[assigned] buf @@
   kernel/module/stats.c:393:35: sparse:     expected void const [noderef] __user *from
   kernel/module/stats.c:393:35: sparse:     got char *[assigned] buf
   kernel/module/stats.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
>> kernel/trace/blktrace.c:421:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   kernel/trace/blktrace.c:421:36: sparse:     expected void const [noderef] __user *from
   kernel/trace/blktrace.c:421:36: sparse:     got char *
   kernel/trace/blktrace.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +393 kernel/module/stats.c

   263	
   264	/*
   265	 * At 64 bytes per module and assuming a 1024 bytes preamble we can fit the
   266	 * 112 module prints within 8k.
   267	 *
   268	 * 1024 + (64*112) = 8k
   269	 */
   270	#define MAX_PREAMBLE 1024
   271	#define MAX_FAILED_MOD_PRINT 112
   272	#define MAX_BYTES_PER_MOD 64
   273	static ssize_t read_file_mod_stats(struct kiocb *iocb, struct iov_iter *to)
   274	{
   275		struct mod_fail_load *mod_fail;
   276		unsigned int len, size, count_failed = 0;
   277		char *buf;
   278		int ret;
   279		u32 live_mod_count, fkreads, fdecompress, fbecoming, floads;
   280		unsigned long total_size, text_size, ikread_bytes, ibecoming_bytes,
   281			idecompress_bytes, imod_bytes, total_virtual_lost;
   282	
   283		live_mod_count = atomic_read(&modcount);
   284		fkreads = atomic_read(&failed_kreads);
   285		fdecompress = atomic_read(&failed_decompress);
   286		fbecoming = atomic_read(&failed_becoming);
   287		floads = atomic_read(&failed_load_modules);
   288	
   289		total_size = atomic_long_read(&total_mod_size);
   290		text_size = atomic_long_read(&total_text_size);
   291		ikread_bytes = atomic_long_read(&invalid_kread_bytes);
   292		idecompress_bytes = atomic_long_read(&invalid_decompress_bytes);
   293		ibecoming_bytes = atomic_long_read(&invalid_becoming_bytes);
   294		imod_bytes = atomic_long_read(&invalid_mod_bytes);
   295	
   296		total_virtual_lost = ikread_bytes + idecompress_bytes + ibecoming_bytes + imod_bytes;
   297	
   298		size = MAX_PREAMBLE + min((unsigned int)(floads + fbecoming),
   299					  (unsigned int)MAX_FAILED_MOD_PRINT) * MAX_BYTES_PER_MOD;
   300		buf = kzalloc(size, GFP_KERNEL);
   301		if (buf == NULL)
   302			return -ENOMEM;
   303	
   304		/* The beginning of our debug preamble */
   305		len = scnprintf(buf, size, "%25s\t%u\n", "Mods ever loaded", live_mod_count);
   306	
   307		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on kread", fkreads);
   308	
   309		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on decompress",
   310				 fdecompress);
   311		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on becoming", fbecoming);
   312	
   313		len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on load", floads);
   314	
   315		len += scnprintf(buf + len, size - len, "%25s\t%lu\n", "Total module size", total_size);
   316		len += scnprintf(buf + len, size - len, "%25s\t%lu\n", "Total mod text size", text_size);
   317	
   318		len += scnprintf(buf + len, size - len, "%25s\t%lu\n", "Failed kread bytes", ikread_bytes);
   319	
   320		len += scnprintf(buf + len, size - len, "%25s\t%lu\n", "Failed decompress bytes",
   321				 idecompress_bytes);
   322	
   323		len += scnprintf(buf + len, size - len, "%25s\t%lu\n", "Failed becoming bytes", ibecoming_bytes);
   324	
   325		len += scnprintf(buf + len, size - len, "%25s\t%lu\n", "Failed kmod bytes", imod_bytes);
   326	
   327		len += scnprintf(buf + len, size - len, "%25s\t%lu\n", "Virtual mem wasted bytes", total_virtual_lost);
   328	
   329		if (live_mod_count && total_size) {
   330			len += scnprintf(buf + len, size - len, "%25s\t%lu\n", "Average mod size",
   331					 DIV_ROUND_UP(total_size, live_mod_count));
   332		}
   333	
   334		if (live_mod_count && text_size) {
   335			len += scnprintf(buf + len, size - len, "%25s\t%lu\n", "Average mod text size",
   336					 DIV_ROUND_UP(text_size, live_mod_count));
   337		}
   338	
   339		/*
   340		 * We use WARN_ON_ONCE() for the counters to ensure we always have parity
   341		 * for keeping tabs on a type of failure with one type of byte counter.
   342		 * The counters for imod_bytes does not increase for fkreads failures
   343		 * for example, and so on.
   344		 */
   345	
   346		WARN_ON_ONCE(ikread_bytes && !fkreads);
   347		if (fkreads && ikread_bytes) {
   348			len += scnprintf(buf + len, size - len, "%25s\t%lu\n", "Avg fail kread bytes",
   349					 DIV_ROUND_UP(ikread_bytes, fkreads));
   350		}
   351	
   352		WARN_ON_ONCE(ibecoming_bytes && !fbecoming);
   353		if (fbecoming && ibecoming_bytes) {
   354			len += scnprintf(buf + len, size - len, "%25s\t%lu\n", "Avg fail becoming bytes",
   355					 DIV_ROUND_UP(ibecoming_bytes, fbecoming));
   356		}
   357	
   358		WARN_ON_ONCE(idecompress_bytes && !fdecompress);
   359		if (fdecompress && idecompress_bytes) {
   360			len += scnprintf(buf + len, size - len, "%25s\t%lu\n", "Avg fail decomp bytes",
   361					 DIV_ROUND_UP(idecompress_bytes, fdecompress));
   362		}
   363	
   364		WARN_ON_ONCE(imod_bytes && !floads);
   365		if (floads && imod_bytes) {
   366			len += scnprintf(buf + len, size - len, "%25s\t%lu\n", "Average fail load bytes",
   367					 DIV_ROUND_UP(imod_bytes, floads));
   368		}
   369	
   370		/* End of our debug preamble header. */
   371	
   372		/* Catch when we've gone beyond our expected preamble */
   373		WARN_ON_ONCE(len >= MAX_PREAMBLE);
   374	
   375		if (list_empty(&dup_failed_modules))
   376			goto out;
   377	
   378		len += scnprintf(buf + len, size - len, "Duplicate failed modules:\n");
   379		len += scnprintf(buf + len, size - len, "%25s\t%15s\t%25s\n",
   380				 "Module-name", "How-many-times", "Reason");
   381		mutex_lock(&module_mutex);
   382	
   383	
   384		list_for_each_entry_rcu(mod_fail, &dup_failed_modules, list) {
   385			if (WARN_ON_ONCE(++count_failed >= MAX_FAILED_MOD_PRINT))
   386				goto out_unlock;
   387			len += scnprintf(buf + len, size - len, "%25s\t%15lu\t%25s\n", mod_fail->name,
   388					 atomic_long_read(&mod_fail->count), mod_fail_to_str(mod_fail));
   389		}
   390	out_unlock:
   391		mutex_unlock(&module_mutex);
   392	out:
 > 393		ret = simple_copy_to_iter(buf, &iocb->ki_pos, len, to);
   394		kfree(buf);
   395		return ret;
   396	}
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
