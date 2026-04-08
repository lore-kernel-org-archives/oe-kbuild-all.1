Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E310A487BE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Apr 2026 01:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775610526; cv=none; b=q2AM2djNpcPI5K1bsSbaiMYUbg7GYi668TGL19+iJidnxqwneqzrjnDxd5tLnrOoUwMBdCUj19PRdUsLfvr86jrbVclrsJkWl9onSnqnYGREn6Y+muH2dSYiLUOdleKkGOGEwa/Hg+gihc9CK+8ua5Sr2qsIKngP02v/CGRTM8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775610526; c=relaxed/simple;
	bh=oH58kHBZb00Q9kMPpxKZ0IVYZlXPeghOafrSChGoMdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/z2Vw1f1WI6LUFw4uOzxuH1JI4wPtqtonqU/y6DkknM4QmHJltWtPR8l1p5WqY0wdPwke/5eAzVTRPy+ucRlMpQsMIskD/sIPuVXItkZQ+Zu4zZpgy290S/lA1cz4EdaicRFlcuC4JCMpL2Yn9Mqph2zQbscnQ03eEMgMZwkaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTpbul3E; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTpbul3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775610524; x=1807146524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oH58kHBZb00Q9kMPpxKZ0IVYZlXPeghOafrSChGoMdk=;
  b=NTpbul3E83UMWKCR2aDPC5WOaVneNIYYVDasrHB9363u0bsLenOj0QqW
   TRX8wc45j4dFBTrN6FA/XH428ze2oteubBUtWCULWEHQGkP/5vWf5oage
   d+F7rQPDxgS2stb4ru7krz/smhAjl03EOB7zxa+j5nVvR3tjrqUo1y8fi
   inoYb60y4oDw2mNy0Z2rgQ3Gpj/IIkcFkM5J2QR6bW2LfyP0bax5Uo0JQ
   QubA+bXh3YsOo3S8v6H9jMMb/WtFR9pW7KUel/XbmNozz5Lll8vV6EKpp
   I3vt/ZiGKALYCb9yNvTZOe9xy3ypAym2YBCE6obWwLdM3tohx/q2UZE3T
   g==;
X-CSE-ConnectionGUID: PK48FivESDK1zlT41OQLzA==
X-CSE-MsgGUID: snmS1tOeQGmPFIQjuIiJqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="75622886"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="75622886"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 18:08:43 -0700
X-CSE-ConnectionGUID: d9Nn0MbaTqag8TpAkiH9TA==
X-CSE-MsgGUID: JXu9yp3ZQxK+OAJQAkqEkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="232698541"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Apr 2026 18:08:40 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAHPG-000000001GX-3tPg;
	Wed, 08 Apr 2026 01:08:34 +0000
Date: Wed, 8 Apr 2026 09:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: Li Wang <liwang@kylinos.cn>, Miklos Szeredi <miklos@szeredi.hu>,
	Bernd Schubert <bernd@bsbernd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Li Wang <liwang@kylinos.cn>
Subject: Re: [PATCH v2] fuse: Send FORGET over io_uring when ring is ready
Message-ID: <202604080826.6cW9hWuX-lkp@intel.com>
References: <20260403035752.20206-1-liwang@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403035752.20206-1-liwang@kylinos.cn>

Hi Li,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.0-rc7]
[also build test ERROR on linus/master]
[cannot apply to mszeredi-fuse/for-next next-20260407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Wang/fuse-Send-FORGET-over-io_uring-when-ring-is-ready/20260408-015226
base:   v7.0-rc7
patch link:    https://lore.kernel.org/r/20260403035752.20206-1-liwang%40kylinos.cn
patch subject: [PATCH v2] fuse: Send FORGET over io_uring when ring is ready
config: i386-randconfig-141-20260408 (https://download.01.org/0day-ci/archive/20260408/202604080826.6cW9hWuX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604080826.6cW9hWuX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604080826.6cW9hWuX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fuse/dev_uring.c:1433:15: error: no member named 'abort_on_kill' in 'struct fuse_args'
    1433 |         if (!d->args.abort_on_kill)
         |              ~~~~~~~ ^
   1 error generated.


vim +1433 fs/fuse/dev_uring.c

  1378	
  1379	/*
  1380	 * Send FUSE_FORGET through the io-uring ring when active; same payload as
  1381	 * fuse_read_single_forget(), with userspace committing like any other request.
  1382	 * Called from fuse_dev_queue_forget() when fuse_uring_ready().
  1383	 */
  1384	void fuse_io_uring_send_forget(struct fuse_iqueue *fiq,
  1385					struct fuse_forget_link *forget)
  1386	{
  1387		struct fuse_conn *fc = container_of(fiq, struct fuse_conn, iq);
  1388		struct fuse_mount *fm;
  1389		struct fuse_req *req;
  1390		struct fuse_forget_uring_data *d;
  1391	
  1392		if (!fuse_uring_ready(fc)) {
  1393			fuse_dev_queue_forget_list(fiq, forget);
  1394			return;
  1395		}
  1396	
  1397		down_read(&fc->killsb);
  1398		if (list_empty(&fc->mounts)) {
  1399			up_read(&fc->killsb);
  1400			fuse_dev_queue_forget_list(fiq, forget);
  1401			return;
  1402		}
  1403		fm = list_first_entry(&fc->mounts, struct fuse_mount, fc_entry);
  1404		up_read(&fc->killsb);
  1405	
  1406		d = kmalloc(sizeof(*d), GFP_KERNEL);
  1407		if (!d)
  1408			goto fallback;
  1409	
  1410		atomic_inc(&fc->num_waiting);
  1411		req = fuse_request_alloc(fm, GFP_KERNEL);
  1412		if (!req) {
  1413			kfree(d);
  1414			fuse_drop_waiting(fc);
  1415			goto fallback;
  1416		}
  1417	
  1418		memset(&d->args, 0, sizeof(d->args));
  1419		d->inarg.nlookup = forget->forget_one.nlookup;
  1420		d->args.opcode = FUSE_FORGET;
  1421		d->args.nodeid = forget->forget_one.nodeid;
  1422		d->args.in_numargs = 1;
  1423		d->args.in_args[0].size = sizeof(d->inarg);
  1424		d->args.in_args[0].value = &d->inarg;
  1425		d->args.force = true;
  1426		d->args.noreply = true;
  1427		d->args.end = fuse_forget_uring_free;
  1428	
  1429		kfree(forget);
  1430	
  1431		fuse_force_creds(req);
  1432		__set_bit(FR_WAITING, &req->flags);
> 1433		if (!d->args.abort_on_kill)
  1434			__set_bit(FR_FORCE, &req->flags);
  1435		fuse_adjust_compat(fc, &d->args);
  1436		fuse_args_to_req(req, &d->args);
  1437		req->in.h.len = sizeof(struct fuse_in_header) +
  1438			fuse_len_args(req->args->in_numargs,
  1439				      (struct fuse_arg *)req->args->in_args);
  1440	
  1441		fuse_uring_queue_fuse_req(fiq, req);
  1442		return;
  1443	
  1444	fallback:
  1445		fuse_dev_queue_forget_list(fiq, forget);
  1446	}
  1447	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
