Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9CE18FC80
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jan 2026 03:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767324549; cv=none; b=HTw7VP9mRgQPUg631KbG0WdaQ/WQ0jVakHz1I5dOp5mC88Oh23xdgisyC4rwCXf2C5nvnAm+D6Ji7axDOHCu7rxtv4QRYVEWaka6J72kf2152KAqLTod1am3jOBGS5541YH9E/n5hSsqsYe1xSdYhW8kvPpMbYGuCyL5utAXLmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767324549; c=relaxed/simple;
	bh=zvEQjGCjZOFj1AbdgepZ7d8mNEWFIQenhSQ1z5s992E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zkt8ast8V14HbSvCMXy7Vez7nmLyqPS90i+ez8zgnRpnwtvVaX5W15Mzq/eFonegUwnV254xRQfRBYR/w0j/4hF3xqHCSz77gZQ3DHehoH+qs7RRqzkCTftpIvVJ5uwavVWejzYnmbdqvZR88WhXmLw9YrFll0r8H3rLyyf9S30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idg6W4Ek; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idg6W4Ek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767324548; x=1798860548;
  h=date:from:to:cc:subject:message-id;
  bh=zvEQjGCjZOFj1AbdgepZ7d8mNEWFIQenhSQ1z5s992E=;
  b=idg6W4EkM829ZJ0syxxcEvlTHHJGq4hKzGCYxLcvH8mROcSvN6dMFg+/
   qxH3bGZ2+7ayFHQBwPMOfK28LNrAVikUS3Z5kIH5PGhN7LHTRpny+zyiw
   SU1uuPH2WTGPE9nxvLYzdz95+OBkr7QQCvn5AH44N/z8X1HUvgAmA6t3p
   9QxJQjefV1Rf1acl/3Zz7KbRYX8QE6QkjLyCcale78kxwsjwOY4NQ28AP
   /sPjUeoS53S/+4FbsdOjPzImpoDsNUBsn/jqds4ykYlU+YSDpUD67sL59
   vRYZLOoifNajvqXnv6sEmB7FwbXswpwQkEo+rJ50YKUDEnCaLyklBcD/N
   g==;
X-CSE-ConnectionGUID: Up0EmSEzR/iIOYH9OQ4uYg==
X-CSE-MsgGUID: 0E5ghAdpR6y1kOpxgWv3cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="91487293"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; 
   d="scan'208";a="91487293"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 19:29:05 -0800
X-CSE-ConnectionGUID: DVDIFfrbS+mxkd8im/8KFw==
X-CSE-MsgGUID: v9af+T/mRzq3QTbKBfvKFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; 
   d="scan'208";a="206265143"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 01 Jan 2026 19:29:03 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbVqX-000000000Mv-0DmO;
	Fri, 02 Jan 2026 03:29:01 +0000
Date: Fri, 02 Jan 2026 04:28:42 +0100
From: kernel test robot <lkp@intel.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [linux-next:master 2424/2671]
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: mailbox@1106000
 (qcom,kaanapali-ipcc): compatible:0: 'qcom,kaanapali-ipcc' is not one of
 ['qcom,milos-ipcc', 'qcom,qcs8300-ipcc', 'qcom,qdu1000-ipcc',
 'qcom,sa8255p-ipcc', 'qcom,sa8775p-ipcc', 'qcom,sar2130p-ipc...
Message-ID: <202601020407.y7ML3zr1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: 1cc3a0a0210697a25e96783cf21f93d28a09ebf7 [2424/2671] arm64: dts: qcom: kaanapali: Add base MTP board
config: arm64-randconfig-2051-20260101 (https://download.01.org/0day-ci/archive/20260102/202601020407.y7ML3zr1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601020407.y7ML3zr1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601020407.y7ML3zr1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: mailbox@1106000 (qcom,kaanapali-ipcc): compatible:0: 'qcom,kaanapali-ipcc' is not one of ['qcom,milos-ipcc', 'qcom,qcs8300-ipcc', 'qcom,qdu1000-ipcc', 'qcom,sa8255p-ipcc', 'qcom,sa8775p-ipcc', 'qcom,sar2130p-ipcc', 'qcom,sc7280-ipcc', 'qcom,sc8280xp-ipcc', 'qcom,sdx75-ipcc', 'qcom,sm6350-ipcc', 'qcom,sm6375-ipcc', 'qcom,sm8250-ipcc', 'qcom,sm8350-ipcc', 'qcom,sm8450-ipcc', 'qcom,sm8550-ipcc', 'qcom,sm8650-ipcc', 'qcom,sm8750-ipcc', 'qcom,x1e80100-ipcc']
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom-ipcc.yaml
>> arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: /soc@0/mailbox@1106000: failed to match any schema with compatible: ['qcom,kaanapali-ipcc', 'qcom,ipcc']
>> arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: /soc@0/phy@1c06000: failed to match any schema with compatible: ['qcom,kaanapali-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: interrupt-controller@b220000 (qcom,kaanapali-pdc): compatible:0: 'qcom,kaanapali-pdc' is not one of ['qcom,glymur-pdc', 'qcom,qcs615-pdc', 'qcom,qcs8300-pdc', 'qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,sm8750-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml
>> arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,kaanapali-pdc', 'qcom,pdc']
>> arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: sram@14680000 (qcom,kaanapali-imem): pil-sram@94c:compatible: ['qcom,pil-reloc-info'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: /soc@0/sram@14680000: failed to match any schema with compatible: ['qcom,kaanapali-imem', 'mmio-sram']
>> arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: mailbox@17610000 (qcom,kaanapali-cpucp-mbox): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,kaanapali-cpucp-mbox', 'qcom,x1e80100-cpucp-mbox'] is too long
   	'qcom,kaanapali-cpucp-mbox' is not one of ['qcom,glymur-cpucp-mbox']
   	'qcom,kaanapali-cpucp-mbox' is not one of ['qcom,x1e80100-cpucp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,cpucp-mbox.yaml
>> arch/arm64/boot/dts/qcom/kaanapali-mtp.dtb: /soc@0/mailbox@17610000: failed to match any schema with compatible: ['qcom,kaanapali-cpucp-mbox', 'qcom,x1e80100-cpucp-mbox']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
