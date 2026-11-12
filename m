Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444740;
	b=KJVy58c6oj4ko/fjawc2GqyKP5sIE8DwPKO63JNlcNU2vRoSwY4P//mAXLeL+RpRXb7c
	 WBhdLuKkgtiGghqma9b6baHFup7YAYIpEva2cm4ibcvpfM5mn2cqQ4wjvvXbtjkaqleuj
	 9udZZNBOymLVfX5hzHIYPSOGHE0iJ6llHZiJ2b6Ny6gycP4fnC1eeOw1QlL3ZHLCkSDXC
	 i2iJrDWlj6h+eX5k85Suk2zXZwGmqn8KBUlWqfCWzhe19YSfbWFiCLiBmt3sgXLPrQsw6
	 W7YbSHk+FewsoKXy+uYSca94vdss1vvUzQpP1ttSYcjl6lRaMxv6VuXxCjdLrQjA/8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444740;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=EAPs9KRaS4NQVXYav5/4awFoGIgT9sQVJLzFFWPDtxA=;
	b=fu3ZSOWrOdQjQUYF3KXtfjIjeWwRl6ON4LTWFASM9olTj+7Wbv716aLAqIyAz1Tp4UeL
	 cBVtfUQdxSyzfsKzRUqWYVwi0o0SDkDtRUNiHuwkzVvt0KPOHQu5azYBblWcjbeaMsAUY
	 lesdwhogqhUYcPBCxu3N/2alNCu1V611NRh6bOKDr4TNY1jzm1WONIjf8YgJ9TQy2PHBW
	 rqzy2jRYld/IEuNhGtSltps8ENaeEUJnN9y6+SNBx6SfpOAUvEtbx72avNweMczpVwlY2
	 qlmVUlst0jrbojUV2p1TAxMlq0PNsPWdX/U2W8tUfTsdM1SlZcnUDACIHtOMfGfIxxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CVsPqJ0B;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B68606A321
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 00:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9B68606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CVsPqJ0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794444740; x=1825980740;
  h=date:from:to:cc:subject:message-id;
  bh=hPKdmDTE9hn9vulkgnXcxMi5nCCO1o1VpC3PXd7BdMw=;
  b=CVsPqJ0Boe5gVHzJ1y5bwMrRzHBKX3QnYPm8ym0t4SEHbQakZp+MwK05
   gcFYIve/1tPEde4xwSgFYRvSbSpQnPG0Avm4Zj2D07dIs3H5YfroBYW4k
   HqWz7XSog3Rn/8QPvdr/AMTaRnKArRWJTPGsZkrf8pzfrQc63C8pzcg2z
   Wr424FMOg6B5bxbK4WkyRuphkj3NWs519kDFZ+CAhCPtMmI1AK8VBDcbp
   LNfculbPgrDYfONprxob5X9xktkg9noDuTAG+hZkcP6A1GPxm0pl8bxHc
   JzZU5OKuPMRVdn138hwr0T/F3pj0ZGl8uavuP7Tir5BQ28lbPqPL54N3t
   w==;
X-CSE-ConnectionGUID: 6Rg3j3hLROucFFhqDOcjQg==
X-CSE-MsgGUID: kk/ArZOSQ5q+HKjtAGU1sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3230236"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3230236"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 16:52:19 -0800
X-CSE-ConnectionGUID: pRCLi8x+T7ykEJebpKUKZA==
X-CSE-MsgGUID: GNgMvFkGQ9SjAqoOK4Rryg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8968834"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2026 16:52:18 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRJ31-000000000lj-2yFL;
	Thu, 12 Nov 2026 00:52:15 +0000
Date: Thu, 12 Nov 2026 01:51:48 +0100
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>
Subject: [linux-next:master 5784/6673] WARNING: modpost: vmlinux:
 section mismatch in reference: seq_buf_terminate+0x42 (section: .text) ->
 bootup_event_buf (section: .init.data)
Message-ID: <202611120138.Fwm5Ljmj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aaa2f954c21b205a0bcd0961e5b2be4e82e58455
commit: 7b8cd26b6aab8cf147165610d13964f79200a5a7 [5784/6673] seq_buf: Mark a seq_buf overflowed when terminating it loses a byte
config: powerpc64-randconfig-r2306-20261111 (https://download.01.org/0day-ci/archive/20261112/202611120138.Fwm5Ljmj-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120138.Fwm5Ljmj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611120138.Fwm5Ljmj-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x22 (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x26 (section: .text) -> bootup_event_seq (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x42 (section: .text) -> bootup_event_buf (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x4e (section: .text) -> bootup_event_buf (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0xb6 (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0xbe (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0xf2 (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0xf6 (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x13e (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x142 (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x17e (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x18a (section: .text) -> bootup_event_seq (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x192 (section: .text) -> bootup_event_seq (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
