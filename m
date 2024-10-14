Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBB81BC58
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 09:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896524; cv=none; b=FS7ginAd4VG9n4x1EkJMuLjXGG2kbIiY49gN3wzQazHSfz5Ei0m4jIhXHU+p5mom4l79HLzZJcAmTfwnr9tJHKlk0I2kc0077LQ+tV3V7lKE4ZzanxrGWpUCR/5wwTRX1x7cn3kRIbzwcVHVSjxkmw9/dUseZfGyG7zJnbi0T6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896524; c=relaxed/simple;
	bh=pIXtCiwWyxWE8i6jcCRy0wtEdLXNz7jBbUm18NIBNVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LHwHEiLjbLfecY3PHHEZo8K1nIdNz3UO/FEgmdTqp9ArwyX4f1B/xKeKXcdMlvo6YS0dIxmiTTzUvfbUiUChVzf5wdw3v0gossW0ABNs9axrbpgVZnJDkVUuw6mOqFqicMc6xcUoqzOCRdj46EKg3uKFm/RMfW8d8bv9vOCSwNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/6K/ciP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/6K/ciP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728896522; x=1760432522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pIXtCiwWyxWE8i6jcCRy0wtEdLXNz7jBbUm18NIBNVo=;
  b=B/6K/ciPb6EolhmFY/rxe22+/IHXesSGhCVvFZ4rlriUTaK3s2wx4Vpc
   0gOW5pt6Kg8nzn7ZJZXT3GCVw0DYdhtjMHR4JhfvG60BXucDQJ1RM8+oU
   w6ue0efW+bXb8/VmzIZTnmhEWpKDhFK0nfvtPHP8H/Fnu7GwttAbYYOjK
   ba+tWY87dMbBvUkjNInVgKqhRA8I9pkhI5zh/vupxsSFpeldjxikL8mUl
   HcJnWuoejNPJcqfSVCZqHMX/15+Q9NU6+dqWnWIx7XWMsmprPliMtePSW
   fIHaNtxBKszpEbmEsX10dt+8X6f2XB/KD+mdF+XwiiJQfR+dqmk41Amf1
   g==;
X-CSE-ConnectionGUID: tn8LlDQPTUanTaDrcOsGgA==
X-CSE-MsgGUID: 9rLx4O6DSiieRM6dw7rEHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="32150929"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="32150929"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 02:02:00 -0700
X-CSE-ConnectionGUID: xnf0x5R3RXOmkKTjZiVAfw==
X-CSE-MsgGUID: lU8CGTFKQoCHffnOxEznWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="78341968"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Oct 2024 02:01:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Gxd-000F7D-30;
	Mon, 14 Oct 2024 09:01:53 +0000
Date: Mon, 14 Oct 2024 17:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 1/98] htmldocs: Warning:
 dist/templates/kernel.template.spec references a file that doesn't exist:
 linux-%%{kernel_unamer}/tools/perf/Documentation/examples.txt
Message-ID: <202410141614.1FlidNP7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   413b1b249304f17f4514dd859a44e3959e5d7674
commit: cf5d03932d492065885a8daef93b8f4b3f26176c [1/98] dist: initial support
reproduce: (https://download.01.org/0day-ci/archive/20241014/202410141614.1FlidNP7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141614.1FlidNP7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: dist/templates/kernel.template.spec references a file that doesn't exist: linux-%%{kernel_unamer}/tools/perf/Documentation/examples.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
