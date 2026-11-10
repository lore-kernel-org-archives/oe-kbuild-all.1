Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341503;
	b=jPpqSj8C+FKwR1/yGCTjDFABonLWDGaUEM9nrLdJDqgSEvVWrXs7XOcB2/qENjhgB2Cl
	 9KKb9DJz73xdhASRW9aK3yc+1q0atUYpdPdyEt2KwdcG4kzCy3aHjE92GRLadFr4XX/ko
	 Ue5KnsJ15fQcob3gho8OjxYzWEteuPRFbw8NxsynED9LBqC2miXMGO2KPs3VnOztCEADF
	 TqWtg0KSC1s2Y3z1+FNZuY23TxyC2vEIsHztORnddLlvCh+EjFlc02WOCOjVxoCIPApHn
	 /CI7JKvVcnOd/38rTw4Hdrc05WdTiq1lUoSBRDbryulC7PtMyx3ufzPsZ0TvRKJwQPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341503;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=tADm6mLsTGFjZBCm4PWVqDLhGRUyDxetfS4lsaWSWPU=;
	b=CUFYRFslq9RcIrrLRCH6nnfEeuJouhKFt69xze3xriFgtdIqYDLYIqZyLS1JTtFxhXFu
	 iDLCRMdCdshVIm9e2oRzH7+Eiqc1Sn/WS9mCqWkd/5ILhQmgCYSgsdehA2F+q+TIDEevP
	 wzoxG1sV9uepN2S6eGPHmKHijI7zeW1+bbFs6ftXQh3rBJBKHM0KEuZ3/A0neJqD3d43o
	 ouSq00HHwImWl6Mg8/x4UrOWfnCv2UFaiDI6BJ1ZAslBXEQkx/o/m8GQek1bJwINbJ+aD
	 hVraRtoyyxZtkc5FPzB6uuxO9DNR49rgZEnnwVUXsqLg5JYDloVpOYV75n84REQ7OXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nNN9vXLr;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF87D606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 20:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF87D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nNN9vXLr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794341502; x=1825877502;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pAEq4yLaLnQuqdYu3xTBupF7zCd1gxSUTvNCNxLgQx8=;
  b=nNN9vXLrJN5jGxbpO9qD6bUYSik/sZwGBMKGaA+bEY4XkdPFgjKJrsp0
   Sxh85moSFcnkWxMTFMKuP5JyKiHGP2G84RGz0FzQ2fAmz12JSon7qZEPl
   uSftzcZgMwiqE/dWud+kx60J/Mmy2s1/ia7GRK6Hzu+S8x2DHmCaQgeeZ
   R+dThhRdu1Ct+URuDS9WGADCj9vQ/MNledJZ6iYrsJuI9hUOrUCZSy9rL
   n84M0vJxrs0quZQrmD17TB3rufST5G6dPgGggtmhvwjnfnf9/wqVJLAI1
   OSpCu6duhIf9lgruliTSCfxRq2sfE8+SnPqg0bgV76CJeRG8mxKJRHw/M
   w==;
X-CSE-ConnectionGUID: eoIDtcKHQ8idgF/hQh6sEg==
X-CSE-MsgGUID: HzzkoiFdR7qeFR5+w67AGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3136336"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3136336"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 12:11:42 -0800
X-CSE-ConnectionGUID: Na9XcZu3RFqfiSgHneD4EQ==
X-CSE-MsgGUID: rBd17iGqTBm0lSFEo42xuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8110834"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2026 12:11:40 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQsBp-000000000Lb-0rP7;
	Tue, 10 Nov 2026 20:11:33 +0000
Date: Tue, 10 Nov 2026 21:10:30 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:bpf-napi 37/46] net/ipv4/tcp_output.c:3307:
 undefined reference to `__tcp_bpf_tx_defer'
Message-ID: <202611102113.Mdm4eGif-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/kkdwivedi/linux bpf-napi
head:   447e73927e821b61da411e58b9444d831373f359
commit: 7a9d3d30a1aaf04d812c1ccb01d50db1cb62083b [37/46] tcp: Let a BPF kth=
read do the xmit work of sockets assigned to it
config: xtensa-randconfig-2000-20261110 (https://download.01.org/0day-ci/ar=
chive/20261110/202611102113.Mdm4eGif-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261110/202611102113.Mdm4eGif-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611102113.Mdm4eGif-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: de=
fined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: de=
fined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/targ=
et_core_configfs.o: defined in discarded section `.exit.text' of drivers/ta=
rget/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/targ=
et_core_configfs.o: defined in discarded section `.exit.text' of drivers/ta=
rget/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of net/bluetooth/6lowp=
an.o: defined in discarded section `.exit.text' of net/bluetooth/6lowpan.o
   `.exit.text' referenced in section `__jump_table' of net/bluetooth/6lowp=
an.o: defined in discarded section `.exit.text' of net/bluetooth/6lowpan.o
   `.exit.text' referenced in section `__jump_table' of net/bluetooth/6lowp=
an.o: defined in discarded section `.exit.text' of net/bluetooth/6lowpan.o
   `.exit.text' referenced in section `__jump_table' of net/bluetooth/6lowp=
an.o: defined in discarded section `.exit.text' of net/bluetooth/6lowpan.o
   `.exit.text' referenced in section `__jump_table' of net/bluetooth/6lowp=
an.o: defined in discarded section `.exit.text' of net/bluetooth/6lowpan.o
   `.exit.text' referenced in section `__jump_table' of net/bluetooth/6lowp=
an.o: defined in discarded section `.exit.text' of net/bluetooth/6lowpan.o
   drivers/clocksource/timer-mediatek.o: in function `mtk_timer_probe':
   drivers/clocksource/timer-mediatek.c:356:(.text+0x50a): dangerous reloca=
tion: windowed longcall crosses 1GB boundary; return may fail: *UND*
   `.exit.text' referenced in section `__jump_table' of net/netfilter/ipset=
/ip_set_core.o: defined in discarded section `.exit.text' of net/netfilter/=
ipset/ip_set_core.o
   `.exit.text' referenced in section `__jump_table' of net/netfilter/ipset=
/ip_set_core.o: defined in discarded section `.exit.text' of net/netfilter/=
ipset/ip_set_core.o
   xtensa-linux-ld: net/ipv4/tcp_output.o: in function `tcp_write_xmit':
>> net/ipv4/tcp_output.c:3307: undefined reference to `__tcp_bpf_tx_defer'
   xtensa-linux-ld: net/ipv4/tcp_output.o: in function `__tcp_push_pending_=
frames':
>> include/net/tcp.h:764: undefined reference to `__tcp_bpf_tx_defer'
   xtensa-linux-ld: net/ipv4/tcp_output.o: in function `__tcp_push_pending_=
frames':
   net/ipv4/tcp_output.c:3327: undefined reference to `__tcp_bpf_tx_defer'
   xtensa-linux-ld: net/ipv4/tcp_output.o: in function `tcp_push_one':
>> include/net/tcp.h:764: undefined reference to `__tcp_bpf_tx_defer'
   xtensa-linux-ld: net/ipv4/tcp_output.o: in function `tcp_xmit_retransmit=
_queue.part.91':
   net/ipv4/tcp_output.c:1328: undefined reference to `__tcp_bpf_tx_defer'
   xtensa-linux-ld: net/ipv4/tcp_output.o:include/net/tcp.h:764: more undef=
ined references to `__tcp_bpf_tx_defer' follow
   `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_commo=
n.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o
   `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_commo=
n.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o


vim +3307 net/ipv4/tcp_output.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  3300 =20
a762a9800752f0 David S. Miller         2005-07-05  3301  /* Push out any pe=
nding frames which were held back due to
a762a9800752f0 David S. Miller         2005-07-05  3302   * TCP_CORK or att=
empt at coalescing tiny packets.
a762a9800752f0 David S. Miller         2005-07-05  3303   * The socket must=
 be locked by the caller.
a762a9800752f0 David S. Miller         2005-07-05  3304   */
9e412ba7632f71 Ilpo J=C3=A4rvinen           2007-04-20  3305  void __tcp_pu=
sh_pending_frames(struct sock *sk, unsigned int cur_mss,
9e412ba7632f71 Ilpo J=C3=A4rvinen           2007-04-20  3306  			       int=
 nonagle)
a762a9800752f0 David S. Miller         2005-07-05 @3307  {
726e07a8a38168 Ilpo J=C3=A4rvinen           2008-12-05  3308  	/* If we are=
 closed, the bytes will have to remain here.
726e07a8a38168 Ilpo J=C3=A4rvinen           2008-12-05  3309  	 * In time c=
losedown will finish, we empty the write queue and
726e07a8a38168 Ilpo J=C3=A4rvinen           2008-12-05  3310  	 * all will =
be happy.
726e07a8a38168 Ilpo J=C3=A4rvinen           2008-12-05  3311  	 */
726e07a8a38168 Ilpo J=C3=A4rvinen           2008-12-05  3312  	if (unlikely=
(sk->sk_state =3D=3D TCP_CLOSE))
726e07a8a38168 Ilpo J=C3=A4rvinen           2008-12-05  3313  		return;
726e07a8a38168 Ilpo J=C3=A4rvinen           2008-12-05  3314 =20
7a9d3d30a1aaf0 Kumar Kartikeya Dwivedi 2026-11-10  3315  	if (tcp_bpf_tx_de=
fer(sk, nonagle))
7a9d3d30a1aaf0 Kumar Kartikeya Dwivedi 2026-11-10  3316  		return;
7a9d3d30a1aaf0 Kumar Kartikeya Dwivedi 2026-11-10  3317 =20
99a1dec70d5acb Mel Gorman              2012-07-31  3318  	if (tcp_write_xmi=
t(sk, cur_mss, nonagle, 0,
7450aaf61f0ae2 Eric Dumazet            2015-11-30  3319  			   sk_gfp_mask(=
sk, GFP_ATOMIC)))
9e412ba7632f71 Ilpo J=C3=A4rvinen           2007-04-20  3320  		tcp_check_p=
robe_timer(sk);
a762a9800752f0 David S. Miller         2005-07-05  3321  }
a762a9800752f0 David S. Miller         2005-07-05  3322 =20

:::::: The code at line 3307 was first introduced by commit
:::::: a762a9800752f05fa8768bb0ac35d0e7f1bcfe7f [TCP]: Kill extra cwnd vali=
date in __tcp_push_pending_frames().

:::::: TO: David S. Miller <davem@davemloft.net>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
