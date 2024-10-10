Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22941CDFD1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728548759; cv=none; b=lI/LsRhcGMzvNr2VipxcDpY/W8kJC6YP8R+wkIOKuMv6xG3bXP5CJMQ63mgU/S+ado1PKTzBXdxEzvnOP1n5nKkJDjWWsyY62Ig9QyrDmfwtSowkM+OVSCU/J0uLjh8BWp3PqqTYDtJBaKlpxEoenYlXdRGnIZt58f1Bn9RejXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728548759; c=relaxed/simple;
	bh=MxPt5FpE+LuS9wwWxDqneGVeC+vbnvG8JxhPOrvZtKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RhttGTze4hs1mpf6jmzECoZEnFy8ak9BPUX5r+IYYlr6pArEqjJkp+H2GzNLGMKjb+bUDPP0sgRljlpdzZcHTrzrz1eykHH7h/mhnrvFZS7iBPtqwEiNKZR1dJ0RY6ChsESt2UEopP/g6uY3izi/OXdXGBnC9oiVOz3laHMm3ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqXhhUR+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqXhhUR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728548758; x=1760084758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MxPt5FpE+LuS9wwWxDqneGVeC+vbnvG8JxhPOrvZtKY=;
  b=SqXhhUR+zd4Xn6cr9vATJ8C4+1d169sXxXuRRh9oaFrw2I6RIRzUXexv
   NIgKNMlR3+J1G2RriZgZFYTsQFZ5T8XvDcSNyNKE4WKzqrlE6FqwPYggO
   eA85aDHBf04UOT+Hm5A7kGdA8TkIGaREOWD7AqaLWI7M5R+T+sUBfWAaR
   ICm1fPnauU8vvBfU3+wmOIPcJK18tJubvf2mg8zRlLPAHokAflqwq6eXZ
   DA1hDFMt4Yne3Ye3T/xtyQBxA4mY1hKx2+jL/DZMY0K/VeiMb2f9ytDb+
   wmb5X8UAYJ06hoRjzfOngD9B1zsvcjaCW3qpOsk//OzIPvZVdJuJqHGjJ
   Q==;
X-CSE-ConnectionGUID: Jaa75OSURraE7Qko5sk+rQ==
X-CSE-MsgGUID: zKhjmvfaQ6OEiXtJFjn4jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38535856"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="38535856"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 01:25:57 -0700
X-CSE-ConnectionGUID: S1BDmmL6Rzu8Pow7oE646w==
X-CSE-MsgGUID: 1blXtP5AQc2z0VtpqAJVbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76511806"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Oct 2024 01:25:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syoUc-000AOH-09;
	Thu, 10 Oct 2024 08:25:54 +0000
Date: Thu, 10 Oct 2024 16:25:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2780/2853]
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0:
 'vddrfacmn-supply' is a required property
Message-ID: <202410101651.96pbVDp1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b6270c3bca987530eafc6a15f9d54ecd0033e0e3
commit: 83a76956b9e1e85a77abab2f63e5c34f3a2ee1cc [2780/2853] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
config: arm64-randconfig-051-20241008 (https://download.01.org/0day-ci/archive/20241010/202410101651.96pbVDp1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101651.96pbVDp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101651.96pbVDp1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: bluetooth: 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: bluetooth: 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: bluetooth: 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: bluetooth: 'vddbtcmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
