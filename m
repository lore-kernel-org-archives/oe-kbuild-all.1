Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94906322DD1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 21:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069063; cv=none; b=s7xLx0cVMMVa8DKE5Eo02aXT8tNRoROxIiGT/GXfYJre0zeb5hoD0HoV92c9hU7tmAiEGQbl8e01h29n0F5n/G9DpEJ7A8ChbnMCokggHIZKKH0MyP5cdcBKJM6bDk2qGIWItQ6QPbVpWEpi5OB+DRwRyT6b1QwAy2GXu6NI6rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069063; c=relaxed/simple;
	bh=5Z8Xe21L3UoBM+LMhnArgXor5BtOvKXTU4+rF1FkC80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NltgwfABrchE6fq4mS8KgNDEfqdDlBmzBdqL0MOB5ABCWjLvNlY/LNhqYQe65PNT4jpEiQbtCyDSkTzaF6EuB5Mxs0gSfZZpRtTNRCoHx7hepys6sQqlMXtW+pQu3CcYivKwsgYe33Wd/yWtEGO2HGIRoxVJzRrP+Hh4MfKUl7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDU71Z5H; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDU71Z5H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069061; x=1794605061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Z8Xe21L3UoBM+LMhnArgXor5BtOvKXTU4+rF1FkC80=;
  b=NDU71Z5HziRa/dY+tiMOsDc9OHlca425OPB+QH6le9JUX09aLTVGvSuK
   2uPPq31J+JR1Si2dwc86Um3+ONjXvpgMDiLO0mR6rJsFqDin/c9pJpKns
   ecdU8U0jk/6G5K5kOzxkIdSrf9VVZA/z26pnbDud4Cl5lFGbiz++4FqPc
   9CsnUlUnUy4pNlYZVnE+ar8vbBCYB3v4oGtBljEAv3xyEusMD6FLjKeAh
   LGBNhmTTVXPK4Cu5OWkBeolKjkt2snptxpMO1nDWoZh7nJNLZO1bY1Zo/
   kj10Hc3Lw/Nz91YD8+de5ksKUv6/GNlELLzh5IflvMGyVH6M9xaoofdF6
   g==;
X-CSE-ConnectionGUID: VU1E/makR3e6fCczhqU3qA==
X-CSE-MsgGUID: cCFfp9v+ShO1jbFBGkzYBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65202016"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="65202016"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:24:16 -0800
X-CSE-ConnectionGUID: 2lgXCh9TRSOdZEycMd5gkA==
X-CSE-MsgGUID: g/AS3Z2nQc68SGpcy+JCwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189435653"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 Nov 2025 13:24:15 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJend-0000000017k-0ydL;
	Thu, 13 Nov 2025 21:24:13 +0000
Date: Thu, 13 Nov 2025 22:23:51 +0100
From: kernel test robot <lkp@intel.com>
To: doubled <doubled@leap-io-kernel.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Shi <alexs@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 407/8066] htmldocs: Warning:
 Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file
 that doesn't exist: Documentation/translations/zh_CN/scsi/aha152x.rst
Message-ID: <202511130315.WOiKJQTu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b179ce312bafcb8c68dc718e015aee79b7939ff0
commit: f7c2e7108e0cf87d04d2f28078b5fefe1af47383 [407/8066] docs/zh_CN: Add scsi-parameters.rst translation
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511130315.WOiKJQTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511130315.WOiKJQTu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/aha152x.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/aic7xxx.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/aic79xx.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/g_NCR5380.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/g_NCR5380.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/g_NCR5380.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/st.rst
>> Warning: Documentation/translations/zh_CN/scsi/scsi-parameters.rst references a file that doesn't exist: Documentation/translations/zh_CN/scsi/st.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/sphinx/parse-headers.pl
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
