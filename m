Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DC312E1FF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 07:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720681457; cv=none; b=glyw8uFFIR40WB4QyYjE9XpvPEDFpdm6WT1BB8pKE4ZFXHCHuMVOt9l3MpXqblLpJ5x9ndUX4CTGAMT7cvBnLiUmTVci9Xer39x6XG2QF1sZAzEEHgAWjIiERVmBwsceLlLIQPj7xAPrwnYrqMpuU/UA+JvrLBotx0YTzEpnraY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720681457; c=relaxed/simple;
	bh=gUsyCUO3hSoPwZ/fdZRK4Jk3noD2i+akPTM74JedKsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nJrtQbRNQMo+VPTCBpWeVeDkLWPtHnTT9HrwLQNRT3q4TQt+f7txH6NMy0UxAGCt0YF4xtBU/xwM4mfrfug1/y3NbRX6tUKnUSxrffBG94NorpVPywIs3WMweWUJ2CVIlGWNqGoK+wc9j6yt37a1AR5TazYa6lDnuWiW/bh3Svw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LP/1pEhX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LP/1pEhX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720681455; x=1752217455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gUsyCUO3hSoPwZ/fdZRK4Jk3noD2i+akPTM74JedKsQ=;
  b=LP/1pEhXLUqiBJ8JzKmh7g5tk2tuFRr7WbQSZpQy6qoxr/F/Ch7U80rG
   tzHEreRydv8ERB8cKC8WBpby5JTliSPwppCoeXytdptyhx2Mgc71FopDx
   8SMcXDiKgGVw75utDvrlzUHn8gtOZTozJqjF2p5ilYLksZAxBD0OMe6Qg
   8QnfrzJj0GgepwmOKbd8qrUMi5exgNDe+RcRl/lNpX+RmMVdNNf83ogcK
   e1BJpQL80CHMJ/RbV1n9Mq94X7YuLmHvDpEezwRX6tAJYiYp+x+5r8dKX
   WFLMKYt3beSyY/vZ62s7RjsgWp16ARD1DQxlQsFcK0hdikoZctWWZZand
   Q==;
X-CSE-ConnectionGUID: t1Q2lyM/Tg6iTbYjN0alhg==
X-CSE-MsgGUID: E9vSMpXXTfysq+opBdGTPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18183338"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="18183338"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 00:04:12 -0700
X-CSE-ConnectionGUID: abzqU0WoQQCmYC0zsWEhcw==
X-CSE-MsgGUID: wSDnVcYxRZWhkxUmkXXmNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="53642541"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jul 2024 00:04:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRnqa-000YvG-1f;
	Thu, 11 Jul 2024 07:04:08 +0000
Date: Thu, 11 Jul 2024 15:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 11984/12309] powerpc64-linux-ld: warning: orphan
 section `.bss..Lubsan_data751' from `kernel/ptrace.o' being placed in
 section `.bss..Lubsan_data751'
Message-ID: <202407111509.7UGrgAba-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   523b23f0bee3014a7a752c9bb9f5c54f0eddae88
commit: 055599651d036d783f53965034451c0d50c42c6d [11984/12309] powerpc/64s: use contiguous PMD/PUD instead of HUGEPD
config: powerpc64-randconfig-r035-20211208 (https://download.01.org/0day-ci/archive/20240711/202407111509.7UGrgAba-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111509.7UGrgAba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111509.7UGrgAba-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data751' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data751'
>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data751' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data751'
>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data751' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data751'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
