Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED34A2B2D7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765443166; cv=none; b=SYkuI2xBgdZJx170WClTtgH/c1m7d176YTmQlUHED1KK454vVi6zix9mFBjFwbF6sCvbFeGrxW/UBzdJRHV67I4cLN1ayJSFQqOcshoLnVlwwUB9gY+KtPKXaW/NxFSVxzJ+ifobMYt5oFNogQYGhZY7fya7nNe2D5bkLE0yQK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765443166; c=relaxed/simple;
	bh=QRHl0iP1H2lAAH8lHUgUHVj7Ug9GA67S03K8fCFy5AA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ta+5wjre2dfHOnCDm3o067tZJejCmyW4FRqMjCerfeVyysZJoJnAaWn49qfsVYCqRPNbuUy3tglUCNif8qoOfWEK7LgsJhWjMdM8qnmJIssiu1eR332JgrHLwcIj2oYyjiQoa2IuqmdY2nAvWemcUZNmJ7kC9sQNMso9ezm+rJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kvzigha1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kvzigha1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765443163; x=1796979163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QRHl0iP1H2lAAH8lHUgUHVj7Ug9GA67S03K8fCFy5AA=;
  b=Kvzigha1cjzmRZT8bFHz8EeCli8Zei9KWMKuca/3aN8LPQsMYcvNu95p
   VAmx6vLUHwd2TYTyXi0TxwijYN1UxMC4/dVY/6a3YsMBLiE1bmEciVz5S
   MNJ23FAKtUXoHPN2D/jgIUQ8RZDYFrC/bgCur8pEYW3qSa69Vwpmb8xhO
   mQAdPLnfWxyDsKZZZaxupO9T0rpbX80q+yKN9IADLsw/fSl73qOLy0Z0o
   YAYmGk8dEYWz7FDTYCQzhI4/kqYmM3jSn2NnM6D5oR2H6jID5kArn/0CZ
   4X3lMPhEP1RnV4XAbReSTedvryd+85DbQg6UFxhtdAJ/PYN9pjRcwkK6H
   w==;
X-CSE-ConnectionGUID: fXitGEnkQRSkcqzx0DygFw==
X-CSE-MsgGUID: 0Y4M4HXnQHGh5V0wjvtyKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67308103"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67308103"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 00:52:43 -0800
X-CSE-ConnectionGUID: 8Z71ADGuQJ2Y8+UMVrWLog==
X-CSE-MsgGUID: lR9YmppzS7Km347S9vSofw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196517900"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 11 Dec 2025 00:52:42 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTcPf-000000000yW-2X2V;
	Thu, 11 Dec 2025 08:52:39 +0000
Date: Thu, 11 Dec 2025 09:52:12 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 0/25] htmldocs:
 Warning: anolis/rpm/kernel.spec.template references a file that doesn't
 exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
Message-ID: <202512110956.DgAnu51b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   443d7ee63a13180e69479cd694f03a167a87da2e
commit: b59c41852684e0cfcf198cb3ded58b8b37413a47 [0/25] anolis: spec: add basic framework to generate rpm tree
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512110956.DgAnu51b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110956.DgAnu51b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using alabaster theme
   Error: Cannot open file ./include/linux/pci.h
   Error: Cannot open file ./include/linux/mod_devicetable.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
