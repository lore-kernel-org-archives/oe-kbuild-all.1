Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED2939855
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 23:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751068620; cv=none; b=b0Lk/F/jd/2gS0HfU/vt7ogy2SumTqfa1yw/Bd8cgtj9OlCUKUgIscsaNMuwPjen63B2bTuVNrxdPmIAQKYMPrTj+7vUWhEJQIhLmps859ICEHsFO3zb88vK+0wkWmAohRp8CAFqRK10Tim7yfpkKZ5ChNn7I1dMejlK5RmA2os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751068620; c=relaxed/simple;
	bh=SnT7XRpBDCr4qRT+FJlvdtt7laR2c4Hchl84ZiDMVrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rKNlro7Dcfejcyh/cABLupWj5ow6FJvsRmZ/SgzkBI6NVV4yorc9ypDhYKQ79uyou5D6RlQApKg7SH66sUTemwuhR7ZtQhFhwEpIYr9tn1v6Gxb1wdLzmN6cRhOvtkhXyK2772aQBOrNzTopnAo/e4dZVBv9PCBXhJ67UgJ0DFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TB0eoh+M; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TB0eoh+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751068619; x=1782604619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SnT7XRpBDCr4qRT+FJlvdtt7laR2c4Hchl84ZiDMVrE=;
  b=TB0eoh+M6901Y7hdAxh5gc0Yuj4Oiy+pqb/1XLqWQn6XK0CkzJMkv8s8
   1k7K0IgRA1FJspfWL4pZyGfxtmXBBY1Fc77lmoeMf3tJXmdbhu4sx33jn
   M8V8lf2yA2tOXCRVPZK6WnEAulCBDg+qOyRHRW9W3A+6+N84qSy4Dg0CD
   Va2K0ZmJLR8+3068X10xnuqMDdIL/RcIJ1sGSvV5+Ci7Pu2p3NGaHjoxc
   OidrYHgbuEdzYh5Is8VmJfgK7abKSIeHbOl5AwTvIJwvAH0Qsw5Ad9F1K
   S2a4uyRf34c65N455E6/g1WThrjZL0dNMPZ7S4BVylt35Zn+kjaRPBSl9
   g==;
X-CSE-ConnectionGUID: EA2WbFeuSWKa+2FUpKFSpQ==
X-CSE-MsgGUID: Eau05t2ESauKjiJ0POkZVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57194619"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="57194619"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 16:56:59 -0700
X-CSE-ConnectionGUID: TBglQy9vR2WSH9tnH1u8VQ==
X-CSE-MsgGUID: wU3CGPn/S7q+5j9bSvuTXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="152443539"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jun 2025 16:56:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVIwB-000WcU-1W;
	Fri, 27 Jun 2025 23:56:55 +0000
Date: Sat, 28 Jun 2025 07:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	linux-doc@vger.kernel.org
Subject: [cornelisnetworks:for-upstream-20250627-1 6/23] htmldocs: Warning:
 Documentation/translations/zh_CN/infiniband/opa_vnic.rst references a file
 that doesn't exist: Documentation/infiniband/opa_vnic.rst
Message-ID: <202506280733.9tLdqUwk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cornelisnetworks/linux.git for-upstream-20250627-1
head:   3e6c24446168bfdf606dce163a7f0f8693a12c5d
commit: bce4b75564c769741d87d441093328ee3463694e [6/23] RDMA/hfi1: Remove opa_vnic
reproduce: (https://download.01.org/0day-ci/archive/20250628/202506280733.9tLdqUwk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280733.9tLdqUwk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: Documentation/translations/zh_CN/infiniband/opa_vnic.rst references a file that doesn't exist: Documentation/infiniband/opa_vnic.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
