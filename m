Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793477055;
	b=ZDvqYVBzG0YjtJrqEFSkwO3AsaPkTMqiN1IS5G9YvWj7PFyvyEzAyZDm6zOO93Gb/XNk
	 dLak/HGogYYu3VjaSkJJQw2X9HV5aVHqdnFaIYPTeLN/itcbssovpUZA1J+kJ6l/DHV7N
	 zYxHQv1a25+WCGmRldNsyFsenlI5Qu3WSbmePx+q1xXd506p0iK0gxuXAVJqiIBUpt4iD
	 N6/DlpDJ9SzWs9nZIxSW5y2H+mD5csRHeaPks8GWwtt9tCZuMaEsCJ+SBg5AAeG+7Rc59
	 DJ9t63uPYVqgFIXvJ4HQhQyCfuIwqIK+l4CPrtKy/rTa08Z45zu5342rHDxR2/mT+RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793477055;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XubOAWkhExxo+qfeaROgeq3zjEYzyFqzOx50lSyRWZ8=;
	b=XXGv/pHaBBoWDX9cYbXeZ/xwE3qEImqGiwmQICTAjCXUr3E+R30qoScpbb6tps6jlPhD
	 L/x93zvs3EP7PSBQKLdVNg5sFDlR/1mRARBF4ejNlCboAqKhWoK2p71AmDqEDDEj70oYG
	 cVvWmrAxuLHidjeP53sezryxrSLZSStZSxkzDF/gsn/p6Awqh3ZRbFDBmRltXobw6CrM1
	 1Aq2Hi+oNoo/9Xu3TCRSpbxXgsXlVizSvLi39hnE1wdupGPY6zdXWPPjWJdY2KeS/NWDf
	 V7BSl0S9mfELxUgDrxt7zeeMe/nDKIq/BcPq2LL2K/3Xtiu7A7o1Mf7/6j/iJ0KfY2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=btKY7yjz;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0744606A31D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 20:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0744606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=btKY7yjz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793477053; x=1825013053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mzUMYd+APfGaeHuT1aeH6UCv83u73Qae+OUu837zd2Y=;
  b=btKY7yjzt1rGGZ/O++4wivvkhAZAdSsw/vLbN+mPEAhzi/iFBESoQJl3
   gvDN/bcXVoKyUBiFxg+dbxk3uFbNsycwLYV5N1ep3BfpJl+QvPNdLAJf4
   2CmmoTLQRahcdaOutke9563r+UuybBBVnWR8N6T2SCvg+VhClfKejENVX
   mzYCyC232FNR6pjPsyfoxnIV1aDQMSgcU7Bbfy6/Bd+Tw6htLKBb5/8A5
   PjBuVE0DKn/+D9RoIRKtdzaUaDbKsyoCjUPeU1vSoE502/YKsew30Tp3r
   lvIK6LcBDSWogohuI/xpMybBKwpu7GeeFs8LVRb9D6/CSEokBR2ToqQmD
   Q==;
X-CSE-ConnectionGUID: 3bKUR8nPRXKaeV9Jp8cIZg==
X-CSE-MsgGUID: cLpEavTSQN+DCqj8KxWbDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2111275"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2111275"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 13:04:13 -0700
X-CSE-ConnectionGUID: wqV4wtYUTm+3PBSF9WNvNw==
X-CSE-MsgGUID: tmPcoAeNRvmA/qsY12kUGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5610746"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Oct 2026 13:04:10 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNFJ9-00000000d8S-1vTm;
	Sat, 31 Oct 2026 20:04:07 +0000
Date: Sun, 1 Nov 2026 04:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Mika Westerberg <westeri@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
Message-ID: <202611010318.CB1ceS4i-lkp@intel.com>
References: <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030082539.1208733-2-chunfeng.yun@mediatek.com>

Hi Chunfeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on westeri-thunderbolt/next]
[also build test ERROR on linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chunfeng-Yun/thunderbolt-add-platform-nhi-driver/20261030-162536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20261030082539.1208733-2-chunfeng.yun%40mediatek.com
patch subject: [PATCH 1/4] thunderbolt: add platform nhi driver
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20261101/202611010318.CB1ceS4i-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611010318.CB1ceS4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611010318.CB1ceS4i-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/thunderbolt/domain.o: in function `tb_domain_init':
>> (.init.text+0x10): multiple definition of `init_module'; drivers/thunderbolt/pci.o:(.init.text+0x10): first defined here
   hppa-linux-ld: drivers/thunderbolt/domain.o: in function `tb_domain_exit':
>> (.exit.text+0x0): multiple definition of `cleanup_module'; drivers/thunderbolt/pci.o:(.exit.text+0x0): first defined here
   hppa-linux-ld: drivers/thunderbolt/plat.o: in function `nhi_plat_driver_init':
>> (.init.text+0x10): multiple definition of `init_module'; drivers/thunderbolt/pci.o:(.init.text+0x10): first defined here
   hppa-linux-ld: drivers/thunderbolt/plat.o: in function `nhi_plat_driver_exit':
>> (.exit.text+0x0): multiple definition of `cleanup_module'; drivers/thunderbolt/pci.o:(.exit.text+0x0): first defined here

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
