Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14DC350D46
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 02:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772764548; cv=none; b=keppoDwKcvmueyo0l69kG6ZWnhgqGMGKJ2McnrgayoVSi85GJxkGRQrwP0RiCnzgRmlX6aw3vMmAQu3WfQi59anByp23m0V21/J1ZEOtKX6UcxLj3mmBDi+XWGotsdMUKt7asN5mOH/RKZ8drToZTuRuzF2KaFcPwfOOJZAxrMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772764548; c=relaxed/simple;
	bh=wKVaco1V5NhovCrJGPVpE4EhntAZKbIN7zrVqfdpDlo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cPEiTO1VTJDFFU5xyNS7yip31LjUfjYkwHsspwFQ+hZ+/cPY0gehwpM3VBVwJfcWdW1/atIeothbUq/6Nx+U2oYZTW03R836H3qr1gIR2bcG/w+HXbUA+ip4vunS2NMGNWtOl/hOPd3Srl3uNYMeZPelaIT1j2y/SFeQ7OFe3nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAiWXRND; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAiWXRND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772764546; x=1804300546;
  h=date:from:to:cc:subject:message-id;
  bh=wKVaco1V5NhovCrJGPVpE4EhntAZKbIN7zrVqfdpDlo=;
  b=BAiWXRNDTJ4iF0BGobRebRz246z8v33+6d3A5s/xkdTw9+m+EOwvcyQA
   pyJ5oiUjlhHyno85nT1yAS+0eK2kmCIFFh5LLhNTrTlMsLwE4npvSeS7j
   JU9QxRPXUR+u+X2HkXHN8pQtvDlk2DDXSbxNqRAp3YQ0HosX+xRW+Ibbn
   BVupiXFgDcAqfQy/IoVVgki4QIVdnvkUhA7gzcARfw5GIG0VH1jTlPFmD
   /SyNoCZWU7tm9sx2e0tJNfI5Qho0IfvAZo1I8VXt7imkeJjP0t0FIrdiS
   EH0ukMI/sN+OBgmuNYj2LefW2AgcNobcaFtq0yLrXUT+LVknIn2xFrAWF
   g==;
X-CSE-ConnectionGUID: HQBcP0e2Sg+mmLNUTTYPng==
X-CSE-MsgGUID: KS+J7OMjR9alq4QTa4gVOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73785693"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73785693"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 18:35:45 -0800
X-CSE-ConnectionGUID: ayKsspP9TBC85QQW6wojRA==
X-CSE-MsgGUID: GjvmFPGUSI+MNQx77m+6mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218115586"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Mar 2026 18:35:44 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyL2T-000000000Dn-0a0j;
	Fri, 06 Mar 2026 02:35:41 +0000
Date: Fri, 06 Mar 2026 10:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 86/467] Warning:
 security/smack/smackfs.c:1581 function parameter 'iocb' not described in
 'smk_read_doi'
Message-ID: <202603061004.0PSCzMYo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 52b435a3166adc86a7ca1570904ccb5b7846650b [86/467] smack: convert to read/write iterators
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260306/202603061004.0PSCzMYo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061004.0PSCzMYo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061004.0PSCzMYo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/smack/smackfs.c:1581 function parameter 'iocb' not described in 'smk_read_doi'
>> Warning: security/smack/smackfs.c:1581 function parameter 'to' not described in 'smk_read_doi'
>> Warning: security/smack/smackfs.c:1604 function parameter 'iocb' not described in 'smk_write_doi'
>> Warning: security/smack/smackfs.c:1604 function parameter 'from' not described in 'smk_write_doi'
>> Warning: security/smack/smackfs.c:1639 function parameter 'iocb' not described in 'smk_read_direct'
>> Warning: security/smack/smackfs.c:1639 function parameter 'to' not described in 'smk_read_direct'
>> Warning: security/smack/smackfs.c:1662 function parameter 'iocb' not described in 'smk_write_direct'
>> Warning: security/smack/smackfs.c:1662 function parameter 'from' not described in 'smk_write_direct'
>> Warning: security/smack/smackfs.c:1710 function parameter 'iocb' not described in 'smk_read_mapped'
>> Warning: security/smack/smackfs.c:1710 function parameter 'to' not described in 'smk_read_mapped'
>> Warning: security/smack/smackfs.c:1733 function parameter 'iocb' not described in 'smk_write_mapped'
>> Warning: security/smack/smackfs.c:1733 function parameter 'from' not described in 'smk_write_mapped'
>> Warning: security/smack/smackfs.c:1781 function parameter 'iocb' not described in 'smk_read_ambient'
>> Warning: security/smack/smackfs.c:1781 function parameter 'to' not described in 'smk_read_ambient'
>> Warning: security/smack/smackfs.c:2056 function parameter 'iocb' not described in 'smk_read_unconfined'
>> Warning: security/smack/smackfs.c:2056 function parameter 'to' not described in 'smk_read_unconfined'
>> Warning: security/smack/smackfs.c:2145 function parameter 'iocb' not described in 'smk_read_logging'
>> Warning: security/smack/smackfs.c:2145 function parameter 'to' not described in 'smk_read_logging'
>> Warning: security/smack/smackfs.c:2167 function parameter 'iocb' not described in 'smk_write_logging'
>> Warning: security/smack/smackfs.c:2167 function parameter 'from' not described in 'smk_write_logging'
   Warning: security/smack/smackfs.c:2615 function parameter 'iocb' not described in 'smk_read_syslog'
   Warning: security/smack/smackfs.c:2615 function parameter 'to' not described in 'smk_read_syslog'
   Warning: security/smack/smackfs.c:2808 function parameter 'iocb' not described in 'smk_read_ptrace'
   Warning: security/smack/smackfs.c:2808 function parameter 'to' not described in 'smk_read_ptrace'
   Warning: security/smack/smackfs.c:2828 function parameter 'iocb' not described in 'smk_write_ptrace'
   Warning: security/smack/smackfs.c:2828 function parameter 'from' not described in 'smk_write_ptrace'
   Warning: security/smack/smackfs.c:1581 function parameter 'iocb' not described in 'smk_read_doi'
   Warning: security/smack/smackfs.c:1581 function parameter 'to' not described in 'smk_read_doi'
   Warning: security/smack/smackfs.c:1604 function parameter 'iocb' not described in 'smk_write_doi'
   Warning: security/smack/smackfs.c:1604 function parameter 'from' not described in 'smk_write_doi'
   Warning: security/smack/smackfs.c:1639 function parameter 'iocb' not described in 'smk_read_direct'
   Warning: security/smack/smackfs.c:1639 function parameter 'to' not described in 'smk_read_direct'
   Warning: security/smack/smackfs.c:1662 function parameter 'iocb' not described in 'smk_write_direct'
   Warning: security/smack/smackfs.c:1662 function parameter 'from' not described in 'smk_write_direct'
   Warning: security/smack/smackfs.c:1710 function parameter 'iocb' not described in 'smk_read_mapped'
   Warning: security/smack/smackfs.c:1710 function parameter 'to' not described in 'smk_read_mapped'
   Warning: security/smack/smackfs.c:1733 function parameter 'iocb' not described in 'smk_write_mapped'
   Warning: security/smack/smackfs.c:1733 function parameter 'from' not described in 'smk_write_mapped'
   Warning: security/smack/smackfs.c:1781 function parameter 'iocb' not described in 'smk_read_ambient'
   Warning: security/smack/smackfs.c:1781 function parameter 'to' not described in 'smk_read_ambient'
   Warning: security/smack/smackfs.c:2056 function parameter 'iocb' not described in 'smk_read_unconfined'
   Warning: security/smack/smackfs.c:2056 function parameter 'to' not described in 'smk_read_unconfined'
   Warning: security/smack/smackfs.c:2145 function parameter 'iocb' not described in 'smk_read_logging'
   Warning: security/smack/smackfs.c:2145 function parameter 'to' not described in 'smk_read_logging'
   Warning: security/smack/smackfs.c:2167 function parameter 'iocb' not described in 'smk_write_logging'
   Warning: security/smack/smackfs.c:2167 function parameter 'from' not described in 'smk_write_logging'
   Warning: security/smack/smackfs.c:2615 function parameter 'iocb' not described in 'smk_read_syslog'
   Warning: security/smack/smackfs.c:2615 function parameter 'to' not described in 'smk_read_syslog'
   Warning: security/smack/smackfs.c:2808 function parameter 'iocb' not described in 'smk_read_ptrace'
   Warning: security/smack/smackfs.c:2808 function parameter 'to' not described in 'smk_read_ptrace'
   Warning: security/smack/smackfs.c:2828 function parameter 'iocb' not described in 'smk_write_ptrace'
   Warning: security/smack/smackfs.c:2828 function parameter 'from' not described in 'smk_write_ptrace'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
