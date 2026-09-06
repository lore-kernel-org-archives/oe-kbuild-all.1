Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FE4364EA6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Sep 2026 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788709634; cv=none; b=kOjLItRVgo90RRwWxYZJ59rBh5jgDFePj+7uX6hjpqaoOLnLq+UQLjEaK1HJVixVeVGjdCP6tDvSzaK/BXWqbnZpe7KBkZNQ82LxkIM7eu8A0x68jtBYmsxFdSmef6H6Zh9JbRLBVvlJBb6LLIv1qypaGxAEsHDjdSEF62mtFMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788709634; c=relaxed/simple;
	bh=KmLSISCNQwV/I41exrjIiP640e7rKfHM4RMCPV3P0GU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gMO26HAj0iQBF99xBQH/Nfqj7DKywRWHJpZFRkhL880qnMjRofHoePQU29vSa/79JkHNEa636ZTBJx4tXGNWLb24PxjcCtB+dZW6w3fZmBlWiej4vHujpdYZLRXlFsSvDjHlY6iGZRiExSr60gx1MuHT7On5LvpQuBcMPdJECXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3fStzsQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3fStzsQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788709630; x=1820245630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KmLSISCNQwV/I41exrjIiP640e7rKfHM4RMCPV3P0GU=;
  b=e3fStzsQ+U5QtMGj4C5EO2I2LZgAl4WGZkmQE/BaWSNxEMILaIsY5W0n
   gMSim3QoB9Vjcnhe/SH4dJz3jwc73VsgAkyI3YK3tEujBxyp6dv8UVxUQ
   JJVlZ9izxIEEPQqbTc1I02oqePOzjSYBAxv756HZGU+4eo6pU7OhsaB83
   Pc2F4rj00iMHHk6Q6W5+dIQ8N21TZyfZWp0pkP1D7BRwAvP+tgWqkuA6w
   3NhGAQHuvPsQDesqMRnTjmiQQdNqIz5pkXV8DInOIsc0iJU3YzpO8nm3L
   f5p/ebFGTCCQVkjgTelwHIo3VHOQUfft9v3Ta3ASdtd2y8J8gYqRNBSw/
   Q==;
X-CSE-ConnectionGUID: /irjGDaZQwStwQb85hVV1Q==
X-CSE-MsgGUID: eJCJ3F8rQQGgXxVsaPveJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89184303"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; 
   d="scan'208";a="89184303"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 08:47:09 -0700
X-CSE-ConnectionGUID: iMh7rDidTN23+e6m/6ZYsQ==
X-CSE-MsgGUID: G/zY+hjnSwat4srFGBdehg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; 
   d="scan'208";a="266814855"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Sep 2026 08:47:07 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3F5E-000000001lz-435P;
	Sun, 06 Sep 2026 15:47:04 +0000
Date: Sun, 06 Sep 2026 23:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:jump-batch-260903 51/56] lib/dynamic_debug.c:793:1:
 warning: the frame size of 1296 bytes is larger than 1280 bytes
Message-ID: <202609062305.5uATbcF2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git jump-batch-260903
head:   c2b43d468878ecfd9647a8eea621ceda5d1cd208
commit: ac471b8cc89b36ddb96940b2bd214217c4bab1fe [51/56] x86/alternative, jump_label, dyndbg: fix early boot crashes and locking in jump-batch-core-1
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260906/202609062305.5uATbcF2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260906/202609062305.5uATbcF2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609062305.5uATbcF2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_apply_class_bitmap':
>> lib/dynamic_debug.c:793:1: warning: the frame size of 1296 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     793 | }
         | ^


vim +793 lib/dynamic_debug.c

a2d375eda771a6 Jim Cromie 2020-08-31  744  
0a63a411361860 Jim Cromie 2025-11-18  745  /* apply a new class-param setting */
b9400852c0801a Jim Cromie 2022-09-04  746  static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
1ec0f7ef1e9ab3 Jim Cromie 2025-11-18  747  				     const u32 *new_bits, const u32 old_bits,
0a63a411361860 Jim Cromie 2025-11-18  748  				     const char *query_modname)
b9400852c0801a Jim Cromie 2022-09-04  749  {
b9400852c0801a Jim Cromie 2022-09-04  750  	const struct ddebug_class_map *map = dcp->map;
b9400852c0801a Jim Cromie 2022-09-04  751  	int matches = 0;
398a544c6030fa Jim Cromie 2026-03-08  752  	int bi, pos = 0;
ac471b8cc89b36 Jim Cromie 2026-08-08  753  	bool alloc = true;
ac471b8cc89b36 Jim Cromie 2026-08-08  754  	char sbuf[1024];
398a544c6030fa Jim Cromie 2026-03-08  755  	char *buf;
398a544c6030fa Jim Cromie 2026-03-08  756  
398a544c6030fa Jim Cromie 2026-03-08  757  	if (*new_bits == old_bits)
398a544c6030fa Jim Cromie 2026-03-08  758  		return 0;
b9400852c0801a Jim Cromie 2022-09-04  759  
1ec0f7ef1e9ab3 Jim Cromie 2025-11-18  760  	v2pr_info("apply bitmap: 0x%x to: 0x%x for %s\n", *new_bits,
28d2dd8233aa44 Jim Cromie 2025-11-18  761  		  old_bits, query_modname ?: "'*'");
b9400852c0801a Jim Cromie 2022-09-04  762  
ac471b8cc89b36 Jim Cromie 2026-08-08  763  	buf = kmalloc(1024, GFP_KERNEL);
ac471b8cc89b36 Jim Cromie 2026-08-08  764  	if (!buf) {
ac471b8cc89b36 Jim Cromie 2026-08-08  765  		buf = sbuf;
ac471b8cc89b36 Jim Cromie 2026-08-08  766  		alloc = false;
ac471b8cc89b36 Jim Cromie 2026-08-08  767  	}
398a544c6030fa Jim Cromie 2026-03-08  768  
1ec0f7ef1e9ab3 Jim Cromie 2025-11-18  769  	for (bi = 0; bi < map->length && bi < 32; bi++) {
1ec0f7ef1e9ab3 Jim Cromie 2025-11-18  770  		bool new_b = !!(*new_bits & BIT(bi));
1ec0f7ef1e9ab3 Jim Cromie 2025-11-18  771  		bool old_b = !!(old_bits & BIT(bi));
1ec0f7ef1e9ab3 Jim Cromie 2025-11-18  772  
1ec0f7ef1e9ab3 Jim Cromie 2025-11-18  773  		if (new_b == old_b)
b9400852c0801a Jim Cromie 2022-09-04  774  			continue;
b9400852c0801a Jim Cromie 2022-09-04  775  
ac471b8cc89b36 Jim Cromie 2026-08-08  776  		pos += scnprintf(buf + pos, (alloc ? 1024 : sizeof(sbuf)) - pos, "class %s %c%s%c",
398a544c6030fa Jim Cromie 2026-03-08  777  				 map->class_names[bi],
398a544c6030fa Jim Cromie 2026-03-08  778  				 new_b ? '+' : '-', dcp->flags, ';');
398a544c6030fa Jim Cromie 2026-03-08  779  	}
b9400852c0801a Jim Cromie 2022-09-04  780  
398a544c6030fa Jim Cromie 2026-03-08  781  	if (pos) {
398a544c6030fa Jim Cromie 2026-03-08  782  		buf[pos - 1] = '\0'; /* trim last ';' */
398a544c6030fa Jim Cromie 2026-03-08  783  		matches = ddebug_exec_queries(buf, query_modname);
b9400852c0801a Jim Cromie 2022-09-04  784  	}
398a544c6030fa Jim Cromie 2026-03-08  785  
ac471b8cc89b36 Jim Cromie 2026-08-08  786  	if (alloc)
398a544c6030fa Jim Cromie 2026-03-08  787  		kfree(buf);
398a544c6030fa Jim Cromie 2026-03-08  788  
1ec0f7ef1e9ab3 Jim Cromie 2025-11-18  789  	v2pr_info("applied bitmap: 0x%x to: 0x%x for %s\n", *new_bits,
28d2dd8233aa44 Jim Cromie 2025-11-18  790  		  old_bits, query_modname ?: "'*'");
0a63a411361860 Jim Cromie 2025-11-18  791  
b9400852c0801a Jim Cromie 2022-09-04  792  	return matches;
b9400852c0801a Jim Cromie 2022-09-04 @793  }
b9400852c0801a Jim Cromie 2022-09-04  794  

:::::: The code at line 793 was first introduced by commit
:::::: b9400852c0801aebee4fc8b62e6b7cc69c7fcbda dyndbg: add drm.debug style (drm/parameters/debug) bitmap support

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
