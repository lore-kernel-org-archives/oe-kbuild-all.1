Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F5B10A3E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731251537; cv=none; b=S9xx91pzxHToWYydJmGYIg+vQzOAIf13lKP3UEaKoNZ4CTcpOMkfKj0m4eAw1jhumr4oxTLOfVrf9UlpglC1TMWl7WsRNWPfIWTKJIvmMI+xICHJDNUYMD6ST7QCAloqfrLI7S7XOYnDygw0AGlsbP2+xEJLtSGLIxHveA1COhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731251537; c=relaxed/simple;
	bh=y1D4eU3fbGsALGXijtgIH1mqveXaVZ+dTlPgloNPxps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l7v4L1OORtZtzq2WvDv781CRywNtBMVoXRAotJUlGjUDRK7dGkD0514QYd8w3geb9dY1IqgNTlddMdOqWlKIwef7NkK0UZ+zDWP+8duRR/3wONEcCWorK/o+FVl3V17LqsfqTlK7QfWUnXQoaFNKFUjErKE0DVmrdfS+qXElw0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecfjBZYh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecfjBZYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731251535; x=1762787535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y1D4eU3fbGsALGXijtgIH1mqveXaVZ+dTlPgloNPxps=;
  b=ecfjBZYhNd9sd9UsDATOEU86DgbVu0WvvaNK2iXMp9hOwna0onnHyjxO
   mYrA2Mt5QDQGQkmJ/r+VDig3YSjwnTRmzu1FEp4sD4cV3hwI1JLy5ICw8
   hDaGgdz9+Sr798X5RhYNtVREo2b/PKFmlnRCf5C4BTmmwNqxK5ekre/t/
   6ocO/w5mIkFiSRnRLAY09YolHhXJwXYj/iquv5kF/nUdQ75wurRrK9C0G
   bU/AXD661vw9KfwyKPGKOF/7NCFOfexPD5V7dkWY1Sudg4BQZB/E25zNs
   Ov9OFJbAxvBFcZwlXvXtv+UTeUH7jYiELA9Az5fhRoaadZ3gwOWTLOV3S
   w==;
X-CSE-ConnectionGUID: iNzt+9LSQ46NZNFBrerZRg==
X-CSE-MsgGUID: vItRAvbLRyeyjWUOcK3j/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="18691797"
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="18691797"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 07:12:15 -0800
X-CSE-ConnectionGUID: WskQWaHTQMy/8RAMPcIkJw==
X-CSE-MsgGUID: lvv7SjN8S12NmgapIstYwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="86205415"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Nov 2024 07:12:13 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tA9bm-0000CT-2q;
	Sun, 10 Nov 2024 15:12:10 +0000
Date: Sun, 10 Nov 2024 23:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Vetter <jvetter@kalrayinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Yann Sionneau <ysionneau@kalrayinc.com>
Subject: [linux-next:master 6632/10559]
 drivers/remoteproc/qcom_q6v5_pas.c:137:46: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202411102342.H8WZP17i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   929beafbe7acce3267c06115e13e03ff6e50548a
commit: 0110feaaf6d0610d0089ae4897387df9a963b5f0 [6632/10559] arm64: Use new fallback IO memcpy/memset
config: arm64-randconfig-r111-20241110 (https://download.01.org/0day-ci/archive/20241110/202411102342.H8WZP17i-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241110/202411102342.H8WZP17i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411102342.H8WZP17i-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/qcom_q6v5_pas.c:137:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got void * @@
   drivers/remoteproc/qcom_q6v5_pas.c:137:46: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/remoteproc/qcom_q6v5_pas.c:137:46: sparse:     got void *
   drivers/remoteproc/qcom_q6v5_pas.c:575:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_pas.c:575:26: sparse:     expected void *mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:575:26: sparse:     got void [noderef] __iomem *
   drivers/remoteproc/qcom_q6v5_pas.c:600:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *dtb_mem_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_pas.c:600:30: sparse:     expected void *dtb_mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:600:30: sparse:     got void [noderef] __iomem *
   drivers/remoteproc/qcom_q6v5_pas.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/firmware.h):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +137 drivers/remoteproc/qcom_q6v5_pas.c

b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson     2016-08-22  121  
181da4bcc3d4bb drivers/remoteproc/qcom_q6v5_pas.c Krzysztof Kozlowski 2023-05-07  122  static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  123  		       void *dest, size_t offset, size_t size)
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  124  {
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  125  	struct qcom_adsp *adsp = rproc->priv;
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  126  	int total_offset;
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  127  
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  128  	total_offset = segment->da + segment->offset + offset - adsp->mem_phys;
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  129  	if (total_offset < 0 || total_offset + size > adsp->mem_size) {
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  130  		dev_err(adsp->dev,
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  131  			"invalid copy request for segment %pad with offset %zu and size %zu)\n",
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  132  			&segment->da, offset, size);
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  133  		memset(dest, 0xff, size);
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  134  		return;
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  135  	}
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  136  
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02 @137  	memcpy_fromio(dest, adsp->mem_region + total_offset, size);
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  138  }
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  139  

:::::: The code at line 137 was first introduced by commit
:::::: a376c10d45a8e6ee5ea55791193f90625b35e156 remoteproc: qcom: pas: Adjust the phys addr wrt the mem region

:::::: TO: Yogesh Lal <quic_ylal@quicinc.com>
:::::: CC: Bjorn Andersson <andersson@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
