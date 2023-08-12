Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79151861
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 07:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691826608; x=1723362608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LgPhAI2P+dKDNtFpn5BjFR0VHfat/pj9D/SXUm4py/k=;
  b=b/PqOy0KUPnv9YuSYI0IKrJzJ1pXJoIk0KaDkbKxsXSVn3NsTnIpLQAY
   N5jm1Tp2kwe4e2vMDd81JxqfmAfMV0Ghlv3sPFC0BwYJxOfbNhhhYSBzq
   MEndefsKa30vK7CayAu3ZsZoYb+HXCMb0Av2YITz+SSnKuPvQ3z1iW/XA
   nY+rGiYwJDcZ5t9pXUaEZSO6A/XiN8SowIRoj/llLFrHYDy1+IDTDhaUx
   nFPvGI3+5aQgTunYjMiTpgQp/LQRlDeJmdnKidOnhetC5cJOt9MSh0ue1
   3oRo4YeZ1/jx6o0fKCexUEvcc7sH5JfSfZwAiLYtb6ZWg2hAqLHxmT+dP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="351417683"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="351417683"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 00:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="798270354"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="798270354"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 Aug 2023 00:50:06 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUjNu-0008O2-0b;
	Sat, 12 Aug 2023 07:50:06 +0000
Date: Sat, 12 Aug 2023 15:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:block-for-next 4/10] drivers/scsi/scsi_error_test.c:63:
 undefined reference to `scsi_call_prepare_resubmit'
Message-ID: <202308121507.91Q4OWCW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux block-for-next
head:   5653a8e09e21af68dbe7f5add0e7fb042cbee645
commit: a034ed36f6462d88aeb8738931398a34a0ecf5f8 [4/10] scsi: core: Call .eh_prepare_resubmit() before resubmitting
config: arm-randconfig-r024-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121507.91Q4OWCW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121507.91Q4OWCW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121507.91Q4OWCW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/scsi/scsi_error_test.o: in function `test_prepare_resubmit':
>> drivers/scsi/scsi_error_test.c:63: undefined reference to `scsi_call_prepare_resubmit'


vim +63 drivers/scsi/scsi_error_test.c

    31	
    32	static void test_prepare_resubmit(struct kunit *test)
    33	{
    34		static struct scsi_cmnd cmd1, cmd2, cmd3, cmd4, cmd5, cmd6;
    35		static struct scsi_device dev1, dev2, dev3;
    36		struct scsi_driver *uld;
    37		LIST_HEAD(cmd_list);
    38	
    39		uld = kzalloc(3 * sizeof(uld), GFP_KERNEL);
    40		uld1 = &uld[0];
    41		uld1->eh_prepare_resubmit = uld1_prepare_resubmit;
    42		uld2 = &uld[1];
    43		uld2->eh_prepare_resubmit = uld2_prepare_resubmit;
    44		uld3 = &uld[2];
    45		dev1.sdev_gendev.driver = &uld1->gendrv;
    46		dev2.sdev_gendev.driver = &uld2->gendrv;
    47		dev3.sdev_gendev.driver = &uld3->gendrv;
    48		cmd1.device = &dev1;
    49		cmd2.device = &dev1;
    50		cmd3.device = &dev2;
    51		cmd4.device = &dev2;
    52		cmd5.device = &dev3;
    53		cmd6.device = &dev3;
    54		list_add_tail(&cmd1.eh_entry, &cmd_list);
    55		list_add_tail(&cmd3.eh_entry, &cmd_list);
    56		list_add_tail(&cmd5.eh_entry, &cmd_list);
    57		list_add_tail(&cmd2.eh_entry, &cmd_list);
    58		list_add_tail(&cmd4.eh_entry, &cmd_list);
    59		list_add_tail(&cmd6.eh_entry, &cmd_list);
    60	
    61		KUNIT_EXPECT_EQ(test, list_count_nodes(&cmd_list), 6);
    62		kunit_test = test;
  > 63		scsi_call_prepare_resubmit(&cmd_list);
    64		kunit_test = NULL;
    65		KUNIT_EXPECT_EQ(test, list_count_nodes(&cmd_list), 6);
    66		KUNIT_EXPECT_TRUE(test, uld1 < uld2);
    67		KUNIT_EXPECT_TRUE(test, uld2 < uld3);
    68		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next, &cmd1.eh_entry);
    69		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next->next, &cmd2.eh_entry);
    70		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next->next->next, &cmd3.eh_entry);
    71		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next->next->next->next,
    72				    &cmd4.eh_entry);
    73		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next->next->next->next->next,
    74				    &cmd5.eh_entry);
    75		KUNIT_EXPECT_PTR_EQ(test, cmd_list.next->next->next->next->next->next,
    76				    &cmd6.eh_entry);
    77		kfree(uld);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
