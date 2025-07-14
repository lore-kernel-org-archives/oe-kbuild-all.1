Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C1E194A60
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 20:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524647; cv=none; b=ZtiNKfphqW2X1Ougb35MboU3xuqyLB7BPknBD005O65mnW9VvyktMDGy3ymgYjjF9cSRlx3GPNw56Qv1Msp19j++XjCZttx9Ub60miNv2Yy9Flt3OBBoNaOER0CsVS6DwZBcGSmSkWf79ZL2G8Iqx1Y7NiAH09TKOzP616ScagE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524647; c=relaxed/simple;
	bh=22i2J5hWdIztNiffuWPaL4fJVpe2SEHOyJ9gvSvwoqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fW/VSpvCxyeAb2iunrLP3WB1wYryRnNPFnWLrRqY3ExY8eYLsE2ifrDUKgzoWRdZOgrU1TE38rgsRfYn6C9VXNvBPjisNFItEBGEBnAWtsOOGzZIrMJQPjRgG0H1ee6PsRUvpT2nuGlMvGRMEbOk1iW38THOMJn3jefZ3rsT+Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMYZtWSS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMYZtWSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752524645; x=1784060645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=22i2J5hWdIztNiffuWPaL4fJVpe2SEHOyJ9gvSvwoqs=;
  b=VMYZtWSSDkru2/r4PutuBR03XQmwUgosuKAAskRe9PPwY1CICVJjNQUR
   s7EZQFJpaeaU38EShmJ+aPVCL925s7hpcbtQ/F7dkpih+u/tj6kvOgAmm
   gCBBEoxyDLGDN2+DStvd9LMTfZUvQaKfWbV0hMZDrnxkcntB3sXvOZbVe
   MHtdstnxVKThm3n5o7SoCqo35ASjG6MViK+47SXbp5UKF0P3VURD+CNkM
   hM5BjiDpvGkIxZpNhFcXvRCvE82mMXwOT30pKKM3Ldo4ZUq0Oh7UuPNoT
   QQs/anPtYDE8uLokb6dHHre2ix3t1rafrrPYT5B43ItPZ90LqU+6ppSjV
   g==;
X-CSE-ConnectionGUID: Wqd5Lss9RQaEF9R3NnWSYw==
X-CSE-MsgGUID: jyFLXCPpSX2k7nf+4OSpFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53838352"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="53838352"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 13:24:05 -0700
X-CSE-ConnectionGUID: hmekbSenTsO6xO1wDYHmdg==
X-CSE-MsgGUID: rqQHQxhbTOOAtDkyeGfNYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="161334824"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jul 2025 13:24:04 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubPiU-0009IR-07;
	Mon, 14 Jul 2025 20:24:02 +0000
Date: Tue, 15 Jul 2025 04:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9133/9557] ERROR: modpost: "utf8_casefold"
 [fs/bcachefs/bcachefs.ko] undefined!
Message-ID: <202507150409.sRu8hN54-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0be23810e32e6d0a17df7c0ebad895ba2c210fc4
commit: c7a5f0f01e24163162bf7811d3d7be196c200314 [9133/9557] bcachefs: More errcode conversions
config: um-randconfig-002-20250714 (https://download.01.org/0day-ci/archive/20250715/202507150409.sRu8hN54-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150409.sRu8hN54-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150409.sRu8hN54-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "utf8_casefold" [fs/bcachefs/bcachefs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
