Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D583F1055
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788000346; cv=none; b=olexh9NI+hEL3vOfLKG5m2Q+nHw7El5BEQ0voFh+QpQMbKfZyloxNsR+S+FsztiI0gGeQwpH50wqF3dnQVZBJdp3+59xeR2aLNgyFiUdAKapmpP8o/qrokSjMTDM3ZD0/hhfhrPAcVUmCz/vEhL7J5oFXqIN4DwckLvhy7C6emk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788000346; c=relaxed/simple;
	bh=Dx8/F2Z76MKoY0taourcF1rbcqD7q5S74+tQopqQSp0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=laQLyTYndGVLyKSIQVehyoySlpouF4uRgdbqDUvUqpzsVbiNWfPxhWooAOWCn5MY16VFUZ+pRgWfV9fzfYFLVRS8hlzZUZGOj4kBOz0JN1xezpli9IaxzAMcCbIXMda+ux0b91HPa8fXuozcIsR0JWHyElqZ0fj1uoLccTiYuRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWbDY7Bu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWbDY7Bu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788000344; x=1819536344;
  h=date:from:to:cc:subject:message-id;
  bh=Dx8/F2Z76MKoY0taourcF1rbcqD7q5S74+tQopqQSp0=;
  b=FWbDY7BuCw09yCFOnI2CMo2I0NgAu5SG6wJCsfH9TfZZ4bKdaThb8qNY
   ZDNja4FLSS4jqtUbQAXk6GsKOI1liTTz0+Q+MeEIEmGBukpl+SAc4nR0o
   q+8Hg4JbqdU6TdWYltV9U6YE370N3UuI1lnLT1ZtwztnDFt3DUV05fGjj
   PhAP8bxl9fq7mZHaSdryJuAi/NR15jZwfrzh6qsKW7sMW7K1SmSIs6TZQ
   Kf/kdtKK40/NpLdMqZltdfxRmzhtqaVFzW9IO94BjRrqa3r3rns1B2eNz
   MC9xZTTyknBh4PWKlisUW+nXhj+DbXalHkwe73Tlmi92L/Z5g5Of5ZsjC
   A==;
X-CSE-ConnectionGUID: u42x4+znTIa3D46vSG9Egg==
X-CSE-MsgGUID: SZ2KjS8vR8yu3NCyBZI01w==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="100000209"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="100000209"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 03:45:43 -0700
X-CSE-ConnectionGUID: cLiIyFAmRKam21x0C6MWIA==
X-CSE-MsgGUID: kpz5uubeS+alv/1kge3gZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="264637470"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Aug 2026 03:45:42 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0GZ9-00000000Cfs-1VSE;
	Sat, 29 Aug 2026 10:45:39 +0000
Date: Sat, 29 Aug 2026 18:45:29 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 272/272]
 drivers/crypto/montage/tsse/tsse_vuart.c:77:13: warning:
 'vuart_wait_for_xmitr' defined but not used
Message-ID: <202608291831.yYrvFLjJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   84ac058188242dfa84b19b6971120842961845e3
commit: fdd68ce93aa21b0a1cfa7370df64619a0510bf80 [272/272] anolis: crypto: add support for Mont-TSSE driver
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20260829/202608291831.yYrvFLjJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260829/202608291831.yYrvFLjJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608291831.yYrvFLjJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/montage/tsse/tsse_vuart.c:77:13: warning: 'vuart_wait_for_xmitr' defined but not used [-Wunused-function]
      77 | static void vuart_wait_for_xmitr(struct uart_port *port)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/vuart_wait_for_xmitr +77 drivers/crypto/montage/tsse/tsse_vuart.c

    76	
  > 77	static void vuart_wait_for_xmitr(struct uart_port *port)
    78	{
    79		unsigned int status, tmout = 10000;
    80	
    81		for (;;) {
    82			status = vuart_serial_in(port, VUART_FSR);
    83			if (FIELD_GET(VUART_FSR_TXFIFOE, status))
    84				break;
    85			if (--tmout == 0) {
    86				pr_err("%s:timeout(10ms), TX is not empty.\n",
    87				       __func__);
    88				break;
    89			}
    90			udelay(1);
    91			touch_nmi_watchdog();
    92		}
    93	}
    94	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
