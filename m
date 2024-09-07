Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10202266AB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 09:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725701478; cv=none; b=sZ+i7QUxpKvAWOXKjR2F6/9D9MGw2+UuoZYdicKqXRgi2zj5HfRM8A1TkiJVXn44HgjwezkEmGaB/9fozgOjbeBY5sh8D0lAziErWARQoQeND9YOP66Kq9R2Dvjh4k7agudfyQdLYU+v01nRjEG+ODaj2p0NvpHjyE/813yJRjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725701478; c=relaxed/simple;
	bh=7qVm0KApF0TLq4mox/APAXOBHIasyewp972aHg2TXhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uJ3BN6RFfWgDh7TwurkvelLAO1RqQSbIlzV2MDqazaEmrXukfnazVBn7J4WO1/gA6RkyLPqlTQo74AaloKZ+W8s4HRduTesPrYNK+Og4Um9SZZldAEPlPk0fiGKusoVJ8/X6reCKSHASD4x34Ldp+dn65OHtmQZPcdIex0oktRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kiip466/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kiip466/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725701477; x=1757237477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7qVm0KApF0TLq4mox/APAXOBHIasyewp972aHg2TXhw=;
  b=kiip466/4VPo1dhceocnUKby0hbwYZFftdoB3ZNzID6wj8WusPTnsZBO
   ss5swXj6XUmLjIqG8U0va26+uYhhSLDaxUYrfgCQjQG4zOzt5T/QnFgXm
   R5M9x0EQQwSySb9ShrVY66y1jaTubYQqCCQDccfZf5GqmSwALkIN9Obr5
   ZhiG6h38rANNuzMrZu1lABXk7noKV+2Cv4B/eVjfuj6yru8sxUaOWBQNO
   XyL5sxUiBuTnZuaTLomz2o86+P/EK1rEUfnvP60RDePreKsQfcPienu5P
   Rf4RzM66LlLK8uQcccucEQg2ISce2dwwSFdIIgvwdTAHEwMcxucbJK+a1
   g==;
X-CSE-ConnectionGUID: awhAy4UdQwmIBgOyEs3WkA==
X-CSE-MsgGUID: hcGMpot7QPeAN37wsKfSww==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="13420510"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="13420510"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 02:31:14 -0700
X-CSE-ConnectionGUID: OFasEm7sRlKhWYh8gzv1ew==
X-CSE-MsgGUID: t3s2AXLSQs+Hn30JurCGPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66510214"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Sep 2024 02:31:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smrmh-000CO9-1O;
	Sat, 07 Sep 2024 09:31:11 +0000
Date: Sat, 7 Sep 2024 17:30:44 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [linux-next:master 8170/10296] drivers/soc/fsl/qe/qmc.c:2002:30:
 warning: 'qmc_data_qe' defined but not used
Message-ID: <202409071707.ou2KFNKO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: eb680d563089e55b20cb7730ed881638fe4425b7 [8170/10296] soc: fsl: cpm1: qmc: Add support for QUICC Engine (QE) implementation
config: powerpc-randconfig-r031-20230616 (https://download.01.org/0day-ci/archive/20240907/202409071707.ou2KFNKO-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071707.ou2KFNKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071707.ou2KFNKO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/fsl/qe/qmc.c:2002:30: warning: 'qmc_data_qe' defined but not used [-Wunused-const-variable=]
    2002 | static const struct qmc_data qmc_data_qe = {
         |                              ^~~~~~~~~~~
   drivers/soc/fsl/qe/qmc.c:1992:30: warning: 'qmc_data_cpm1' defined but not used [-Wunused-const-variable=]
    1992 | static const struct qmc_data qmc_data_cpm1 = {
         |                              ^~~~~~~~~~~~~


vim +/qmc_data_qe +2002 drivers/soc/fsl/qe/qmc.c

  2001	
> 2002	static const struct qmc_data qmc_data_qe = {
  2003		.version = QMC_QE,
  2004		.tstate = 0x30000000,
  2005		.rstate = 0x30000000,
  2006		.zistate = 0x00000200,
  2007		.zdstate_hdlc = 0x80FFFFE0,
  2008		.zdstate_transp = 0x003FFFE2,
  2009		.rpack = 0x80000000,
  2010	};
  2011	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
