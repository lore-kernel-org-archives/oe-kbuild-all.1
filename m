Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8795A6AB4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 21:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690149481; x=1721685481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EO+nfL20GWkeWkaXSZ5Pg86G2BT8K3hrRLGYEYItbps=;
  b=C7tMYmpc7XdUhqYhrkNMNfmcO5FbVvD14id1QkUzubngf82beQSiPtXq
   B8dXbusYqiGD5WlvEX0bfjUyJBwCjaY0ju8+aBOPW96SSOoTQBnl6VZE6
   VMGsg0Ez7w0XxRaYhxRfqrGdFOplkWLGJ4NEVC/YJvobAuPSYmDyZJ90T
   jmhnvxA9pvZlTIXpVYqL3oMKHD0sG7xIdelZ3TIcTrwRLxe+TFwgllnnn
   FraOFtJFhRCV/VOHUVF/ISlEjmhQ2ggSFPtARvgeD7XASvWIqEDjo2MPd
   06MJrPEXBvZrUFPmKGEBZlSojcJ+rKkuyhXVFZ/fjWt+cOW8lbm0SyYqZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="433549881"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="433549881"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 14:58:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="702651015"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="702651015"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 23 Jul 2023 14:57:59 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNh5S-0009IL-1P;
	Sun, 23 Jul 2023 21:57:58 +0000
Date: Mon, 24 Jul 2023 05:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: James Smart <jsmart2021@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.4.y 216/9999] drivers/scsi/lpfc/lpfc_ct.c:2200:9:
 warning: 'strncpy' specified bound 256 equals destination size
Message-ID: <202307240523.AP9JLdvz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   b30db4f7e45f3c17cca2ba5be6f22762837a6e34
commit: 41b71eff27771831772f80ac3bc7cbe7369d0bc3 [216/9999] scsi: lpfc: Fix coverity errors in fmdi attribute handling
config: s390-randconfig-r021-20230724 (https://download.01.org/0day-ci/archive/20230724/202307240523.AP9JLdvz-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240523.AP9JLdvz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240523.AP9JLdvz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/lpfc/lpfc_ct.c: In function 'lpfc_fdmi_hba_attr_drvr_ver':
>> drivers/scsi/lpfc/lpfc_ct.c:2200:9: warning: 'strncpy' specified bound 256 equals destination size [-Wstringop-truncation]
    2200 |         strncpy(ae->un.AttrString, lpfc_release_version,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2201 |                 sizeof(ae->un.AttrString));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +2200 drivers/scsi/lpfc/lpfc_ct.c

4258e98ee3862ca James Smart     2015-12-16  2189  
bd4b3e5c8adf2b9 Baoyou Xie      2016-09-25  2190  static int
4258e98ee3862ca James Smart     2015-12-16  2191  lpfc_fdmi_hba_attr_drvr_ver(struct lpfc_vport *vport,
4258e98ee3862ca James Smart     2015-12-16  2192  			    struct lpfc_fdmi_attr_def *ad)
4258e98ee3862ca James Smart     2015-12-16  2193  {
4258e98ee3862ca James Smart     2015-12-16  2194  	struct lpfc_fdmi_attr_entry *ae;
4258e98ee3862ca James Smart     2015-12-16  2195  	uint32_t len, size;
dea3101e0a5c897 James Bottomley 2005-04-17  2196  
41b71eff2777183 James Smart     2020-01-27  2197  	ae = &ad->AttrValue;
41b71eff2777183 James Smart     2020-01-27  2198  	memset(ae, 0, sizeof(*ae));
4258e98ee3862ca James Smart     2015-12-16  2199  
4258e98ee3862ca James Smart     2015-12-16 @2200  	strncpy(ae->un.AttrString, lpfc_release_version,
4258e98ee3862ca James Smart     2015-12-16  2201  		sizeof(ae->un.AttrString));
4258e98ee3862ca James Smart     2015-12-16  2202  	len = strnlen(ae->un.AttrString,
4258e98ee3862ca James Smart     2015-12-16  2203  			  sizeof(ae->un.AttrString));
dea3101e0a5c897 James Bottomley 2005-04-17  2204  	len += (len & 3) ? (4 - (len & 3)) : 4;
4258e98ee3862ca James Smart     2015-12-16  2205  	size = FOURBYTES + len;
4258e98ee3862ca James Smart     2015-12-16  2206  	ad->AttrLen = cpu_to_be16(size);
4258e98ee3862ca James Smart     2015-12-16  2207  	ad->AttrType = cpu_to_be16(RHBA_DRIVER_VERSION);
4258e98ee3862ca James Smart     2015-12-16  2208  	return size;
4258e98ee3862ca James Smart     2015-12-16  2209  }
4258e98ee3862ca James Smart     2015-12-16  2210  

:::::: The code at line 2200 was first introduced by commit
:::::: 4258e98ee3862ca7036654b43c839ab7668043e0 lpfc: Modularize and cleanup FDMI code in driver

:::::: TO: James Smart <james.smart@avagotech.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
