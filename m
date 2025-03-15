Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88132383
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742040880; cv=none; b=muSX/cPq3qsYGY7hEXzUbs1sAZmgQvdtZQcpZMg5sbX+a+mwVm7WXycQvJ2Wv5x7TeUODd3e+mluO5JMuUrV5oWdL0wOBHRwEdd0pmzK0JZsiYPSrilJTJLsX3HSnWgRsBZNmDu3dlrY1T3FtQjfMkIStPhmHaRBeliJouE67eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742040880; c=relaxed/simple;
	bh=nvK7OPHhwn7Gt00i4Nv0gXfdp/l7NdUJJibpOhY+MVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DxFBlnpx49SJAbSkYOwtH+ByQ1ns8sqdC5efZfWsu4yhpgfSGJwHEHebsDnjT5Zo/kj107VH1E9IhrFk7OiZIPbI//DyyyM8AAooOa2cHtQblecR/WXLzX3LpIjtWrsnjp2rIdHjSDl1j2+cFDQ4A8b+bdMC50BsSZjPUE4hHAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5U1CX+t; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5U1CX+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742040878; x=1773576878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nvK7OPHhwn7Gt00i4Nv0gXfdp/l7NdUJJibpOhY+MVM=;
  b=V5U1CX+tco4wzJMhNPE3NKuTeJOUvbmMX1gjE0OStLl7tlR4L0yOgeOE
   /y8QC+HideZEfHg9u8mFrAN1cM/Ir5MFp7hHlyDx+mA6jN6JVlZMOFlBw
   4MsmphwSzu/FFFRMXV1FTJDOMdXHgbVFdjgKUzgmirJSvrfV673OVtCPa
   UPqLVe4LvoqZf6YAvkPF06IBMND/N0tTd9WLERJm3n1u09WncSn+y9MMu
   bayN9y0ouqKmwoQHoWPZP1s0JY1YoziX7N8vcCPkQaCtEQzxjADimYaYa
   0pYvB/2WivKkQkuFlgIGmQXtrClm7W2iLHfj+w7FD+RkwhkTKtpHT3P7C
   w==;
X-CSE-ConnectionGUID: 1cSowHWDRpi3QqzQo0QAjg==
X-CSE-MsgGUID: KhssrHPOTwmTKf2x17d2QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="60587801"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="60587801"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 05:14:38 -0700
X-CSE-ConnectionGUID: h8w0lxSNQqmEtwUTp6QYbQ==
X-CSE-MsgGUID: 4gYTWxxORjCIJQRVpTMoQA==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="121239568"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 15 Mar 2025 05:14:37 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttQPS-000BKV-1w;
	Sat, 15 Mar 2025 12:14:34 +0000
Date: Sat, 15 Mar 2025 20:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 158/159] fs/bcachefs/movinggc.c:322:33:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202503152029.8nPuORFx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   36bbffd106e5d55aaadb060309bad1a28e122f03
commit: 454dd9816ae1cd9fd0827c062a641dbbdbe44ef0 [158/159] bcachefs: rebalance, copygc status also print stacktrace
config: parisc-randconfig-r122-20250315 (https://download.01.org/0day-ci/archive/20250315/202503152029.8nPuORFx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250315/202503152029.8nPuORFx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503152029.8nPuORFx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/movinggc.c: note: in included file:
   fs/bcachefs/bcachefs.h:1007:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/movinggc.c:322:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/movinggc.c:322:33: sparse:    struct task_struct [noderef] __rcu *
   fs/bcachefs/movinggc.c:322:33: sparse:    struct task_struct *

vim +322 fs/bcachefs/movinggc.c

   298	
   299	void bch2_copygc_wait_to_text(struct printbuf *out, struct bch_fs *c)
   300	{
   301		printbuf_tabstop_push(out, 32);
   302		prt_printf(out, "running:\t%u\n",		c->copygc_running);
   303		prt_printf(out, "copygc_wait:\t%llu\n",		c->copygc_wait);
   304		prt_printf(out, "copygc_wait_at:\t%llu\n",	c->copygc_wait_at);
   305	
   306		prt_printf(out, "Currently waiting for:\t");
   307		prt_human_readable_u64(out, max(0LL, c->copygc_wait -
   308						atomic64_read(&c->io_clock[WRITE].now)) << 9);
   309		prt_newline(out);
   310	
   311		prt_printf(out, "Currently waiting since:\t");
   312		prt_human_readable_u64(out, max(0LL,
   313						atomic64_read(&c->io_clock[WRITE].now) -
   314						c->copygc_wait_at) << 9);
   315		prt_newline(out);
   316	
   317		prt_printf(out, "Currently calculated wait:\t");
   318		prt_human_readable_u64(out, bch2_copygc_wait_amount(c));
   319		prt_newline(out);
   320	
   321		rcu_read_lock();
 > 322		struct task_struct *t = rcu_dereference(c->copygc_thread);
   323		if (t)
   324			get_task_struct(t);
   325		rcu_read_unlock();
   326	
   327		if (t) {
   328			bch2_prt_task_backtrace(out, t, 0, GFP_KERNEL);
   329			put_task_struct(t);
   330		}
   331	}
   332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
