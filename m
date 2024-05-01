Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330F5101DB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 02:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714529645; cv=none; b=EkiK7MqU1z4EyM8qn+Ql74MN2FTUtATa2hu8xnTFG/+lfRftsh7E1dQpDQ/r8GmzPSIyTJYLZQ2/+cFA5QKYjaoQLLDD6J+3sBCLQgMoOcBQgNClJh2yv1A0wd1hL+rMQVbcspqBlkDYAYlZoig06c9U4HvgoIw52dPim0amNmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714529645; c=relaxed/simple;
	bh=pmFe7zXrkOB3JN0N66vunyHwoSzNg/axyWWTtADlsRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+ICwkVILXLUNOfd2bIwj9QxYshUzriTesG6cNh4H1KtxNIgM9E1Yjtwn09xWLTpFkakZukxEj7rC2Z/0P4KHk4fxSYfSUYzLxyG32dLYI4N1r+xecBtFE41/wRslI9eCfb8teAI6iJ9OCQvtpPT8gdSYZH5JQ2cCQiPq7axWf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JD+KtGr8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JD+KtGr8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714529644; x=1746065644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pmFe7zXrkOB3JN0N66vunyHwoSzNg/axyWWTtADlsRo=;
  b=JD+KtGr8JH3BWi8VWsCUu6C5Y3pZL3kUu+oggNfET9Pm+qFA9ymSVlMX
   BXhcd20fOFFq37oMMY+NkCBgKPtuywyBl8AiP6ieNyWeAO3sWUA++mg0L
   ySXjiV0IIrZGSakpXHBI4RkR7zFc5ztgQSXt828M4zzuLTVoq0QFW2oCW
   PLUQcviEPSblH3925QgJNXq1F6rtFnolM0CA+/0UFXLQwkC5M1bCOgrOr
   aloQBytlbUo0gPmQZMCFRSR2R8OTYTpIosAEVzC+6bzqRE6YIWrOSleZE
   3cnTZurpj00MFI/KEc/MzpHrCtk88hIXswj66Fhyp5q7jPDZAVD141rgm
   Q==;
X-CSE-ConnectionGUID: o4Jz/uy2TaGQ5wTPL+fhug==
X-CSE-MsgGUID: iOABZBNVSzCfPqiMaqtxgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="13188610"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="13188610"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 19:14:03 -0700
X-CSE-ConnectionGUID: iv0Wb31bTReV/IO0UqXhWQ==
X-CSE-MsgGUID: 3Zvdv6n/S+GE7cF9ReKfyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="57546296"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Apr 2024 19:14:02 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1zTr-0008l1-2O;
	Wed, 01 May 2024 02:13:59 +0000
Date: Wed, 1 May 2024 10:13:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sungwoo Kim <iam@sung-woo.kim>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] Bluetooth: msft: fix slab-use-after-free in
 msft_do_close()
Message-ID: <202405011016.CBytvMaJ-lkp@intel.com>
References: <20240430162049.1516720-1-iam@sung-woo.kim>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430162049.1516720-1-iam@sung-woo.kim>

Hi Sungwoo,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth/master]
[also build test ERROR on linus/master v6.9-rc6 next-20240430]
[cannot apply to bluetooth-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sungwoo-Kim/Bluetooth-msft-fix-slab-use-after-free-in-msft_do_close/20240501-003554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20240430162049.1516720-1-iam%40sung-woo.kim
patch subject: [PATCH v3] Bluetooth: msft: fix slab-use-after-free in msft_do_close()
config: x86_64-randconfig-122-20240501 (https://download.01.org/0day-ci/archive/20240501/202405011016.CBytvMaJ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405011016.CBytvMaJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405011016.CBytvMaJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/bluetooth/hci_core.c: In function 'hci_release_dev':
>> net/bluetooth/hci_core.c:2824:9: error: implicit declaration of function 'msft_release'; did you mean 'dst_release'? [-Werror=implicit-function-declaration]
    2824 |         msft_release(hdev);
         |         ^~~~~~~~~~~~
         |         dst_release
   cc1: some warnings being treated as errors


vim +2824 net/bluetooth/hci_core.c

  2797	
  2798	/* Release HCI device */
  2799	void hci_release_dev(struct hci_dev *hdev)
  2800	{
  2801		debugfs_remove_recursive(hdev->debugfs);
  2802		kfree_const(hdev->hw_info);
  2803		kfree_const(hdev->fw_info);
  2804	
  2805		destroy_workqueue(hdev->workqueue);
  2806		destroy_workqueue(hdev->req_workqueue);
  2807	
  2808		hci_dev_lock(hdev);
  2809		hci_bdaddr_list_clear(&hdev->reject_list);
  2810		hci_bdaddr_list_clear(&hdev->accept_list);
  2811		hci_uuids_clear(hdev);
  2812		hci_link_keys_clear(hdev);
  2813		hci_smp_ltks_clear(hdev);
  2814		hci_smp_irks_clear(hdev);
  2815		hci_remote_oob_data_clear(hdev);
  2816		hci_adv_instances_clear(hdev);
  2817		hci_adv_monitors_clear(hdev);
  2818		hci_bdaddr_list_clear(&hdev->le_accept_list);
  2819		hci_bdaddr_list_clear(&hdev->le_resolv_list);
  2820		hci_conn_params_clear_all(hdev);
  2821		hci_discovery_filter_clear(hdev);
  2822		hci_blocked_keys_clear(hdev);
  2823		hci_codec_list_clear(&hdev->local_codecs);
> 2824		msft_release(hdev);
  2825		hci_dev_unlock(hdev);
  2826	
  2827		ida_destroy(&hdev->unset_handle_ida);
  2828		ida_free(&hci_index_ida, hdev->id);
  2829		kfree_skb(hdev->sent_cmd);
  2830		kfree_skb(hdev->req_skb);
  2831		kfree_skb(hdev->recv_event);
  2832		kfree(hdev);
  2833	}
  2834	EXPORT_SYMBOL(hci_release_dev);
  2835	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
