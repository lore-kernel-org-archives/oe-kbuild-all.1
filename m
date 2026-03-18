Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6819D346773
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841084; cv=none; b=lUotmoCpqyrgPmcoMC5zfYe8iVMy7rSsQ/YSkpjYq0SlSfopLXRkXhSZ6knQLookjPxkAjrGouJeFwatAOppc6cyT98iIOUhHU6XLl5eNNctLAhx46Fl42wXNDjnLm1V0tf/s15mBZGg7vSkaU3M4GKH9Qd2pGyyznEOVPizvZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841084; c=relaxed/simple;
	bh=OG8f338mHXvVP8x56qvMldMU1kM9cl00AHYWS5Rno7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QSF46+FRwPv2Vv5v5K0Mde2Hh2sQeaHo6i2X/VIYxNm8t+f4x5Kz5J6SI1hvyR6mtAK+3sRXQMYN/DauSXis+94b01fvrYU0slvpNPm6FA8Ggk3rLsjrzV+ia0dfIKm+uBxHOjqGsBb/1UzHVjH33n/U424Rt2F7OFL70K7M8II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHtd6ptT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHtd6ptT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773841082; x=1805377082;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OG8f338mHXvVP8x56qvMldMU1kM9cl00AHYWS5Rno7E=;
  b=VHtd6ptT1EoEVtBZabQaU8Arz1oD+X026V8lcqG/iMW9g1kAjx1+nGsN
   HiuXK/W52lK+kVyMVyWivwLnsu2F8/qO+wkr0uwOV0vYsQIdC6FPU6H/X
   vWKibVwXOLN8iEQ/QRaDN0V7ayGYaEFZbPY4cS+vlTfjfkcqCxnSINav3
   GIflYcNcxnwV4r/GFvtibei2EbqCL06jUXJQlkfB6TJ6xZvKYNBtzGIpB
   UvtlrgfPywjPbcLxwmYL3fTOL1zBSeYKfVILxp+uACLrWeWyaF6+/nIA5
   Nd0hHqspINZnwr9fi0CHRhnyaa2Ebmp9TzT85i1R2Z94st19mojfAI+vH
   g==;
X-CSE-ConnectionGUID: t5+ItLDJT0WGW+fLjrFrJQ==
X-CSE-MsgGUID: sxksX8SzTxOflEVWjPVxZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74923922"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74923922"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 06:38:02 -0700
X-CSE-ConnectionGUID: 8pL0TS/mSwKW4IbcscF1Qg==
X-CSE-MsgGUID: rygFBL82Q2iwvdRi1vlJHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="260527140"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 06:38:01 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2r5y-000000002xV-0i7Z;
	Wed, 18 Mar 2026 13:37:58 +0000
Date: Wed, 18 Mar 2026 21:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5796/6828]
 drivers/block/drbd/drbd_strings.c:33:34-35: WARNING: Use ARRAY_SIZE
Message-ID: <202603182128.rsr1ydEg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8e5a478b6d6a5bb0a3d52147862b15e4d826af19
commit: 314794b19fb4b08aba87ff06d650a1d38c86c094 [5796/6828] drbd: remove B=
ROKEN for DRBD
config: parisc-randconfig-r054-20260318 (https://download.01.org/0day-ci/ar=
chive/20260318/202603182128.rsr1ydEg-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260318/202603182128.rsr1ydEg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182128.rsr1ydEg-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/block/drbd/drbd_transport_tcp.o: in function `dtt=
_recv_short':
>> drivers/block/drbd/drbd_transport_tcp.c:307:(.text+0x514): undefined ref=
erence to `tls_get_record_type'
>> hppa-linux-ld: drivers/block/drbd/drbd_transport_tcp.c:313:(.text+0x54c)=
: undefined reference to `tls_alert_recv'
   hppa-linux-ld: drivers/block/drbd/drbd_transport_tcp.o: in function `dtt=
_socket_free':
>> drivers/block/drbd/drbd_transport_tcp.c:626:(.text+0x5e0): undefined ref=
erence to `tls_handshake_cancel'
   hppa-linux-ld: drivers/block/drbd/drbd_transport_tcp.o: in function `.LC=
65':
>> drbd_transport_tcp.c:(.rodata.cst4+0x10): undefined reference to `tls_se=
rver_hello_x509'
   hppa-linux-ld: drivers/block/drbd/drbd_transport_tcp.o: in function `.LC=
66':
>> drbd_transport_tcp.c:(.rodata.cst4+0x14): undefined reference to `tls_cl=
ient_hello_x509'

cocci warnings: (new ones prefixed by >>)
>> drivers/block/drbd/drbd_strings.c:33:34-35: WARNING: Use ARRAY_SIZE
   drivers/block/drbd/drbd_strings.c:85:34-35: WARNING: Use ARRAY_SIZE
   drivers/block/drbd/drbd_strings.c:120:32-33: WARNING: Use ARRAY_SIZE
   drivers/block/drbd/drbd_strings.c:211:30-31: WARNING: Use ARRAY_SIZE
   drivers/block/drbd/drbd_strings.c:56:34-35: WARNING: Use ARRAY_SIZE
   drivers/block/drbd/drbd_strings.c:67:34-35: WARNING: Use ARRAY_SIZE
--
>> drivers/block/drbd/drbd_sender.c:852:2-8: WARNING: do_div() does a 64-by=
-32 division, please consider using div64_u64 instead.
   drivers/block/drbd/drbd_sender.c:867:3-9: WARNING: do_div() does a 64-by=
-32 division, please consider using div64_u64 instead.
--
>> drivers/block/drbd/drbd_bitmap.c:156:2-12: second lock on line 165
--
>> drivers/block/drbd/drbd_main.c:5964:2-11: second lock on line 5964
--
>> drivers/block/drbd/drbd_main.c:3335:2-20: WARNING: NULL check before som=
e freeing functions is not needed.
   drivers/block/drbd/drbd_main.c:3337:2-20: WARNING: NULL check before som=
e freeing functions is not needed.
   drivers/block/drbd/drbd_main.c:3339:2-20: WARNING: NULL check before som=
e freeing functions is not needed.
--
>> drivers/block/drbd/drbd_receiver.c:1487:15-20: ERROR: reference preceded=
 by free on line 1459
   drivers/block/drbd/drbd_receiver.c:1491:45-50: ERROR: reference preceded=
 by free on line 1459
--
>> drivers/block/drbd/drbd_nl.c:1312:1-20: iterator with update on line 1317
--
>> drivers/block/drbd/drbd_main.c:4403:1-7: preceding lock on line 4304
--
>> drivers/block/drbd/drbd_receiver.c:892:2-8: preceding lock on line 960
   drivers/block/drbd/drbd_receiver.c:906:3-9: preceding lock on line 960
   drivers/block/drbd/drbd_receiver.c:927:3-9: preceding lock on line 960
   drivers/block/drbd/drbd_receiver.c:937:2-8: preceding lock on line 960
   drivers/block/drbd/drbd_receiver.c:1047:1-7: preceding lock on line 960
   drivers/block/drbd/drbd_receiver.c:9720:4-10: preceding lock on line 9698
   drivers/block/drbd/drbd_receiver.c:7464:3-9: preceding lock on line 7408
   drivers/block/drbd/drbd_receiver.c:7160:2-8: preceding lock on line 7158
--
>> drivers/block/drbd/drbd_req.c:1440:2-3: Unneeded semicolon
--
>> drivers/block/drbd/drbd_nl.c:6977:37-46: opportunity for str_enabled_dis=
abled(new_value)
--
>> drivers/block/drbd/drbd_sender.c:1086:3-19: opportunity for str_enabled_=
disabled(peer_replication)
--
>> drivers/block/drbd/drbd_state.c:1204:10-22: opportunity for str_yes_no(f=
ail_io [ NEW ])
>> drivers/block/drbd/drbd_state.c:1203:10-22: opportunity for str_yes_no(f=
ail_io [ OLD ])
>> drivers/block/drbd/drbd_state.c:1245:11-27: opportunity for str_yes_no(h=
ave_quorum [ NEW ])
>> drivers/block/drbd/drbd_state.c:1244:11-27: opportunity for str_yes_no(h=
ave_quorum [ OLD ])
>> drivers/block/drbd/drbd_state.c:1285:12-33: opportunity for str_yes_no(p=
eer_replication [ NEW ])
>> drivers/block/drbd/drbd_state.c:1284:12-33: opportunity for str_yes_no(p=
eer_replication [ OLD ])
>> drivers/block/drbd/drbd_state.c:1280:12-28: opportunity for str_yes_no(r=
eplication [ NEW ])
>> drivers/block/drbd/drbd_state.c:1279:12-28: opportunity for str_yes_no(r=
eplication [ OLD ])
--
>> drivers/block/drbd/drbd_transport_tcp.c:1423:37-54: opportunity for str_=
yes_no(new_net_conf -> tls)
>> drivers/block/drbd/drbd_transport_tcp.c:1423:3-20: opportunity for str_y=
es_no(old_net_conf -> tls)
--
>> drivers/block/drbd/drbd_main.c:4354:22-33: ERROR: invalid reference to t=
he index variable of the iterator on line 4323

vim +33 drivers/block/drbd/drbd_strings.c

b411b3637fa71f Philipp Reisner      2009-09-25  30 =20
70962e539d81f4 Christoph B=C3=B6hmwalder 2025-12-16  31  struct state_names=
 drbd_conn_state_names =3D {
70962e539d81f4 Christoph B=C3=B6hmwalder 2025-12-16  32  	.names =3D __conn=
_state_names,
70962e539d81f4 Christoph B=C3=B6hmwalder 2025-12-16 @33  	.size =3D sizeof(=
__conn_state_names) / sizeof(__conn_state_names[0]),
70962e539d81f4 Christoph B=C3=B6hmwalder 2025-12-16  34  };
70962e539d81f4 Christoph B=C3=B6hmwalder 2025-12-16  35 =20

:::::: The code at line 33 was first introduced by commit
:::::: 70962e539d81f48270aa468831ae4b0981f1497e drbd: rework support module=
s for DRBD 9 multi-peer monitoring

:::::: TO: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>
:::::: CC: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
