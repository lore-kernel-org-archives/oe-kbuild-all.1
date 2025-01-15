Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A802111
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 00:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736900358; cv=none; b=MmwjTJifmFFoTd/pCB5fAhXBBnOYNNQQeM4Fs3SwaahBNGvsqKP5BgYTOO1dZaGdR9T68NhJbIBS1kIJm6+huyTMaR9AAlgh884MDJNjP7w+Rtt+kfDWndhEX2FGet3ZG5wnkiHy+2GPSDNcazjkWIFtInG4yMWlUoMcBKn5oaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736900358; c=relaxed/simple;
	bh=C/bOWfkfNksaWLTrNSa9letkFQYvH8t4UAOJnU5z/Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b7cjg9iiP2ujRA1vB11je5wKbsNrHU24zGY4yVDzp1r9dvQL67IC1xrT7OojlAlroW2yliqybm/rdp8eTgbpmsz9LjT7DgQQUGJSQ2pdIls2OVFrFGYl7z+1lUEiQpo8CkLQ1gkkGiw2A5YpvIjTt0CIuMfI8EfbUNRO7/Zs3vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xmj5OTOz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xmj5OTOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736900356; x=1768436356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C/bOWfkfNksaWLTrNSa9letkFQYvH8t4UAOJnU5z/Hw=;
  b=Xmj5OTOzt4YNkJHl0zAlJbtLHRR25HuivtW0xUYIL6lf+hUD4ch6ydP+
   eq7tgUDx9AYXq4bg1IznXJOi+OFAiEy5V9WwTt+2OFo9QBjYuqW5W39fQ
   g0t6LitqaLSjZ7EtLWM14+UsitJnu0jrfEoJw3HxphWBTnmqJjj22t09F
   NyPCAPfDvHGfrn74LQ6QQd6OQcPrFB5XDQz7oNLp3fXbY+tbYfTVpIhqh
   eB4qZa62MxShzAevvY3F6SlIsafWj9qVTNMBDdDXXqlWRrXWbCkxrKchi
   WkrrdaMmucf3aX4be8Ly41AvZXAY8bTmjTuZqh9A23bdaqqIzTAY19eSV
   Q==;
X-CSE-ConnectionGUID: NqfOmk9IQ/KeNGk084ez9w==
X-CSE-MsgGUID: IipSkOw/QCCi6isseDOqDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="40983681"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="40983681"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 16:19:15 -0800
X-CSE-ConnectionGUID: vQNiX9P2Qpy/cfEQRYHuXA==
X-CSE-MsgGUID: TJm9UYA0ROeoP57gkxB2HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="105500452"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jan 2025 16:19:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXr7o-000PDn-27;
	Wed, 15 Jan 2025 00:19:12 +0000
Date: Wed, 15 Jan 2025 08:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool/break-stuff 4/4] kernel/bpf/core.o: error:
 objtool: ___bpf_prog_run+0x74: sibling call from callable instruction with
 modified stack frame
Message-ID: <202501150853.RqQO2B4M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool/break-stuff
head:   5daebdfce36d5b286c19eafeb6a44bb73d7f721c
commit: 92c6d838b7e6d873c20b11ada80909fc590160cf [4/4] objtool: Change "warning:" to "error:" for CONFIG_OBJTOOL_WERROR
config: loongarch-randconfig-001-20250115 (https://download.01.org/0day-ci/archive/20250115/202501150853.RqQO2B4M-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501150853.RqQO2B4M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501150853.RqQO2B4M-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/core.o: error: objtool: ___bpf_prog_run+0x74: sibling call from callable instruction with modified stack frame
>> kernel/bpf/core.o: error: objtool:   ___bpf_prog_run+0x0: <=== (sym)
   0000 00000000000009e0 <___bpf_prog_run>:
   0000      9e0:	03400000 	nop
   0004      9e4:	03400000 	nop
   0008      9e8:	02fe4063 	addi.d      	$sp, $sp, -112
   000c      9ec:	29c0e07b 	st.d        	$s4, $sp, 56
   0010      9f0:	1a00001b 	pcalau12i   	$s4, 0	9f0: R_LARCH_PCALA_HI20	jumptable.26
   0014      9f4:	29c16077 	st.d        	$s0, $sp, 88
   0018      9f8:	29c14078 	st.d        	$s1, $sp, 80
   001c      9fc:	29c0c07c 	st.d        	$s5, $sp, 48
   0020      a00:	29c0a07d 	st.d        	$s6, $sp, 40
   0024      a04:	29c1a061 	st.d        	$ra, $sp, 104
   0028      a08:	29c18076 	st.d        	$fp, $sp, 96
   002c      a0c:	29c12079 	st.d        	$s2, $sp, 72
   0030      a10:	29c1007a 	st.d        	$s3, $sp, 64
   0034      a14:	29c0807e 	st.d        	$s7, $sp, 32
   0038      a18:	29c0607f 	st.d        	$s8, $sp, 24
   003c      a1c:	0015001d 	move        	$s6, $zero
   0040      a20:	00150098 	move        	$s1, $a0
   0044      a24:	001500b7 	move        	$s0, $a1
   0048      a28:	02c0037b 	addi.d      	$s4, $s4, 0	a28: R_LARCH_PCALA_LO12	jumptable.26
   004c      a2c:	0281401c 	li.w        	$s5, 80
   0050      a30:	001502e4 	move        	$a0, $s0
   0054      a34:	54000000 	bl          	0	# a34 <___bpf_prog_run+0x54>	a34: R_LARCH_B26	__asan_load1_noabort
   0058      a38:	2a0002f9 	ld.bu       	$s2, $s0, 0
   005c      a3c:	00410f3a 	slli.d      	$s3, $s2, 0x3
   0060      a40:	0010eb64 	add.d       	$a0, $s4, $s3
   0064      a44:	54000000 	bl          	0	# a44 <___bpf_prog_run+0x64>	a44: R_LARCH_B26	__asan_load8_noabort
   0068      a48:	380c6b6c 	ldx.d       	$t0, $s4, $s3
   006c      a4c:	0040833e 	slli.w      	$s7, $s2, 0x0
   0070      a50:	02c012fa 	addi.d      	$s3, $s0, 4
   0074      a54:	4c000180 	jr          	$t0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
