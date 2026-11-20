Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215115;
	b=HBxWyNXUYY3pIxDFv7c37WCU8+IUTaUNFRLBkI8+XnO4A1GbCDlCoNzJp8K7BJBlV9gn
	 Awmo2Q30SL8s0L8+oCVn/bXS6DuxMexo1VPqa5fIDyvtJmLb6nqGHXV2sDI3PBBcKHdB3
	 4g6Wnm4dxdsXNDSw0TWAPBwpxx9ww6fZMt4cy9zOj8q0i2sUBbHe4JBpPlY1jQ6SgI6oM
	 kgnS2RfQ2YLlaRnneJFT7vmfop/UNPkVZMVDVHaIQAXc8fROCssq9C6+4ySpnmPysjcEh
	 xedT9Ioq1kTqnGG7hmdbyRp5yKf7PPiA/KOW6DE2LtA071GNNaSXWddoffOrjQQQt8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215115;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gJqe6SUML2qCrOp8e4AWe3D7A19cCi2z2NS+2JBlnSQ=;
	b=kqJxL+DVfh8hMgONw+m0wbZYoDeTpcBkn5lhYoUWGMXS0mFqvh5JuaG5y9vTm+SNZTfh
	 B0FWFAHJgAghxrBnob5F2pSTu7Kw5sUrWhYGAvidzqi2Vz1lYe5JS6FmSvKJ2CUTYgHVB
	 U5GE8+M93cqpnNwZRoxEugQOHrf4ttxugL/A8WNmTdp3jnWhcB91YD/NKQ793fyIVlUFg
	 DxrP5cOzu7AENvj3Yj+bb5/ZzYc7ExUQ0nqbpQn1vwmgThL8M4jkL0oluGqnoxBrnwm27
	 1jrj0IXQnE6EAXsoJhZXPU6IAaSh2Sh/hy0NX218fzEK5fwFcEH2C23K4zlMHx3VMfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="HA3xBV6/";
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81691606A6B6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 22:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81691606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HA3xBV6/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795215112; x=1826751112;
  h=date:from:to:cc:subject:message-id;
  bh=8XwmCzQaHKhjbjMlbOH8smhH7UP3GKFbp4b+WXG0ve4=;
  b=HA3xBV6/oYLTjpqeNOx048uQIFET1YHGzFtcHmZaRo8sIQv0K+tKZnEO
   GWwtwMUKVXTUPEYWn7Wou0a/0ot/FMyO+JAWqGeb9xSQewyjVvqqay22x
   qT2njpvNTQA0CvoNEGL2srjhItB8lm1og7k8amJeVT0TKujOL2z6prge7
   9bTtVLNZTEc7VPRnGKouJPymjCN3vIC+Y5SEUUSearwaUppaXzWm4zgyN
   d/74eJ9Zt1HDKmAs2s5OLS1Rzt+CCNj0AIRanRxYGArGthUtfYlm8lBNK
   SKpKI0Z/PeITSLsOOXiVqlQUPnAdb9owOQhk+9xzfr1A2IRmDxePFcFMn
   Q==;
X-CSE-ConnectionGUID: DZ0vG2zXRG25AIvgNkdh/w==
X-CSE-MsgGUID: A8rch667ThKJbdZPFJbWAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4203848"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4203848"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 14:51:51 -0800
X-CSE-ConnectionGUID: qLN+w4vUSLGtv7DJTpXIQQ==
X-CSE-MsgGUID: XicwP/+9TDqG3nPcVJ2CWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="12627889"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 20 Nov 2026 14:51:50 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUXSN-0000000048P-16Rc;
	Fri, 20 Nov 2026 22:51:47 +0000
Date: Fri, 20 Nov 2026 23:51:03 +0100
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:b4/acpi-static-table-irq-probe-defer-v2 3/10]
 drivers/acpi/property.c:1802:43: error: call to undeclared function
 'FIELD_GET'; ISO C99 and later do not support implicit function declarations
Message-ID: <20261120234544.ecybgywJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git b4/acpi-static-table-irq-probe-defer-v2
head:   a75860f203b994ab67f8a876c7f568ac0f7f84c0
commit: 5df91ea5bcbef51cb967f3a07dd7c69c50681213 [3/10] ACPI: Introduce irq_get() for static fwnodes
config: x86_64-randconfig-2200-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120234544.ecybgywJ-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120234544.ecybgywJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120234544.ecybgywJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/property.c:16:
   include/linux/acpi.h:126:15: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |         irq->flags = ACPI_STATIC_IRQ_FLAGS(trigger, polarity);
         |                      ^
   include/linux/acpi.h:71:3: note: expanded from macro 'ACPI_STATIC_IRQ_FLAGS'
      71 |         (FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))    | \
         |          ^
>> drivers/acpi/property.c:1802:43: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1802 |         return acpi_register_gsi(NULL, irq->gsi, ACPI_STATIC_IRQ_TRIGGER(irq->flags),
         |                                                  ^
   include/linux/acpi.h:75:2: note: expanded from macro 'ACPI_STATIC_IRQ_TRIGGER'
      75 |         FIELD_GET(ACPI_STATIC_IRQ_TRIGGER_MASK, (flags))
         |         ^
   2 errors generated.


vim +/FIELD_GET +1802 drivers/acpi/property.c

  1790	
  1791	static int acpi_static_fwnode_irq_get(const struct fwnode_handle *fwnode,
  1792					      unsigned int index)
  1793	{
  1794		const struct acpi_static_fwnode *node = container_of(fwnode,
  1795							struct acpi_static_fwnode, fwnode);
  1796		const struct acpi_static_irq *irq;
  1797	
  1798		if (index >= node->irq_count)
  1799			return -ENXIO;
  1800	
  1801		irq = &node->irqs[index];
> 1802		return acpi_register_gsi(NULL, irq->gsi, ACPI_STATIC_IRQ_TRIGGER(irq->flags),
  1803					 ACPI_STATIC_IRQ_POLARITY(irq->flags));
  1804	}
  1805	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
