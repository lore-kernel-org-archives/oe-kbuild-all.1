Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBC41C2424
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 16:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727799328; cv=none; b=Fbz+lknYn29jXabMT9vYpi2xbL5BaG/srlcdrvdQFFkPNBh8CmiOejqQ9Fz6gr1dPkT8DVOZSfdDsfKWuw36dO56nZXLPC89qNoteqDPU7y9yYJktEioNTlKnDNh0siLYbMw5z2LaOadc5nYWbflogHHhAe3KbJEDZNB8b5bT8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727799328; c=relaxed/simple;
	bh=OsXL0MzguBfHiyBQvuJqNfLyS1hTHPyIn885cH1dAg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cdkExBcTS9Xms51lUcSWQgY5SaX0GTrKMRg4W3ulmoz9kFWMrfjXtLRiRsm+giM3xGyXtIr1tfgRwHcxRRe6zUZxAy7hR+/ho04xj3RRt5zsccqduhETNiwaBhLZU1ad3aeVdqtNz+oLPbYcsBCE0QnahpH/p0eCsBRCR61qPn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSitQFkJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSitQFkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727799327; x=1759335327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OsXL0MzguBfHiyBQvuJqNfLyS1hTHPyIn885cH1dAg0=;
  b=hSitQFkJOhVY3OKNaePnGy4GspZ3jwLCJ4iEVZKhjzBRbqurQ/+PUwxd
   Y8g0ZouCRDSQD6m3+5B/Bg96wed6eLQtOqBSuOHl6foqYWHFFmIjcPWah
   +xj91/vFjpS0nSMoclc2K/C9jrxxVWxXqa/ZmggYqKPxv/YfCisiPxFUE
   6jGbxytBhQRXfUN8k0jkMBm9UW7k/U8g9+KmD9LKQqFBH98Cq8Eqo48Z9
   W+mEihFK6aaGQlHi+5zsceJ0qpqP5jDm5c0hdcUhJ4L3Pmd2XDl2RMED5
   GiBWC7FSWiBRFu+Aup/Sr032lKAdwnTQ64zB9QbrDiSRvvIeJWLPTO9Aw
   A==;
X-CSE-ConnectionGUID: bN0pGey3T6yTQhlIMf0XaA==
X-CSE-MsgGUID: O/Gcygl1QoOrvgcSDcYAsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="14564481"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="14564481"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 09:15:26 -0700
X-CSE-ConnectionGUID: l2Ra+qfBSDaxEULXwVTZrA==
X-CSE-MsgGUID: PTkISs5uSoGuyk9OLstN+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="97074965"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2024 09:15:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svfX1-000QsX-0c;
	Tue, 01 Oct 2024 16:15:23 +0000
Date: Wed, 2 Oct 2024 00:15:05 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3406/16788]
 ./usr/include/linux/tsn.h:394:9: error: unknown type name '__u8'
Message-ID: <202410020054.Dp5kX3dg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 8bad9bdf1fe710ab0b4d97a1266a7cf3954d0a7e [3406/16788] net: tsn: netlink interface to configure TSN capabilities on hardware ports
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241002/202410020054.Dp5kX3dg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020054.Dp5kX3dg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020054.Dp5kX3dg-lkp@intel.com/

Note: the freescale-fslc/6.6-2.0.x-imx HEAD ac32ba5fe66266329914d2020570364afe217bec builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/tsn.h:394:9: error: unknown type name '__u8'
     394 |         __u8 admin_state;
         |         ^~~~
>> ./usr/include/linux/tsn.h:400:9: error: unknown type name '__u32'
     400 |         __u32 hold_advance;
         |         ^~~~~
   ./usr/include/linux/tsn.h:407:9: error: unknown type name '__u32'
     407 |         __u32 release_advance;
         |         ^~~~~
   ./usr/include/linux/tsn.h:413:9: error: unknown type name '__u8'
     413 |         __u8 preemption_active;
         |         ^~~~
   ./usr/include/linux/tsn.h:422:9: error: unknown type name '__u8'
     422 |         __u8 hold_request;
         |         ^~~~
   ./usr/include/linux/tsn.h:436:9: error: unknown type name '__u8'
     436 |         __u8 delta_bw; /* percentage, 0~100 */
         |         ^~~~
   ./usr/include/linux/tsn.h:437:9: error: unknown type name '__u32'
     437 |         __u32 idleslope;
         |         ^~~~~
>> ./usr/include/linux/tsn.h:438:9: error: unknown type name '__s32'
     438 |         __s32 sendslope;
         |         ^~~~~
   ./usr/include/linux/tsn.h:439:9: error: unknown type name '__u32'
     439 |         __u32 maxframesize;
         |         ^~~~~
   ./usr/include/linux/tsn.h:440:9: error: unknown type name '__u32'
     440 |         __u32 hicredit;
         |         ^~~~~
   ./usr/include/linux/tsn.h:441:9: error: unknown type name '__s32'
     441 |         __s32 locredit;
         |         ^~~~~
   ./usr/include/linux/tsn.h:442:9: error: unknown type name '__u32'
     442 |         __u32 maxninference;
         |         ^~~~~
   ./usr/include/linux/tsn.h:449:9: error: unknown type name '__u8'
     449 |         __u8 capability;
         |         ^~~~
   ./usr/include/linux/tsn.h:452:9: error: unknown type name '__u8'
     452 |         __u8 mode;
         |         ^~~~
   ./usr/include/linux/tsn.h:455:9: error: unknown type name '__u8'
     455 |         __u8 prio;
         |         ^~~~
   ./usr/include/linux/tsn.h:465:9: error: unknown type name '__u8'
     465 |         __u8 queue_cnt;
         |         ^~~~
   ./usr/include/linux/tsn.h:468:9: error: unknown type name '__u32'
     468 |         __u32 max_rate;
         |         ^~~~~
   ./usr/include/linux/tsn.h:471:9: error: unknown type name '__u32'
     471 |         __u32 tsn_capability;
         |         ^~~~~
>> ./usr/include/linux/tsn.h:496:9: error: unknown type name '__u64'
     496 |         __u64 dmac;
         |         ^~~~~
   ./usr/include/linux/tsn.h:506:9: error: unknown type name '__u8'
     506 |         __u8 tagged;
         |         ^~~~
>> ./usr/include/linux/tsn.h:513:9: error: unknown type name '__u16'
     513 |         __u16 vid;
         |         ^~~~~
   ./usr/include/linux/tsn.h:517:9: error: unknown type name '__u64'
     517 |         __u64 smac;
         |         ^~~~~
   ./usr/include/linux/tsn.h:518:9: error: unknown type name '__u8'
     518 |         __u8 tagged;
         |         ^~~~
   ./usr/include/linux/tsn.h:519:9: error: unknown type name '__u16'
     519 |         __u16 vid;
         |         ^~~~~
   ./usr/include/linux/tsn.h:523:9: error: unknown type name '__u64'
     523 |         __u64 down_dmac;
         |         ^~~~~
   ./usr/include/linux/tsn.h:524:9: error: unknown type name '__u8'
     524 |         __u8 down_tagged;
         |         ^~~~
   ./usr/include/linux/tsn.h:525:9: error: unknown type name '__u16'
     525 |         __u16 down_vid;
         |         ^~~~~
   ./usr/include/linux/tsn.h:526:9: error: unknown type name '__u8'
     526 |         __u8 down_prio;
         |         ^~~~
   ./usr/include/linux/tsn.h:527:9: error: unknown type name '__u64'
     527 |         __u64 up_dmac;
         |         ^~~~~
   ./usr/include/linux/tsn.h:528:9: error: unknown type name '__u8'
     528 |         __u8 up_tagged;
         |         ^~~~
   ./usr/include/linux/tsn.h:529:9: error: unknown type name '__u16'
     529 |         __u16 up_vid;
         |         ^~~~~
   ./usr/include/linux/tsn.h:530:9: error: unknown type name '__u8'
     530 |         __u8 up_prio;
         |         ^~~~
   ./usr/include/linux/tsn.h:534:9: error: unknown type name '__u64'
     534 |         __u64 dmac;
         |         ^~~~~
   ./usr/include/linux/tsn.h:535:9: error: unknown type name '__u8'
     535 |         __u8 tagged;
         |         ^~~~
   ./usr/include/linux/tsn.h:536:9: error: unknown type name '__u16'
     536 |         __u16 vid;
         |         ^~~~~
   ./usr/include/linux/tsn.h:537:9: error: unknown type name '__u64'
     537 |         __u64 siph;
         |         ^~~~~
   ./usr/include/linux/tsn.h:538:9: error: unknown type name '__u64'
     538 |         __u64 sipl;
         |         ^~~~~
   ./usr/include/linux/tsn.h:539:9: error: unknown type name '__u64'
     539 |         __u64 diph;
         |         ^~~~~
   ./usr/include/linux/tsn.h:540:9: error: unknown type name '__u64'
     540 |         __u64 dipl;
         |         ^~~~~
   ./usr/include/linux/tsn.h:541:9: error: unknown type name '__u8'
     541 |         __u8 dscp;
         |         ^~~~
   ./usr/include/linux/tsn.h:542:9: error: unknown type name '__u8'
     542 |         __u8 npt;
         |         ^~~~
   ./usr/include/linux/tsn.h:543:9: error: unknown type name '__u16'
     543 |         __u16 sport;
         |         ^~~~~
   ./usr/include/linux/tsn.h:544:9: error: unknown type name '__u16'
     544 |         __u16 dport;
         |         ^~~~~
   ./usr/include/linux/tsn.h:553:9: error: unknown type name '__s32'
     553 |         __s32 handle;
         |         ^~~~~
   ./usr/include/linux/tsn.h:560:9: error: unknown type name '__u32'
     560 |         __u32 ifac_oport;
         |         ^~~~~
   ./usr/include/linux/tsn.h:567:9: error: unknown type name '__u32'
     567 |         __u32 ofac_oport;
         |         ^~~~~
   ./usr/include/linux/tsn.h:573:9: error: unknown type name '__u32'
     573 |         __u32 ifac_iport;
         |         ^~~~~
   ./usr/include/linux/tsn.h:579:9: error: unknown type name '__u32'
     579 |         __u32 ofac_iport;
         |         ^~~~~
   ./usr/include/linux/tsn.h:591:9: error: unknown type name '__u8'
     591 |         __u8 type;
         |         ^~~~
   ./usr/include/linux/tsn.h:612:17: error: unknown type name '__u64'
     612 |                 __u64 input;
         |                 ^~~~~
   ./usr/include/linux/tsn.h:613:17: error: unknown type name '__u64'
     613 |                 __u64 output;
         |                 ^~~~~
   ./usr/include/linux/tsn.h:617:17: error: unknown type name '__u64'
     617 |                 __u64 input;
         |                 ^~~~~
   ./usr/include/linux/tsn.h:618:17: error: unknown type name '__u64'
     618 |                 __u64 output;
         |                 ^~~~~
   ./usr/include/linux/tsn.h:628:9: error: unknown type name '__s32'
     628 |         __s32 max_sf_instance;
         |         ^~~~~
   ./usr/include/linux/tsn.h:634:9: error: unknown type name '__s32'
     634 |         __s32 max_sg_instance;
         |         ^~~~~
   ./usr/include/linux/tsn.h:640:9: error: unknown type name '__s32'
     640 |         __s32 max_fm_instance;
         |         ^~~~~
   ./usr/include/linux/tsn.h:646:9: error: unknown type name '__s32'
     646 |         __s32 supported_list_max;
         |         ^~~~~
   ./usr/include/linux/tsn.h:654:9: error: unknown type name '__u64'
     654 |         __u64 matching_frames_count;
         |         ^~~~~
   ./usr/include/linux/tsn.h:659:9: error: unknown type name '__u64'
     659 |         __u64 passing_frames_count;
         |         ^~~~~
   ./usr/include/linux/tsn.h:664:9: error: unknown type name '__u64'
     664 |         __u64 not_passing_frames_count;
         |         ^~~~~
   ./usr/include/linux/tsn.h:669:9: error: unknown type name '__u64'
     669 |         __u64 passing_sdu_count;
         |         ^~~~~
   ./usr/include/linux/tsn.h:675:9: error: unknown type name '__u64'
     675 |         __u64 not_passing_sdu_count;
         |         ^~~~~
   ./usr/include/linux/tsn.h:680:9: error: unknown type name '__u64'
     680 |         __u64 red_frames_count;
         |         ^~~~~
   ./usr/include/linux/tsn.h:690:9: error: unknown type name '__s32'
     690 |         __s32 stream_handle_spec;
         |         ^~~~~
>> ./usr/include/linux/tsn.h:696:9: error: unknown type name '__s8'
     696 |         __s8 priority_spec;
         |         ^~~~
   ./usr/include/linux/tsn.h:701:9: error: unknown type name '__u32'
     701 |         __u32 stream_gate_instance_id;
         |         ^~~~~
   ./usr/include/linux/tsn.h:713:17: error: unknown type name '__u16'
     713 |                 __u16 maximum_sdu_size;
         |                 ^~~~~
   ./usr/include/linux/tsn.h:720:17: error: unknown type name '__s32'
     720 |                 __s32 flow_meter_instance_id;
         |                 ^~~~~
   ./usr/include/linux/tsn.h:727:9: error: unknown type name '__u8'
     727 |         __u8 block_oversize_enable;
         |         ^~~~
   ./usr/include/linux/tsn.h:734:9: error: unknown type name '__u8'
     734 |         __u8 block_oversize;
         |         ^~~~
   ./usr/include/linux/tsn.h:742:9: error: unknown type name '__u8'
     742 |         __u8 gate_state;
         |         ^~~~
   ./usr/include/linux/tsn.h:747:9: error: unknown type name '__s8'
     747 |         __s8 ipv;
         |         ^~~~
   ./usr/include/linux/tsn.h:752:9: error: unknown type name '__u32'
     752 |         __u32 time_interval;
         |         ^~~~~
   ./usr/include/linux/tsn.h:757:9: error: unknown type name '__u32'
     757 |         __u32 octet_max;
         |         ^~~~~
   ./usr/include/linux/tsn.h:767:9: error: unknown type name '__u8'
     767 |         __u8 gate_states;
         |         ^~~~
   ./usr/include/linux/tsn.h:773:9: error: unknown type name '__u8'
     773 |         __u8 control_list_length;
         |         ^~~~
   ./usr/include/linux/tsn.h:778:9: error: unknown type name '__u32'
     778 |         __u32 cycle_time;
         |         ^~~~~
   ./usr/include/linux/tsn.h:784:9: error: unknown type name '__u32'
     784 |         __u32 cycle_time_extension;
         |         ^~~~~
   ./usr/include/linux/tsn.h:383:19: error: unknown type name '__u64'
     383 | #define ptptime_t __u64
         |                   ^~~~~
   ./usr/include/linux/tsn.h:791:9: note: in expansion of macro 'ptptime_t'
     791 |         ptptime_t base_time;
         |         ^~~~~~~~~
   ./usr/include/linux/tsn.h:797:9: error: unknown type name '__s8'
     797 |         __s8 init_ipv;
         |         ^~~~
   ./usr/include/linux/tsn.h:810:9: error: unknown type name '__u8'
     810 |         __u8 gate_enabled;
         |         ^~~~
   ./usr/include/linux/tsn.h:816:9: error: unknown type name '__u8'
     816 |         __u8 config_change;
         |         ^~~~
   ./usr/include/linux/tsn.h:825:9: error: unknown type name '__u8'
     825 |         __u8 block_invalid_rx_enable;
         |         ^~~~
   ./usr/include/linux/tsn.h:831:9: error: unknown type name '__u8'
     831 |         __u8 block_invalid_rx;
         |         ^~~~
   ./usr/include/linux/tsn.h:837:9: error: unknown type name '__u8'
     837 |         __u8 block_octets_exceeded_enable;
         |         ^~~~
   ./usr/include/linux/tsn.h:844:9: error: unknown type name '__u8'
     844 |         __u8 block_octets_exceeded;
         |         ^~~~
   ./usr/include/linux/tsn.h:383:19: error: unknown type name '__u64'
     383 | #define ptptime_t __u64
         |                   ^~~~~
   ./usr/include/linux/tsn.h:858:9: note: in expansion of macro 'ptptime_t'
     858 |         ptptime_t config_change_time;
         |         ^~~~~~~~~
   ./usr/include/linux/tsn.h:863:9: error: unknown type name '__u32'
     863 |         __u32 tick_granularity;
         |         ^~~~~
   ./usr/include/linux/tsn.h:383:19: error: unknown type name '__u64'
     383 | #define ptptime_t __u64
         |                   ^~~~~
   ./usr/include/linux/tsn.h:870:9: note: in expansion of macro 'ptptime_t'
     870 |         ptptime_t current_time;
         |         ^~~~~~~~~
   ./usr/include/linux/tsn.h:876:9: error: unknown type name '__u8'
     876 |         __u8 config_pending;
         |         ^~~~
   ./usr/include/linux/tsn.h:882:9: error: unknown type name '__u64'
     882 |         __u64 config_change_error;
         |         ^~~~~
   ./usr/include/linux/tsn.h:891:9: error: unknown type name '__u32'
     891 |         __u32 cir;
         |         ^~~~~
   ./usr/include/linux/tsn.h:896:9: error: unknown type name '__u32'
     896 |         __u32 cbs;
         |         ^~~~~
   ./usr/include/linux/tsn.h:901:9: error: unknown type name '__u32'
     901 |         __u32 eir;
         |         ^~~~~
   ./usr/include/linux/tsn.h:906:9: error: unknown type name '__u32'
     906 |         __u32 ebs;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
