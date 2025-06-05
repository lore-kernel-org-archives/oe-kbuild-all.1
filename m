Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF9527A46E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 20:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749154587; cv=none; b=FPcwM5eecuGFEaT80THJ3y5ByUH8V6b4xAl02qmeNldsXWjrt0KpgtPIG2LIXPmnePJitT6jT604PrWyG+YJRd01bJhBZehtFoVO3wDQwiNAMhpX4TTWAW2yIgA0bB/heShBJD32KwiDS74TLPN29I3zt6iBqeSmeDjSGK/V5XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749154587; c=relaxed/simple;
	bh=P3Gcf0LDRGy23etIptHNp64Ii6ao+9OUq0bkjqKFhnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=osW0IcUVWQ4NEpdbwhA4vXyMvo5+T6osry/NHx7l4LssgG1QSqPDizUOQh8qgV3wlkCVoscB9XJGCWCcJfZu3Y/OmGEvOewkHXP8mDKRugJ2i72S+F2yAiDqKFdZhwk4or0mSqh3qOK12e1zJ3GP0x1cSJEodJWFDWlhtyk8bFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irK6dA93; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irK6dA93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749154586; x=1780690586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P3Gcf0LDRGy23etIptHNp64Ii6ao+9OUq0bkjqKFhnA=;
  b=irK6dA93csABl1o3+v71ejYd7fnnHM3qU+GwNrJUJ9L8ubyqX/qKcWfr
   63/TrC8d3amf/i0Xlukt665A9G/ERSycQqIzmRmmWuYHWYfVdsA5b0UY5
   Gr4jQMxbbGcQfsgNzk4kJewwjjCRQFJtefNndM9i+NskfLnY0y3k8AcwR
   E55XJVUZ2/lOXQ5KGbPOYHIsSPaX7GvmsXdEjEHOpWK35t8MfU+msHj//
   S2XFQK7Kr2h0oNya2G4J7PhdIqcmWArWDKxDF3ai177wZo1/5uMd3ijQA
   gmTFG8qCzNgsPl8Uxt4rEWms6MEvG68uNHed9JcVSTN8ulh1jiJlffYfk
   Q==;
X-CSE-ConnectionGUID: GScEMzflSdaEhn/mLQ5iog==
X-CSE-MsgGUID: 2MHlQwdbRHOkOQHUmBlNug==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68851254"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="68851254"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 13:16:25 -0700
X-CSE-ConnectionGUID: UbY4UMLTRIiJBg8kHe8fiA==
X-CSE-MsgGUID: /GAxDO/tRV2syUlfZbrrqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="150770908"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2025 13:16:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNH0g-0004Rs-2C;
	Thu, 05 Jun 2025 20:16:22 +0000
Date: Fri, 6 Jun 2025 04:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-handle 3/3] io_uring/openclose.c:588:1:
 warning: control reaches end of non-void function
Message-ID: <202506060418.wgRIu37n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-handle
head:   7a590a5963086085ce58fee4cdf920e8fdd049f4
commit: 7a590a5963086085ce58fee4cdf920e8fdd049f4 [3/3] io_uring: add support for IORING_OP_OPEN_BY_HANDLE
config: riscv-randconfig-002-20250606 (https://download.01.org/0day-ci/archive/20250606/202506060418.wgRIu37n-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506060418.wgRIu37n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506060418.wgRIu37n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/openclose.c: In function 'io_open_by_handle':
   io_uring/openclose.c:587:9: error: 'IOU_OK' undeclared (first use in this function); did you mean 'IOC_IN'?
     return IOU_OK;
            ^~~~~~
            IOC_IN
   io_uring/openclose.c:587:9: note: each undeclared identifier is reported only once for each function it appears in
>> io_uring/openclose.c:588:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +588 io_uring/openclose.c

   555	
   556	int io_open_by_handle(struct io_kiocb *req, unsigned int issue_flags)
   557	{
   558		struct io_open_handle *h = io_kiocb_to_cmd(req, struct io_open_handle);
   559		const struct export_operations *eops;
   560		int ret;
   561	
   562		ret = get_path_from_fd(h->dirfd, &h->ctx.root);
   563		if (ret < 0)
   564			goto err;
   565	
   566		eops = h->ctx.root.mnt->mnt_sb->s_export_op;
   567		if (eops && eops->permission)
   568			ret = eops->permission(&h->ctx, h->open_flags);
   569		else
   570			ret = may_decode_fh(&h->ctx, h->open_flags);
   571		if (ret) {
   572			path_put(&h->ctx.root);
   573			goto err;
   574		}
   575	
   576		ret = __io_open_by_handle(req, issue_flags, eops);
   577		io_req_set_res(req, ret, 0);
   578		if (ret < 0) {
   579	err:
   580			req_set_fail(req);
   581			return ret;
   582		}
   583	
   584		kfree(req->async_data);
   585		req->async_data = NULL;
   586		req->flags &= ~REQ_F_ASYNC_DATA;
   587		return IOU_OK;
 > 588	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
