Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756082;
	b=b7kC1482zkdrUkyzW2n3B+q7aroDg5zYFu9XNXDicMY1PQmyf7KWrnDrfa+ujyeQSJ6E
	 LPywT3bDR/wZpLhTNE3yNlSDggl8aGE1v+itcFSUFOKVjSE3R5E2bxwrIbGl4mrlg7/TC
	 kaf5RGSOe+KuLirN0O29GtjuyfLsHvSLdM1ffI4O62Mhw5lC5UHjzMu3fpfIDEcGkqV/I
	 JZW0XhcKoj5cSAQzLjMmRad9Z09NXABSlWCSV4L8HBZJFPgR+5zkOy5kmBPvuL7Pl4cV0
	 mXgU40WORWQAlp2wBT09WT8xmgew/tSaT8y4vjT5Th4I0PXkCadukeapj3gfysPu6Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756082;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=njXXhRl3SRk1skioaDFUChND2RMCAQz2ka8HoJqKYok=;
	b=LKV9J8J2/s2rzhxpv5KsnVmShpws0ZpXmcah1W8ceJwUewAjzPaQ7ReGiJcsvGCij+ap
	 W4tRZJmppbeEx6q2v/Sjmj7H+r7HghMf8YAFdHqMrEUx1d51iQXDnr5RUXupXjstc2kij
	 XWVA9Abz5lcj/pJS3cbCHU3ovWz1VPpeS7zfWwdpoPr2yx7sYYkp+6XyrDLvhipH+mjtd
	 tFcPpL2sOymSfBOR/kBOR7EcGfAXssRoRMB91PhcmtweXPX+T3L+tKN3DBngiMiUHAnL+
	 6jcaKNS2B82qiUTk5Qu2f0MT4zq7luVGjZmO6LGV1ZkUNf2YCvtoKegJeTapzlMguBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LFcRKox7;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4B1606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 11:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE4B1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LFcRKox7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792756081; x=1824292081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KMwrt1VWEnnJMKV+x3fnd0vau1sRRbU/XqsI2QsGkxU=;
  b=LFcRKox7aXj/NuAt3AwG2qLacd+x6lqCzEz5jioPa1ltz48qETaEFv4U
   aSHc1RISGiuHm9vCnA7I5wHO9J/ELPpzx2EFTqFY7z7WqHZAgNZgy3qEh
   z/++ijsVPTLraphDS7bpvs1CXNptqe9bs7qtDcf/WwAz28SmT21RsCMPU
   DtODH5CejBnKByw7hO43VSPAWCpKkIMBqlLtzxsmZD/JK4iZ5eHCwLpG7
   y50bDYSGDD5IT7A6Lc6oGAxAAFOebOfGHeeqAXlx/u5qKvupQowmwIitr
   8d4oll3KRuhlSDKgPgbUwrPceuQ7XLPAzOB2EfoR43cyQUYnlOC8EfNZ2
   A==;
X-CSE-ConnectionGUID: n5XcJe+fR1qrNIhK0pixCQ==
X-CSE-MsgGUID: 8k5c9qSMRhmKIpllXYmEaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1418289"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1418289"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 04:48:01 -0700
X-CSE-ConnectionGUID: JQobo0LTQnOWmzHmn98+4A==
X-CSE-MsgGUID: s0eBgANGTh61XlZtgMB20A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3719335"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Oct 2026 04:48:00 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKDkb-000000000b1-0lUa;
	Fri, 23 Oct 2026 11:47:57 +0000
Date: Fri, 23 Oct 2026 13:47:48 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 17/41] Warning:
 kernel/time/timekeeping.c:241 expecting prototype for ktime_mono_to_aux().
 Prototype was for ktime_aux_to_mono() instead
Message-ID: <202610231318.Vd9PGJzy-lkp@intel.com>
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
commit: 43397fe79e1c3dcc1334df0cd2c26459efad86ba [17/41] timekeeping: Add facilities to convert between monotonic and auxiliary clock timestamps
config: csky-randconfig-r2200-20261022 (https://download.01.org/0day-ci/archive/20261023/202610231318.Vd9PGJzy-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231318.Vd9PGJzy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231318.Vd9PGJzy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/time/timekeeping.c:241 expecting prototype for ktime_mono_to_aux(). Prototype was for ktime_aux_to_mono() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
