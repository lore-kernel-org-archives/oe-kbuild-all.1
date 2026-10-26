Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792977621;
	b=yugKSXzgXHN7I2qYjkbHYZCQ48SeUjCCfgrslTSkmaUsgpb5TGNSUmjmPZkExCjEl+hB
	 6IdWak0iYQvd/h8RX72dRMuoMOC74TZVmB7BzOFWTqG4MSAjsczFWiLsp3998r0+Fic8h
	 mqYoN3Tr/lvnl/dxdABgoHaSNTfIgFGkoRIbolmPcCRb//Y/nEwUnVdGzw0JQsyvaP2PH
	 vMI5Mcp1AyKys2BOy9GdxLDy2YkK7te3yfDFouEbttgJhxy9JtFDbJbQhjDoa2DAuLWSI
	 y51rSyYtI7s7GWG6V5QaljwAzbG/Pf/8Yj/nqru1KnWFs2eRAPRJlubEX3qOI6ztsFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792977621;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:Message-ID:
	 MIME-Version:Content-Type;
	bh=nACYY/J1flcBazt/DWhDPB6T+PC33voNTI/bWAr/LwY=;
	b=g68SUHwanraNSGpNQC7qEVz28VMnY2R++7mpB4AWIVE5KFncNw+lgYC1oBPENmvmkwOd
	 ZJ26pC6D/hPI3nhA4L8EKkFCVlwbbspeqCUKLuU6utFP2mqwyaMUID9yOe6p6IYY6O2IN
	 XT/XA/rwT1VAkuKm6dMEDag2bHwzjqN+Fgj6hc4JQn70HcpSRxMplEWGVPn67gG8MNndY
	 Z1NgmEUmwBvGxTVmlhbfiYEE+FdpyWmgl6wCbHcBDFJuIxY0ZLzuW/J2g30D5yH1oySHB
	 8aZQUk7Y+Sjv2oQB0g1VdMA4O+M2sV+5nqJaiu5jFnFJwSNlvuaKOl4hZdClJ5Mr1yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b="j/G3veEU";
	arc=none smtp.remote-ip=192.134.164.104
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF12606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 01:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BF12606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=j/G3veEU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nACYY/J1flcBazt/DWhDPB6T+PC33voNTI/bWAr/LwY=;
  b=j/G3veEUPUPx5wUUmKpHK4LVt9Cs5DmPZXOHh4T6dRdC4foYdCD9vBnP
   lno84N3t/WEvINOmn70xvfS6ZYqd+/v6G2g28pSVqYw2kX/3OyH7YJbE7
   8PGdpmKV4Bb3+ulFifx5D4/TSWpfXKLAMCRLWBWuuMmgchPveN//81gbA
   s=;
X-CSE-ConnectionGUID: MTEcJWBxS3Os1DcDOHwIfg==
X-CSE-MsgGUID: vhRg6G3oRl2G1xOaUyTa9w==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,178,1787004000"; 
   d="scan'208";a="160828793"
Received: from c-76-123-3-53.hsd1.va.comcast.net (HELO hadrien) ([76.123.3.53])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:20:10 +0100
Date: Sun, 25 Oct 2026 21:20:07 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: cros-kernel-buildreports@googlegroups.com
cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-lts 2/2] fs/eventpoll.c:1009:2-11:
 second lock on line 994 (fwd)
Message-ID: <fea95cfa-9ce5-ac56-9c85-7ad88e837bc4@inria.fr>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

After line 1009, does somerhing unlock the lock?

julia

---------- Forwarded message ----------
Date: Sun, 25 Oct 2026 21:48:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android13-5.15-lts 2/2] fs/eventpoll.c:1009:2-11:
    second lock on line 994

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15-lts
head:   28ca5d8b733ed5c4ea847e57cc94f90cfa929e94
commit: 9208957e850335d35905a45e0041c09aac9ea5fb [2/2] UPSTREAM: eventpoll: kill __ep_remove()
:::::: branch date: 10 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-2102-20261025 (https://download.01.org/0day-ci/archive/20261025/202610252137.KYEUgiaP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a808f8ea7fdc61ead417bfe55e8ef5f728776aeb)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610252137.KYEUgiaP-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/eventpoll.c:1009:2-11: second lock on line 994

vim +1009 fs/eventpoll.c

7699acd1341c63 Davide Libenzi    2007-05-10   976
b611967de4dc5c Davide Libenzi    2006-10-11   977  /*
7699acd1341c63 Davide Libenzi    2007-05-10   978   * This is called from eventpoll_release() to unlink files from the eventpoll
7699acd1341c63 Davide Libenzi    2007-05-10   979   * interface. We need to have this facility to cleanup correctly files that are
7699acd1341c63 Davide Libenzi    2007-05-10   980   * closed without being removed from the eventpoll interface.
b611967de4dc5c Davide Libenzi    2006-10-11   981   */
7699acd1341c63 Davide Libenzi    2007-05-10   982  void eventpoll_release_file(struct file *file)
b611967de4dc5c Davide Libenzi    2006-10-11   983  {
7699acd1341c63 Davide Libenzi    2007-05-10   984  	struct eventpoll *ep;
44cdc1d952e3f7 Al Viro           2020-09-27   985  	struct epitem *epi;
f2451def095c17 Paolo Abeni       2023-03-22   986  	bool dispose;
f2451def095c17 Paolo Abeni       2023-03-22   987
f2451def095c17 Paolo Abeni       2023-03-22   988  	/*
f2451def095c17 Paolo Abeni       2023-03-22   989  	 * Use the 'dying' flag to prevent a concurrent ep_clear_and_put() from
f2451def095c17 Paolo Abeni       2023-03-22   990  	 * touching the epitems list before eventpoll_release_file() can access
f2451def095c17 Paolo Abeni       2023-03-22   991  	 * the ep->mtx.
f2451def095c17 Paolo Abeni       2023-03-22   992  	 */
f2451def095c17 Paolo Abeni       2023-03-22   993  again:
f2451def095c17 Paolo Abeni       2023-03-22  @994  	spin_lock(&file->f_lock);
f2451def095c17 Paolo Abeni       2023-03-22   995  	if (file->f_ep && file->f_ep->first) {
f2451def095c17 Paolo Abeni       2023-03-22   996  		epi = hlist_entry(file->f_ep->first, struct epitem, fllink);
9208957e850335 Christian Brauner 2026-09-29   997  		WRITE_ONCE(epi->dying, true);
f2451def095c17 Paolo Abeni       2023-03-22   998  		spin_unlock(&file->f_lock);
f2451def095c17 Paolo Abeni       2023-03-22   999
f2451def095c17 Paolo Abeni       2023-03-22  1000  		/*
f2451def095c17 Paolo Abeni       2023-03-22  1001  		 * ep access is safe as we still own a reference to the ep
f2451def095c17 Paolo Abeni       2023-03-22  1002  		 * struct
b611967de4dc5c Davide Libenzi    2006-10-11  1003  		 */
7699acd1341c63 Davide Libenzi    2007-05-10  1004  		ep = epi->ep;
f2451def095c17 Paolo Abeni       2023-03-22  1005  		mutex_lock(&ep->mtx);
9208957e850335 Christian Brauner 2026-09-29  1006
9208957e850335 Christian Brauner 2026-09-29  1007  		ep_unregister_pollwait(ep, epi);
9208957e850335 Christian Brauner 2026-09-29  1008
9208957e850335 Christian Brauner 2026-09-29 @1009  		spin_lock(&file->f_lock);
9208957e850335 Christian Brauner 2026-09-29  1010  		__ep_remove_file(ep, epi, file);
9208957e850335 Christian Brauner 2026-09-29  1011  		dispose = __ep_remove_epi(ep, epi);
9208957e850335 Christian Brauner 2026-09-29  1012
d47de16c722196 Davide Libenzi    2007-05-15  1013  		mutex_unlock(&ep->mtx);
f2451def095c17 Paolo Abeni       2023-03-22  1014
c36fff461c90c6 Linus Torvalds    2025-07-09  1015  		if (dispose && ep_refcount_dec_and_test(ep))
f2451def095c17 Paolo Abeni       2023-03-22  1016  			ep_free(ep);
f2451def095c17 Paolo Abeni       2023-03-22  1017  		goto again;
b611967de4dc5c Davide Libenzi    2006-10-11  1018  	}
f2451def095c17 Paolo Abeni       2023-03-22  1019  	spin_unlock(&file->f_lock);
b611967de4dc5c Davide Libenzi    2006-10-11  1020  }
b611967de4dc5c Davide Libenzi    2006-10-11  1021

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
