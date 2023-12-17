Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA9E5662
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 10:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEO4iWm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702808167; x=1734344167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JoeSZFs6EGjaLzJ6V8rma0zMqGHqbmJD93oGLIX1dOM=;
  b=QEO4iWm8nKep03zASLDQjVMS8pp4DevkLQtHYaDYgEdXth4G4hTQj7z2
   rIJ9R04Je+QI0uFOQmVsB2vgYT2mYAJtxnDfkijCrOthibdoppYK0EzUz
   NHnsJUrbX8qjXCHKjA4n6LJd3sOdxj4aNQovOb7jZGr1CxGRAKbMJR37C
   qDfTJch9dQp1rclkwZkXmPfVUQbJfQDWLm9wybsiWNrq1f8UpMP1740bA
   9/Ld4Za89wL/4vSeRECHbhDlhvTMB04umGSlWhU3MvnKZcq74P6PLoIcW
   nOr5qQqoAu9+8YaJS3uql5a+uy7Cjaus+JX6llnmNd8QfoaGee2hDsJax
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2235154"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="2235154"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 02:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="918933986"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="918933986"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2023 02:16:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEoBm-0002w8-2P;
	Sun, 17 Dec 2023 10:16:02 +0000
Date: Sun, 17 Dec 2023 18:15:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3447/16025]
 ./usr/include/linux/tsn.h:503:9: error: unknown type name '__u16'
Message-ID: <202312171819.S8sRVYoU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Po,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: 05b486dd6e073128aab6d5ae6ce9ae3f811b9682 [3447/16025] net: tsn: netlink interface for APP layer to config TSN capability on hardware ports
config: i386-randconfig-015-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171819.S8sRVYoU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171819.S8sRVYoU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171819.S8sRVYoU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   ./usr/include/linux/tsn.h:384:9: error: unknown type name '__u8'
     384 |         __u8 admin_state;
         |         ^~~~
   ./usr/include/linux/tsn.h:390:9: error: unknown type name '__u32'
     390 |         __u32 hold_advance;
         |         ^~~~~
   ./usr/include/linux/tsn.h:397:9: error: unknown type name '__u32'
     397 |         __u32 release_advance;
         |         ^~~~~
   ./usr/include/linux/tsn.h:403:9: error: unknown type name '__u8'
     403 |         __u8 preemption_active;
         |         ^~~~
   ./usr/include/linux/tsn.h:412:9: error: unknown type name '__u8'
     412 |         __u8 hold_request;
         |         ^~~~
   ./usr/include/linux/tsn.h:426:9: error: unknown type name '__u8'
     426 |         __u8 delta_bw; /* percentage, 0~100 */
         |         ^~~~
   ./usr/include/linux/tsn.h:427:9: error: unknown type name '__u32'
     427 |         __u32 idleslope;
         |         ^~~~~
   ./usr/include/linux/tsn.h:428:9: error: unknown type name '__s32'
     428 |         __s32 sendslope;
         |         ^~~~~
   ./usr/include/linux/tsn.h:429:9: error: unknown type name '__u32'
     429 |         __u32 maxframesize;
         |         ^~~~~
   ./usr/include/linux/tsn.h:430:9: error: unknown type name '__u32'
     430 |         __u32 hicredit;
         |         ^~~~~
   ./usr/include/linux/tsn.h:431:9: error: unknown type name '__s32'
     431 |         __s32 locredit;
         |         ^~~~~
   ./usr/include/linux/tsn.h:432:9: error: unknown type name '__u32'
     432 |         __u32 maxninference;
         |         ^~~~~
   ./usr/include/linux/tsn.h:439:9: error: unknown type name '__u8'
     439 |         __u8 capability;
         |         ^~~~
   ./usr/include/linux/tsn.h:442:9: error: unknown type name '__u8'
     442 |         __u8 mode;
         |         ^~~~
   ./usr/include/linux/tsn.h:445:9: error: unknown type name '__u8'
     445 |         __u8 prio;
         |         ^~~~
   ./usr/include/linux/tsn.h:455:9: error: unknown type name '__u8'
     455 |         __u8 queue_cnt;
         |         ^~~~
   ./usr/include/linux/tsn.h:458:9: error: unknown type name '__u32'
     458 |         __u32 max_rate;
         |         ^~~~~
   ./usr/include/linux/tsn.h:461:9: error: unknown type name '__u32'
     461 |         __u32 tsn_capability;
         |         ^~~~~
   ./usr/include/linux/tsn.h:486:9: error: unknown type name '__u64'
     486 |         __u64 dmac;
         |         ^~~~~
   ./usr/include/linux/tsn.h:496:9: error: unknown type name '__u8'
     496 |         __u8 tagged;
         |         ^~~~
>> ./usr/include/linux/tsn.h:503:9: error: unknown type name '__u16'
     503 |         __u16 vid;
         |         ^~~~~
   ./usr/include/linux/tsn.h:507:9: error: unknown type name '__u64'
     507 |         __u64 smac;
         |         ^~~~~
   ./usr/include/linux/tsn.h:508:9: error: unknown type name '__u8'
     508 |         __u8 tagged;
         |         ^~~~
   ./usr/include/linux/tsn.h:509:9: error: unknown type name '__u16'
     509 |         __u16 vid;
         |         ^~~~~
   ./usr/include/linux/tsn.h:513:9: error: unknown type name '__u64'
     513 |         __u64 down_dmac;
         |         ^~~~~
   ./usr/include/linux/tsn.h:514:9: error: unknown type name '__u8'
     514 |         __u8 down_tagged;
         |         ^~~~
   ./usr/include/linux/tsn.h:515:9: error: unknown type name '__u16'
     515 |         __u16 down_vid;
         |         ^~~~~
   ./usr/include/linux/tsn.h:516:9: error: unknown type name '__u8'
     516 |         __u8 down_prio;
         |         ^~~~
   ./usr/include/linux/tsn.h:517:9: error: unknown type name '__u64'
     517 |         __u64 up_dmac;
         |         ^~~~~
   ./usr/include/linux/tsn.h:518:9: error: unknown type name '__u8'
     518 |         __u8 up_tagged;
         |         ^~~~
   ./usr/include/linux/tsn.h:519:9: error: unknown type name '__u16'
     519 |         __u16 up_vid;
         |         ^~~~~
   ./usr/include/linux/tsn.h:520:9: error: unknown type name '__u8'
     520 |         __u8 up_prio;
         |         ^~~~
   ./usr/include/linux/tsn.h:524:9: error: unknown type name '__u64'
     524 |         __u64 dmac;
         |         ^~~~~
   ./usr/include/linux/tsn.h:525:9: error: unknown type name '__u8'
     525 |         __u8 tagged;
         |         ^~~~
   ./usr/include/linux/tsn.h:526:9: error: unknown type name '__u16'
     526 |         __u16 vid;
         |         ^~~~~
   ./usr/include/linux/tsn.h:527:9: error: unknown type name '__u64'
     527 |         __u64 siph;
         |         ^~~~~
   ./usr/include/linux/tsn.h:528:9: error: unknown type name '__u64'
     528 |         __u64 sipl;
         |         ^~~~~
   ./usr/include/linux/tsn.h:529:9: error: unknown type name '__u64'
     529 |         __u64 diph;
         |         ^~~~~
   ./usr/include/linux/tsn.h:530:9: error: unknown type name '__u64'
     530 |         __u64 dipl;
         |         ^~~~~
   ./usr/include/linux/tsn.h:531:9: error: unknown type name '__u8'
     531 |         __u8 dscp;
         |         ^~~~
   ./usr/include/linux/tsn.h:532:9: error: unknown type name '__u8'
     532 |         __u8 npt;
         |         ^~~~
   ./usr/include/linux/tsn.h:533:9: error: unknown type name '__u16'
     533 |         __u16 sport;
         |         ^~~~~
   ./usr/include/linux/tsn.h:534:9: error: unknown type name '__u16'
     534 |         __u16 dport;
         |         ^~~~~
   ./usr/include/linux/tsn.h:543:9: error: unknown type name '__s32'
     543 |         __s32 handle;
         |         ^~~~~
   ./usr/include/linux/tsn.h:550:9: error: unknown type name '__u32'
     550 |         __u32 ifac_oport;
         |         ^~~~~
   ./usr/include/linux/tsn.h:557:9: error: unknown type name '__u32'
     557 |         __u32 ofac_oport;
         |         ^~~~~
   ./usr/include/linux/tsn.h:563:9: error: unknown type name '__u32'
     563 |         __u32 ifac_iport;
         |         ^~~~~
   ./usr/include/linux/tsn.h:569:9: error: unknown type name '__u32'
     569 |         __u32 ofac_iport;
         |         ^~~~~
   ./usr/include/linux/tsn.h:581:9: error: unknown type name '__u8'
     581 |         __u8 type;
         |         ^~~~
   ./usr/include/linux/tsn.h:602:17: error: unknown type name '__u64'
     602 |                 __u64 input;
         |                 ^~~~~
   ./usr/include/linux/tsn.h:603:17: error: unknown type name '__u64'
     603 |                 __u64 output;
         |                 ^~~~~
   ./usr/include/linux/tsn.h:607:17: error: unknown type name '__u64'
     607 |                 __u64 input;
         |                 ^~~~~
   ./usr/include/linux/tsn.h:608:17: error: unknown type name '__u64'
     608 |                 __u64 output;
         |                 ^~~~~
   ./usr/include/linux/tsn.h:618:9: error: unknown type name '__s32'
     618 |         __s32 max_sf_instance;
         |         ^~~~~
   ./usr/include/linux/tsn.h:624:9: error: unknown type name '__s32'
     624 |         __s32 max_sg_instance;
         |         ^~~~~
   ./usr/include/linux/tsn.h:630:9: error: unknown type name '__s32'
     630 |         __s32 max_fm_instance;
         |         ^~~~~
   ./usr/include/linux/tsn.h:636:9: error: unknown type name '__s32'
     636 |         __s32 supported_list_max;
         |         ^~~~~
   ./usr/include/linux/tsn.h:644:9: error: unknown type name '__u64'
     644 |         __u64 matching_frames_count;
         |         ^~~~~
   ./usr/include/linux/tsn.h:649:9: error: unknown type name '__u64'
     649 |         __u64 passing_frames_count;
         |         ^~~~~
   ./usr/include/linux/tsn.h:654:9: error: unknown type name '__u64'
     654 |         __u64 not_passing_frames_count;
         |         ^~~~~
   ./usr/include/linux/tsn.h:659:9: error: unknown type name '__u64'
     659 |         __u64 passing_sdu_count;
         |         ^~~~~
   ./usr/include/linux/tsn.h:665:9: error: unknown type name '__u64'
     665 |         __u64 not_passing_sdu_count;
         |         ^~~~~
   ./usr/include/linux/tsn.h:670:9: error: unknown type name '__u64'
     670 |         __u64 red_frames_count;
         |         ^~~~~
   ./usr/include/linux/tsn.h:680:9: error: unknown type name '__s32'
     680 |         __s32 stream_handle_spec;
         |         ^~~~~
>> ./usr/include/linux/tsn.h:686:9: error: unknown type name '__s8'
     686 |         __s8 priority_spec;
         |         ^~~~
   ./usr/include/linux/tsn.h:691:9: error: unknown type name '__u32'
     691 |         __u32 stream_gate_instance_id;
         |         ^~~~~
   ./usr/include/linux/tsn.h:703:17: error: unknown type name '__u16'
     703 |                 __u16 maximum_sdu_size;
         |                 ^~~~~
   ./usr/include/linux/tsn.h:710:17: error: unknown type name '__s32'
     710 |                 __s32 flow_meter_instance_id;
         |                 ^~~~~
   ./usr/include/linux/tsn.h:717:9: error: unknown type name '__u8'
     717 |         __u8 block_oversize_enable;
         |         ^~~~
   ./usr/include/linux/tsn.h:724:9: error: unknown type name '__u8'
     724 |         __u8 block_oversize;
         |         ^~~~
   ./usr/include/linux/tsn.h:732:9: error: unknown type name '__u8'
     732 |         __u8 gate_state;
         |         ^~~~
   ./usr/include/linux/tsn.h:737:9: error: unknown type name '__s8'
     737 |         __s8 ipv;
         |         ^~~~
   ./usr/include/linux/tsn.h:742:9: error: unknown type name '__u32'
     742 |         __u32 time_interval;
         |         ^~~~~
   ./usr/include/linux/tsn.h:747:9: error: unknown type name '__u32'
     747 |         __u32 octet_max;
         |         ^~~~~
   ./usr/include/linux/tsn.h:757:9: error: unknown type name '__u8'
     757 |         __u8 gate_states;
         |         ^~~~
   ./usr/include/linux/tsn.h:763:9: error: unknown type name '__u8'
     763 |         __u8 control_list_length;
         |         ^~~~
   ./usr/include/linux/tsn.h:768:9: error: unknown type name '__u32'
     768 |         __u32 cycle_time;
         |         ^~~~~
   ./usr/include/linux/tsn.h:774:9: error: unknown type name '__u32'
     774 |         __u32 cycle_time_extension;
         |         ^~~~~
   ./usr/include/linux/tsn.h:373:19: error: unknown type name '__u64'
     373 | #define ptptime_t __u64
         |                   ^~~~~
   ./usr/include/linux/tsn.h:781:9: note: in expansion of macro 'ptptime_t'
     781 |         ptptime_t base_time;
         |         ^~~~~~~~~
   ./usr/include/linux/tsn.h:787:9: error: unknown type name '__s8'
     787 |         __s8 init_ipv;
         |         ^~~~
   ./usr/include/linux/tsn.h:800:9: error: unknown type name '__u8'
     800 |         __u8 gate_enabled;
         |         ^~~~
   ./usr/include/linux/tsn.h:806:9: error: unknown type name '__u8'
     806 |         __u8 config_change;
         |         ^~~~
   ./usr/include/linux/tsn.h:815:9: error: unknown type name '__u8'
     815 |         __u8 block_invalid_rx_enable;
         |         ^~~~
   ./usr/include/linux/tsn.h:821:9: error: unknown type name '__u8'
     821 |         __u8 block_invalid_rx;
         |         ^~~~
   ./usr/include/linux/tsn.h:827:9: error: unknown type name '__u8'
     827 |         __u8 block_octets_exceeded_enable;
         |         ^~~~
   ./usr/include/linux/tsn.h:834:9: error: unknown type name '__u8'
     834 |         __u8 block_octets_exceeded;
         |         ^~~~
   ./usr/include/linux/tsn.h:373:19: error: unknown type name '__u64'
     373 | #define ptptime_t __u64
         |                   ^~~~~
   ./usr/include/linux/tsn.h:848:9: note: in expansion of macro 'ptptime_t'
     848 |         ptptime_t config_change_time;
         |         ^~~~~~~~~
   ./usr/include/linux/tsn.h:853:9: error: unknown type name '__u32'
     853 |         __u32 tick_granularity;
         |         ^~~~~
   ./usr/include/linux/tsn.h:373:19: error: unknown type name '__u64'
     373 | #define ptptime_t __u64
         |                   ^~~~~
   ./usr/include/linux/tsn.h:860:9: note: in expansion of macro 'ptptime_t'
     860 |         ptptime_t current_time;
         |         ^~~~~~~~~
   ./usr/include/linux/tsn.h:866:9: error: unknown type name '__u8'
     866 |         __u8 config_pending;
         |         ^~~~
   ./usr/include/linux/tsn.h:872:9: error: unknown type name '__u64'
     872 |         __u64 config_change_error;
         |         ^~~~~
   ./usr/include/linux/tsn.h:881:9: error: unknown type name '__u32'
     881 |         __u32 cir;
         |         ^~~~~
   ./usr/include/linux/tsn.h:886:9: error: unknown type name '__u32'
     886 |         __u32 cbs;
         |         ^~~~~
   ./usr/include/linux/tsn.h:891:9: error: unknown type name '__u32'
     891 |         __u32 eir;
         |         ^~~~~
   ./usr/include/linux/tsn.h:896:9: error: unknown type name '__u32'
     896 |         __u32 ebs;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
