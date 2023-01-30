Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB915376
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 02:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675046526; x=1706582526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n4bjKMTTt1A9Ns2l5KAG1RFlZYdRPlG6wPWs/TscKL0=;
  b=bf0Dd439qk7CFlF2jjjTBofNeG153aoXfQSOLWaH5T5MybUCnnwrrmvc
   9MJ58kO7NdZEdl4z80ignC857Bvn2nGbb8Duyab4Br2yP2rNaixQMDANk
   ohIpuwUgl51kyuATkwqL9LGV5+UGL9o2BCUJbYnZolKqiXS/FKToaUFiL
   bGkQmjZB24hQY7K3+bdPhQqwPbzSt6nJZDEehD6ZkuKual4v5HCZ1TyXh
   XwjEmO+uUzGx1s8/941ByknBu9NFOJ2h0mV7DBu3UEJC8vJr7GHRrkZZE
   tBBCvneckJu0Q4c6cqIebVJQflaDfuTxiIUJdQ7yZfwzjZkKNzKyHbrDW
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="325156492"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="325156492"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 18:42:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="772319475"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="772319475"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2023 18:42:02 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMK7N-0003Iw-2j;
	Mon, 30 Jan 2023 02:42:01 +0000
Date: Mon, 30 Jan 2023 10:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependencies
 detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
Message-ID: <202301301054.KVvGA5XO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   c52c9acc415eb6ff54f658492f8c53da0fc3528a
commit: c52c9acc415eb6ff54f658492f8c53da0fc3528a [35/35] xhci: host: Add Renesas RZ/V2M SoC support
config: csky-kismet-CONFIG_USB_RZV2M_USB3DRD-CONFIG_USB_XHCI_RZV2M-0-0 (https://download.01.org/0day-ci/archive/20230130/202301301054.KVvGA5XO-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=c52c9acc415eb6ff54f658492f8c53da0fc3528a
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-next
        git checkout c52c9acc415eb6ff54f658492f8c53da0fc3528a
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_USB_RZV2M_USB3DRD --selectors CONFIG_USB_XHCI_RZV2M -a=csky
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=csky olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
   .config:4492:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for USB_RZV2M_USB3DRD
     Depends on [n]: USB_SUPPORT [=y] && USB_GADGET [=n] && (ARCH_R9A09G011 [=n] || COMPILE_TEST [=y])
     Selected by [y]:
     - USB_XHCI_RZV2M [=y] && USB_SUPPORT [=y] && USB [=y] && USB_XHCI_HCD [=y] && USB_XHCI_PLATFORM [=y] && (ARCH_R9A09G011 [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
