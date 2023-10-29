Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF13A934
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 17:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+PT0xHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698600064; x=1730136064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YF32p0Gyd66CJXltDpmuCaqjZuN06ROB/FQ2Q2ybwNA=;
  b=j+PT0xHESzpcfSGjsM+XsIJ41IMgKt3yg6h1+iOc0+A1cREFBlAR4jaT
   UoKTBzKW6Vl6SmSqWDVXnpBoi8n53Mil3F3dsdFnrvbFUAEKGTQT7Uj1m
   G0iS+sWMNfSr++sM6dj34hrHKBS5bMSE8Q21dyMHrZKA9+Fld28SziTRl
   nnahwgf8LZnjvFXTxaFpF2bFnqUynBhw4mTN5loktc9waJVCl2x9G2Cue
   tBbsKSPNRhb5/Dw64M8Wzb+/n31tg5DOQm1Plw+5sHxkUitzsBSYtexjX
   iZDFrhJF+hfgnfShE+sXW5np2NLe18e+/Vc7H1fpaimx0uMvdiNJd3lBT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="9505665"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="9505665"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 10:21:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="933578459"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="933578459"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Oct 2023 10:20:59 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qx9T7-000Cih-2O;
	Sun, 29 Oct 2023 17:20:57 +0000
Date: Mon, 30 Oct 2023 01:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: Karan Tilak Kumar <kartilak@cisco.com>, sebaddel@cisco.com
Cc: oe-kbuild-all@lists.linux.dev, arulponn@cisco.com, djhawar@cisco.com,
	gcboffa@cisco.com, mkai2@cisco.com, satishkh@cisco.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Karan Tilak Kumar <kartilak@cisco.com>
Subject: Re: [PATCH v2 12/13] scsi: fnic: Add support for multiqueue (MQ) in
 fnic driver
Message-ID: <202310300032.2awCqkfn-lkp@intel.com>
References: <20231027180302.418676-13-kartilak@cisco.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027180302.418676-13-kartilak@cisco.com>

Hi Karan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[cannot apply to jejb-scsi/for-next linus/master v6.6-rc7 next-20231027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karan-Tilak-Kumar/scsi-fnic-Modify-definitions-to-sync-with-VIC-firmware/20231028-060626
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20231027180302.418676-13-kartilak%40cisco.com
patch subject: [PATCH v2 12/13] scsi: fnic: Add support for multiqueue (MQ) in fnic driver
config: x86_64-randconfig-001-20231029 (https://download.01.org/0day-ci/archive/20231030/202310300032.2awCqkfn-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310300032.2awCqkfn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310300032.2awCqkfn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/fnic/fnic_scsi.c: In function 'fnic_queuecommand':
>> drivers/scsi/fnic/fnic_scsi.c:606:6: warning: variable 'tag' set but not used [-Wunused-but-set-variable]
     int tag = 0;
         ^~~


vim +/tag +606 drivers/scsi/fnic/fnic_scsi.c

   601	
   602	int fnic_queuecommand(struct Scsi_Host *shost, struct scsi_cmnd *sc)
   603	{
   604		struct request *const rq = scsi_cmd_to_rq(sc);
   605		uint32_t mqtag = 0;
 > 606		int tag = 0;
   607		uint16_t hwq = 0;
   608	
   609		mqtag = blk_mq_unique_tag(rq);
   610		hwq = blk_mq_unique_tag_to_hwq(mqtag);
   611		tag = blk_mq_unique_tag_to_tag(mqtag);
   612	
   613		return fnic_queuecommand_int(sc, mqtag, hwq);
   614	}
   615	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
