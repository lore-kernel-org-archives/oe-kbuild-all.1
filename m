Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437376;
	b=Ss0k1EpSX7GWf5NaVYpsjUvQ75WVYP51574oBQHt28i5i75hGG0JAF9N/8RQIePRYdwL
	 u6Fjg3osroV2MfU352xILZyqTdafns+uyJRAp8RZrlU0dSq2jpcvJDwOiwbKJnxDqJVD4
	 W3VVhD0gyZy4gJWsCKVYm+n/mCeJFG4BwqrrFcntZcbaXTMiekBebFaUjfTBStsX3aZyr
	 G8nk20KH7LK6Wazxj3h428Tf7L3rKWWMcdILTlQE8/GgEPYWQ5lJ7QtE5nO8xJ/yn5771
	 PsEw2D/6QIGVS19UZBKPH4tVhj8D4DtPX4XvvFLxGDAR8bsZK1kyDfYdhVk6qaNKobA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437376;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=TXER8ykX7RgHrj/Ix1+8XpZnaqbFqeCPubeDYKTDVEY=;
	b=McDgG8C4CN3fUmYYb5i2My4+F7G4Rg+lpPmbkdyssKFh8fNGJ00oGiUjz1aRt9a4i2Bn
	 IQb4iY1twIipg+fhQz6w6yJ3ttGhPKjd9IPzmw6vFhS3Gtq889sIn+Sh59s5wRr0e76kj
	 IH6OZsRa4+fTx2dyerXb+Tz3HiA7HdOEio7+UJ329qCEPFqIXL4AgNfU6vK71U8ZzGrGx
	 lsS/grWifuiJ92MKxzG1/8Fn8lWtDHYEWvnVEKk4JO9EqIRSYKgtuA365Sqx/Ym7dYRpk
	 YbzHZSE4lsGFPhirEHqIAPK4f6g2d/n5gBGr3IKI4RT9bsoIlZPYg1ch2dod3kQ52oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XGiEgM3x;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61C1606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 09:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E61C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XGiEgM3x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793437374; x=1824973374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5VowtKNFv1YlISIfX3eMIr0wi5T9Z/ReCQjtjoFgpwY=;
  b=XGiEgM3xMxRxwirbmV2wM4RJqQiR3qtKhNBTinPRQDd0MwHy18TsrXSD
   GxjgicdvNVcreVgCKEYhbyWzauZeco84svjWOq2fPHmZY8P/+suJwPfuw
   ZEM5xyMvc+YAyU+0eg4Pp3aJZzQIi5iVxdqKP5Gr/DVcKs+PfbgVEcvGw
   qSyn5gKd3L8aTOOorvVldzs1Zirubm7wx01NB5fd4cGupUS/pn9oMVkPi
   DW0QwVtqlgmAU9R6RYAVZBoEQb9XlFvuwTdS/q4hi8Q8Bgg+WNz26N09r
   b7wUSGqsAajnaR0VSWhDdg05p8s1KRpMHpxHua2AxBW9amhrrQw5eXC62
   g==;
X-CSE-ConnectionGUID: N7nradfPQnqqPlVmfIlYnw==
X-CSE-MsgGUID: ifmWHvolSEmHvC4Jbx/lrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2224665"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2224665"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 02:02:53 -0700
X-CSE-ConnectionGUID: 7cfGZNEKQYi0eh0hwPPrxw==
X-CSE-MsgGUID: Ao2Qn6DRSemTL0BZpTwvVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7470576"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 31 Oct 2026 02:02:51 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN4z9-00000000cgq-2KOu;
	Sat, 31 Oct 2026 09:02:47 +0000
Date: Sat, 31 Oct 2026 17:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: chitranshmandhaniya@gmail.com, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com, david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com, qipeng.zha@intel.com
Subject: Re: [PATCH 1/8] platform/x86: isst_if_mmio: switch to
 devm_mutex_init()
Message-ID: <202610311637.I3TdahBR-lkp@intel.com>
References: <20261030082303.284271-2-chitranshmandhaniya@gmail.com>
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
In-Reply-To: <20261030082303.284271-2-chitranshmandhaniya@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chitranshmandhaniya-gmail-com/platform-x86-isst_if_mmio-switch-to-devm_mutex_init/20261030-135255
base:   linus/master
patch link:    https://lore.kernel.org/r/20261030082303.284271-2-chitranshmandhaniya%40gmail.com
patch subject: [PATCH 1/8] platform/x86: isst_if_mmio: switch to devm_mutex_init()
config: x86_64-randconfig-1001-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311637.I3TdahBR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311637.I3TdahBR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311637.I3TdahBR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c: In function 'isst_if_remove':
>> drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c:142:32: warning: variable 'punit_dev' set but not used [-Wunused-but-set-variable]
     142 |         struct isst_if_device *punit_dev;
         |                                ^~~~~~~~~


vim +/punit_dev +142 drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c

d3a23584294c1f drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c Srinivas Pandruvada 2019-06-26  139  
d3a23584294c1f drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c Srinivas Pandruvada 2019-06-26  140  static void isst_if_remove(struct pci_dev *pdev)
d3a23584294c1f drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c Srinivas Pandruvada 2019-06-26  141  {
d3a23584294c1f drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c Srinivas Pandruvada 2019-06-26 @142  	struct isst_if_device *punit_dev;
d3a23584294c1f drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c Srinivas Pandruvada 2019-06-26  143  
d3a23584294c1f drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c Srinivas Pandruvada 2019-06-26  144  	punit_dev = pci_get_drvdata(pdev);
6cc8f6598978b8 drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c Srinivas Pandruvada 2020-03-03  145  	isst_if_cdev_unregister(ISST_IF_DEV_MMIO);
d3a23584294c1f drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c Srinivas Pandruvada 2019-06-26  146  }
d3a23584294c1f drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c Srinivas Pandruvada 2019-06-26  147  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
