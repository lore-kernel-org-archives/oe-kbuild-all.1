Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7D01C54AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 22:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740781267; cv=none; b=DR4k7wzjPDet9PVbS1+M3ZwsShudEwnbnqJw9ZqEn5BqHkAaAE0BTH+zZPwwbt1YY4K39FdPT4XjCuGGB6+ZMm/lOaFRPkSZQQNaISqdevsVjPJauu8DHrOpdWir5tebz3f/ofVVB1BM89BOMhmd93GCyhXuZH665jBQQ1v106k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740781267; c=relaxed/simple;
	bh=cQHeRZXhLjDV6cGyQOs6OoT76owavjZFEdGCI/sdIaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JwqTqxE9CBk0v8WXlATEbvCs/U0oIM+aYwzr+4nRTBX+zDZBPFXjZ4EJibhNAKDzc1wfEzopE9dXgILgPRXV+tCeQhFLkc25nrs1KddqUJGupu5QhAULrZPPtNhA+3zknAIVV+t/L//b/4KGyZVVdd6sbj8L+XwSWpqe9SVz45g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9jKWk2l; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9jKWk2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740781265; x=1772317265;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cQHeRZXhLjDV6cGyQOs6OoT76owavjZFEdGCI/sdIaw=;
  b=V9jKWk2lkGzlX48NIAy3AVgLTgDIRlvJyEgEjP6mI4OF6OJje8l940tZ
   QAyvP/NkDQtG2QLS+A4u/m5MN+T/PjbDdbGjXPt+xOpuVTxkhEtY9bOzU
   1yPDbzyfQv/lqu+94maXr24d3yfmeuEqka2PDqJejUdE+C2BdNzDfm8RY
   neM07X8mu30mSm+6CTByvjNguUjedgUQ0rt8QgyFZLtBVfgJZ0ERXVXzA
   bSl0shZvCd1BDdJlSn85nG1iZwHxG0COItXjHRqu7ddGF/Ijba7BX7dDD
   o0uIprZeYiyek03+CgFVReRUnNxM0lrH6my3OLji8yjJ5AvrEJaAc3RG4
   A==;
X-CSE-ConnectionGUID: RUmwMANYQReSodqwxzslRQ==
X-CSE-MsgGUID: hMcLLP6qStyo31u45fuKfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="64182720"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="64182720"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 14:21:05 -0800
X-CSE-ConnectionGUID: Hvkp3KPDQVGPaEbyUrXKZQ==
X-CSE-MsgGUID: MiKUUxguRNGJajJ9V1q0ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="117959705"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Feb 2025 14:21:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to8j7-000FZa-18;
	Fri, 28 Feb 2025 22:21:01 +0000
Date: Sat, 1 Mar 2025 06:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] block/blk-core.c:1151: warning:
 Function parameter or member 'iob' not described in 'bio_poll'
Message-ID: <202503010657.polBw837-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   b546d9695894905e1bc9de7646f89b06dbeae968
commit: ddd49747325a3eff986b8d4a1b837b5760783716 [0/1] block: add a struct io_comp_batch argument to fops->iopoll()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250301/202503010657.polBw837-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503010657.polBw837-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503010657.polBw837-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-core.c:1151: warning: Function parameter or member 'iob' not described in 'bio_poll'


vim +1151 block/blk-core.c

b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1138  
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1139  /**
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1140   * bio_poll - poll for BIO completions
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1141   * @bio: bio to poll for
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1142   * @flags: BLK_POLL_* flags that control the behavior
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1143   *
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1144   * Poll for completions on queue associated with the bio. Returns number of
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1145   * completed entries found.
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1146   *
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1147   * Note: the caller must either be the context that submitted @bio, or
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1148   * be in a RCU critical section to prevent freeing of @bio.
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1149   */
ddd49747325a3e block/blk-core.c          Jens Axboe        2021-10-12  1150  int bio_poll(struct bio *bio, struct io_comp_batch *iob, unsigned int flags)
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12 @1151  {
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1152  	struct request_queue *q = bio->bi_disk->queue;
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1153  	blk_qc_t cookie = READ_ONCE(bio->bi_cookie);
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1154  	int ret;
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1155  
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1156  	if (cookie == BLK_QC_T_NONE ||
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1157  	    !test_bit(QUEUE_FLAG_POLL, &q->queue_flags))
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1158  		return 0;
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1159  
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1160  	if (current->plug)
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1161  		blk_flush_plug_list(current->plug, false);
b8e24a9300b083 block/blk-core.c          Johannes Weiner   2019-08-08  1162  
62137c3417522c block/blk-core.c          Christoph Hellwig 2022-05-23  1163  	if (bio_queue_enter(bio))
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1164  		return 0;
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1165  	if (WARN_ON_ONCE(!queue_is_mq(q)))
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1166  		ret = 0;	/* not yet implemented, should not happen */
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1167  	else
ddd49747325a3e block/blk-core.c          Jens Axboe        2021-10-12  1168  		ret = blk_mq_poll(q, cookie, iob, flags);
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1169  	blk_queue_exit(q);
b8e24a9300b083 block/blk-core.c          Johannes Weiner   2019-08-08  1170  	return ret;
^1da177e4c3f41 drivers/block/ll_rw_blk.c Linus Torvalds    2005-04-16  1171  }
b8f1c9a55b6646 block/blk-core.c          Christoph Hellwig 2021-10-12  1172  EXPORT_SYMBOL_GPL(bio_poll);
760f83ea63a7b2 block/blk-core.c          Christoph Hellwig 2020-04-28  1173  

:::::: The code at line 1151 was first introduced by commit
:::::: b8f1c9a55b664647922f370751f48d2abd0535bc block: switch polling to be bio based

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: 小龙 <wenqing.ly@alibaba-inc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
