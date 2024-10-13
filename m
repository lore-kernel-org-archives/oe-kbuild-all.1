Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542EA12FF9C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 06:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728802722; cv=none; b=D6BGcucDBiV7EyrylsPIAuABiSH+RA7OqYd7e8aFq4IrTMMtlK5nVvuJUVzlDHrHkIefTjA4UpWIxEM25lLe+IJxj4SwwCSWAMC+Wrvc8jXo/BV4nSq2+e2gFJbYKx8f1Jxyofc9CZi25dKt2NYcm/k7b9ngD6iwVsmA0uTj8v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728802722; c=relaxed/simple;
	bh=XP+uIPaJTMCWNEWWeeji70k4hbqLokoMier5yCPGlRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCLq/+oWA574szSUewotnkxdpPwwn7Hw3CrHi2JQaLl7PcOlwQ3EPEEKDnB15cT4RzB7LZmeTIpzSMJ1sJmTOWnpqJDcwVp3enYGNxjtiz3Qps6jM4L/YaFdvsVME17mLuCcNiwCHyR7aXgfobZKZRLOAnY7dFykrgQFandAeX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BaRXW3xE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BaRXW3xE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728802721; x=1760338721;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XP+uIPaJTMCWNEWWeeji70k4hbqLokoMier5yCPGlRA=;
  b=BaRXW3xEKKOf7h2D2eDCEnL4q1VtzLl04/spFz1lIEn+DvdNqClQN27V
   9sbuYHBze89wBw6Gmx6UWo7CF6tYewY0kRcjSxJN/Y5THWfwSemogHkmw
   QYmoO2bogL4lQxJ2n83fzCRPhddJXzOzPQIDxyHM6+Eq74CeLDQsn2sg8
   SGFcI12fkw6km9uEaa/1+gmebmGtkZoJd+1u4JjjvplM4JT6s+FmAFGEh
   KMYPWSHk4TW1pxt4NjA0+9KMsce31Xq4PnmYcB6ySllvucVSxyAoZ4Zg4
   hhpHVfWNCjJgADsh7E3N71DYeIdz+Mdq3indy7CXzDhtV4K+pniI8wdRd
   A==;
X-CSE-ConnectionGUID: 58IKdtpPRRaH6VYbbqd3dg==
X-CSE-MsgGUID: QLBisUJIRoiRuXAjsZeNgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27969879"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="27969879"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 23:58:40 -0700
X-CSE-ConnectionGUID: VonNU9upSJCWgP/045r9Fg==
X-CSE-MsgGUID: XkSrCq2lQnekQXFSpHwAwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="81838059"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Oct 2024 23:58:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szsYm-000E9z-1h;
	Sun, 13 Oct 2024 06:58:36 +0000
Date: Sun, 13 Oct 2024 14:58:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-gs-tangorpro-5.10-android15-dp 30/31]
 drivers/android/binder.c:6082:47: warning: format '%lx' expects argument of
 type 'long unsigned int', but argument 5 has type 'int'
Message-ID: <202410131415.bqZtHiQS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android-gs-tangorpro-5.10-android15-dp
head:   11d7e4f57f688287511f911187ada11784b4263d
commit: 48ef5d18d7af53aa0516c1d20fe8ac92acc94b84 [30/31] ANDROID: binder: fix KMI-break due to address type change
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241013/202410131415.bqZtHiQS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131415.bqZtHiQS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131415.bqZtHiQS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/android/binder.c: In function 'print_binder_transaction_ilocked':
>> drivers/android/binder.c:6082:47: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'int' [-Wformat=]
    6082 |         seq_printf(m, " size %zd:%zd offset %lx\n",
         |                                             ~~^
         |                                               |
         |                                               long unsigned int
         |                                             %x
    6083 |                    buffer->data_size, buffer->offsets_size,
    6084 |                    proc->alloc.buffer - buffer->user_data);
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       int
--
   drivers/android/binder_alloc.c: In function 'binder_alloc_deferred_release':
   drivers/android/binder_alloc.c:943:39: warning: variable 'page_addr' set but not used [-Wunused-but-set-variable]
     943 |                         unsigned long page_addr;
         |                                       ^~~~~~~~~
   drivers/android/binder_alloc.c: In function 'binder_alloc_print_allocated':
>> drivers/android/binder_alloc.c:987:47: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'int' [-Wformat=]
     987 |                 seq_printf(m, "  buffer %d: %lx size %zd:%zd:%zd %s\n",
         |                                             ~~^
         |                                               |
         |                                               long unsigned int
         |                                             %x
     988 |                            buffer->debug_id,
     989 |                            buffer->user_data - alloc->buffer,
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                              |
         |                                              int


vim +6082 drivers/android/binder.c

355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6044  
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6045  static void print_binder_transaction_ilocked(struct seq_file *m,
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6046  					     struct binder_proc *proc,
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6047  					     const char *prefix,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6048  					     struct binder_transaction *t)
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6049  {
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6050  	struct binder_proc *to_proc;
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6051  	struct binder_buffer *buffer = t->buffer;
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6052  
7a4408c6bd3eb1 drivers/android/binder.c         Todd Kjos          2017-06-29  6053  	spin_lock(&t->lock);
eabe9707f264c8 drivers/android/binder.c         zhang chuang       2021-06-16  6054  	trace_android_vh_binder_print_transaction_info(m, proc, prefix, t);
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6055  	to_proc = t->to_proc;
5249f4883045de drivers/staging/android/binder.c Arve Hjønnevåg     2009-04-28  6056  	seq_printf(m,
e00eb41c0c7bea drivers/android/binder.c         Martijn Coenen     2017-06-06  6057  		   "%s %d: %pK from %d:%d to %d:%d code %x flags %x pri %d:%d r%d",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6058  		   prefix, t->debug_id, t,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6059  		   t->from ? t->from->proc->pid : 0,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6060  		   t->from ? t->from->pid : 0,
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6061  		   to_proc ? to_proc->pid : 0,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6062  		   t->to_thread ? t->to_thread->pid : 0,
e00eb41c0c7bea drivers/android/binder.c         Martijn Coenen     2017-06-06  6063  		   t->code, t->flags, t->priority.sched_policy,
e00eb41c0c7bea drivers/android/binder.c         Martijn Coenen     2017-06-06  6064  		   t->priority.prio, t->need_reply);
7a4408c6bd3eb1 drivers/android/binder.c         Todd Kjos          2017-06-29  6065  	spin_unlock(&t->lock);
7a4408c6bd3eb1 drivers/android/binder.c         Todd Kjos          2017-06-29  6066  
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6067  	if (proc != to_proc) {
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6068  		/*
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6069  		 * Can only safely deref buffer if we are holding the
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6070  		 * correct proc inner lock for this node
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6071  		 */
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6072  		seq_puts(m, "\n");
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6073  		return;
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6074  	}
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6075  
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6076  	if (buffer == NULL) {
5249f4883045de drivers/staging/android/binder.c Arve Hjønnevåg     2009-04-28  6077  		seq_puts(m, " buffer free\n");
5249f4883045de drivers/staging/android/binder.c Arve Hjønnevåg     2009-04-28  6078  		return;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6079  	}
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6080  	if (buffer->target_node)
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6081  		seq_printf(m, " node %d", buffer->target_node->debug_id);
0fb2b1b64e660d drivers/android/binder.c         Carlos Llamas      2023-12-01 @6082  	seq_printf(m, " size %zd:%zd offset %lx\n",
5f2f63696c5520 drivers/android/binder.c         Todd Kjos          2017-06-29  6083  		   buffer->data_size, buffer->offsets_size,
0fb2b1b64e660d drivers/android/binder.c         Carlos Llamas      2023-12-01  6084  		   proc->alloc.buffer - buffer->user_data);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6085  }
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6086  

:::::: The code at line 6082 was first introduced by commit
:::::: 0fb2b1b64e660da94f9e519cb4efb9a6739d2c70 FROMGIT: binder: avoid user addresses in debug logs

:::::: TO: Carlos Llamas <cmllamas@google.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
