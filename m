Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D7118E75B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 23:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722294191; cv=none; b=ibY/TDb60IvWYrMfHdm25gRxB3xdvhNA+B6NjII78m6SJwBIkRn2n2mVOF7XJ5uCSolbJoGlV3VNl+p7Wp1U4vOsqvYiEUN5irVx5G6TUUKf/O7VhI2GNhgv4O7sKYInPSg6H+5vU4v8S3LQPP0RXlhN/kX9mr6Yr47ztz+jEWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722294191; c=relaxed/simple;
	bh=glZRX7FnpRH/ElwUjA+7lKIBpf6JM7fldm2r9Z8otLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dMzci41NlE8EPytOxe5FoRXyy+cxto8gUBahJbMA/OppxvoFWNK3dlmUEVFWxVlrmIe0aUlGC+tC21pk/yRc+v/JpGTHrjMTiGQxKQT7ax/YS6+K3wYZHii0JMtTnwAGskHlUblIiO/bln9Ccm0JojAMAQBnZ04IeSvo2cmxfUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m43nv4Nj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m43nv4Nj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722294189; x=1753830189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=glZRX7FnpRH/ElwUjA+7lKIBpf6JM7fldm2r9Z8otLY=;
  b=m43nv4NjSxarpjsy753/76G/iX/jrjsdBdT1AhIuWL/mGtoNgdJCROIP
   aWlzDWpZFslWSigUbQjazsAd2OufsYFajjEfqx/zIQbmulmDavB/cA2lI
   YlT/UobAZsTQejthqUX/3Jz4H9bO6ySWohHZMAmjHdQqneiNNbbLj61PB
   JkPEvS6Z/OZ58+Ak1bu+ACz/91kyPwSxsGN4/7dyG2Mkx3/NIMaEe12/g
   +6F0MyVMNXaEr860pchttNe3Y5dPyBiKkhWNUQmryS7PY7tBhnTutOPe6
   FH/6+xC+jahOlsw8MKWT9zUNolwOhGLFSn6QZR2RwKSu572Jftb6/PrPW
   w==;
X-CSE-ConnectionGUID: rinaqbJwSvm10kqjtEoz8g==
X-CSE-MsgGUID: Bos2o0qHSUqGoLINDwDhIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="22996788"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="22996788"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 16:03:07 -0700
X-CSE-ConnectionGUID: Uqc2Zc+iS82A+IQzico+Ow==
X-CSE-MsgGUID: BKkDAHugTKmGxSTR0A36xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="53843418"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2024 16:03:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYZOR-000s9y-2y;
	Mon, 29 Jul 2024 23:03:03 +0000
Date: Tue, 30 Jul 2024 07:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
	linux-doc@vger.kernel.org
Subject: [asahilinux:bits/005-maintainers 2/2] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/spi/apple,spi.yaml
Message-ID: <202407300750.sMmRvNzq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/005-maintainers
head:   e58fcf1783e145ebf6a5e11dd9e7a4f26d2fb88b
commit: e58fcf1783e145ebf6a5e11dd9e7a4f26d2fb88b [2/2] MAINTAINERS: Add apple-spi driver & binding files
reproduce: (https://download.01.org/0day-ci/archive/20240730/202407300750.sMmRvNzq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300750.sMmRvNzq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/spi/apple,spi.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/usb/apple,dwc3.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
