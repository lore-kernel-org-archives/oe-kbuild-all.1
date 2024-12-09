Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E7A197A67
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719668; cv=none; b=ek7fbxnoT41D2sTPfD4KCNpSH1UBaxrsvJVopCelrrQ3l6jt5U2Id8dEyOSUMJ8vi/qBvVwe5FBI0R7Fm8dGDb0u7XVUofpxHl8Vadjp80DhnrkCzgSgGR/FPr33pge3xOfq5W3BZaFEif1PDVV33HII2HNFDhfvxZFQuDLN40E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719668; c=relaxed/simple;
	bh=oGQLEO9Jk5yk6DnfCNJIWMvX22cHDx9xeH8e6qrGBJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LO9rfZe9EdHZF7hZtKkkkLGdrqu69PDmWQY/hGXSqbS8Z15nidaOE0MDWYyHf42KwuBpyn18t2+sfasZoiw4q2KZugPxONMrfiV0tYs1kLd2qFuz3mTksyBhHTRBg3O+nuxtTHH9p/XYuxM09rv0LNfLMQrT1Kp5xodAaTNq284=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jx4aEV/z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jx4aEV/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719667; x=1765255667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oGQLEO9Jk5yk6DnfCNJIWMvX22cHDx9xeH8e6qrGBJI=;
  b=jx4aEV/zZkkRYeJGqr0P6e6QY88vAL1EWw9Q/hkKy5NWRfCBoQhFwrZF
   DYFD6zUugeIw4yQ8cQIcH02fXPlsm4U215oAeoSNzdY7atufdJO7hfNFq
   Xf6LMvdjdSRY0R0XSm2NcJNtOMh46MJFq5CUlRSShJFyb5XSHKOMonSaO
   8s94CVHwELttA5mplbaHZf/GVkFLu15HTOH2ZjrpWrpDagoONNGukYPVP
   5YMeegNk+q6CO/SypqcPm1dDrj7olM7mVAe7j0LGkXsDRwSY9j6ctWfOT
   OdOQtY9MGSvTU87/G8WSlSYyrPtaj67LVGsly3PIg7JyyTA8eegqnQwja
   Q==;
X-CSE-ConnectionGUID: UkOUKIH0SZCbNq0ynda/ig==
X-CSE-MsgGUID: lyU9MWriQDK66VqysO0xJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34060170"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34060170"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:47:42 -0800
X-CSE-ConnectionGUID: MZbzW0C7S7W33okZ/hyHDA==
X-CSE-MsgGUID: fxGVWoO2Rlq1vyVVCgyBhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99012438"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2024 20:47:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVgG-0003un-2g;
	Mon, 09 Dec 2024 04:47:36 +0000
Date: Mon, 9 Dec 2024 12:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: Karan Tilak Kumar <kartilak@cisco.com>, sebaddel@cisco.com
Cc: oe-kbuild-all@lists.linux.dev, arulponn@cisco.com, djhawar@cisco.com,
	gcboffa@cisco.com, mkai2@cisco.com, satishkh@cisco.com,
	aeasi@cisco.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Karan Tilak Kumar <kartilak@cisco.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 08/15] scsi: fnic: Add and integrate support for FIP
Message-ID: <202412081904.pXwdx15J-lkp@intel.com>
References: <20241206210852.3251-9-kartilak@cisco.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206210852.3251-9-kartilak@cisco.com>

Hi Karan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on linus/master v6.13-rc1]
[cannot apply to mkp-scsi/for-next next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karan-Tilak-Kumar/scsi-fnic-Replace-shost_printk-with-dev_info-dev_err/20241207-054453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20241206210852.3251-9-kartilak%40cisco.com
patch subject: [PATCH v6 08/15] scsi: fnic: Add and integrate support for FIP
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241208/202412081904.pXwdx15J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412081904.pXwdx15J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412081904.pXwdx15J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/fnic/fnic_fcs.c:21:
   drivers/scsi/fnic/fnic_fcs.c: In function 'fnic_rq_cmpl_frame_recv':
>> drivers/scsi/fnic/fnic.h:235:33: warning: format '%ld' expects argument of type 'long int', but argument 7 has type 'unsigned int' [-Wformat=]
     235 |                                 "fnic<%d>: %s: %d: " fmt, fnic_num,\
         |                                 ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/fnic/fnic.h:222:25: note: in definition of macro 'FNIC_CHECK_LOGGING'
     222 |                         CMD;                                    \
         |                         ^~~
   include/scsi/scsi_host.h:737:9: note: in expansion of macro 'dev_printk'
     737 |         dev_printk(prefix, &(shost)->shost_gendev, fmt, ##a)
         |         ^~~~~~~~~~
   drivers/scsi/fnic/fnic.h:234:26: note: in expansion of macro 'shost_printk'
     234 |                          shost_printk(kern_level, host,                 \
         |                          ^~~~~~~~~~~~
   drivers/scsi/fnic/fnic_fcs.c:491:17: note: in expansion of macro 'FNIC_FCS_DBG'
     491 |                 FNIC_FCS_DBG(KERN_INFO, fnic->lport->host, fnic->fnic_num,
         |                 ^~~~~~~~~~~~
   drivers/scsi/fnic/fnic_fcs.c: In function 'fdls_send_fcoe_frame':
   drivers/scsi/fnic/fnic.h:235:33: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type 'unsigned int' [-Wformat=]
     235 |                                 "fnic<%d>: %s: %d: " fmt, fnic_num,\
         |                                 ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/fnic/fnic.h:222:25: note: in definition of macro 'FNIC_CHECK_LOGGING'
     222 |                         CMD;                                    \
         |                         ^~~
   include/scsi/scsi_host.h:737:9: note: in expansion of macro 'dev_printk'
     737 |         dev_printk(prefix, &(shost)->shost_gendev, fmt, ##a)
         |         ^~~~~~~~~~
   drivers/scsi/fnic/fnic.h:234:26: note: in expansion of macro 'shost_printk'
     234 |                          shost_printk(kern_level, host,                 \
         |                          ^~~~~~~~~~~~
   drivers/scsi/fnic/fnic_fcs.c:675:25: note: in expansion of macro 'FNIC_FCS_DBG'
     675 |                         FNIC_FCS_DBG(KERN_INFO, fnic->lport->host, fnic->fnic_num,
         |                         ^~~~~~~~~~~~


vim +235 drivers/scsi/fnic/fnic.h

5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  225  
3df9dd0d51c2e4 Karan Tilak Kumar 2023-12-11  226  #define FNIC_MAIN_DBG(kern_level, host, fnic_num, fmt, args...)		\
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  227  	FNIC_CHECK_LOGGING(FNIC_MAIN_LOGGING,			\
3df9dd0d51c2e4 Karan Tilak Kumar 2023-12-11  228  			 shost_printk(kern_level, host,			\
3df9dd0d51c2e4 Karan Tilak Kumar 2023-12-11  229  				"fnic<%d>: %s: %d: " fmt, fnic_num,\
3df9dd0d51c2e4 Karan Tilak Kumar 2023-12-11  230  				__func__, __LINE__, ##args);)
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  231  
3df9dd0d51c2e4 Karan Tilak Kumar 2023-12-11  232  #define FNIC_FCS_DBG(kern_level, host, fnic_num, fmt, args...)		\
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  233  	FNIC_CHECK_LOGGING(FNIC_FCS_LOGGING,			\
3df9dd0d51c2e4 Karan Tilak Kumar 2023-12-11  234  			 shost_printk(kern_level, host,			\
3df9dd0d51c2e4 Karan Tilak Kumar 2023-12-11 @235  				"fnic<%d>: %s: %d: " fmt, fnic_num,\
3df9dd0d51c2e4 Karan Tilak Kumar 2023-12-11  236  				__func__, __LINE__, ##args);)
5df6d737dd4b0f Abhijeet Joglekar 2009-04-17  237  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
