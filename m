Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792727492;
	b=1H4f8c3P6LyeW2kojbKIgt38Ch9DH7ApZk4zm0JmGE/jgxa2JkhgBzAITFPX75u6G7WC
	 fZ5gPy0y8FA1/T7mWsuo1UNo4y0xd5AU9kMzCserQOwgcTl274yYuUnotLIvo18ktdIyL
	 aydzWMitPEDYayByK3LZqEme8mqNhpHqyerdMtYczcTZGSEJ+VnIT0U4ZfsM0tTvOepcO
	 PLH2xEBWycSISkR3HDsE4Opx/DKk55SlEDilDSKyli24bLC6fe6gy1HvGUClhvAJ5/7O6
	 /p+hhdECRgQDKHeOFo/Ju7XDiPAAXwM7Gdj5POEJGF9QHn8VyTykUTo2NCKZ/HkmrgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792727492;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=f5N94CPZ5HY5U20a/frRSTDIfHcRLIuco7NZJMxewKk=;
	b=OQDUiMiyZEZJbPFLklJ9ukBCHd7Ak0wQrpIx1jpRtgVUgWEP/9nDcsIoNXNpvHS5n8um
	 NSQCfD1GoWmDLQcK9N9cgpO+53sQZhXba7xZPIF26UFzlnuL/BdxhXMZ7ztLZOdb1g21p
	 dpNTPB6bHrX93YKaZym2GrE0jIVlykhfI7/T33oPh2aRAtQTEughYgNLunWdTOU1wyT73
	 X2XM+hVN4Qbjl+6psv7fY1AN3RJmiyvdUeVrgIfEsrZrU5lH/nmg8gv04llWh7zzCBZrj
	 HS6cF9+f+CVrs17f5/CAfgEPazQG+/Ogfo7bM5t8hslSAldirF+wBHlXE94xHxWR2rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="oBf3/8cP";
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48758606A319
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 03:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48758606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oBf3/8cP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792727492; x=1824263492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rr+e1FG17LejI5e/pS0LNCpquUqx1zmJpb5KFRa+e4Y=;
  b=oBf3/8cPdgsvQ0KXueOJ0/uRcuJofyyNjIMUVpmQEZh12++3u/pUeV8z
   YhCxOlElm7yqoSG7gv/vMqsZfNXZ8CRoJ4wWq/62QLO06TmYCAB+wjoUX
   N50zyWEfjYARV25Zy6XuHC5dYlCyasOYDf6LjRpn0Z+kB/mbGcEGwjz1W
   bk9asEmjfcrkUbMDsLWAppgLSwUbkWVnKz8kF/+WLrQ9Ev8JOmPlySpxA
   KerJEUOcLreO3Bu+NMkhb5i3jtK95XqwCs7MP3IeviONTW10i3V9RBYA0
   1J3i8E11acIghO+5Okw8wgnWmf89hJ6RTp+rV1oDlb1jvorG7XTsMhQFz
   w==;
X-CSE-ConnectionGUID: DV+AL48ITNmf8rO648eC6w==
X-CSE-MsgGUID: d8bfxFScQ0GzlguvTcb2Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1493852"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1493852"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 20:51:31 -0700
X-CSE-ConnectionGUID: 6PkQt75xSa+qODx//iHTdw==
X-CSE-MsgGUID: OxSvrQgKQfSOdROucJSLdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3855439"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2026 20:51:29 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xK6JT-000000000VX-22Ju;
	Fri, 23 Oct 2026 03:51:27 +0000
Date: Fri, 23 Oct 2026 05:50:56 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 18/41] ERROR:
 modpost: kernel/time/time_tests.ko: symbol '__divdi3' undefined!
Message-ID: <202610230517.q9tTZM5u-lkp@intel.com>
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
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   a40991dd87115c3f70bf87884b803ed7e09dc387
commit: 503828dc4bd6f98d85d169659fdfc68f30032df4 [18/41] timekeeping: Add a test for auxiliary to monotonic clock conversions
config: riscv-randconfig-r2110-20261022 (https://download.01.org/0day-ci/archive/20261023/202610230517.q9tTZM5u-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610230517.q9tTZM5u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610230517.q9tTZM5u-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: kernel/time/time_tests.ko: symbol '__divdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
