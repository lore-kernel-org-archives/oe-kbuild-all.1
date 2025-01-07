Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ED91F4721
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267138; cv=none; b=kHbjPaZhTSZXasRt3Nly2qXFHKculh/8aMZQpzxR5S72uWksTM6D8ifcTU0e1mxV34+JIlxMs7+Njl1CPjnlgQ4jVcZT6a8um+nwDgXABecbSqlwJN49DC+fkdBbJcwiuX1hS3r98xHXRpq43eKkd++GkPv+0SlrK1QlaaM1v0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267138; c=relaxed/simple;
	bh=AHm3+juMqrtHopjaOagwTaF09yOy1hbCC/2HPyXcRYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gxnz/n6VXj6nFvZR1LS6sLEqHXv77wrq9oeqcNZ+RkhXW6XmSKIdxh+Z/0XFKoO0PQCQC1HOeRwFFFd2PD74t9KO1KdMxcfiI4auIubThWECHTbhJqNWgbd9Shv3v77NVPhI8fMMFdxshjL/41U2kQQpchipsqR5asVy+1Nw2Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZkFpdn4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZkFpdn4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736267135; x=1767803135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AHm3+juMqrtHopjaOagwTaF09yOy1hbCC/2HPyXcRYs=;
  b=VZkFpdn4SXnMmI2svspY7cPRyJHOoC9kka57zB7f4BYIebTJZi5QqVdB
   NsaoyYwvixyLPLp0RvcCo2YpB8bu2sMsK/sBvvp52EzI3MgBraL+jx07H
   wLuwg203R3yaMga8tOtbvZdS34y5WWHa1GLB8fFL4L982WF0se8r8BA7f
   Sz1KCUR2mlb8Y/jJTu9SUUCsjcukF2sHSlpdauxnPNxee8tFDLRpTuH4r
   HJ7NIaupuWNlx6oHRiBqiWgLm7kj3yKGs52u7E4849Vi2lf7NAh7wBIaC
   Y1IazywYgYFNbtRWnciAQrlGw+sCq20LzAvva1umA5gznu867yiZdJx5F
   Q==;
X-CSE-ConnectionGUID: Ux/qnuDQRSC5JvHuoR5MZA==
X-CSE-MsgGUID: 0wXLOoudQdi2kOc5XMNToQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36617695"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36617695"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 08:25:21 -0800
X-CSE-ConnectionGUID: caHHTg+WRi6zLaK+7XXjZA==
X-CSE-MsgGUID: M2aCRMIYQkSwK0Q7fzg4lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107430376"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jan 2025 08:25:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVCOL-000Ey3-1s;
	Tue, 07 Jan 2025 16:25:17 +0000
Date: Wed, 8 Jan 2025 00:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 1347/1347] io_uring/rw.c:912:2-7: WARNING:
 NULL check before some freeing functions is not needed.
Message-ID: <202501080029.UgiQTbhx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 739b43265be0074bb146049da59ffc03bb9d1dd0 [1347/1347] fs: export rw_verify_area()
config: x86_64-randconfig-101-20250107 (https://download.01.org/0day-ci/archive/20250108/202501080029.UgiQTbhx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080029.UgiQTbhx-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/rw.c:912:2-7: WARNING: NULL check before some freeing functions is not needed.
   io_uring/rw.c:1017:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +912 io_uring/rw.c

65f092313e595f Jens Axboe 2022-06-13  770  
65f092313e595f Jens Axboe 2022-06-13  771  int io_read(struct io_kiocb *req, unsigned int issue_flags)
65f092313e595f Jens Axboe 2022-06-13  772  {
65f092313e595f Jens Axboe 2022-06-13  773  	struct io_rw *rw = io_kiocb_to_cmd(req);
65f092313e595f Jens Axboe 2022-06-13  774  	struct io_rw_state __s, *s = &__s;
65f092313e595f Jens Axboe 2022-06-13  775  	struct iovec *iovec;
65f092313e595f Jens Axboe 2022-06-13  776  	struct kiocb *kiocb = &rw->kiocb;
65f092313e595f Jens Axboe 2022-06-13  777  	bool force_nonblock = issue_flags & IO_URING_F_NONBLOCK;
65f092313e595f Jens Axboe 2022-06-13  778  	struct io_async_rw *io;
65f092313e595f Jens Axboe 2022-06-13  779  	ssize_t ret, ret2;
65f092313e595f Jens Axboe 2022-06-13  780  	loff_t *ppos;
65f092313e595f Jens Axboe 2022-06-13  781  
65f092313e595f Jens Axboe 2022-06-13  782  	if (!req_has_async_data(req)) {
65f092313e595f Jens Axboe 2022-06-13  783  		ret = io_import_iovec(READ, req, &iovec, s, issue_flags);
65f092313e595f Jens Axboe 2022-06-13  784  		if (unlikely(ret < 0))
65f092313e595f Jens Axboe 2022-06-13  785  			return ret;
65f092313e595f Jens Axboe 2022-06-13  786  	} else {
65f092313e595f Jens Axboe 2022-06-13  787  		io = req->async_data;
65f092313e595f Jens Axboe 2022-06-13  788  		s = &io->s;
65f092313e595f Jens Axboe 2022-06-13  789  
65f092313e595f Jens Axboe 2022-06-13  790  		/*
65f092313e595f Jens Axboe 2022-06-13  791  		 * Safe and required to re-import if we're using provided
65f092313e595f Jens Axboe 2022-06-13  792  		 * buffers, as we dropped the selected one before retry.
65f092313e595f Jens Axboe 2022-06-13  793  		 */
65f092313e595f Jens Axboe 2022-06-13  794  		if (io_do_buffer_select(req)) {
65f092313e595f Jens Axboe 2022-06-13  795  			ret = io_import_iovec(READ, req, &iovec, s, issue_flags);
65f092313e595f Jens Axboe 2022-06-13  796  			if (unlikely(ret < 0))
65f092313e595f Jens Axboe 2022-06-13  797  				return ret;
65f092313e595f Jens Axboe 2022-06-13  798  		}
65f092313e595f Jens Axboe 2022-06-13  799  
65f092313e595f Jens Axboe 2022-06-13  800  		/*
65f092313e595f Jens Axboe 2022-06-13  801  		 * We come here from an earlier attempt, restore our state to
65f092313e595f Jens Axboe 2022-06-13  802  		 * match in case it doesn't. It's cheap enough that we don't
65f092313e595f Jens Axboe 2022-06-13  803  		 * need to make this conditional.
65f092313e595f Jens Axboe 2022-06-13  804  		 */
65f092313e595f Jens Axboe 2022-06-13  805  		iov_iter_restore(&s->iter, &s->iter_state);
65f092313e595f Jens Axboe 2022-06-13  806  		iovec = NULL;
65f092313e595f Jens Axboe 2022-06-13  807  	}
65f092313e595f Jens Axboe 2022-06-13  808  	ret = io_rw_init_file(req, FMODE_READ);
65f092313e595f Jens Axboe 2022-06-13  809  	if (unlikely(ret)) {
65f092313e595f Jens Axboe 2022-06-13  810  		kfree(iovec);
65f092313e595f Jens Axboe 2022-06-13  811  		return ret;
65f092313e595f Jens Axboe 2022-06-13  812  	}
65f092313e595f Jens Axboe 2022-06-13  813  	req->cqe.res = iov_iter_count(&s->iter);
65f092313e595f Jens Axboe 2022-06-13  814  
65f092313e595f Jens Axboe 2022-06-13  815  	if (force_nonblock) {
65f092313e595f Jens Axboe 2022-06-13  816  		/* If the file doesn't support async, just async punt */
65f092313e595f Jens Axboe 2022-06-13  817  		if (unlikely(!io_file_supports_nowait(req))) {
65f092313e595f Jens Axboe 2022-06-13  818  			ret = io_setup_async_rw(req, iovec, s, true);
65f092313e595f Jens Axboe 2022-06-13  819  			return ret ?: -EAGAIN;
65f092313e595f Jens Axboe 2022-06-13  820  		}
65f092313e595f Jens Axboe 2022-06-13  821  		kiocb->ki_flags |= IOCB_NOWAIT;
65f092313e595f Jens Axboe 2022-06-13  822  	} else {
65f092313e595f Jens Axboe 2022-06-13  823  		/* Ensure we clear previously set non-block flag */
65f092313e595f Jens Axboe 2022-06-13  824  		kiocb->ki_flags &= ~IOCB_NOWAIT;
65f092313e595f Jens Axboe 2022-06-13  825  	}
65f092313e595f Jens Axboe 2022-06-13  826  
65f092313e595f Jens Axboe 2022-06-13  827  	ppos = io_kiocb_update_pos(req);
65f092313e595f Jens Axboe 2022-06-13  828  
65f092313e595f Jens Axboe 2022-06-13  829  	ret = rw_verify_area(READ, req->file, ppos, req->cqe.res);
65f092313e595f Jens Axboe 2022-06-13  830  	if (unlikely(ret)) {
65f092313e595f Jens Axboe 2022-06-13  831  		kfree(iovec);
65f092313e595f Jens Axboe 2022-06-13  832  		return ret;
65f092313e595f Jens Axboe 2022-06-13  833  	}
65f092313e595f Jens Axboe 2022-06-13  834  
65f092313e595f Jens Axboe 2022-06-13  835  	ret = io_iter_do_read(rw, &s->iter);
65f092313e595f Jens Axboe 2022-06-13  836  
65f092313e595f Jens Axboe 2022-06-13  837  	if (ret == -EAGAIN || (req->flags & REQ_F_REISSUE)) {
65f092313e595f Jens Axboe 2022-06-13  838  		req->flags &= ~REQ_F_REISSUE;
65f092313e595f Jens Axboe 2022-06-13  839  		/* if we can poll, just do that */
65f092313e595f Jens Axboe 2022-06-13  840  		if (req->opcode == IORING_OP_READ && file_can_poll(req->file))
65f092313e595f Jens Axboe 2022-06-13  841  			return -EAGAIN;
65f092313e595f Jens Axboe 2022-06-13  842  		/* IOPOLL retry should happen for io-wq threads */
65f092313e595f Jens Axboe 2022-06-13  843  		if (!force_nonblock && !(req->ctx->flags & IORING_SETUP_IOPOLL))
65f092313e595f Jens Axboe 2022-06-13  844  			goto done;
65f092313e595f Jens Axboe 2022-06-13  845  		/* no retry on NONBLOCK nor RWF_NOWAIT */
65f092313e595f Jens Axboe 2022-06-13  846  		if (req->flags & REQ_F_NOWAIT)
65f092313e595f Jens Axboe 2022-06-13  847  			goto done;
65f092313e595f Jens Axboe 2022-06-13  848  		ret = 0;
65f092313e595f Jens Axboe 2022-06-13  849  	} else if (ret == -EIOCBQUEUED) {
65f092313e595f Jens Axboe 2022-06-13  850  		goto out_free;
65f092313e595f Jens Axboe 2022-06-13  851  	} else if (ret == req->cqe.res || ret <= 0 || !force_nonblock ||
65f092313e595f Jens Axboe 2022-06-13  852  		   (req->flags & REQ_F_NOWAIT) || !need_read_all(req)) {
65f092313e595f Jens Axboe 2022-06-13  853  		/* read all, failed, already did sync or don't want to retry */
65f092313e595f Jens Axboe 2022-06-13  854  		goto done;
65f092313e595f Jens Axboe 2022-06-13  855  	}
65f092313e595f Jens Axboe 2022-06-13  856  
65f092313e595f Jens Axboe 2022-06-13  857  	/*
65f092313e595f Jens Axboe 2022-06-13  858  	 * Don't depend on the iter state matching what was consumed, or being
65f092313e595f Jens Axboe 2022-06-13  859  	 * untouched in case of error. Restore it and we'll advance it
65f092313e595f Jens Axboe 2022-06-13  860  	 * manually if we need to.
65f092313e595f Jens Axboe 2022-06-13  861  	 */
65f092313e595f Jens Axboe 2022-06-13  862  	iov_iter_restore(&s->iter, &s->iter_state);
65f092313e595f Jens Axboe 2022-06-13  863  
65f092313e595f Jens Axboe 2022-06-13  864  	ret2 = io_setup_async_rw(req, iovec, s, true);
65f092313e595f Jens Axboe 2022-06-13  865  	if (ret2)
65f092313e595f Jens Axboe 2022-06-13  866  		return ret2;
65f092313e595f Jens Axboe 2022-06-13  867  
65f092313e595f Jens Axboe 2022-06-13  868  	iovec = NULL;
65f092313e595f Jens Axboe 2022-06-13  869  	io = req->async_data;
65f092313e595f Jens Axboe 2022-06-13  870  	s = &io->s;
65f092313e595f Jens Axboe 2022-06-13  871  	/*
65f092313e595f Jens Axboe 2022-06-13  872  	 * Now use our persistent iterator and state, if we aren't already.
65f092313e595f Jens Axboe 2022-06-13  873  	 * We've restored and mapped the iter to match.
65f092313e595f Jens Axboe 2022-06-13  874  	 */
65f092313e595f Jens Axboe 2022-06-13  875  
65f092313e595f Jens Axboe 2022-06-13  876  	do {
65f092313e595f Jens Axboe 2022-06-13  877  		/*
65f092313e595f Jens Axboe 2022-06-13  878  		 * We end up here because of a partial read, either from
65f092313e595f Jens Axboe 2022-06-13  879  		 * above or inside this loop. Advance the iter by the bytes
65f092313e595f Jens Axboe 2022-06-13  880  		 * that were consumed.
65f092313e595f Jens Axboe 2022-06-13  881  		 */
65f092313e595f Jens Axboe 2022-06-13  882  		iov_iter_advance(&s->iter, ret);
65f092313e595f Jens Axboe 2022-06-13  883  		if (!iov_iter_count(&s->iter))
65f092313e595f Jens Axboe 2022-06-13  884  			break;
65f092313e595f Jens Axboe 2022-06-13  885  		io->bytes_done += ret;
65f092313e595f Jens Axboe 2022-06-13  886  		iov_iter_save_state(&s->iter, &s->iter_state);
65f092313e595f Jens Axboe 2022-06-13  887  
65f092313e595f Jens Axboe 2022-06-13  888  		/* if we can retry, do so with the callbacks armed */
65f092313e595f Jens Axboe 2022-06-13  889  		if (!io_rw_should_retry(req)) {
65f092313e595f Jens Axboe 2022-06-13  890  			kiocb->ki_flags &= ~IOCB_WAITQ;
65f092313e595f Jens Axboe 2022-06-13  891  			return -EAGAIN;
65f092313e595f Jens Axboe 2022-06-13  892  		}
65f092313e595f Jens Axboe 2022-06-13  893  
65f092313e595f Jens Axboe 2022-06-13  894  		/*
65f092313e595f Jens Axboe 2022-06-13  895  		 * Now retry read with the IOCB_WAITQ parts set in the iocb. If
65f092313e595f Jens Axboe 2022-06-13  896  		 * we get -EIOCBQUEUED, then we'll get a notification when the
65f092313e595f Jens Axboe 2022-06-13  897  		 * desired page gets unlocked. We can also get a partial read
65f092313e595f Jens Axboe 2022-06-13  898  		 * here, and if we do, then just retry at the new offset.
65f092313e595f Jens Axboe 2022-06-13  899  		 */
65f092313e595f Jens Axboe 2022-06-13  900  		ret = io_iter_do_read(rw, &s->iter);
65f092313e595f Jens Axboe 2022-06-13  901  		if (ret == -EIOCBQUEUED)
65f092313e595f Jens Axboe 2022-06-13  902  			return IOU_ISSUE_SKIP_COMPLETE;
65f092313e595f Jens Axboe 2022-06-13  903  		/* we got some bytes, but not all. retry. */
65f092313e595f Jens Axboe 2022-06-13  904  		kiocb->ki_flags &= ~IOCB_WAITQ;
65f092313e595f Jens Axboe 2022-06-13  905  		iov_iter_restore(&s->iter, &s->iter_state);
65f092313e595f Jens Axboe 2022-06-13  906  	} while (ret > 0);
65f092313e595f Jens Axboe 2022-06-13  907  done:
65f092313e595f Jens Axboe 2022-06-13  908  	kiocb_done(req, ret, issue_flags);
65f092313e595f Jens Axboe 2022-06-13  909  out_free:
65f092313e595f Jens Axboe 2022-06-13  910  	/* it's faster to check here then delegate to kfree */
65f092313e595f Jens Axboe 2022-06-13  911  	if (iovec)
65f092313e595f Jens Axboe 2022-06-13 @912  		kfree(iovec);
65f092313e595f Jens Axboe 2022-06-13  913  	return IOU_ISSUE_SKIP_COMPLETE;
65f092313e595f Jens Axboe 2022-06-13  914  }
65f092313e595f Jens Axboe 2022-06-13  915  

:::::: The code at line 912 was first introduced by commit
:::::: 65f092313e595f73e3226e68793924cfd32905ce io_uring: move read/write related opcodes to its own file

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jinhui Guo <guojinhui.liam@bytedance.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
