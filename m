Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6A4369
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 01:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694654887; x=1726190887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9SP8e/kt6frrUU8cakHEKjjORTiAyYa7on3mChVtLxY=;
  b=RXG9ZIG2ZLV2RsBuEGmkOboHiPoa/y3MXDQG6bYbJahMP63ZJtnLl7B5
   TDUFve01hjvhKB7hkyAGBAD+2mStNQp6iN2lxqKBxc7cKqt1szaeF5W4/
   8hLfg4tdd9kD7CvMHN42QbHIkvk+waTT31ULD92RX3fTIZH2IAXKLiiES
   ZmDkacbHVqXBw4rQmg8autvSop+t9SYuCXvZXbOOLTtFcIRHcoTfyJcn6
   Fkg3W8dXgQUP7SVjr7nhUzQTSaZ203fCdqsyxMRLePjBBRiJRywb/VV8A
   hKUXCSxpXksewPzebrepTvFtrJFDV6PNr3B3tZ+u2hkHgO8NKot1G2JXp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="363864224"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="363864224"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="887574442"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="887574442"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2023 18:27:30 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgb9D-0000w5-2H;
	Thu, 14 Sep 2023 01:27:59 +0000
Date: Thu, 14 Sep 2023 09:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 221/222]
 include/net/ip_tunnels.h:469:17: error: implicit declaration of function
 'DEV_STATS_INC'
Message-ID: <202309140945.vVSVRdwy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   abc83abe491d0306da538cddb3047de9f34f4d8a
commit: 7edcdbd724c9dd63f624fb736ba72cfcff8c5a19 [221/222] ip_tunnels: use DEV_STATS_INC()
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230914/202309140945.vVSVRdwy-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140945.vVSVRdwy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140945.vVSVRdwy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/udp_tunnel.h:5,
                    from drivers/net/ethernet/broadcom/bnxt/bnxt.c:44:
   include/net/ip_tunnels.h: In function 'iptunnel_xmit_stats':
>> include/net/ip_tunnels.h:469:17: error: implicit declaration of function 'DEV_STATS_INC' [-Werror=implicit-function-declaration]
     469 |                 DEV_STATS_INC(dev, tx_errors);
         |                 ^~~~~~~~~~~~~
>> include/net/ip_tunnels.h:469:36: error: 'tx_errors' undeclared (first use in this function); did you mean 'PG_error'?
     469 |                 DEV_STATS_INC(dev, tx_errors);
         |                                    ^~~~~~~~~
         |                                    PG_error
   include/net/ip_tunnels.h:469:36: note: each undeclared identifier is reported only once for each function it appears in
>> include/net/ip_tunnels.h:470:36: error: 'tx_aborted_errors' undeclared (first use in this function)
     470 |                 DEV_STATS_INC(dev, tx_aborted_errors);
         |                                    ^~~~~~~~~~~~~~~~~
>> include/net/ip_tunnels.h:472:36: error: 'tx_dropped' undeclared (first use in this function)
     472 |                 DEV_STATS_INC(dev, tx_dropped);
         |                                    ^~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/net/dst_metadata.h:6,
                    from drivers/net/ethernet/broadcom/bnxt/bnxt.h:24,
                    from drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c:17:
   include/net/ip_tunnels.h: In function 'iptunnel_xmit_stats':
>> include/net/ip_tunnels.h:469:17: error: implicit declaration of function 'DEV_STATS_INC' [-Werror=implicit-function-declaration]
     469 |                 DEV_STATS_INC(dev, tx_errors);
         |                 ^~~~~~~~~~~~~
>> include/net/ip_tunnels.h:469:36: error: 'tx_errors' undeclared (first use in this function); did you mean 'PG_error'?
     469 |                 DEV_STATS_INC(dev, tx_errors);
         |                                    ^~~~~~~~~
         |                                    PG_error
   include/net/ip_tunnels.h:469:36: note: each undeclared identifier is reported only once for each function it appears in
>> include/net/ip_tunnels.h:470:36: error: 'tx_aborted_errors' undeclared (first use in this function)
     470 |                 DEV_STATS_INC(dev, tx_aborted_errors);
         |                                    ^~~~~~~~~~~~~~~~~
>> include/net/ip_tunnels.h:472:36: error: 'tx_dropped' undeclared (first use in this function)
     472 |                 DEV_STATS_INC(dev, tx_dropped);
         |                                    ^~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c: In function 'bnxt_vf_rep_rx':
   drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c:212:35: warning: variable 'rx_stats' set but not used [-Wunused-but-set-variable]
     212 |         struct bnxt_vf_rep_stats *rx_stats;
         |                                   ^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/net/dst_metadata.h:6,
                    from include/net/tc_act/tc_tunnel_key.h:16,
                    from drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:19:
   include/net/ip_tunnels.h: In function 'iptunnel_xmit_stats':
>> include/net/ip_tunnels.h:469:17: error: implicit declaration of function 'DEV_STATS_INC' [-Werror=implicit-function-declaration]
     469 |                 DEV_STATS_INC(dev, tx_errors);
         |                 ^~~~~~~~~~~~~
>> include/net/ip_tunnels.h:469:36: error: 'tx_errors' undeclared (first use in this function); did you mean 'PG_error'?
     469 |                 DEV_STATS_INC(dev, tx_errors);
         |                                    ^~~~~~~~~
         |                                    PG_error
   include/net/ip_tunnels.h:469:36: note: each undeclared identifier is reported only once for each function it appears in
>> include/net/ip_tunnels.h:470:36: error: 'tx_aborted_errors' undeclared (first use in this function)
     470 |                 DEV_STATS_INC(dev, tx_aborted_errors);
         |                                    ^~~~~~~~~~~~~~~~~
>> include/net/ip_tunnels.h:472:36: error: 'tx_dropped' undeclared (first use in this function)
     472 |                 DEV_STATS_INC(dev, tx_dropped);
         |                                    ^~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c: In function 'bnxt_tc_parse_flow':
   drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:192:13: warning: variable 'addr_type' set but not used [-Wunused-but-set-variable]
     192 |         u16 addr_type = 0;
         |             ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/DEV_STATS_INC +469 include/net/ip_tunnels.h

   454	
   455	static inline void iptunnel_xmit_stats(struct net_device *dev, int pkt_len)
   456	{
   457		if (pkt_len > 0) {
   458			struct pcpu_sw_netstats *tstats = get_cpu_ptr(dev->tstats);
   459	
   460			u64_stats_update_begin(&tstats->syncp);
   461			tstats->tx_bytes += pkt_len;
   462			tstats->tx_packets++;
   463			u64_stats_update_end(&tstats->syncp);
   464			put_cpu_ptr(tstats);
   465			return;
   466		}
   467	
   468		if (pkt_len < 0) {
 > 469			DEV_STATS_INC(dev, tx_errors);
 > 470			DEV_STATS_INC(dev, tx_aborted_errors);
   471		} else {
 > 472			DEV_STATS_INC(dev, tx_dropped);
   473		}
   474	}
   475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
