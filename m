Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436147;
	b=j2Xng9tpUwMMiQnn155jENbhoeRwD+jVlA8pzeA45IKoOwVg+IIOcvtWVS807U02hBxE
	 1T9RIEvF2ozuHlZzO78w7bkL81ED0UM2KL0/UuBJF0u/Kmbd7q1wri4MBKTzlcn0rBOX5
	 ZV/gOtfL+yKGE6a468X2pBv1rC9xWJIDnyBv2oxClL3rVf6K1hXKLl/NsXLjv/KMy5AuQ
	 C77B8rTuh28GkrgqpEPF4rnWig2bRxWPBq4B5gXmDmP5fY2sOjvLyVwdbZ9U6931c/7Ru
	 /FMIk9YtXnhDMNdt7aA7ErB0Lw1N7jWmo7hu8jpUn1oNk0SeBgWhsgB3nYIdbo4SetA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436147;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=TkpxNJcc0hHgIkt/cUlO0/3ztUfSZKSF43jTTn4fUBc=;
	b=uM63Gd+0yMh8fECSTXBM1D4cF9wvna9eWElrVp13P1durgdT5lbc1LRXYAGENNWd9/I8
	 33ApixbBr0KpG7CsiLhd3U7TcDiV41TT5jSNAN/QiSNqXjqN3zkhM2nqMNUoVzON/6b22
	 wu0FDqk/l6ec9+5MSuEsMHNBS7MeVhYRXckFqpylDAI4sHmtIeDSALdmFJPKivCylc907
	 c51q/S6eesnvU17lRAjxkUt2t93LY2bR+cxwnUDcVf54g4aiWnBImrkkDx9sPb4wcyTt4
	 EcP7DsVadIk7stm6pso/MiPrnK/F+kwafAdXSt8zk3QxLlJdRGHwLxOG+4WwMMAZeww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iqi0Ygqu;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6447606A326
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 22:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6447606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iqi0Ygqu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794436147; x=1825972147;
  h=date:from:to:cc:subject:message-id;
  bh=ORrUupl54Hi4WwSujWQ0g5qiamapo+IzUgTDzm0qdm8=;
  b=iqi0Ygqu+F8l0jbVwUvm3EJgw2VbH6Oxeccbvpx35+whrltw7AShiu9Y
   cZ3M8FtCCgcc4i5xZAmA0nNGdap0Q3G4yfkHTtBNeMbOQzocl4iVgXvw1
   auG0NHHVlZaaYe3YmYe5MrEwErjmb0MrKnk8BCyUCpQyeTLFfwaIC02v7
   t1s6AR2eqyaYBBORtl2hHZacjVtzSuR876Ednqf2fe9JbHiabGUI9rt+D
   5xvYIpVNKPbYOdrjZoks00eMbTw6sFIV1lOSqEoFR43BlfTyv6DVZr2tY
   kak6Y+9GuGn7sWejANDM+nOyG7T9bokveXv6TQeky+UXlDkQfFYEoLYEz
   Q==;
X-CSE-ConnectionGUID: jmpVosyrRJybKyhBmgq9tA==
X-CSE-MsgGUID: vUsD7O/LQ1K1s6OxZBAA/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3119654"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3119654"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 14:29:04 -0800
X-CSE-ConnectionGUID: fUv5rdlfT1uwwTwCYxl/ig==
X-CSE-MsgGUID: lAY+V1TgSpi2YUpOY9IRwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="10288452"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 11 Nov 2026 14:29:03 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRGoP-000000000fD-1lxG;
	Wed, 11 Nov 2026 22:29:01 +0000
Date: Wed, 11 Nov 2026 23:28:53 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations-backup/frame-slots 28/34] undefined
 reference to `bpf_sk_release_proto'
Message-ID: <202611112324.w8h2KkBL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux cancellations-backup/frame-slots
head:   57f1029f852dc5be270836c5ca820f32cdb62637
commit: 870dec4c95cf19c79626c22a410e1c90303bc1ff [28/34] bpf: Add frame descriptors and release what their slots hold when unwinding
config: parisc-randconfig-r2301-20261111 (https://download.01.org/0day-ci/archive/20261111/202611112324.w8h2KkBL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.3.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611112324.w8h2KkBL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611112324.w8h2KkBL-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/bpf/unwind.o: in function `bpf_unwind_release':
>> (.text+0x7ac): undefined reference to `bpf_sk_release_proto'
>> hppa-linux-ld: (.text+0x7b0): undefined reference to `bpf_sk_release_proto'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
