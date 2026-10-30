Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351978;
	b=z30b0O3blcSth0arws3/+oUUdeHKSmkNRRon5xqtDf9RWRvidejg5hsYflv53UDQIfaa
	 +Ugmh9/O1oetaqq8dNr14FGDWokz1iP0tKNOTPmbM2bohTFu3lJl15fVaPonO0pUXyryZ
	 HOtuyNXhD9MXo6lMUj2ZZ5Iw8+yC5bmZmODVLguHhTfPsZoaP7hVh4icPjKbUtIzIVYsj
	 f4K1dzRToiCbwvGZ8tTqet/L6mrQrJbzAJ7zpyqyC8tlN6D2PVJcAFoIV+/ro58zNNKMU
	 PBLIz65ktTCZw8O+F2u0ywJ/KuzVdGe5aWkGIRIDH7gcMOREHNLBQR+VrDU9tsoZ1Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351978;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=T+0KxGCAzVwMOt5rcePp3fl8u6u2KtZSidEnIwQkECs=;
	b=IthrFAvU1b70VLOqFkryCStcr47oVFd0ijycmQ22NRiG9BgjlDF52EaVXdyIIyHsMvNO
	 8rXctb1pKJBJk2kU/oH8KW5hsE1R3vB554G/XmQPIcyuJc/sW9o24sfEygfaPBEFbZh9y
	 wepcsLB/wdAZfHe8do9uMWYjALGv8MYTOud3Q6OWIRkdpmU0IKXit8ASOMbnjk2L9SCcs
	 5uLIGXgMCsLslhViS0fCIq3AWgIOf3cuVUYfDzRbZoBSeVmkbsYQhKp8/rlc2l253mnrC
	 R2oRgslHIWjjwBnVi89U7LwyNwaU9615jFuNXQJmndgdkQsz6jEeKgnM7XPn6JX9cuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hCscuWOE;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35715606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 09:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35715606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hCscuWOE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793351977; x=1824887977;
  h=date:from:to:cc:subject:message-id;
  bh=VJo3HqqQ1VrXzBdDpN+1pKod93dLcadZFU7atEtPow0=;
  b=hCscuWOENDb3CWRZrGdepSF/9Z55rWHC55+taFFN5pSgB/f9NVNDBKAC
   5yNWwPBkjjHfSQQ0Kzp1pjgMuaQb2LKQ4ciC5Ap73sHbIU1BlzmLA1aUV
   gSa8nFHKxsqXD29cNzFeIBObp//8VAeg1G3a17l6hWD/yk6JpQYPiSQ/e
   oajBCypZBF+PnwNoeA6P2Uvq81p7KaiKLsl3/vr2GgEY+wS0b70HpNb18
   X9ubZT82Vb9VYw7dkz0uKZTe2hXA37Ig5879WuJcDBtoYbYbUdqwAvG1k
   kgLG9coBhiQVvkDwu/cDcFNlayctVS/1DIrl9hnLBA9QH7EPwOet3kwqv
   w==;
X-CSE-ConnectionGUID: 9wevwCKpQKmmiEqE1ZBwPA==
X-CSE-MsgGUID: cOgYSnn8R02o0JFoIr3vcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2125307"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2125307"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:19:36 -0700
X-CSE-ConnectionGUID: ay5nU87DTaCVoHHJwxzHMw==
X-CSE-MsgGUID: 2bF2OPr/Tx2X5eC6qx1xKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5516053"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2026 02:19:34 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMilo-000000005XD-0xOl;
	Fri, 30 Oct 2026 09:19:32 +0000
Date: Fri, 30 Oct 2026 10:19:15 +0100
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/syscall 5/5] vmlinux.o: warning: objtool:
 .export_symbol+0x128: data relocation to !ENDBR: x86_entry_from_kvm+0x0
Message-ID: <202610301028.jA5xenfo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/syscall
head:   43093e4a64a017d5e0f28eedbba8add73f35e1e4
commit: 43093e4a64a017d5e0f28eedbba8add73f35e1e4 [5/5] x86_64/entry: Mark C noinstr __noendbr
config: x86_64-randconfig-2300-20261030 (https://download.01.org/0day-ci/archive/20261030/202610301028.jA5xenfo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610301028.jA5xenfo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610301028.jA5xenfo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .export_symbol+0x128: data relocation to !ENDBR: x86_entry_from_kvm+0x0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
