Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86196446836
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 17:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785517245; cv=none; b=XNlBySQgfcdrRSd0ZN4kyUTyKaaWuqV9smpqwGr5jksVwwntqlJEneuvzkCRm80IIPVdlW710MIOyMiVXxyDY8VXNgYrXuBsZjDASgkxXCXvjmsHPb7w5AnHdhI22ulcvBmJGQDBgKm03LjMM8mU44OoFIs2mO/1q7j2Tx0l29s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785517245; c=relaxed/simple;
	bh=DdEw/LaNqLxzMpWbazRcgc9JomDX3uYZxCgN46mzIPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fEvhsyQoQpzLN7iSt56FmFaUJyhvzCzrCqCWt5hROrARnIXH0ihFrUWZYMVAuANAJoQk1cq0lxw+rDcfLf4fkUWutfcGPpg/VWIrDkTn4YWBBFNX0yPmYXBfcH/iIiWZ4CRtcV3fvpgqDVYZY76rpgLNepgrmSvzGMHpBpDdPL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TcB72tTO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TcB72tTO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785517244; x=1817053244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DdEw/LaNqLxzMpWbazRcgc9JomDX3uYZxCgN46mzIPo=;
  b=TcB72tTOr+TGtMMOZtlihsVuDNxlkuOFz26WmUhFvIRYrH0rGza7mrT3
   7gkrMJs6FXfnTAf2g6yFrZxFSmL7Op54/NJQPwmK1WGiZOARaLZEug5Xd
   ShQulnVvpE9M/PON8jwH/lWt+qFru25Q6SGlaD+StyWDeuDKyXnpgMQ7H
   VpmmrPXyXjoRQ24f7SczgJUxe4Id+bIBRGb59csY3+1f0q/SYEX/TlHjB
   EHxjJwCE5plTGxOsGiVY4huGQhThB1nhFbZu5gwvBxQAdmfHD4wYF4Qoh
   KS6JQfeqiwjgFTVG8g59I2mqmSCCYc6ttaVzPLbYE06uLzwpuPPe5eGKL
   A==;
X-CSE-ConnectionGUID: DwdJoY5pQLu7c3lCFqCGZw==
X-CSE-MsgGUID: 3EfXoMIQS46PecBOa8sF4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86265613"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="86265613"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 10:00:42 -0700
X-CSE-ConnectionGUID: aUiAQwcjThG344uz/JpPcA==
X-CSE-MsgGUID: q6MWDf0zRSmH41YdSe8kLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="261238771"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 31 Jul 2026 10:00:41 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpqb8-000000003EU-2jrr;
	Fri, 31 Jul 2026 17:00:38 +0000
Date: Fri, 31 Jul 2026 19:00:33 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 55/55] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202607311826.5Y0AGjKL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   c2edf72f8ebcec4268393789859f789bb12ea5d0
commit: c2edf72f8ebcec4268393789859f789bb12ea5d0 [55/55] debug
reproduce: (https://download.01.org/0day-ci/archive/20260731/202607311826.5Y0AGjKL-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#32: FILE: kernel/time/hrtimer.c:1685:
+		switch (reprogram) {
+			case HRTIMER_REPROGRAM:
[...]
+			case HRTIMER_REPROGRAM_FORCE:
[...]
+			case HRTIMER_REPROGRAM_NONE:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
