Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DC52E3715
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 14:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751724966; cv=none; b=WonbZQW5tJ+ziDwS69sZkHDq4zwoXzkrcNoZPfZpOcxQYgUueTk5nkrMD+BA4yha5197cBHtiS4pREmv4sRXrnnA84eX4RWIOUbEATUcyN7W9IL+LAsV1tAZsUY98i9+TiHuHlUSym/X6KWJs+qdRAlcgITnA8cVDqoE8jbohB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751724966; c=relaxed/simple;
	bh=4i8kbi/ofLdeJ/peCXZlkiKQTiRe0HxhevagFxR7Jeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5DxR5KfG6dSqX+NPSF5tw7h6EwmojqvOW/pL/EKziHiu11FQdn0J868QYFkeb7lfFDAdUrtMVLRj8rJHyVeuAL1KoeH3QwqfmyyX83bOAvUL8rjUcdS9lL3uYEkxvwDCD+oDLoqPoK86sK+Jok1WrsnJuVTQSBE8S1g3BOES3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJEH0Rwg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJEH0Rwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751724963; x=1783260963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4i8kbi/ofLdeJ/peCXZlkiKQTiRe0HxhevagFxR7Jeg=;
  b=PJEH0RwgBiHWyQJF2xFGijnsiiGZK1t/1YXxbyl7eKwTbUe2aLa1v57W
   5QEyHKCQWiYC358sHt8M+SeP+KQOAP2uUX2E51X/d3AId7JlDUVhfk/Zz
   WsLdxwHxqml2CJasyj4hhX4cGAbT85wy45cuOsLcZdQs49oSTp0x1WBs9
   xoANNIgjI/hyBdJf93n07mImqVlEs4ji+3jNDNzttM0aWqhaK1ZfuSbTE
   +cLf06+OO9h1GzFpDhWKIo+7N/3pk4BGBypG3eamKyEbFxTIs411kFc5C
   7IHQc2OqhJ8F6aRMdfJxQ6QrQsqaMxqATVHDWIzSgpeb7MWU6zFHxiiaU
   g==;
X-CSE-ConnectionGUID: +6bWpqPYTPiDzpCu1r3AlA==
X-CSE-MsgGUID: /23RC/h7S/68cucYqTloSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="71591819"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="71591819"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 07:16:02 -0700
X-CSE-ConnectionGUID: vTc56exUQzSI0+2bk7KCLA==
X-CSE-MsgGUID: o9adzH+JQ/q5paD4go2NSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="185846982"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Jul 2025 07:16:02 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY3gN-0004XH-0h;
	Sat, 05 Jul 2025 14:15:59 +0000
Date: Sat, 5 Jul 2025 22:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH rtw-next v4 14/14] wifi: rtw89: Enable the new USB modules
Message-ID: <202507052209.SrlVQU7Q-lkp@intel.com>
References: <4968a9d5-02c8-4d35-a5ad-b75ece8f5d36@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4968a9d5-02c8-4d35-a5ad-b75ece8f5d36@gmail.com>

Hi Bitterblue,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bitterblue-Smith/wifi-rtw89-8851b-Accept-USB-devices-and-load-their-MAC-address/20250701-045500
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/4968a9d5-02c8-4d35-a5ad-b75ece8f5d36%40gmail.com
patch subject: [PATCH rtw-next v4 14/14] wifi: rtw89: Enable the new USB modules
config: sh-randconfig-r121-20250704 (https://download.01.org/0day-ci/archive/20250705/202507052209.SrlVQU7Q-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250705/202507052209.SrlVQU7Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507052209.SrlVQU7Q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/realtek/rtw89/usb.c:213:40: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] v @@     got restricted __le32 [usertype] dword0 @@
   drivers/net/wireless/realtek/rtw89/usb.c:213:40: sparse:     expected unsigned int [usertype] v
   drivers/net/wireless/realtek/rtw89/usb.c:213:40: sparse:     got restricted __le32 [usertype] dword0

vim +213 drivers/net/wireless/realtek/rtw89/usb.c

fe1617b78fe746 Bitterblue Smith 2025-06-30  190  
fe1617b78fe746 Bitterblue Smith 2025-06-30  191  static void rtw89_usb_write_port_complete(struct urb *urb)
fe1617b78fe746 Bitterblue Smith 2025-06-30  192  {
fe1617b78fe746 Bitterblue Smith 2025-06-30  193  	struct rtw89_usb_tx_ctrl_block *txcb = urb->context;
fe1617b78fe746 Bitterblue Smith 2025-06-30  194  	struct rtw89_dev *rtwdev = txcb->rtwdev;
fe1617b78fe746 Bitterblue Smith 2025-06-30  195  	struct ieee80211_tx_info *info;
fe1617b78fe746 Bitterblue Smith 2025-06-30  196  	struct rtw89_txwd_body *txdesc;
fe1617b78fe746 Bitterblue Smith 2025-06-30  197  	struct sk_buff *skb;
fe1617b78fe746 Bitterblue Smith 2025-06-30  198  	u32 txdesc_size;
fe1617b78fe746 Bitterblue Smith 2025-06-30  199  
fe1617b78fe746 Bitterblue Smith 2025-06-30  200  	while (true) {
fe1617b78fe746 Bitterblue Smith 2025-06-30  201  		skb = skb_dequeue(&txcb->tx_ack_queue);
fe1617b78fe746 Bitterblue Smith 2025-06-30  202  		if (!skb)
fe1617b78fe746 Bitterblue Smith 2025-06-30  203  			break;
fe1617b78fe746 Bitterblue Smith 2025-06-30  204  
fe1617b78fe746 Bitterblue Smith 2025-06-30  205  		if (txcb->txch == RTW89_TXCH_CH12) {
fe1617b78fe746 Bitterblue Smith 2025-06-30  206  			dev_kfree_skb_any(skb);
fe1617b78fe746 Bitterblue Smith 2025-06-30  207  			continue;
fe1617b78fe746 Bitterblue Smith 2025-06-30  208  		}
fe1617b78fe746 Bitterblue Smith 2025-06-30  209  
fe1617b78fe746 Bitterblue Smith 2025-06-30  210  		txdesc = (struct rtw89_txwd_body *)skb->data;
fe1617b78fe746 Bitterblue Smith 2025-06-30  211  
fe1617b78fe746 Bitterblue Smith 2025-06-30  212  		txdesc_size = rtwdev->chip->txwd_body_size;
fe1617b78fe746 Bitterblue Smith 2025-06-30 @213  		if (u32_get_bits(txdesc->dword0, RTW89_TXWD_BODY0_WD_INFO_EN))
fe1617b78fe746 Bitterblue Smith 2025-06-30  214  			txdesc_size += rtwdev->chip->txwd_info_size;
fe1617b78fe746 Bitterblue Smith 2025-06-30  215  
fe1617b78fe746 Bitterblue Smith 2025-06-30  216  		skb_pull(skb, txdesc_size);
fe1617b78fe746 Bitterblue Smith 2025-06-30  217  
fe1617b78fe746 Bitterblue Smith 2025-06-30  218  		info = IEEE80211_SKB_CB(skb);
fe1617b78fe746 Bitterblue Smith 2025-06-30  219  		ieee80211_tx_info_clear_status(info);
fe1617b78fe746 Bitterblue Smith 2025-06-30  220  
fe1617b78fe746 Bitterblue Smith 2025-06-30  221  		if (urb->status == 0) {
fe1617b78fe746 Bitterblue Smith 2025-06-30  222  			if (info->flags & IEEE80211_TX_CTL_NO_ACK)
fe1617b78fe746 Bitterblue Smith 2025-06-30  223  				info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
fe1617b78fe746 Bitterblue Smith 2025-06-30  224  			else
fe1617b78fe746 Bitterblue Smith 2025-06-30  225  				info->flags |= IEEE80211_TX_STAT_ACK;
fe1617b78fe746 Bitterblue Smith 2025-06-30  226  		}
fe1617b78fe746 Bitterblue Smith 2025-06-30  227  
fe1617b78fe746 Bitterblue Smith 2025-06-30  228  		ieee80211_tx_status_irqsafe(rtwdev->hw, skb);
fe1617b78fe746 Bitterblue Smith 2025-06-30  229  	}
fe1617b78fe746 Bitterblue Smith 2025-06-30  230  
fe1617b78fe746 Bitterblue Smith 2025-06-30  231  	switch (urb->status) {
fe1617b78fe746 Bitterblue Smith 2025-06-30  232  	case 0:
fe1617b78fe746 Bitterblue Smith 2025-06-30  233  	case -EPIPE:
fe1617b78fe746 Bitterblue Smith 2025-06-30  234  	case -EPROTO:
fe1617b78fe746 Bitterblue Smith 2025-06-30  235  	case -EINPROGRESS:
fe1617b78fe746 Bitterblue Smith 2025-06-30  236  	case -ENOENT:
fe1617b78fe746 Bitterblue Smith 2025-06-30  237  	case -ECONNRESET:
fe1617b78fe746 Bitterblue Smith 2025-06-30  238  		break;
fe1617b78fe746 Bitterblue Smith 2025-06-30  239  	default:
fe1617b78fe746 Bitterblue Smith 2025-06-30  240  		set_bit(RTW89_FLAG_UNPLUGGED, rtwdev->flags);
fe1617b78fe746 Bitterblue Smith 2025-06-30  241  		break;
fe1617b78fe746 Bitterblue Smith 2025-06-30  242  	}
fe1617b78fe746 Bitterblue Smith 2025-06-30  243  
fe1617b78fe746 Bitterblue Smith 2025-06-30  244  	kfree(txcb);
fe1617b78fe746 Bitterblue Smith 2025-06-30  245  	usb_free_urb(urb);
fe1617b78fe746 Bitterblue Smith 2025-06-30  246  }
fe1617b78fe746 Bitterblue Smith 2025-06-30  247  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
