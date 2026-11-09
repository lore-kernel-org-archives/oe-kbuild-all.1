Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251219;
	b=b/mfNP2oH5J0B/2PQjthOSolvXR/D3EOnxHlYvRv/+7fRDOLq/oZApTy5kaEkw9TEiSB
	 tTnEePez8lMpgADbNu7NO/3WNAzq6+xDIQdMc6HxfNZRxfBMU7B/RbJnkQlmbSty/i0dC
	 7AfmDDU+yKTBFvLzkPBkW39UGaR0+rQjddR/b8hZ6zUdN0AWtD97j2F17GOKEiYY46K+O
	 rNNkCTw6cK5qXdWwIhwSorKvAwP6Db/zT7mMkzf9bTSqEMUCXCU2+L36hcKhosTJGAuY6
	 LlQIU6SQ6bLUXBMo4x7IxgtKfC6guAj5qRIe6p2OW5HfCgFHx6tGfPwSayS5XQ+Z4Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251219;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xY6OTPYc49ZkYpG+lHtAjzsBl/VdixyfeUWIMuRNcB8=;
	b=GXUi+5YYvwkwE1WdxuFxkPBr2AuO7S1nbZGGckE859U/4qt/6WHFblwHWhpwl2lBtrD9
	 Y/CoWBCpKEJdm5vPKbhslkRerPAWWXHnlPy3glCNch7KbJHOqIy1NrN8WJJ5CVpe/4T4I
	 2DQ3LI7lnPFuX+XHKBGjs3IuxJ8S8VAZBVzC1KZIBxO87/TFxap3BALP5/kqLA9RxzGJ/
	 OJgd/kQLnren9o9BYdjYlexJd8pJfABr225ysqlZ1rAR4WOXhyKBjxteIYqPPAIFU9DaC
	 bxSyDoTnuct45T5E3s3dftKrlohJckRB9NlNrxqRSZfP7t9VKZgKkMfNnj+nqtpW0pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H8fo3Qx3;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03B4606A321
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 19:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F03B4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H8fo3Qx3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794251219; x=1825787219;
  h=date:from:to:cc:subject:message-id;
  bh=tFBkX3D80gVKiWe9dfHWT57ObqAghSHuR4IVVq/G0FA=;
  b=H8fo3Qx3zmXVBJwtF4GpCAJwLanwTsA9IhauP5CJ32NhpttesBJYFYHn
   96IGRY0ZV3bV1UADkcZk7O3x8McBLDoW/BHe0AjkxyqHJmyA8VJ53SJam
   Ruoafndzo68r2InPM1pM0TzIuYCkGH+p4Qnuqw70Twbn2uMuPg8yRhtUc
   xAgtc29QjHOEYoI7LrZhFn8hjJcaiTUWNR8mtmvtRP13Bu9v5SCje0hCe
   ODhGR0+pqTNeggACVr6cRxBPzNZwskf53GZ032bBxZTQUlNqeDI08hWb5
   QCqHQTc44huMTutMwWggOy89mkPlzFfvm6whGiTtiEL8aroEv6a29XOPl
   Q==;
X-CSE-ConnectionGUID: GvM1j/RGQUmnzJgyJFd28A==
X-CSE-MsgGUID: RfvQMNreQpeJmh5sAC6JLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2996756"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2996756"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:06:58 -0800
X-CSE-ConnectionGUID: cXpf6oyQQZKzwgM2E4C5sw==
X-CSE-MsgGUID: rRvhV3PHQuq0zUNWMUB3qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7962822"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 09 Nov 2026 11:06:54 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQUhf-000000000Rz-3sXf;
	Mon, 09 Nov 2026 19:06:51 +0000
Date: Mon, 09 Nov 2026 20:06:01 +0100
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:cpu-model 1/10] setup.c:undefined reference
 to `m68k_cpumodel'
Message-ID: <202611092059.OidEaf8N-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cpu-model
head:   6217ad6f81c95c3046e6d406734dfdbf2aa85542
commit: d034e5f2c808aebe347eb33720e5a9937d6395c3 [1/10] m68k: support reporting CPU model name and revision
config: m68k-randconfig-2001-20261109 (https://download.01.org/0day-ci/archive/20261109/202611092059.OidEaf8N-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611092059.OidEaf8N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611092059.OidEaf8N-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: arch/m68k/kernel/setup.o: in function `show_cpuinfo':
>> setup.c:(.text+0x11e): undefined reference to `m68k_cpumodel'
>> m68k-linux-ld: setup.c:(.text+0x13a): undefined reference to `m68k_cpurevision'
   m68k-linux-ld: arch/m68k/kernel/setup.o: in function `setup_arch':
>> setup.c:(.init.text+0x86): undefined reference to `m68k_cpumodel'
>> m68k-linux-ld: setup.c:(.init.text+0x92): undefined reference to `m68k_cpumodel'
>> m68k-linux-ld: setup.c:(.init.text+0x98): undefined reference to `m68k_cpurevision'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
