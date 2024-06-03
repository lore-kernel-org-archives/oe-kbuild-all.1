Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1874204B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 06:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717397985; cv=none; b=ZvpSUvvsvswhM/+U4KtFNW6fs5sNdQbRoIt/a6vyZ3LJWmC/l0x2NBlqhyqJ7Vm5mErUIM3PSX+uDTX2zWxZflY2w7cW3FcBeFf+NQodCbkau7jlpti7RPovuthY1q/qNzH8VtxjpkShq0u8eVFWn9cxdGaA6fHQUuEkrCBAZow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717397985; c=relaxed/simple;
	bh=wev1QeZy3Ojt36DUS6N7XESPafqqU+G03GP20yq/4u0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TOEYqx6fXPhvYK2CC2uJf+2gCErWFSRfl0YLjUXdUaGlMNgDUleBxSNHOneOkXVYw63goZc/33Wye96JSS2V0eavi+H4fT4IVouux5pO/icmCCrdfH1bHdVvyIGXUmp8t+IE83xh1isrE3TPxWwiLN+m3v4dmhtcr/UW9eocv5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kp+8grSe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kp+8grSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717397984; x=1748933984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wev1QeZy3Ojt36DUS6N7XESPafqqU+G03GP20yq/4u0=;
  b=kp+8grSeg8H6W0XaZCtxSamBLdn+HYwBvkSmzolKDnDoDEyLvkvJNIaC
   T0nXDn6C1zBWbq0mL+3xOFhbSgjxv+hl1zgXdFIeZDiB8TrYVZM1/EKKp
   7qEGFeVdkozKvoZsQttLQpd8i1Xj84CqXhCrOn2Ed+JPDF1EHNslIPiHh
   cllwTxSF75O/FUXrFmfh8Ignr/Wf+JEB1Zmlyvf0e/CdWo3D9EGHduIc0
   pm2U/10rbOiwjb2phXO6VRHbc33rrBVaXsMJIYOKDi3nv6Ppmi+4cLtyy
   3CzYhZ4GMcD6QS0Pack9ndMdSXqIY3+qnry8SKMMF48/ZFiOeqWS6eMzy
   g==;
X-CSE-ConnectionGUID: k0oPJX1/R+qjbqEnLPIyxQ==
X-CSE-MsgGUID: h66mgvKARKKNs8Tg7fmQNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13717684"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="13717684"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 23:59:43 -0700
X-CSE-ConnectionGUID: aYtOoEE/TZS80Qf72AJ5OQ==
X-CSE-MsgGUID: xM1Z9alXRmKnV1JITS3dEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="36686620"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jun 2024 23:59:41 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE1fM-000L8P-1k;
	Mon, 03 Jun 2024 06:59:37 +0000
Date: Mon, 3 Jun 2024 14:59:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 61/61] fs/bcachefs/error.c:121:3: error:
 a label can only be part of a statement and a declaration is not a statement
Message-ID: <202406031445.W3Z8Dimv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   c39351763cb597c4b0882f00fc043ebcf00e3c62
commit: c39351763cb597c4b0882f00fc043ebcf00e3c62 [61/61] bcachefs: Unlock trans when waiting for user input in fsck
config: i386-buildonly-randconfig-004-20240603 (https://download.01.org/0day-ci/archive/20240603/202406031445.W3Z8Dimv-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240603/202406031445.W3Z8Dimv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406031445.W3Z8Dimv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/bcachefs/error.c: In function 'bch2_fsck_ask_yn':
>> fs/bcachefs/error.c:121:3: error: a label can only be part of a statement and a declaration is not a statement
     121 |   unsigned long t = unlock_long_at
         |   ^~~~~~~~
>> fs/bcachefs/error.c:125:3: error: expected expression before 'int'
     125 |   int r = bch2_stdio_redirect_readline_timeout(stdio, &line, t);
         |   ^~~
>> fs/bcachefs/error.c:126:7: error: 'r' undeclared (first use in this function)
     126 |   if (r == -ETIME) {
         |       ^
   fs/bcachefs/error.c:126:7: note: each undeclared identifier is reported only once for each function it appears in
>> fs/bcachefs/error.c:121:17: warning: unused variable 't' [-Wunused-variable]
     121 |   unsigned long t = unlock_long_at
         |                 ^


vim +121 fs/bcachefs/error.c

    99	
   100	#ifdef __KERNEL__
   101	static enum ask_yn bch2_fsck_ask_yn(struct bch_fs *c, struct btree_trans *trans)
   102	{
   103		struct stdio_redirect *stdio = c->stdio;
   104	
   105		if (c->stdio_filter && c->stdio_filter != current)
   106			stdio = NULL;
   107	
   108		if (!stdio)
   109			return YN_NO;
   110	
   111		if (trans)
   112			bch2_trans_unlock(trans);
   113	
   114		unsigned long unlock_long_at = trans ? jiffies + HZ * 2 : 0;
   115		darray_char line = {};
   116		int ret;
   117	
   118		do {
   119			bch2_print(c, " (y,n, or Y,N for all errors of this type) ");
   120	rewait:
 > 121			unsigned long t = unlock_long_at
   122				? max_t(long, unlock_long_at - jiffies, 0)
   123				: MAX_SCHEDULE_TIMEOUT;
   124	
 > 125			int r = bch2_stdio_redirect_readline_timeout(stdio, &line, t);
 > 126			if (r == -ETIME) {
   127				bch2_trans_unlock_long(trans);
   128				unlock_long_at = 0;
   129				goto rewait;
   130			}
   131	
   132			if (r < 0) {
   133				ret = YN_NO;
   134				break;
   135			}
   136	
   137			darray_last(line) = '\0';
   138		} while ((ret = parse_yn_response(line.data)) < 0);
   139	
   140		darray_exit(&line);
   141		return ret;
   142	}
   143	#else
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
