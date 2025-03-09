Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D8A136351
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 20:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741553949; cv=none; b=jSUt72fk8aRsjHYWuH0T7DCzozXv3WS/MJ1NSRVAWceAA9C9gpzfVHKJ0uiyAL4a5pQ818NY6cm2hkDViCpUqEp9NRAJiJYvK9+BvI7cV3uZd5SpoESRomGTXXk0vsnOz8wuTDgrVFmo9Fy6+UqPRt6/1XVTfZVS3jNVRoF1txc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741553949; c=relaxed/simple;
	bh=qiiXnUadSRHRzyj66WjoGror4io5/+xMIT2nmfJM/mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UEcSrVMKfRFwkUBe/WnV8x8nVMHrXOePB9Xljic2P35kRKGeb/kBpDmIErqnCILeqEK9hNrS80JW2Df5phJuu6Og9N9DwYOjQRYhGnnYvhH/GAOlHLd62yV2wwoNamZdE+8eAfBWzO2IVeHE591bukuuZ0o4wRPFv3tsmYBOaJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=km769S+g; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="km769S+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741553947; x=1773089947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qiiXnUadSRHRzyj66WjoGror4io5/+xMIT2nmfJM/mw=;
  b=km769S+g5ZCHWJfgr/QpAXHnaby7Ng2fVK0/lTHTjbxuzbQB73KNWRSW
   cZP1tZy7Mj9Q1BKnPy/oWB5AP0WBJzLtJIARGGaHGOXTQ+8ueQZCfnXQV
   DTzL7Eh2fOEHQ0oX5ILPxPLuMdvyyFwf3Ww2U8oRciT3AtirAhjlDyRSg
   HN8O8J8DcoId9If49GK2YuE38K449hLBeT/AX2n7folIlwg5R619EmpB0
   gk2xaRAt+wK6a+YiKc8VlBWLVynxnJN2MR8cJ/s5a2p2jLf/HFdIJtIwK
   XjiBdbuesetBQOmjdB09xW/MLbqUb6j73KsXyOzHb1eTVyZaSgs3+BI0/
   g==;
X-CSE-ConnectionGUID: 6VpLsVeoQvy60CFfNlpzAA==
X-CSE-MsgGUID: vbsuGH+HTIyXxvHrL1k3SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="67904807"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="67904807"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 13:59:07 -0700
X-CSE-ConnectionGUID: /mm2a+CJRKaDWCAzYIxPaA==
X-CSE-MsgGUID: p7yxL6r5Riywi3zLEk3vWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="120527789"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 09 Mar 2025 13:59:06 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trNjk-0003SY-0E;
	Sun, 09 Mar 2025 20:59:04 +0000
Date: Mon, 10 Mar 2025 04:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] fs/fuse/dev.c:2286: warning:
 Function parameter or member 'fc' not described in 'fuse_resend_pqueue'
Message-ID: <202503100417.BJrwFAs0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peng,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   797aae63f086cf8250bfbb8395ab310c525ac4a6
commit: 017eaddf79d79778d3ba4af5ed1076a1e9558151 [1/1] anolis: fuse: add sysfs api to resend processing queue requests
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250310/202503100417.BJrwFAs0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100417.BJrwFAs0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100417.BJrwFAs0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/fuse/dev.c:212: warning: Function parameter or member 'fiq' not described in 'fuse_dev_wake_and_unlock'
>> fs/fuse/dev.c:2286: warning: Function parameter or member 'fc' not described in 'fuse_resend_pqueue'


vim +2286 fs/fuse/dev.c

  2269	
  2270	/**
  2271	 * Resend all processing queue requests.
  2272	 *
  2273	 * When a FUSE daemon panics and fails over, we want to reuse the existing FUSE
  2274	 * connection and avoid affecting applications as little as possible. During
  2275	 * FUSE daemon failover, the FUSE processing queue requests are waiting for
  2276	 * replies from user space daemon that never come back and applications would
  2277	 * stuck forever.
  2278	 *
  2279	 * Besides flushing the processing queue requests like being done in fuse_flush_pq(),
  2280	 * we can also resend these requests to user space daemon so that they can be
  2281	 * processed properly again. Such strategy can only be done for idempotent requests
  2282	 * or if the user space daemon takes good care to record and avoid processing
  2283	 * duplicated non-idempotent requests.
  2284	 */
  2285	void fuse_resend_pqueue(struct fuse_conn *fc)
> 2286	{
  2287		struct fuse_dev *fud;
  2288		struct fuse_req *req, *next;
  2289		struct fuse_iqueue *fiq = &fc->iq;
  2290		LIST_HEAD(to_queue);
  2291	
  2292		spin_lock(&fc->lock);
  2293		if (!fc->connected) {
  2294			spin_unlock(&fc->lock);
  2295			return;
  2296		}
  2297	
  2298		list_for_each_entry(fud, &fc->devices, entry) {
  2299			struct fuse_pqueue *fpq = &fud->pq;
  2300	
  2301			spin_lock(&fpq->lock);
  2302			list_for_each_entry_safe(req, next, &fpq->io, list) {
  2303				spin_lock(&req->waitq.lock);
  2304				if (!test_bit(FR_LOCKED, &req->flags)) {
  2305					__fuse_get_request(req);
  2306					list_move(&req->list, &to_queue);
  2307				}
  2308				spin_unlock(&req->waitq.lock);
  2309			}
  2310			list_splice_tail_init(fpq->processing, &to_queue);
  2311			spin_unlock(&fpq->lock);
  2312		}
  2313		spin_unlock(&fc->lock);
  2314	
  2315		list_for_each_entry_safe(req, next, &to_queue, list) {
  2316			__set_bit(FR_PENDING, &req->flags);
  2317		}
  2318	
  2319		spin_lock(&fiq->lock);
  2320		/* iq and pq requests are both oldest to newest */
  2321		list_splice(&to_queue, &fiq->pending);
  2322		spin_unlock(&fiq->lock);
  2323	}
  2324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
