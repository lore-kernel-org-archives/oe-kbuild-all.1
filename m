Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C391DDC38
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 01:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779586631; cv=none; b=qClzqe3Ug9Pb+Bvrx3F6S2lpdPGikhLI2E38jXR0s9tQzTcpOGBLX8mVJFZ8MkYlKpVDEIlHQAkYMaM0jjSZ5wBoj396jjbhnFL88inIQ/qY/QDP5gF2dkGMMY5bISoa2ufwJyoPdvo4rV9K9AxipkcgsPfA4eshNcrZ352Jelg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779586631; c=relaxed/simple;
	bh=hyWxwrVufFAA/USOAmh8/IBkQ7rDJ3Wm/pKJuHEvcLE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EQKLssElswKWDegUupZOYrmOGwSqLtusT2sotnq+/aHKSjd9l461nvPiESvlmbDEQpXPAafUClhS12Nltr+su42zkPfRe0xhHsrAkzgDgrpjuLwmJIq7XO6yGGnirRA799VKhks6NzAN9dtooVDZgLk3nFeBa0WfWyAEVdKOgYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9gqHU1b; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9gqHU1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779586630; x=1811122630;
  h=date:from:to:cc:subject:message-id;
  bh=hyWxwrVufFAA/USOAmh8/IBkQ7rDJ3Wm/pKJuHEvcLE=;
  b=k9gqHU1bnAX6kHm1GumVrUdHeBtcSO+GXnCurZlP8EKnJiPfQ3iT//rG
   2+UIonMUt97QNGY5ltzfgoLH+n2pjPy1SUjagGsyAIXZiA131vNKO2vzV
   4Qs1oPZfZNsX39OYQS66jbkCqr/VjuWnc01XYo1jx8EyYorzHpP3Y5ij2
   9hh7XzBlfvatXpwvO3L4iD9TPw0SDjwbLVYn3OQ1SCf6tExnBD9QbkA1P
   zY4F17TDiRHgwPvygHThsks4E1Nwf8ndNqDxfm00L0maxSXbwR1lv0OiX
   0HD4jdwqMWTwL1Ym8XxlF0i5jufP0xP/K6tOntgaXlwBbkSIYs9y5bsBD
   Q==;
X-CSE-ConnectionGUID: vGTfah1BT0eI1k3lRfOfxw==
X-CSE-MsgGUID: PTfc169mSA+Vcncfu27dEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91849629"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="91849629"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 18:37:08 -0700
X-CSE-ConnectionGUID: oZ71qjCdTXCCxHk7bpSpRw==
X-CSE-MsgGUID: +38WWLHeRG2kXoN7YcBL6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="246336532"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 May 2026 18:37:06 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQxm4-000000000Y5-0EYw;
	Sun, 24 May 2026 01:37:04 +0000
Date: Sun, 24 May 2026 09:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-04 1/1]
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c:780:38: warning: default
 initialization of an object of type 'typeof (timeout)' (aka 'const unsigned
 long') leaves the object uninitialized
Message-ID: <202605240931.wfixFUpT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jiri,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-04
head:   360d1154b6351162ad1018a73f58cb5d21cca03b
commit: ec6f22171dc266f410335068291f2149b64e8363 [1/1] net: wwan: t7xx: do not compile with -Werror
config: arm64-randconfig-002-20260524 (https://download.01.org/0day-ci/archive/20260524/202605240931.wfixFUpT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240931.wfixFUpT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240931.wfixFUpT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c:780:38: warning: default initialization of an object of type 'typeof (timeout)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     780 |                 if (!skb_info->msg_pit_received && time_after_eq(jiffies, timeout))
         |                                                    ^
   include/linux/jiffies.h:112:3: note: expanded from macro 'time_after_eq'
     112 |          typecheck(unsigned long, b) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   1 warning generated.


vim +780 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c

d642b012df70a7 Haijun Liu 2022-05-06  763  
d642b012df70a7 Haijun Liu 2022-05-06  764  static int t7xx_dpmaif_rx_start(struct dpmaif_rx_queue *rxq, const unsigned int pit_cnt,
d642b012df70a7 Haijun Liu 2022-05-06  765  				const unsigned long timeout)
d642b012df70a7 Haijun Liu 2022-05-06  766  {
d642b012df70a7 Haijun Liu 2022-05-06  767  	unsigned int cur_pit, pit_len, rx_cnt, recv_skb_cnt = 0;
d642b012df70a7 Haijun Liu 2022-05-06  768  	struct device *dev = rxq->dpmaif_ctrl->dev;
d642b012df70a7 Haijun Liu 2022-05-06  769  	struct dpmaif_cur_rx_skb_info *skb_info;
d642b012df70a7 Haijun Liu 2022-05-06  770  	int ret = 0;
d642b012df70a7 Haijun Liu 2022-05-06  771  
d642b012df70a7 Haijun Liu 2022-05-06  772  	pit_len = rxq->pit_size_cnt;
d642b012df70a7 Haijun Liu 2022-05-06  773  	skb_info = &rxq->rx_data_info;
d642b012df70a7 Haijun Liu 2022-05-06  774  	cur_pit = rxq->pit_rd_idx;
d642b012df70a7 Haijun Liu 2022-05-06  775  
d642b012df70a7 Haijun Liu 2022-05-06  776  	for (rx_cnt = 0; rx_cnt < pit_cnt; rx_cnt++) {
d642b012df70a7 Haijun Liu 2022-05-06  777  		struct dpmaif_pit *pkt_info;
d642b012df70a7 Haijun Liu 2022-05-06  778  		u32 val;
d642b012df70a7 Haijun Liu 2022-05-06  779  
d642b012df70a7 Haijun Liu 2022-05-06 @780  		if (!skb_info->msg_pit_received && time_after_eq(jiffies, timeout))
d642b012df70a7 Haijun Liu 2022-05-06  781  			break;
d642b012df70a7 Haijun Liu 2022-05-06  782  
d642b012df70a7 Haijun Liu 2022-05-06  783  		pkt_info = (struct dpmaif_pit *)rxq->pit_base + cur_pit;
d642b012df70a7 Haijun Liu 2022-05-06  784  		if (t7xx_dpmaif_check_pit_seq(rxq, pkt_info)) {
d642b012df70a7 Haijun Liu 2022-05-06  785  			dev_err_ratelimited(dev, "RXQ%u checks PIT SEQ fail\n", rxq->index);
d642b012df70a7 Haijun Liu 2022-05-06  786  			return -EAGAIN;
d642b012df70a7 Haijun Liu 2022-05-06  787  		}
d642b012df70a7 Haijun Liu 2022-05-06  788  
d642b012df70a7 Haijun Liu 2022-05-06  789  		val = FIELD_GET(PD_PIT_PACKET_TYPE, le32_to_cpu(pkt_info->header));
d642b012df70a7 Haijun Liu 2022-05-06  790  		if (val == DES_PT_MSG) {
d642b012df70a7 Haijun Liu 2022-05-06  791  			if (skb_info->msg_pit_received)
d642b012df70a7 Haijun Liu 2022-05-06  792  				dev_err(dev, "RXQ%u received repeated PIT\n", rxq->index);
d642b012df70a7 Haijun Liu 2022-05-06  793  
d642b012df70a7 Haijun Liu 2022-05-06  794  			skb_info->msg_pit_received = true;
d642b012df70a7 Haijun Liu 2022-05-06  795  			t7xx_dpmaif_parse_msg_pit(rxq, pkt_info, skb_info);
d642b012df70a7 Haijun Liu 2022-05-06  796  		} else { /* DES_PT_PD */
d642b012df70a7 Haijun Liu 2022-05-06  797  			val = FIELD_GET(PD_PIT_BUFFER_TYPE, le32_to_cpu(pkt_info->header));
d642b012df70a7 Haijun Liu 2022-05-06  798  			if (val != PKT_BUF_FRAG)
d642b012df70a7 Haijun Liu 2022-05-06  799  				ret = t7xx_dpmaif_get_rx_pkt(rxq, pkt_info, skb_info);
d642b012df70a7 Haijun Liu 2022-05-06  800  			else if (!skb_info->cur_skb)
d642b012df70a7 Haijun Liu 2022-05-06  801  				ret = -EINVAL;
d642b012df70a7 Haijun Liu 2022-05-06  802  			else
d642b012df70a7 Haijun Liu 2022-05-06  803  				ret = t7xx_dpmaif_get_frag(rxq, pkt_info, skb_info);
d642b012df70a7 Haijun Liu 2022-05-06  804  
d642b012df70a7 Haijun Liu 2022-05-06  805  			if (ret < 0) {
d642b012df70a7 Haijun Liu 2022-05-06  806  				skb_info->err_payload = 1;
d642b012df70a7 Haijun Liu 2022-05-06  807  				dev_err_ratelimited(dev, "RXQ%u error payload\n", rxq->index);
d642b012df70a7 Haijun Liu 2022-05-06  808  			}
d642b012df70a7 Haijun Liu 2022-05-06  809  
d642b012df70a7 Haijun Liu 2022-05-06  810  			val = FIELD_GET(PD_PIT_CONT, le32_to_cpu(pkt_info->header));
d642b012df70a7 Haijun Liu 2022-05-06  811  			if (!val) {
d642b012df70a7 Haijun Liu 2022-05-06  812  				if (!skb_info->err_payload) {
d642b012df70a7 Haijun Liu 2022-05-06  813  					t7xx_dpmaif_rx_skb(rxq, skb_info);
d642b012df70a7 Haijun Liu 2022-05-06  814  				} else if (skb_info->cur_skb) {
d642b012df70a7 Haijun Liu 2022-05-06  815  					dev_kfree_skb_any(skb_info->cur_skb);
d642b012df70a7 Haijun Liu 2022-05-06  816  					skb_info->cur_skb = NULL;
d642b012df70a7 Haijun Liu 2022-05-06  817  				}
d642b012df70a7 Haijun Liu 2022-05-06  818  
d642b012df70a7 Haijun Liu 2022-05-06  819  				memset(skb_info, 0, sizeof(*skb_info));
d642b012df70a7 Haijun Liu 2022-05-06  820  
d642b012df70a7 Haijun Liu 2022-05-06  821  				recv_skb_cnt++;
d642b012df70a7 Haijun Liu 2022-05-06  822  				if (!(recv_skb_cnt & DPMAIF_RX_PUSH_THRESHOLD_MASK)) {
d642b012df70a7 Haijun Liu 2022-05-06  823  					wake_up_all(&rxq->rx_wq);
d642b012df70a7 Haijun Liu 2022-05-06  824  					recv_skb_cnt = 0;
d642b012df70a7 Haijun Liu 2022-05-06  825  				}
d642b012df70a7 Haijun Liu 2022-05-06  826  			}
d642b012df70a7 Haijun Liu 2022-05-06  827  		}
d642b012df70a7 Haijun Liu 2022-05-06  828  
d642b012df70a7 Haijun Liu 2022-05-06  829  		cur_pit = t7xx_ring_buf_get_next_wr_idx(pit_len, cur_pit);
d642b012df70a7 Haijun Liu 2022-05-06  830  		rxq->pit_rd_idx = cur_pit;
d642b012df70a7 Haijun Liu 2022-05-06  831  		rxq->pit_remain_release_cnt++;
d642b012df70a7 Haijun Liu 2022-05-06  832  
d642b012df70a7 Haijun Liu 2022-05-06  833  		if (rx_cnt > 0 && !(rx_cnt % DPMAIF_NOTIFY_RELEASE_COUNT)) {
d642b012df70a7 Haijun Liu 2022-05-06  834  			ret = t7xx_dpmaifq_rx_notify_hw(rxq);
d642b012df70a7 Haijun Liu 2022-05-06  835  			if (ret < 0)
d642b012df70a7 Haijun Liu 2022-05-06  836  				break;
d642b012df70a7 Haijun Liu 2022-05-06  837  		}
d642b012df70a7 Haijun Liu 2022-05-06  838  	}
d642b012df70a7 Haijun Liu 2022-05-06  839  
d642b012df70a7 Haijun Liu 2022-05-06  840  	if (recv_skb_cnt)
d642b012df70a7 Haijun Liu 2022-05-06  841  		wake_up_all(&rxq->rx_wq);
d642b012df70a7 Haijun Liu 2022-05-06  842  
d642b012df70a7 Haijun Liu 2022-05-06  843  	if (!ret)
d642b012df70a7 Haijun Liu 2022-05-06  844  		ret = t7xx_dpmaifq_rx_notify_hw(rxq);
d642b012df70a7 Haijun Liu 2022-05-06  845  
d642b012df70a7 Haijun Liu 2022-05-06  846  	if (ret)
d642b012df70a7 Haijun Liu 2022-05-06  847  		return ret;
d642b012df70a7 Haijun Liu 2022-05-06  848  
d642b012df70a7 Haijun Liu 2022-05-06  849  	return rx_cnt;
d642b012df70a7 Haijun Liu 2022-05-06  850  }
d642b012df70a7 Haijun Liu 2022-05-06  851  

:::::: The code at line 780 was first introduced by commit
:::::: d642b012df70a76dd5723f2d426b40bffe83ac49 net: wwan: t7xx: Add data path interface

:::::: TO: Haijun Liu <haijun.liu@mediatek.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
