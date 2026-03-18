Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AFF25A2B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 07:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773819782; cv=none; b=Cd1oZZ4PsV17Eut/K2Ji+C8NGrO2VvDW3/S/I1d6gcqd8OpEfqO0wrvb8x93l2axRLxZUSyymfUCJV6NgeZnJGl/pDln1RJoNE5mvuIg54594jqgBncRKDYf5NRo7tR6XyMHcYEnEHNiqNolEvEQkDvqlh2pFB36wZSeYcw7KNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773819782; c=relaxed/simple;
	bh=6pT/x/Pj6+ib/BeVI20NDlN8xedo/+jqsPXJQ8mHpNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VrzID1J4BeZ/QfylMUYW2yiYfKWaixMjWex/e3yIVP3J93mC9Y2oABekKWf2XO6Y+G0GJF2ybQV29DDWLih+KHmth5OI1pA0TyowTkrulq9EkDmDAOMu7YluEAdKJXhRN+wSae5qu3J4cHKnwyTSc4gz1QizeznBn4c+7h9Gtyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vEXS2VBD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vEXS2VBD"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso5169000f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 00:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773819779; x=1774424579; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GWUe2vkO7j3zKsp+duzaX4cSZivxcbRz1IRm1ygnoBw=;
        b=vEXS2VBDCK06GsoDFFM8q1JXncv4W6Ym6hjv85YqyxWYxpOnf3WnacZR9xMqqDDa8t
         xYtPpvD/+Riygvnxp8JrqLWXJ6qyDWdPQCMNQakwDKdtJRxj+dREk7u4OXLRlIx84bnk
         VwJOz373UBTtpBR56kRPjaOxMH5qKt0xgT1MLrupz/FNtFu1BLAnvRm7tfoTz8dulbs4
         pHVMJUf4wNLOMsLc9OS4LbfL+bke5tvHzWtha+FOGthxjskoxKoV7ynSL7HNQzqHm+2y
         73qxc/nLzSPmZpE442hfIIqBY9N5DmJ0GS4hkPFrPj7vTc6vkGbhHcSh7s5iI4/G6HBe
         IpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773819779; x=1774424579;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWUe2vkO7j3zKsp+duzaX4cSZivxcbRz1IRm1ygnoBw=;
        b=chEkhMgwJdZHTxB4takCDnH7KD5P//x61spPCJHoKiFvWROl0IA8rj49xOL625Zm69
         h6Tb4nPPMFE6z2moxCTa40/DEDTy7XkgOFJwPDqAagM45RY1uadlJWJsxyTvwphDmeOY
         9iobMaYHP3gh8tbacwkJpYq47dTHDfP1X1X+xa9QgSI9erTUQ87pBExWxdrVb1uqvuxd
         83NfbI0RwY2/XQwlQSdvehAI7I6mnL1QBufbSv7OvYFKNRZ8ztWzsNOidC+rRhxPDt3I
         kcaUiqhCxUUdEK4sic/xY7leC4WF+FeASTk8Xw74PzsQYxqDSv7ReIoNUOpgL8n3IuNb
         j4Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVgsTImDMLQAJwv1OlDVR3r5Obp3K2I0q/2jt0wetBku0qqawQBedXitj5swbp/ScSrNuxJ/omQKu6nINg4@lists.linux.dev
X-Gm-Message-State: AOJu0YwmLzdtzHVb0ZNq7DFFq0Nf5QP3L39BuVPSO6xXobgJE+QLNLJc
	WueIW1+UGfCfpLavD4Dc3Li5Wg/36diRFL4wswlJIwnyFCyrQvgSPIrn3GpQA0Fi+Gg=
X-Gm-Gg: ATEYQzzjoy9F90vZJRE7OzdfNpB5G+Z2ZL3iyUvfwxzZFEs6WW/ZLVEuSmg+xU2lqUz
	n7njvLmHkKZI3AboHOX2SF+7/VmMh0fEVaYoYjQQ1D1WicKwgz6P5+ximHx4PBpwwwRoyAd/ue5
	dXaOuVZtjiDsbUkXHEIyYGwc0hbVRPGenZcCb9dn8AF+HN6XtHRfrREw8OpNGGkpDaVtZtkdIo+
	0h4qw1yYqwhFlheHfJp/+FfvAUhh9sypv0Qat0gb7T4vTFi5NHM12Qj5M1FKl7CdyXlfRWl1a5+
	fyz/7MUQpcchP7rmHPV5ro/pBn8ZMkOm4C7IBr6ns2F9a9KLbL+d3M9aEclrYUBpKlQb4Q8lbUZ
	JmK869Lf4goOx8tjivmH21IDJwLSgYP8lu7w4lc/n4cZJyzvzpIpOXu5eW35eMHgUiK8R4kiYBt
	1BEfjjNy+IjlRWquBsIf1dNE6YBWVZ
X-Received: by 2002:a05:600c:1d10:b0:483:a27e:6706 with SMTP id 5b1f17b1804b1-486f442647bmr40207665e9.9.1773819778977;
        Wed, 18 Mar 2026 00:42:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4b9beb0sm23455385e9.8.2026.03.18.00.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 00:42:58 -0700 (PDT)
Date: Wed, 18 Mar 2026 10:42:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>
Subject: [jlayton:exportd-netlink 3/18] net/sunrpc/cache.c:1074
 cache_release() error: dereferencing freed memory 'rq' (line 1070)
Message-ID: <202603180258.r8Bt94T2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   4599c5d95d86c6bc932897f19b1f5a573e7c4637
commit: e344b49528c8ef457ee714bb65e2da4c121132c2 [3/18] Merge branch 'mrchuck/nfsd-testing'
config: x86_64-randconfig-161-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180258.r8Bt94T2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603180258.r8Bt94T2-lkp@intel.com/

smatch warnings:
net/sunrpc/cache.c:1074 cache_release() error: dereferencing freed memory 'rq' (line 1070)

vim +/rq +1074 net/sunrpc/cache.c

173912a6add00f Trond Myklebust  2009-08-09  1040  static int cache_release(struct inode *inode, struct file *filp,
173912a6add00f Trond Myklebust  2009-08-09  1041  			 struct cache_detail *cd)
^1da177e4c3f41 Linus Torvalds   2005-04-16  1042  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  1043  	struct cache_reader *rp = filp->private_data;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1044  
^1da177e4c3f41 Linus Torvalds   2005-04-16  1045  	if (rp) {
17ad31b3a43b72 Jeff Layton      2026-02-23  1046  		struct cache_request *rq = NULL;
17ad31b3a43b72 Jeff Layton      2026-02-23  1047  
b00567a1495f66 Jeff Layton      2026-02-23  1048  		spin_lock(&cd->queue_lock);
^1da177e4c3f41 Linus Torvalds   2005-04-16  1049  		if (rp->offset) {
812936f74067e6 Jeff Layton      2026-02-23  1050  			struct cache_request *cr;
812936f74067e6 Jeff Layton      2026-02-23  1051  
812936f74067e6 Jeff Layton      2026-02-23  1052  			cr = cache_next_request(cd, rp->next_seqno);
812936f74067e6 Jeff Layton      2026-02-23  1053  			if (cr) {
17ad31b3a43b72 Jeff Layton      2026-02-23  1054  				cr->readers--;
17ad31b3a43b72 Jeff Layton      2026-02-23  1055  				if (cr->readers == 0 &&
17ad31b3a43b72 Jeff Layton      2026-02-23  1056  				    !test_bit(CACHE_PENDING,
17ad31b3a43b72 Jeff Layton      2026-02-23  1057  					      &cr->item->flags)) {
812936f74067e6 Jeff Layton      2026-02-23  1058  					list_del(&cr->list);
17ad31b3a43b72 Jeff Layton      2026-02-23  1059  					rq = cr;
17ad31b3a43b72 Jeff Layton      2026-02-23  1060  				}
^1da177e4c3f41 Linus Torvalds   2005-04-16  1061  			}
^1da177e4c3f41 Linus Torvalds   2005-04-16  1062  			rp->offset = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1063  		}
812936f74067e6 Jeff Layton      2026-02-23  1064  		list_del(&rp->list);
b00567a1495f66 Jeff Layton      2026-02-23  1065  		spin_unlock(&cd->queue_lock);
^1da177e4c3f41 Linus Torvalds   2005-04-16  1066  
0b88d5fcde160d Jeff Layton      2026-02-23  1067  		if (rq) {
0b88d5fcde160d Jeff Layton      2026-02-23  1068  			cache_put(rq->item, cd);
0b88d5fcde160d Jeff Layton      2026-02-23  1069  			kfree(rq->buf);
0b88d5fcde160d Jeff Layton      2026-02-23 @1070  			kfree(rq);
                                                                        ^^^^^^^^^

0b88d5fcde160d Jeff Layton      2026-02-23  1071  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  1072  
17ad31b3a43b72 Jeff Layton      2026-02-23  1073  		if (rq) {
17ad31b3a43b72 Jeff Layton      2026-02-23 @1074  			cache_put(rq->item, cd);
17ad31b3a43b72 Jeff Layton      2026-02-23  1075  			kfree(rq->buf);
17ad31b3a43b72 Jeff Layton      2026-02-23  1076  			kfree(rq);
                                                                        ^^^^^^^^^

17ad31b3a43b72 Jeff Layton      2026-02-23  1077  		}

Looks like a bad merge.

17ad31b3a43b72 Jeff Layton      2026-02-23  1078  
^1da177e4c3f41 Linus Torvalds   2005-04-16  1079  		filp->private_data = NULL;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1080  		kfree(rp);
64a38e840ce594 Dave Wysochanski 2019-07-26  1081  	}
64a38e840ce594 Dave Wysochanski 2019-07-26  1082  	if (filp->f_mode & FMODE_WRITE) {
64a38e840ce594 Dave Wysochanski 2019-07-26  1083  		atomic_dec(&cd->writers);
c5b29f885afe89 NeilBrown        2010-08-12  1084  		cd->last_close = seconds_since_boot();
^1da177e4c3f41 Linus Torvalds   2005-04-16  1085  	}
f7e86ab92f2198 Trond Myklebust  2009-08-19  1086  	module_put(cd->owner);
^1da177e4c3f41 Linus Torvalds   2005-04-16  1087  	return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1088  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

