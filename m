Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0E919EEDF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 18:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719253645; cv=none; b=WMbb+rDJ+rhlMdTQIpY2ANKup8EDKy02oRq7chvSiEgZZ7Z3HRun7Q3SSRAFDDh+/iZbcgFEg/qpvz10ngyHNb+sUuxIS69iSMWshBDSwAIS/gma5BZVJ4eVb5m2lWePKkudQpPnRL4oomfR7e8VQVSongj+JKZ4MtIORQYQBXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719253645; c=relaxed/simple;
	bh=AL49mnt5NFVyhcNsre3X4EybtIvV4SQNUIIgrkYqPgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AlYGf5dMT7lWyy+7fJRC8SuCIrtIok2T/l+V+Ecl1Ehp+4NQ4AOaxYIL2dd0ZJCWkuh34fG5f8bmTx5bhRUNvxVVCzLmX3sC/Vuz4Y2SfUvsCkcn3XA2hsLZMXXaRtOKekqtzVN6C1ffxzRgaBucdolkQf6YGL5GK3WECmLF1Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GC+TbxkM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GC+TbxkM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719253643; x=1750789643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AL49mnt5NFVyhcNsre3X4EybtIvV4SQNUIIgrkYqPgo=;
  b=GC+TbxkMymlj3+FJy5fyEwyzj6TxZqytRf9DXbOcoCY+9tOLaVRF/p0m
   /i/GM2oZ4CVYqSXGBRK/o6ekd6SgBvLdG+Or80vJulQ+udDGtEyAbatud
   DlWSDRqJd2tIQ+bv8IYyD5KYzhAudFxicrYzdObd4ilvw5t2lhXLHb/Bs
   XcICVvN5KLENAIHmMSMs5PEPEn71SkdOBnN7a308g659o32kQta+B+Am3
   czxjWwHrMUX+n62rJ+Ysodq55C1YqCruj/IqERcbx0enZsBt78egkVCOd
   /pCM/CCtS98WgOzsBI9zS1GjbHaVS3sJrvBSMcCkVjSpCF/1TcFGjotI6
   w==;
X-CSE-ConnectionGUID: rbey+TThS8KNJTPVsImMRQ==
X-CSE-MsgGUID: CxzpLDowTZalzmxVCZnW0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="15997543"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="15997543"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 11:27:23 -0700
X-CSE-ConnectionGUID: n5raGlThRPKffr7fQt9KYA==
X-CSE-MsgGUID: 9SRpT5Z8TEGUi50vgRCWDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="47832011"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jun 2024 11:27:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLoPP-000Dcg-2T;
	Mon, 24 Jun 2024 18:27:19 +0000
Date: Tue, 25 Jun 2024 02:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [conor:riscv-dt-for-next 8/8]
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: /soc/pcie@940000000:
 failed to match any schema with compatible: ['starfive,jh7110-pcie']
Message-ID: <202406250240.5NPqlOEG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git riscv-dt-for-next
head:   ca0ef1c2f38e10a39510346c34e3c99f64187d0a
commit: ca0ef1c2f38e10a39510346c34e3c99f64187d0a [8/8] riscv: dts: starfive: add PCIe dts configuration for JH7110
config: riscv-randconfig-051-20240625 (https://download.01.org/0day-ci/archive/20240625/202406250240.5NPqlOEG-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406250240.5NPqlOEG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406250240.5NPqlOEG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: /soc/pcie@940000000: failed to match any schema with compatible: ['starfive,jh7110-pcie']
>> arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: /soc/pcie@9c0000000: failed to match any schema with compatible: ['starfive,jh7110-pcie']
--
>> arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: /soc/pcie@940000000: failed to match any schema with compatible: ['starfive,jh7110-pcie']
>> arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: /soc/pcie@9c0000000: failed to match any schema with compatible: ['starfive,jh7110-pcie']
--
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: /soc/pcie@940000000: failed to match any schema with compatible: ['starfive,jh7110-pcie']
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: /soc/pcie@9c0000000: failed to match any schema with compatible: ['starfive,jh7110-pcie']
--
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: /soc/pcie@940000000: failed to match any schema with compatible: ['starfive,jh7110-pcie']
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: /soc/pcie@9c0000000: failed to match any schema with compatible: ['starfive,jh7110-pcie']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
