Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3B4171C9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 00:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751762395; cv=none; b=L3QfLgOWJfrLKKeTtyHRvrEos/uiKQYEzrdHh/QnzD58XP+H5YNmgTt/9bWQ8OTESap/KOoffu05HofPWNYfgUDPPcH4m8LfWWbR4HIGGmvgy4Nk4t6dsFYiaAHrKC0avungEJFPmFlNotqsTGYQfKzJVBPIVS/m6eB4OUs4N88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751762395; c=relaxed/simple;
	bh=fs0ubOcayBUiPhTs6ieWvkEAXJTZbv4GBXRi3N1fO0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ehk/cNgSaJBejuiURZKnWAQk8vXALJWjR8l3zXdHtCzLz24amAbgAod8xfTw5u+wRcT1OKl5tgIpvsVprB8kpMPO98QSoYmOUE6a2urLgmlGJwpFownka6cPI5wCZ5AWT5LeBXgO2TBCepAiypRx9zxpjK42p5el6PxOc4l49NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+cQOsqI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+cQOsqI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751762393; x=1783298393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fs0ubOcayBUiPhTs6ieWvkEAXJTZbv4GBXRi3N1fO0E=;
  b=C+cQOsqIjfusjsbYsZO8vDy46X3sNb/Z5Rv0rDlbiqpnE4uwom+3FdoK
   C34Bjikk6RVkQuKn8HZ1bT2Dsp3R0ssReDioDcGVnlG2MClpbxoqc3yvd
   A8zveN/wBT77eMxS24CpY+trYxHs+xF1nlODlvuRpvMSZ+L5QBEizPFLO
   PLxge7SX8HROB59b+pjoSrdYKSo3odF+q93w7aAsWPSIhGySlociRBDJ4
   VKBYosjhWhP7X+bdb+H/KgFTih4PwN2I4jR8HkEYJSq9EMz41OY2u9Tfz
   b9WqR306bwZPR2LzeZaI3WfC7acDyJzp/XngijOnru3hrlC8c6rGR4YMc
   w==;
X-CSE-ConnectionGUID: MwalR6uPS+6kZXvB4GSGpQ==
X-CSE-MsgGUID: jBe/84W9QxufngIEtW7b4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="54171592"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="54171592"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 17:39:52 -0700
X-CSE-ConnectionGUID: oXBZ5h+5Q4CS0V3euLit6w==
X-CSE-MsgGUID: c1LcRIXiRJum+l1BtPhKmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="155265394"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jul 2025 17:39:52 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYDQ5-0004mv-2v;
	Sun, 06 Jul 2025 00:39:49 +0000
Date: Sun, 6 Jul 2025 08:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 6/6] greybus: add class driver for Silabs Bluetooth
Message-ID: <202507060815.ufA8rMCz-lkp@intel.com>
References: <20250705004036.3828-7-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705004036.3828-7-damien.riegel@silabs.com>

Hi Damien,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on staging/staging-next staging/staging-linus linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Ri-gel/greybus-move-host-controller-drivers-comment-in-Makefile/20250705-090138
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250705004036.3828-7-damien.riegel%40silabs.com
patch subject: [RFC 6/6] greybus: add class driver for Silabs Bluetooth
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250706/202507060815.ufA8rMCz-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060815.ufA8rMCz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060815.ufA8rMCz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/greybus/silabs-ble.c: In function 'gb_ble_send':
>> drivers/staging/greybus/silabs-ble.c:52:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      52 |         int ret;
         |             ^~~


vim +/ret +52 drivers/staging/greybus/silabs-ble.c

    48	
    49	static int gb_ble_send(struct hci_dev *hdev, struct sk_buff *skb)
    50	{
    51		struct gb_ble *ble = hci_get_drvdata(hdev);
  > 52		int ret;
    53	
    54		memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
    55	
    56		ret = gb_operation_unidirectional_async_timeout(ble->conn,
    57								gb_ble_xfer_done, skb,
    58								GB_BLE_TRANSFER,
    59								skb->data, skb->len + 1,
    60								GB_OPERATION_TIMEOUT_DEFAULT);
    61	
    62		return -ENOMEM;
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
