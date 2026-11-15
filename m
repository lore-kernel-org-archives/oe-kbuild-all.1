Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748420;
	b=leFEt1EOj6DCA8iXZw6TGlxwcTt9sz4pVTgj4Ank2I25JMShVydliC29wa+UuI9NqBd/
	 aespncq+XpyRmHLSQkYuwhaFN6uSz13+grsiXTQNd2+fbUcqY/AYlCgpR4taVVm9Ip+mX
	 MPatTBo1vIGGFaZJW9mfdqOY1tUHTvsPrpaen0jRpas/9FHkm9GnkSKIj7ugT798wO82p
	 06BU4bE51ansD5lQZLkFPa/kzZ/rJmnanhKt7UQIk1rkhDGd1swDRws5KIRDRo3BtN1pb
	 hFIyGa9f/R48TQrx4tuOLeS6Pux1gdqkDCfEj/ru5HArvIeHQ7OpzgCUkP110JI8DMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748420;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=TaDXUAfjCmXlLoCT4Vi7O96HmsiDMkRi1295KEfbEBA=;
	b=vWpTVnEWvf8KM+dDHAm7N/4HHGKFvFPHz+B40nMcA8zjLm7PfPwAL2yr4FziP2cOyRhJ
	 2+HK5JpJt67f/WbuaDOFkZSLMdOEzLk5ypcydS4G/08K4SUqJTAyok4YQwpkT1m23n+eQ
	 vk4JYlBI1s+UyNgRO4D6q9ZUYk+VsX/PthoyBUtXyR+rKo0sbJk/sj6PSvNxUjEd6cWMx
	 2zWBW1a+8kA4EJJIEN0u/JvnuQYYM51MHRdN0RxZwb8TgqOnYKdpauL5UxaxBN+xkA5QF
	 MR+fPxc8hRrD5XINXDzuOcMIiwsAHe6Zk1/tXwsBsXlY+GKntxCLIRSZSIP9+Qbhg8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CQU9cxiN;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE4E606A31F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 13:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CE4E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CQU9cxiN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794748420; x=1826284420;
  h=date:from:to:cc:subject:message-id;
  bh=jK/hv9wYA1W7jt8ZgRw61Rb9oXehZBVmRCEa+v6GEPk=;
  b=CQU9cxiNuwpO085pI/EOCe9aqAnCyLq6V2VlISB4jW27FFepFV3ZRUHD
   JUOTfsIYwzWx2/A+bu9NEQbl9Ou38H7AeNFVExCt8cATfpaDoIWkB6vyE
   5X9C7BPVMcsiJ0feLbPmY/RD7/s6YABOJDuyvwhrl2DOgxUzrCcqUcKZm
   vtFAu8seqSeLGjAEtml+2Z8wfe7PBwOuvXwkPWbhlCdwZwNeYf1833Qsk
   AyDHDh27Q9AMhhhzr3eZfeb56nB2IAFU3D9eaXTnqWR/8PJOzXvoVrfb/
   4fXzreROkk0UkVPZfX/JQMmUqeGf3f/ZX8B9CY/rMhcsjlCt830UrW1TM
   Q==;
X-CSE-ConnectionGUID: A4R8vULLQKOEZhrfY1rCGw==
X-CSE-MsgGUID: 2mbEOk3gS/Ouxiblp48wag==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3532781"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3532781"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 05:13:39 -0800
X-CSE-ConnectionGUID: Pmxwyh4ES3uEQ39foHeGKw==
X-CSE-MsgGUID: bXDBwT4LT9qKS/EXgZsVLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9168102"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 15 Nov 2026 05:13:37 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSa34-000000002Ca-3MnE;
	Sun, 15 Nov 2026 13:13:34 +0000
Date: Sun, 15 Nov 2026 14:13:06 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/181] htmldocs: Warning:
 anolis/changelog/002-changelog.6.6.25-2 references a file that doesn't exist:
 Documentation/x86
Message-ID: <202611151418.30Y4FHDJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Tianchen,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   4f2db664ee044fbea206f4d976d61e47d4cf2158
commit: 5c79516ebe734e67eb8ab9847049b332100d0c25 [0/181] anolis: changelog: sync and consolidate historical changelogs
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611151418.30Y4FHDJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151418.30Y4FHDJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: anolis/changelog/002-changelog.6.6.25-2 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/004-changelog.6.6.88-4 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/64
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/hw-vuln
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/kernel-parameters
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/amd/hsmp
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: include/net/netns/ipv4.h references a file that doesn't exist: Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: anolis/changelog/002-changelog.6.6.25-2 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/004-changelog.6.6.88-4 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/64
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/hw-vuln
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/kernel-parameters
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86
>> Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/amd/hsmp
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: include/net/netns/ipv4.h references a file that doesn't exist: Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
