Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4B32030A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715370994; cv=none; b=L4GFGvpX3rq5VIFWM0ZbNldiWyOKhzEpRvsFG3+FUibySzPbkgD4GpBB2KR88wcF7r2XDRu7QzqOjT876pIr/7pQCGY2k7RDjKQmOg9+0DNTYxyek8NCNlZ+iUlTOyYoWguRPvd13tKxlDTC6PP/vM7F/gvp/sxCre82+NUR8Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715370994; c=relaxed/simple;
	bh=GZ+A3xQ49l3QNKobbXQFZYhQX9ollFjiZNImOlB1WHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TsuPOnhHEbAQmSgSn77IGXK5u2FXDwXBrCGCRYL9GShBk4gJxI3iNHU0D2AttlIr+erSeJv0mAuHzeJLoPQBb6kJiC4ZNwWqKR1mfmVcBdFIl6X9AP+TE2I6fg0SM9ryRDP8BXqSbyHKDqJwwgApJPtC7LSsvpCE1D07sFj8xlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcxSkk06; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcxSkk06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715370992; x=1746906992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GZ+A3xQ49l3QNKobbXQFZYhQX9ollFjiZNImOlB1WHE=;
  b=LcxSkk06//CDjNOPIBA3Fzh9OmLtbYFAIGNeCg0eLwV1OTXI56tiUh4L
   r6EvvaJSjMsyxXU7vWIOISU3eVBBSirjY6m6dshKG467ZC0upN3bD8jvQ
   +K9K4tmvTVCUVygv/mUnyfx1iUfvCJ/1P3XkF7E7u6rQE2S+orEEOPaGX
   b2JrFo3GQRJ/qzLW60JRtzGXm3N8FPH4Ha+9AUZ5+uQaPGX7f88O7dd+h
   vuzKfKgmJQFXKNRGqV427XAujt0V9f7IT9GX65sPCZfepbRbXh3pEJe6t
   ClMcylYimGzMSrfVSU7C6LbzC0eyo+lY7U2xRnlhZYV+uq6YqAdT/z+hq
   g==;
X-CSE-ConnectionGUID: hpAT2dujReOPo9hyNqHykw==
X-CSE-MsgGUID: +DizzfTXQOOPZbFNLI7TjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="33882411"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="33882411"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 12:56:31 -0700
X-CSE-ConnectionGUID: enpziz0HQUSzl0zpC7ct0w==
X-CSE-MsgGUID: cRpDkz42Qg+p45Zy2YQXCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="34249218"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 May 2024 12:56:29 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5WLz-0006Wp-0J;
	Fri, 10 May 2024 19:56:27 +0000
Date: Sat, 11 May 2024 03:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:secure-concat.v4 20/20]
 drivers/nvme/target/fabrics-cmd.c:213:25: error: 'struct nvmet_sq' has no
 member named 'tls_key'
Message-ID: <202405110327.Q7FhhWrD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v4
head:   8986008182ed104f529376181e6cfd13efa627e2
commit: 8986008182ed104f529376181e6cfd13efa627e2 [20/20] nvmet-tcp: support secure channel concatenation
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240511/202405110327.Q7FhhWrD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110327.Q7FhhWrD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110327.Q7FhhWrD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/loongarch/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/loongarch/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from drivers/nvme/target/fabrics-cmd.c:7:
   drivers/nvme/target/fabrics-cmd.c: In function 'nvmet_connect_result':
>> drivers/nvme/target/fabrics-cmd.c:213:25: error: 'struct nvmet_sq' has no member named 'tls_key'
     213 |                  req->sq->tls_key ? key_serial(req->sq->tls_key) : 0);
         |                         ^~
   include/linux/printk.h:429:33: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   include/linux/printk.h:587:9: note: in expansion of macro 'no_printk'
     587 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   drivers/nvme/target/fabrics-cmd.c:210:9: note: in expansion of macro 'pr_debug'
     210 |         pr_debug("%s: ctrl %d qid %d should %sauthenticate, tls psk %08x\n",
         |         ^~~~~~~~
   drivers/nvme/target/fabrics-cmd.c:213:55: error: 'struct nvmet_sq' has no member named 'tls_key'
     213 |                  req->sq->tls_key ? key_serial(req->sq->tls_key) : 0);
         |                                                       ^~
   include/linux/printk.h:429:33: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   include/linux/printk.h:587:9: note: in expansion of macro 'no_printk'
     587 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   drivers/nvme/target/fabrics-cmd.c:210:9: note: in expansion of macro 'pr_debug'
     210 |         pr_debug("%s: ctrl %d qid %d should %sauthenticate, tls psk %08x\n",
         |         ^~~~~~~~
--
   In file included from drivers/nvme/target/tcp.c:13:
   include/linux/nvme-keyring.h: In function 'nvme_tls_psk_refresh':
   include/linux/nvme-keyring.h:23:16: warning: returning 'int' from a function with return type 'struct key *' makes pointer from integer without a cast [-Wint-conversion]
      23 |         return -ENOTSUPP;
         |                ^
   drivers/nvme/target/tcp.c: In function 'nvmet_tcp_release_queue_work':
>> drivers/nvme/target/tcp.c:1609:27: error: 'struct nvmet_sq' has no member named 'tls_key'
    1609 |         if (queue->nvme_sq.tls_key)
         |                           ^
   drivers/nvme/target/tcp.c:1610:39: error: 'struct nvmet_sq' has no member named 'tls_key'
    1610 |                 key_put(queue->nvme_sq.tls_key);
         |                                       ^
   include/linux/nvme-keyring.h: At top level:
   include/linux/nvme-keyring.h:20:20: warning: 'nvme_tls_psk_refresh' defined but not used [-Wunused-function]
      20 | static struct key *nvme_tls_psk_refresh(struct key *keyring, char *hostnqn, char *subnqn,
         |                    ^~~~~~~~~~~~~~~~~~~~


vim +213 drivers/nvme/target/fabrics-cmd.c

   201	
   202	static u32 nvmet_connect_result(struct nvmet_ctrl *ctrl, struct nvmet_req *req)
   203	{
   204		bool needs_auth = nvmet_has_auth(ctrl, req);
   205	
   206		/* Do not authenticate I/O queues for secure concatenation */
   207		if (ctrl->concat && req->sq->qid)
   208			needs_auth = false;
   209	
   210		pr_debug("%s: ctrl %d qid %d should %sauthenticate, tls psk %08x\n",
   211			 __func__, ctrl->cntlid, req->sq->qid,
   212			 needs_auth ? "" : "not ",
 > 213			 req->sq->tls_key ? key_serial(req->sq->tls_key) : 0);
   214		return (u32)ctrl->cntlid |
   215			(needs_auth ? NVME_CONNECT_AUTHREQ_ATR : 0);
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
