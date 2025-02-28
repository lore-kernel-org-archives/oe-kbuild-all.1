Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAE826A1CD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 12:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740745648; cv=none; b=Jf74Bmhy8mplhr+HkEgFma/OjEfM+tMj3ocST4e8cB88QGKJFaVCF6opFH6k+4IsyZ3xHb7zKx5tLLnO207zmYAsatJf5lrSamdUUOQlcWPFoI/CcI1Bi8xjXyj7SG4zzeR0mk6PsBmJoeGEfpfabmkAfP/yPXsY5pIPp+3JA6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740745648; c=relaxed/simple;
	bh=dD0lxTAzTn0wjgRneiiJuU6Csiog46AckfN4y+9dqkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BPNMWJqk2e3w6Z1R4ZYigdn3BNXHkfjxl7m+YzOwhHo05Kt7FiEm05HV3kpApDnDEmh2XnQqBCB+R4S4bl8R5kvwLhXYuRQZ7mRr2mF0Qa/X+Maeg7+/U4s2haiJ+rC/zPVDUlq+xi440B1CP6XCsVsyCybA575dYsyFsMYLJVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEujio1n; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEujio1n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740745647; x=1772281647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dD0lxTAzTn0wjgRneiiJuU6Csiog46AckfN4y+9dqkQ=;
  b=GEujio1n9fEAEXEdEnZaPcpUFJ/dDUBGXOijFkPgBHpEj1v7RY/ffjff
   0R7HgwrkQlvN99wPMYDi5lMDI1ozBzOlrmXhNmSrv1iIJ+K8kaGes7ZQ3
   8c8jhRJlq9qMfDV1rSgORh6nexHT4vKkT4nDzLDOmuJ2EqsUMahhShPM6
   St2wNU7JYSBFBU7yLnHhTtBarKEsRRa+GCUJ+HRF2uvrmXdMwvuXHhX+U
   7fZrAm9LK76FcI1RuY0FkqoPcGJRQ9qRkDJ7eRLMEONxEf1Ww5vXIFVTi
   MDmKiGgJO7r7yz3oG8gJ8kofiQWVamtB9qJKeBoNISbvGHoL3i0atCshw
   A==;
X-CSE-ConnectionGUID: A4Rdgp2+Q8iIiHFR0Zh2Gw==
X-CSE-MsgGUID: Qrf+7hvHRn6ibNUpbU7V1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="59210055"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="59210055"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:27:26 -0800
X-CSE-ConnectionGUID: XLfsStgCQ3mYo0V91XP1fg==
X-CSE-MsgGUID: OsN0knpPSLOPfLQhwvkkug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154499953"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Feb 2025 04:27:25 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnzSc-000Era-1n;
	Fri, 28 Feb 2025 12:27:22 +0000
Date: Fri, 28 Feb 2025 20:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] htmldocs: Warning:
 Documentation/userspace-api/ioasid.rst references a file that doesn't exist:
 Documentation/driver-api/ioasid.rst
Message-ID: <202502282003.ilfNUWv1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   33e283448f335063aab245460a2d3b85ac627b9d
commit: 0ebb438216c3881f28b16c9e29df4f27e1a4c50f [0/1] ioasid: Add /dev/ioasid for userspace
reproduce: (https://download.01.org/0day-ci/archive/20250228/202502282003.ilfNUWv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502282003.ilfNUWv1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
>> Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
