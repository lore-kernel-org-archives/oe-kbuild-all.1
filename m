Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370622;
	b=BzJ+rZ5sEIyvHPTAvqnSXB0MMWanVWAmq1uk6t8G/e7REdPVMwsacT8HM4qZfKktf4y1
	 058mUySpVuS7bdJ5GRmelNQuhk2RDvL8Zu4KRVSp7+dvKYCSe9ta+IGy4V2RCH5Zj1whT
	 yr70pjaHvvhRq9pxZPp9cpLgmpq8Hv52wu1Ou3+R+LUPX35GYoVzm2fJ8es0rboiIkSr7
	 sy60zMstJsQiZTrBbAatwK090NF7Pzn3JNmGUxKsdhmT7kzCF3wwW6kkNneBqTBI+AG/A
	 M0iku++NhCsz3+TidE64YpNw0duLrpyg3+uG+Cz1XePIyiKNH+Ulw92pqyNu1rlGmtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370622;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xBRjdLlg5wmRtN8lqdZmn0KznGIKo9eL+YTfivDXhPw=;
	b=QZREkfZ96mWbYje8NhqstCfvcT8NaOzKM2TOAS3x805hoLVCpqITC76OMxy3HKRs5Uh0
	 hzrOVMuuNTOlxtl/x4KqDj19gTH7n1VsfJsLMJLNl8NPJUcuRIUMLNvE6cRzSqIMHyji5
	 BE2DHBxzoctzvGm8w/1BYx9I1yHHIeFK0r7aaZ3YQVl7aJJx1tdUKgPRqllYA7p8mWvs6
	 80+SZ0afdweq3Z00KNmsFg4Lc0NJf7g74JldVVMfhMELbvQcXOMF7OAoimdtcAPaJaZgB
	 AS9wL05AIeNrtoI2kvHV+FX0I9X6lSE0v1203xj7XKYJcOLzSzb3A+yeOUY92oIcVIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="M/qzFYhL";
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6366606A31E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 14:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6366606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M/qzFYhL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793370619; x=1824906619;
  h=date:from:to:cc:subject:message-id;
  bh=HvpJxMPwQLIZl5Pao+dj5mLg8UGSChbNokPg3TArH3g=;
  b=M/qzFYhL6NBGU8VNLNl7SBYhNYWD8o9o6gEWPotuUQVsOCbw4T6gWYGd
   +mG/rEM85gqShJuxKT+AviYEUVA6dc9dc/rDKmdxOQfVxREF/5260kVLp
   PjCeVZ95YKBGlqP2yhysqCfOoqOQ+lQUA1+BzdD+YD0sdPEi0tjD/I6RQ
   3BO+FyWERwnDGb8i1BHA5Jlslwyn9bKOm692eyLMnIIb8FSQ4KqdJHlUs
   /vNhMWQB39nk1ahsLoAiPKfE0x8X5XO5QKoEiAiKQQ8yRhKfrffcwqLH1
   fZUJ82ciXqLqaliX9i4u6syYxAV8KKzKRD0OY+M29JzBRnU6gnWYSYI6g
   A==;
X-CSE-ConnectionGUID: gPA1HVPuR82yvomVvOc9Eg==
X-CSE-MsgGUID: SbNNdxcsSO2c+fSjdDkUyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2013677"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2013677"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 07:30:19 -0700
X-CSE-ConnectionGUID: RsAAkDkZQym/2QFo6R5vdA==
X-CSE-MsgGUID: 8832+KmJRc+mw/C76s7SAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5338134"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2026 07:30:19 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMncW-00000000br0-0m2z;
	Fri, 30 Oct 2026 14:30:16 +0000
Date: Fri, 30 Oct 2026 22:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/syscall 5/5] vmlinux.o: warning: objtool:
 .export_symbol+0x118: data relocation to !ENDBR: x86_entry_from_kvm+0x0
Message-ID: <202610302218.cTVNS7AC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/syscall
head:   43093e4a64a017d5e0f28eedbba8add73f35e1e4
commit: 43093e4a64a017d5e0f28eedbba8add73f35e1e4 [5/5] x86_64/entry: Mark C noinstr __noendbr
config: x86_64-randconfig-1003-20261030 (https://download.01.org/0day-ci/archive/20261030/202610302218.cTVNS7AC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610302218.cTVNS7AC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610302218.cTVNS7AC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .export_symbol+0x118: data relocation to !ENDBR: x86_entry_from_kvm+0x0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
