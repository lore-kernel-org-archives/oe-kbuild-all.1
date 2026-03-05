Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFE039B4BE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772711938; cv=none; b=DduybKVd9LoBVN3vwFLnLWTMCHpiwo3bYLDXg8v9lrw/a+QYzIjROZVgU6cpBLJPRO2IMRVWiwnO61QZpbhs2xhxJreUKKlADSCJguxe1PgYUs2MaQDa+Bv9vNuuP06LoJ+Nn5cT99rbqsVOSrZ0GwHVbWlzzTv3qrVDQBqEepM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772711938; c=relaxed/simple;
	bh=yiBPSiaFSjmQcYEGEEfcirbCNp+5syi5qwxTNq/VWq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdsUuHs6UhNtKVOub/vgTKd5lwAdoQu/+7c8f8jhxt6H97+6mD/nAKn/MzsOD2P2TK75TqXg2uilTzzfvsu35a6GTQ0Tq36xoT2V7q64iQrhS03TApI64fuwoaHHHgaXd5LdEYt8ExloTsB+Tz92yOC3VbW/ksNcjOY7ttn603o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTFFCBK3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTFFCBK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772711935; x=1804247935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yiBPSiaFSjmQcYEGEEfcirbCNp+5syi5qwxTNq/VWq4=;
  b=dTFFCBK3ZTX5m2K0RmMnk0O7Cga6ZObhBKiDTCh8xdPrpJ1uCoGZNQGk
   +IlhdW5Uo1byxQLV6L7uvrzI8zmUmxUnNhQuhdYOlW6TAdy/IqoHVOMGP
   G6L8LiKLRuvyUSGysWI5ECEKamc0FQhPR5do1dViuNTGylibyWkjxrYfV
   sKFmujqPL6qEhHyifDIYnlF5mB23x26V2eqa4QByldAErN0fImEbO9D4a
   GuiyTVIbzSxiOPrMXlVkSW88MLX+iQyODIbTLlhr1/+CeoPII1H8TVUeO
   fNi/WsuI8L9Ni77IiJpcfLVUFjHnmdcrU1kNfoj528rRckFi8Qc4FYAnj
   Q==;
X-CSE-ConnectionGUID: xC1+ZtccS36iB/lWM8v5Rg==
X-CSE-MsgGUID: zmgaw19xTOyjataHm1NipQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84429977"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="84429977"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 03:58:53 -0800
X-CSE-ConnectionGUID: WsLkToN/Txy7DD+yuM+QnA==
X-CSE-MsgGUID: K+PDn+IIRb6zQ0Sp0E+tGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="215475898"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2026 03:58:52 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy7Lt-000000000Yu-39aY;
	Thu, 05 Mar 2026 11:58:49 +0000
Date: Thu, 5 Mar 2026 19:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: javen <javen_xu@realsil.com.cn>, arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Javen Xu <javen_xu@realsil.com.cn>
Subject: Re: [PATCH v2] rtl_pci: add support for Realtek management device
Message-ID: <202603051934.PPZGZ5mA-lkp@intel.com>
References: <20260303061841.1431-1-javen_xu@realsil.com.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303061841.1431-1-javen_xu@realsil.com.cn>

Hi javen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v7.0-rc2 next-20260304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/javen/rtl_pci-add-support-for-Realtek-management-device/20260303-142108
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260303061841.1431-1-javen_xu%40realsil.com.cn
patch subject: [PATCH v2] rtl_pci: add support for Realtek management device
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603051934.PPZGZ5mA-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051934.PPZGZ5mA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051934.PPZGZ5mA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/rtl_pci.c:27:76: warning: initialized field overwritten [-Woverride-init]
      27 |         { PCI_VDEVICE(REALTEK, PCI_DEVICE_ID_REALTEK_PCIBR), .class_mask = 0xff00 },
         |                                                                            ^~~~~~
   drivers/misc/rtl_pci.c:27:76: note: (near initialization for 'rtl_pci_tbl[5].class_mask')
>> drivers/misc/rtl_pci.c:60:32: warning: 'rtl_pm_ops' defined but not used [-Wunused-const-variable=]
      60 | static const struct dev_pm_ops rtl_pm_ops = {
         |                                ^~~~~~~~~~


vim +/rtl_pm_ops +60 drivers/misc/rtl_pci.c

    59	
  > 60	static const struct dev_pm_ops rtl_pm_ops = {
    61		SYSTEM_SLEEP_PM_OPS(rtl_pm_suspend, rtl_pm_resume)
    62	};
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
