Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A040E15216C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 20:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720557246; cv=none; b=TP2+q6ZGHEkCfhUNlaPgDJPZcMkeP94MepB/wtaVm2odllOWtu0JhXqpINrwRkPhgI/NihFttLqAWc3qG4Bm5t3pDkclfWF1Dq4rBgbMttkOI5Jx6BuzApsoXcuqR+pNOlljHE2PDeqcvj+ynOVjZhdbfF3Fpn+TrwNS+nPkyZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720557246; c=relaxed/simple;
	bh=ScsyCxTLLBht/IYmbRWBLzF05IS3u+gwEsJSerO0Tc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FCixfiHWbBz0mjcTLRv4hEIimNCqrag+KmX5ZyvZYoe1OfDXx4E4BCNbky/vzjRru/ECc8RL/TX4kURciRu71+NmFKVHUMIxElPeH+R86xRCL0Jh2bTBDamg/kMI/ZhWU7q/CqfFexesqjQjHq3b6nML25EtXCXhGxmN+VbeZQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZOA5SfN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZOA5SfN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720557245; x=1752093245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ScsyCxTLLBht/IYmbRWBLzF05IS3u+gwEsJSerO0Tc8=;
  b=OZOA5SfNY1/ONTlXYb8j7f/JkEDxOKraXxAYX17m8qSNPocpqsEuTIx8
   OCqiqSKe6Evledr+p5fLPwYu/LeIt7dk7q4WaUzUruDWl2uBtnOmwSBjn
   ouUEAcUmUO70KGD0LZYcNl7srYjEMI60/kM3qfifFjdn9fz1uUwIkLtSc
   CVc++u5t7p6/mwNUs3pSQho7dZ+bs+2tcW59srkEbc0faJNLRbUoRfSj6
   ajeUJrjAPhYHSWsOvl7sFiSNTDem3UXJYfJKEAV4io+TQ2qPkZ0oKgqLq
   ZAMXRkTi/TAZ1F614zinLyAmyOFc9o0jgaw4uHTmXwICDw7/DPLzyy/Ac
   g==;
X-CSE-ConnectionGUID: L8aZv6LqR1a0BWW/aw62/w==
X-CSE-MsgGUID: 4ULOxxDITyemBwFhY6Dm8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28449925"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="28449925"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 13:34:04 -0700
X-CSE-ConnectionGUID: dRuGGnZ5R7GPDQ4ZqYPbbA==
X-CSE-MsgGUID: zOLNl0U5ReCrOHCaylZ93A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="52783484"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jul 2024 13:34:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRHXD-000X4c-12;
	Tue, 09 Jul 2024 20:33:59 +0000
Date: Wed, 10 Jul 2024 04:33:07 +0800
From: kernel test robot <lkp@intel.com>
To: Anton Bambura <jenneron@postmarketos.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Nikita Travkin <nikita@trvn.ru>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [linux-next:master 11229/11980]
 arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: smsm: 'anyOf' conditional
 failed, one must be fixed:
Message-ID: <202407100406.8WLNVVOS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82d01fe6ee52086035b201cfa1410a3b04384257
commit: 88bf3be9c327f2d78c65e7e4c10c677d4b36128a [11229/11980] arm64: dts: qcom: msm8916-lg-c50: add initial dts for LG Leon LTE
config: arm64-randconfig-051-20240707 (https://download.01.org/0day-ci/archive/20240710/202407100406.8WLNVVOS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407100406.8WLNVVOS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407100406.8WLNVVOS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: smsm: 'anyOf' conditional failed, one must be fixed:
   	'qcom,ipc-1' is a required property
   	'qcom,ipc-2' is a required property
   	'qcom,ipc-3' is a required property
   	'qcom,ipc-4' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smsm.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: smsm: 'mboxes' does not match any of the regexes: '@[0-9a-f]$', '^qcom,ipc-[1-4]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smsm.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: /soc@0/audio-codec@771c000: failed to match any schema with compatible: ['qcom,msm8916-wcd-digital-codec']
>> arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
