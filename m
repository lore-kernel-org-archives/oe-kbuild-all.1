Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632996;
	b=dFGrFUVpQR7ikoe4SIEuoMWjHDRCFtP9dQqcHncR26PuW1p3h7/djY6uFMRCxnGjHj3m
	 C/+sYjvQEwm5mB1s+E7a2XHgIgIBP2IByKlxOSQ26Fckd66bjLKoygpFx/TFbSwNtnQFX
	 H6iPt60k9/lIGXkYmbc450eMFIAzFBbUdYR0oJedeYbxCJWO2GVKjJB0mG8sFNBzuK034
	 ccY7FGUFB8vLfRF6r2olbztyvX32lzy4BBgkk9b4MtA97iG/RAGvdxaCtFXv/Sv/nz7/n
	 tXpBNfdx1PfCTMf/6T2iMXF/PmkbcAm0o2eH7PkvESOeIg7ESWTkqhUdBrbwjn8jF3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632996;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+3WNH+NgbgURTGbMZYKoXfd2WDmkhfNyQhDH4KeNlp4=;
	b=QQ/iAT8UnhgJvg/zQc8FmNkWcogz5TRhDhAA7B1q81PmXOrLSPJGUOytJqW/iLpldneP
	 bktElOOwnCDQSG93Bq/Xl1Msuc2IzX1GKgyZOSEwylJoS967JIX4oGHSJ6ahOa8DEe6mQ
	 CbXxXPpTzY1z9rTyzB+r/1ym9ctSXcnFzkxmz1/EsKf8yhuiv3YKuZ4Gdtf/K33iVL8Jb
	 vH2GayiYtan74Rf7a0CCOirWJ3CogfEm5KgdESDBnODQ1c7LcdDzBp3UQCoj1U509EXZp
	 0K+JVryhuZtr86FyNirnonf4vKA6lzBGXgXUN+X8OvOnPct2Jj+xRe6d5Dtn+j3W/UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oH3kh82X;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79E7606A321
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 18:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A79E7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oH3kh82X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795632994; x=1827168994;
  h=date:from:to:cc:subject:message-id;
  bh=lVrBYANnp61eMqtayDABiTLDHDIhfjYmeiloBR8rPvc=;
  b=oH3kh82Xv4oIq46H5m0rMh0YHMCNrROR62avuF7AkHkAVw65a6AmRmTo
   chWmMM3wNU4+vAO1tFrVzjAYXwJGuhMgSV5kYzN6nxj6waAgaZAFyU7AH
   E7zOJ3hc1QGcPoTr4nx2DL8fKCZAHoSWrvFqONFwJb7a1JdNspf1uB+pQ
   jdK0AyvWpUtJwYcCwahGAnzB7GjGmR8clNiLYQ0mwfCfpeaDDrN8RdSB7
   tXjZHcwS3rw94//DhreXdRqeGNozOKWLYj23F3fxV0XrjyMOtn/iUHFFE
   WHElUXI6im6BmKNaYWzkQgqwjfdPn9wcchVtwEjS6asmB2kEvJ6NDXIRA
   w==;
X-CSE-ConnectionGUID: 1Weg1U97SA23wqjyjlfhFQ==
X-CSE-MsgGUID: kRcHtSQkTsSoOyDqB2ruNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4428337"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4428337"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 10:27:11 -0800
X-CSE-ConnectionGUID: BGFqD0lBTOOu8mWQEXWc2g==
X-CSE-MsgGUID: TTeP87l+QKygccWuhPtQnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12075781"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 25 Nov 2026 10:26:51 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWHhg-0000000002x-1w8p;
	Wed, 25 Nov 2026 18:26:48 +0000
Date: Wed, 25 Nov 2026 19:26:13 +0100
From: kernel test robot <lkp@intel.com>
To: Anubhav Shelat <ashelat@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>
Subject: [trace:eventfs/for-next 1/1] Warning:
 fs/tracefs/event_inode.c:667 expecting prototype for eventfs_root_lookup().
 Prototype was for __eventfs_root_lookup() instead
Message-ID: <20261125192418.uQSoI87B-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace eventfs/for-next
head:   42ecc8eec33880139eaec065cd33c81d2aa1f4e2
commit: 42ecc8eec33880139eaec065cd33c81d2aa1f4e2 [1/1] tracefs: Add read-only eventfs filesystem at /sys/kernel/events
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261125/20261125192418.uQSoI87B-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125192418.uQSoI87B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125192418.uQSoI87B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/tracefs/event_inode.c:667 expecting prototype for eventfs_root_lookup(). Prototype was for __eventfs_root_lookup() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
