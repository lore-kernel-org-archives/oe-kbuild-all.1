Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A60314A83
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 13:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783690380; cv=none; b=ZKOWTe+JIicO6AaJt87fzGsN57ZKgcNQJo0YqM+rvc3wIHQSRXNg1N3r/wdTY0+2NJWvXCbMkL7kaja9P71ih5KtXkik3DO0SZs8ZN/i5ZAQFUTezY68TSRrABWfzmvqBEjrwIzv0alkDHfpuXvGBjnkOqsWrWhPZeYo7JJMifA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783690380; c=relaxed/simple;
	bh=BpygB3DWbYPcasUor/ZEiaGNgWLdD2OqDyQDQ88ZlMk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bxB2dvaM+KvdKilbrSXGU3Rr+8NmZODSlJFfUEh3GH1Cs6E9kzhLsQxZna4gNgHnDXEjE+45/vNbWbAw77FsL1kgDODNbmKQkYWgeurUsZCujVf9enf2N03yNly+4+wd54WVvSJkgk13XZAdtUM+j/1uhqY5GRg7Dc0+JEvFUOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJvGuIs7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJvGuIs7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783690377; x=1815226377;
  h=date:from:to:cc:subject:message-id;
  bh=BpygB3DWbYPcasUor/ZEiaGNgWLdD2OqDyQDQ88ZlMk=;
  b=RJvGuIs7swWzEhh1Ob6jE1p/GLpNicV8hv7ami5AdyANGwkWxg3yd6f1
   U+OKH1yjuv73XZumj6ZzwjxC+9U8PWqdWCbhfwu5aXAzb8QjV5fsEyteM
   BT5pjwi/zCyoEaLc95BxIBbZ6mXdT0fis/tYjEGdqtff/viAwnxY2HrIV
   zYZVu5YTOD2n/JssorwbG7j6203rFbZxDfTQpQDO+tPXdLx1Hw0GaakaM
   UpiTgQUwwRScuJVTLsGTBw8U56kXYjeGqA40ij7JYNvzhL2g39kQh0lRO
   UEXSZsDuGS7tEyy0OrmhVpM9OMgQqSyK/EKAY/Sh5yS4keROagW8MkDXF
   w==;
X-CSE-ConnectionGUID: YzS29V7SQ+Sp3QwxAy4tRw==
X-CSE-MsgGUID: PwIqUJDASD2xFEZYVItxww==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95031993"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95031993"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 06:32:54 -0700
X-CSE-ConnectionGUID: Pi4Q2jSUSzW98vKs94LPlQ==
X-CSE-MsgGUID: Ou2qZIbQR1Oka8VEkrgitA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="284989024"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 10 Jul 2026 06:32:54 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiBLX-000000003AH-0WIK;
	Fri, 10 Jul 2026 13:32:51 +0000
Date: Fri, 10 Jul 2026 15:31:54 +0200
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:anfe_v1 4/5] drivers/pci/pcie/aer.c:1304:17: error: too
 few arguments to function 'pcie_read_tlp_log'
Message-ID: <202607101526.CAyTqCEx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lukas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/l1k/linux anfe_v1
head:   f6644604bbe576e7631c5adf41f197f8e9cb5780
commit: 29e8cfead5a6747a5ad5f5846f1e286fe3ec7e86 [4/5] PCI/AER: Move retrieval of FEP and TLP Log into helper
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260710/202607101526.CAyTqCEx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607101526.CAyTqCEx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607101526.CAyTqCEx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pci/pcie/aer.c: In function 'aer_get_uncor_info':
>> drivers/pci/pcie/aer.c:1307:35: warning: the comparison will always evaluate as 'true' for the address of 'tlp' will never be NULL [-Waddress]
    1307 |                                   &info->tlp);
         |                                   ^
   In file included from drivers/pci/pcie/aer.c:38:
   drivers/pci/pcie/../pci.h:853:29: note: 'tlp' declared here
     853 |         struct pcie_tlp_log tlp;
         |                             ^~~
>> drivers/pci/pcie/aer.c:1304:17: error: too few arguments to function 'pcie_read_tlp_log'
    1304 |                 pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG,
         |                 ^~~~~~~~~~~~~~~~~
   drivers/pci/pcie/../pci.h:864:5: note: declared here
     864 | int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
         |     ^~~~~~~~~~~~~~~~~


vim +/pcie_read_tlp_log +1304 drivers/pci/pcie/aer.c

  1290	
  1291	static void aer_get_uncor_info(struct pci_dev *dev, struct aer_err_info *info,
  1292				       u32 status)
  1293	{
  1294		u16 aer = dev->aer_cap;
  1295		u32 aercc;
  1296	
  1297		/* Get First Error Pointer */
  1298		pci_read_config_dword(dev, aer + PCI_ERR_CAP, &aercc);
  1299		info->first_error = PCI_ERR_CAP_FEP(aercc);
  1300	
  1301		/* Get TLP Prefix/Header Log */
  1302		if (tlp_header_logged(status, aercc)) {
  1303			info->tlp_header_valid = 1;
> 1304			pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG,
  1305					  aer + PCI_ERR_PREFIX_LOG,
  1306					  aercc & PCI_ERR_CAP_TLP_LOG_FLIT,
> 1307					  &info->tlp);
  1308		}
  1309	}
  1310	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
