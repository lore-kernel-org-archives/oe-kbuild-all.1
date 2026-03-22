Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8072221D00A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 07:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774165263; cv=none; b=LgOUNQF/QKa0HDlq1LRoQR0dR4E9wFwMqVgbCB5t3tgkGzGjkMKisa5H+ch+ctohfpXXfAAeYWZHutCUdDu6v3lbGv9ZumJZ16WYl9cL9uTEsy2EyLOhgibpfRD4om0ytQxzDvYNXvWbn88ATcJoNd1zyk6ar70HYBAFvhNCGSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774165263; c=relaxed/simple;
	bh=Bb4QyRenZ7daQTIah7HNDKj8CLKXNag8jCu6QnIEdBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekd5baFoo+ehCQSnNkrdZcBbGowoqVoGtZrfpGh1VAnCLAyzVnb1Kcs3unyOT4FDTUQSystC8sGfi/qEfwchm9cxZX9JRT2pq6tQAyX1a1RjApfpLkJUzXSc4HoG8SS5QifsmsoRaKyfOnSh2SM+wgIxnjykWePdMr/2h2tvNXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yh1s/sKn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yh1s/sKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774165262; x=1805701262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bb4QyRenZ7daQTIah7HNDKj8CLKXNag8jCu6QnIEdBg=;
  b=Yh1s/sKnY6Sbk31AZykrLtKcZ0xpRsbsauGpLJjCe5+MDKJl6oeHiyNj
   wdXgzlxXKlHF0GkbJjNB/+iYYrdXXytePWyAtmV0TIB63PgAa/ItXbIIR
   9nDMO48vuVGjTfDLUFbJ/pDQajjw1gjWdyRtfWm9dE7Gu/MhfaKBfTuxD
   95y7F0r9e81F+Rgr4Gq4/akGIVS4Bb3/V0cuPkRAYEmLJ2e6NPCEoYd6l
   dZ9CY8exI6nbERyN/RIifgYRt+yNx1IiCit1oX2wwP3lHBGzSyqKWcYjs
   Wh4kW6TcgPuwTUDKyGaPoim6MEo/5Vi+x3mbTWbpEH0GWXdxS1GatFSTx
   w==;
X-CSE-ConnectionGUID: 1EiIx0jfQCKMdDy00ki8rw==
X-CSE-MsgGUID: 5VFFHPV5SYihnRTtBIFrHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="74218076"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="74218076"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 00:41:02 -0700
X-CSE-ConnectionGUID: aubtGZfvTP64cXi8tj3R7Q==
X-CSE-MsgGUID: iuwTwHhqRGKMtknP2CxQOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="223749971"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Mar 2026 00:40:59 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4DQb-000000001pJ-1PUq;
	Sun, 22 Mar 2026 07:40:55 +0000
Date: Sun, 22 Mar 2026 15:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: Oskar Gerlicz Kowalczuk <oskar@gerlicz.space>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>, Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
	Oskar Gerlicz Kowalczuk <oskar@gerlicz.space>
Subject: Re: [PATCH 1/5] liveupdate: block outgoing session updates during
 reboot
Message-ID: <202603221537.TfoAS2LD-lkp@intel.com>
References: <20260320163720.100456-1-oskar@gerlicz.space>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320163720.100456-1-oskar@gerlicz.space>

Hi Oskar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.0-rc4 next-20260320]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oskar-Gerlicz-Kowalczuk/kexec-abort-liveupdate-handover-on-kernel_kexec-unwind/20260322-071016
base:   linus/master
patch link:    https://lore.kernel.org/r/20260320163720.100456-1-oskar%40gerlicz.space
patch subject: [PATCH 1/5] liveupdate: block outgoing session updates during reboot
config: x86_64-randconfig-161-20260322 (https://download.01.org/0day-ci/archive/20260322/202603221537.TfoAS2LD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221537.TfoAS2LD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221537.TfoAS2LD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/liveupdate/luo_session.c:99 struct member 'reboot_waitq' not described in 'luo_session_header'
>> Warning: kernel/liveupdate/luo_session.c:99 struct member 'rebooting' not described in 'luo_session_header'
>> Warning: kernel/liveupdate/luo_session.c:99 struct member 'reboot_waitq' not described in 'luo_session_header'
>> Warning: kernel/liveupdate/luo_session.c:99 struct member 'rebooting' not described in 'luo_session_header'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
