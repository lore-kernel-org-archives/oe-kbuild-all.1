Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449211;
	b=FXlqsWKJdsf8+T90nfZVEDsBsoH/GN69xV+yRV6a1CO09c9PgYtzWXgBrjZSt0+SQm0V
	 sVJLwvVG2Bl/4Ow691pIpXq7NBl19h0cxOkzNZuNIny4zigfGf2td4kTFhh4Dnka2QHue
	 gxhDU0XA92Zy5UEiNsqR0xZEFwhnnCGK9958FxMaq3uVu1t/r7RusdMLlxCBDOHrBY6Yn
	 pqMfk9wzwiIsyGhQKUkUn4f+UXf3Pz2zmbbb6ppk08i/WpDTR3Sus8YcnYI6QqZxdlu1g
	 8XOJznAzb+nY6Ks7Bx5Wdymc0vSagpzvltvSHqvjMqxKND2XjniZ/iKtdg6PvPJaToA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449211;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=B4U0JqAqjLI2Yu670Ze0vs2di29aPcPEVerkf4RxpRc=;
	b=j0J8ZHG14Rli4/KisrUaYb/fTF0qFZ4mvsA/W2E9UoyI8eMJZFXODRwaNrvo/IyPz83r
	 b+MwV/yW7fnooFWBpe4E73A8tqPWXQHoLMqgwNpZBLTEjBwJeT77V1hKK7p3l+GcT5CyQ
	 PhbgmQYBa89MU0D0OTyM9CpjGvA//WbMpMNmCwY5/eUHswHpJa3O6qUflxrCcAk3Q/fOQ
	 SgvJCeDKHeBcGt3e76Bx8SMPSAYyM+JE4ip8Is9Ry1SNO5/4JdQGtz4iUOrSNiU5fJZv4
	 /XvbXZjBv57XROCeSlESF9mGe0tq93vXocOI/Co9MzoSCSNu5qaZJbkTy18f2flezDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SZLG7XYo;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCA9606A31E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 12:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FCA9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SZLG7XYo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793449210; x=1824985210;
  h=date:from:to:cc:subject:message-id;
  bh=yHiCe2BLiJnvIzO0tjd/YeLXs/ORDH5vhbGeVaL1+2A=;
  b=SZLG7XYo+dBuwBzA+WjAWHJYmppN88vUjqGFr1myJs41qTCdJCCo6MPA
   mPE1GrsXZxwIW+zekBgiIcatEUZ9ra670jpoFGkg3R0gXwvB5IUH2z3TO
   nxIqvbVbHgCh4jRfjL6tbHR/kRFyLBsZLZDjE/aZX2lDGKPWo2BujUJ/n
   N5aXUPeip3MoBM5JmqPVCTj4QrBiuDaSCZRshm11UndEUPt+q4B1XocvE
   CSCadF/RyfVqq/7dO89mwRrTzznKMwVglZZ7mZG10AbB3sWSiEJtTo5r1
   xOfO+oUD8/wGwsj0v7U3zf2GTfSbo+Jm84bvSUO4RCkgJeDbZVZe1pfOQ
   Q==;
X-CSE-ConnectionGUID: VtDyZAX7RS2SW3uit+0Z1w==
X-CSE-MsgGUID: Bf6ka2LjT+SSU5XAILG6lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2111370"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2111370"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 05:20:10 -0700
X-CSE-ConnectionGUID: UWrCo/uBRba1r4vmlEy1qg==
X-CSE-MsgGUID: XEhz82uGS1qxM0z/rd1W3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="7495209"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 31 Oct 2026 05:20:09 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN846-000000005zr-2yTq;
	Sat, 31 Oct 2026 12:20:06 +0000
Date: Sat, 31 Oct 2026 13:19:48 +0100
From: kernel test robot <lkp@intel.com>
To: Alex Markuze <amarkuze@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ceph-client:testing 23/47] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202610311337.Fya0qiQi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/ceph/ceph-client.git testing
head:   3f007b9f327745c94aec312a28973b28f6a51fc4
commit: 3751f4b9fcc39f484c10486ce7ae8ac541712d02 [23/47] ceph: add BLOG deserialization support
reproduce: (https://download.01.org/0day-ci/archive/20261031/202610311337.Fya0qiQi-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#320: FILE: fs/ceph/blog_des.c:297:
+			 * Skip kernel %p sub-specifiers (U, I, d, D, etc.).
+				 * boutc does not support %p extensions; call sites

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#321: FILE: fs/ceph/blog_des.c:298:
+				 * boutc does not support %p extensions; call sites
+			 * must pre-format them with snprintf and pass %s.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
