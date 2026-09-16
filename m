Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB41361950
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 01:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789521094; cv=none; b=J/zrNRaYsuZsVG4csbi4I+BTcqqjNeYGlOmWsg4Beux6+4icb6VrJ9DQ0zhHK0/MbzkUJ4zHAe/oyWfZ7K23HNKk9SuLYc74yvD+AyRqQk7XVnNHSv2KFXvKtzZKOAuwdHDAosbX7JGlisqchq3S2osudi2dn/ZYO0b8sipOf6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789521094; c=relaxed/simple;
	bh=w/1HlWfEeOTU3zqty4hsxzZTVELj1iO2EmL6xhTEqY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TlT6eO4CllZvvXSBdrQe+kbirKZBEXFb+6lNBlfUdDNFDjIeYD1cbSkIABlADftVXOvjvKqDbTlcm/RNTnZknvYB5av/dSwilsmbWzZnRH7ShTKezzoEEYSnH1mfFaa/IIYVdCiZ6sfQxqfE2C9xSPv7VCh0BRf8xY+Xez+WynA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiRGnSAk; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiRGnSAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789521092; x=1821057092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w/1HlWfEeOTU3zqty4hsxzZTVELj1iO2EmL6xhTEqY4=;
  b=QiRGnSAkXd0Ad3qZ/DyHrTAfRsfcKiHyiREclkApG8K4PP6SJMlZY3J1
   y/rV/wiTZEZ5VErhlGlnq2IchLwSfHZzOszsS47I3N3L1/NBo+umsDXZf
   qlkD1FZYLYwZfzfFiszqjhspAHnspy8fe9afQdgJ/ik/5E2zcbPvEPNdx
   8aI/WZCkiCeHIdxyx/Pj/xhQQddCnJVbcsWXjQ+XH6d17vMqVCnzORC2F
   MIzeyFFRBhVZB0kUS0HdiNanN19P8uXBKUMlMREnu3z6AmesALWDpXFtY
   nAQaqBl5ttaSOyBsRdvRTginTN9aoh5d1Fi6xJ7v/pibjFgBcNrk6y1jd
   A==;
X-CSE-ConnectionGUID: LhGQB+NfTHOxq8EB9BIMPA==
X-CSE-MsgGUID: a0rAwEH3RPGX0LQ+68HSyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="403842"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="403842"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 18:11:31 -0700
X-CSE-ConnectionGUID: vdV7uYkmRTa0Cm3c+z5HQA==
X-CSE-MsgGUID: XZODzSpBQ+CLj6KEF57xPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271394418"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Sep 2026 18:11:29 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6eBL-000000005Hp-0g7u;
	Wed, 16 Sep 2026 01:11:27 +0000
Date: Wed, 16 Sep 2026 09:11:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:ksyms-tune 4/6] kernel/kprobes.c:76:undefined
 reference to `kallsyms_lookup_name'
Message-ID: <202609160940.3ibzgix7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git ksyms-tune
head:   bc5ee628d6230f6c491f1b868aa7a201bf2ee513
commit: 7e96e1c95c0fa1af496e25ee9645927632dc4d32 [4/6] kallsyms: improve the compare in binary search in kallsyms_lookup_names()
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260916/202609160940.3ibzgix7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160940.3ibzgix7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160940.3ibzgix7-lkp@intel.com/

Note: the jimc/ksyms-tune HEAD bc5ee628d6230f6c491f1b868aa7a201bf2ee513 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `kprobe_lookup_name':
>> kernel/kprobes.c:76:(.text+0x5bbcd6): undefined reference to `kallsyms_lookup_name'
   ld: vmlinux.o: in function `ftrace_lookup_symbols':
>> kernel/trace/ftrace.c:9367:(.text+0x5ffa39): undefined reference to `kallsyms_lookup_name'
   ld: vmlinux.o: in function `parse_pred':
>> kernel/trace/trace_events_filter.c:1766:(.text+0x6ac669): undefined reference to `kallsyms_lookup_name'
   ld: vmlinux.o: in function `trace_kprobe_address':
>> kernel/trace/trace_kprobe.c:214:(.text+0x7046e1): undefined reference to `kallsyms_lookup_name'
>> ld: kernel/trace/trace_kprobe.c:214:(.text+0x705086): undefined reference to `kallsyms_lookup_name'
   ld: vmlinux.o:kernel/trace/trace_kprobe.c:214: more undefined references to `kallsyms_lookup_name' follow


vim +76 kernel/kprobes.c

ef53d9c5e4da147 Srinivasa D S 2008-07-25  72  
290e3070762ac80 Naveen N Rao  2017-04-19  73  kprobe_opcode_t * __weak kprobe_lookup_name(const char *name,
290e3070762ac80 Naveen N Rao  2017-04-19  74  					unsigned int __unused)
49e0b4658fe6aab Naveen N Rao  2017-04-19  75  {
49e0b4658fe6aab Naveen N Rao  2017-04-19 @76  	return ((kprobe_opcode_t *)(kallsyms_lookup_name(name)));
49e0b4658fe6aab Naveen N Rao  2017-04-19  77  }
49e0b4658fe6aab Naveen N Rao  2017-04-19  78  

:::::: The code at line 76 was first introduced by commit
:::::: 49e0b4658fe6aab5bf6bfe0738a86c1895930ad1 kprobes: Convert kprobe_lookup_name() to a function

:::::: TO: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
