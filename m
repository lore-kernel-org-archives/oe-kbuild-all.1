Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AC38248E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 18:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713204967; cv=none; b=NcVTYKa2MUlKG+7IsBXQJFyGYqE2NLsMME9f0tlyofJbD+aIDeIxfyJ5k7VvX6eN0ughZkmyclKE6T/db2m3EuDFURZMokQxHgwTpz0vT0vSEdXxq2WWOSFuGyDSppPv6xXApRQEB3qJzRxvn1J6P//zP4vQ6ZqtvrVc71Hgf5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713204967; c=relaxed/simple;
	bh=QEpErlo9xJlsHNIC/sV8xlpwo4XX4hAAYcqKNmJc+kg=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=OyXtDWV4jD6mAd98MDLmV6/e81Bo+kPwI4AWkIhjwUN9boFHi3ox82ax8S6otVj6EqgpSbMz01RHSwITIiELNYxNgvyHq3HBnxwAgeAD60ahRysg6n8pXOzylTGQwreiKMvVQd8flTwera1VHBeb4UFLU7zQArLFp/NVn15ntxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=PDrWlKV4; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="PDrWlKV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9BKQ9z8mQEP4dTi+XlmYAMgvWWj01Dy+ofQP50sVLrA=;
  b=PDrWlKV4ZuGs5H0nFJLrOimid+aFx1p5ttofBWRTBZcJ8ad230BYASoC
   IEPNg/xfStSedKPX+jh5OvYBUG1gqYqCV4tci5ZfLYX8nMtzDGyxMm6kq
   AWkxrl/DPdnW8HWFHPlWZd5LcZ5BBRYQ3+fwG2FwdO5//rKDE9+lCspCy
   4=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,203,1708383600"; 
   d="scan'208";a="84882604"
Received: from unknown (HELO hadrien) ([89.207.175.13])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 20:15:53 +0200
Date: Mon, 15 Apr 2024 20:15:51 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Andrew Davis <afd@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
cc: nm@ti.com, vigneshr@ti.com, oe-kbuild-all@lists.linux.dev
Subject: [ti:ti-linux-6.6.y-wip 16/18] drivers/remoteproc/remoteproc_cdev.c:167:6-16:
 ERROR: reference preceded by free on line 165 (fwd)
Message-ID: <22bc93ba-e135-119d-8257-739b8c57dc15@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Please check lines 165 and 167.

julia

---------- Forwarded message ----------
Date: Mon, 15 Apr 2024 01:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [ti:ti-linux-6.6.y-wip 16/18]
    drivers/remoteproc/remoteproc_cdev.c:167:6-16: ERROR: reference preceded by
    free on line 165

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Andrew Davis <afd@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   6b3bec4539bd706892be36c3b481b9aa7cbe27a8
commit: cde91a89becee656867b8c8a86e627241dc91449 [16/18] remoteproc: core: Add DMA-BUF attachment interface to cdev
:::::: branch date: 3 days ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-101-20240414 (https://download.01.org/0day-ci/archive/20240415/202404150107.gJtdbKtX-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404150107.gJtdbKtX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/remoteproc/remoteproc_cdev.c:167:6-16: ERROR: reference preceded by free on line 165

vim +167 drivers/remoteproc/remoteproc_cdev.c

a4dac51a55b795 Andrew Davis    2024-02-21  150
a4dac51a55b795 Andrew Davis    2024-02-21  151  static int rproc_cdev_release(struct inode *inode, struct file *filp)
a4dac51a55b795 Andrew Davis    2024-02-21  152  {
a4dac51a55b795 Andrew Davis    2024-02-21  153  	struct rproc_cdev *rproc_cdev = filp->private_data;
a4dac51a55b795 Andrew Davis    2024-02-21  154  	struct rproc *rproc = rproc_cdev->rproc;
6e71d2b2a2b717 Mathieu Poirier 2021-03-12  155  	int ret = 0;
6e71d2b2a2b717 Mathieu Poirier 2021-03-12  156
cde91a89becee6 Andrew Davis    2024-02-21  157  	/* Release all buffers attached with this file */
cde91a89becee6 Andrew Davis    2024-02-21  158  	struct rproc_cdev_attach *attach, *atmp;
cde91a89becee6 Andrew Davis    2024-02-21  159  	list_for_each_entry_safe(attach, atmp, &rproc_cdev->attachments, node) {
cde91a89becee6 Andrew Davis    2024-02-21  160  		rproc_detach_dmabuf(rproc, attach->dmabuf);
cde91a89becee6 Andrew Davis    2024-02-21  161  		dma_buf_put(attach->dmabuf);
cde91a89becee6 Andrew Davis    2024-02-21  162  		kfree(attach);
cde91a89becee6 Andrew Davis    2024-02-21  163  	}
cde91a89becee6 Andrew Davis    2024-02-21  164  	mutex_destroy(&rproc_cdev->mutex);
cde91a89becee6 Andrew Davis    2024-02-21 @165  	kfree(rproc_cdev);
cde91a89becee6 Andrew Davis    2024-02-21  166
a4dac51a55b795 Andrew Davis    2024-02-21 @167  	if (!rproc_cdev->cdev_put_on_release)
6e71d2b2a2b717 Mathieu Poirier 2021-03-12  168  		return 0;
4476770881d7ac Siddharth Gupta 2020-07-29  169
6e71d2b2a2b717 Mathieu Poirier 2021-03-12  170  	if (rproc->state == RPROC_RUNNING)
4476770881d7ac Siddharth Gupta 2020-07-29  171  		rproc_shutdown(rproc);
6e71d2b2a2b717 Mathieu Poirier 2021-03-12  172  	else if (rproc->state == RPROC_ATTACHED)
6e71d2b2a2b717 Mathieu Poirier 2021-03-12  173  		ret = rproc_detach(rproc);
4476770881d7ac Siddharth Gupta 2020-07-29  174
6e71d2b2a2b717 Mathieu Poirier 2021-03-12  175  	return ret;
4476770881d7ac Siddharth Gupta 2020-07-29  176  }
4476770881d7ac Siddharth Gupta 2020-07-29  177

:::::: The code at line 167 was first introduced by commit
:::::: a4dac51a55b7950e8e3fdd71db15b8c1686a8a28 remoteproc: core: Make shutdown-on-release per-file handle

:::::: TO: Andrew Davis <afd@ti.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
