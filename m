Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7641C8632
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 07:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741159412; cv=none; b=MQnwDiV2AV5vxbQ5Zcr3fgvm8XbBphNPSBWYoI5stuDl87hEaCZKZFKcvx6oHvyPQe9tt7IPTDBmJSkwPalt4YZ7pAFtlxl7zgdaBWGL43fqwjllyt4f4GXbwFvfxzt42rKVlcji/ByRowjVMxTw6aqAFZ3PlB+fEM/V51uXXio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741159412; c=relaxed/simple;
	bh=scz/pUFaWZGmLF1vIopEC+5H7KRugNCKd806CPlZTZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=e/OiJc8OXYwUpeCPwydPlZ9RUnv5aXUrbrTsZ53wyCAcd5MtX3wMcaVldnLNa9isTU+5wWaCHZ0EdjnTX+LNUbIcA/yj7DGIs5i1NBM/5xIP6ftgIY/DcQccdXnawnxba5DkRF/4d9ZB5yGGiz2ZZzNZjJJcVjKK9AWi4AAadrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RGw2Wr6/; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RGw2Wr6/"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5257NLSQ3225045
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 5 Mar 2025 01:23:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741159401;
	bh=OwXMzn8HDl3nLPTsUKWbH3ZfSB8uQxzPotmc1ObR/ZY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RGw2Wr6/m0ZVvgfEIYL/ezmNYXE/ztOL7Z1u1vetesyFH1YkXoaP6I0ssBik/LfD7
	 4j7Z9t56hQgH72pwL3CtDziZFCrdJsJM11HafVHwktVv1xtwcnoy9KNEB1DXV3EzNR
	 q9tY87xN/cdtsKavfx0HP26FJZQMqlWQ9FK9D6Rw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5257NLR4008967;
	Wed, 5 Mar 2025 01:23:21 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 01:23:21 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 01:23:21 -0600
Received: from [10.24.69.250] (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5257NJDq028803;
	Wed, 5 Mar 2025 01:23:20 -0600
Message-ID: <d605a17d-4b5d-4226-838e-c0628b6987c8@ti.com>
Date: Wed, 5 Mar 2025 12:53:18 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 7355/7930]
 arch/arm64/boot/dts/ti/k3-j721e-evm-pcie-ntb.dtb: /epf-bus: failed to match
 any schema with compatible: ['pci-epf-bus']
To: kernel test robot <lkp@intel.com>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
CC: <oe-kbuild-all@lists.linux.dev>
References: <202503051518.o9Ed6Wgm-lkp@intel.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <202503051518.o9Ed6Wgm-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 05/03/25 10:57, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   20d5c66e1810e6e8805ec0d01373afb2dba9f51a
> commit: d92a0ab61ed2137d174c2afef3475234ab2924b6 [7355/7930] arm64: dts: ti: k3-j721e-evm: Add overlay for PCIe NTB functionality
> config: arm64-randconfig-051-20250304 (https://download.01.org/0day-ci/archive/20250305/202503051518.o9Ed6Wgm-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> dtschema version: 2025.3.dev3+gabf9328
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051518.o9Ed6Wgm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503051518.o9Ed6Wgm-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie-ntb.dtb: /epf-bus: failed to match any schema with compatible: ['pci-epf-bus']
>>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie-ntb.dtb: /epf-bus/ntb: failed to match any schema with compatible: ['pci-epf-ntb']
> 


Thanks for the report. I have dropped the offending patch from the tree.

-- 
Regards
Vignesh
https://ti.com/opensource

