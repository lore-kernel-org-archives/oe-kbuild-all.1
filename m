Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D9CBE5B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 May 2023 11:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684754843; x=1716290843;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=gjB45gXpgLc2VAwCepeSq1HHQaR5QnFKZpB136yerZg=;
  b=de4p+yseYIXvNM8VDYiTNc5dnYjuePL+4MFuG+7905FedwGEHQikSdIU
   KGYV/r/fr5OE8qsxdcdaWjIlXJyUwlIRNK4VvPkPkJAQnYMI770D6KpRe
   oY5tBc8lBJYlYlpFTjGhh1QqW3keiwTqBvunEbCdh6V5v93wPHLzodCz9
   xbuXLqtMbAp/K1Memi0QHeRbpiASB9wWEkK6to6Muw59DlBaOJwqvUWMU
   2/ZCObmBVndsb55MJ/tdnUUDm7vjwCmcgA6zCTU9nk8XD2F5P4BOoQN1d
   tVYfy6BGzlCy2WG61tsm3w4aTQVGUqdi9+v7KNjBv9CRX+1Lfh69m92w5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="381121493"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="381121493"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 04:27:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="827685585"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="827685585"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 22 May 2023 04:27:20 -0700
Message-ID: <a9c61bb2-d0be-0724-3da8-8dd7f350db7a@linux.intel.com>
Date: Mon, 22 May 2023 14:28:38 +0300
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Josue David Hernandez Gutierrez <josue.d.hernandez.gutierrez@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <202305210548.0axTFRJ4-lkp@intel.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [linux-stable-rc:queue/6.3 150/198]
 drivers/usb/host/xhci.c:497:19: error: static declaration of
 'xhci_try_enable_msi' follows non-static declaration
In-Reply-To: <202305210548.0axTFRJ4-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.5.2023 0.57, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/6.3
> head:   347e3ffc36d4486936333d5ba51ff984b5f28bb3
> commit: 8d0ff17ac4ed3017ee0433b931184e43ac6da616 [150/198] xhci: Avoid PCI MSI/MSIX interrupt reinitialization at resume
> config: m68k-randconfig-r003-20230521
> compiler: m68k-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=8d0ff17ac4ed3017ee0433b931184e43ac6da616
>          git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>          git fetch --no-tags linux-stable-rc queue/6.3
>          git checkout 8d0ff17ac4ed3017ee0433b931184e43ac6da616
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/usb/host/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305210548.0axTFRJ4-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/usb/host/xhci.c:497:19: error: static declaration of 'xhci_try_enable_msi' follows non-static declaration
>       497 | static inline int xhci_try_enable_msi(struct usb_hcd *hcd)
>           |                   ^~~~~~~~~~~~~~~~~~~
>     In file included from drivers/usb/host/xhci.c:22:
>     drivers/usb/host/xhci.h:2146:5: note: previous declaration of 'xhci_try_enable_msi' with type 'int(struct usb_hcd *)'
>      2146 | int xhci_try_enable_msi(struct usb_hcd *hcd);
>           |     ^~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/xhci_try_enable_msi +497 drivers/usb/host/xhci.c
> 
> 421aa841a134f6 Sebastian Andrzej Siewior 2011-09-23  496
> 01bb59ebffdec3 David Cohen               2014-04-25 @497  static inline int xhci_try_enable_msi(struct usb_hcd *hcd)
> 421aa841a134f6 Sebastian Andrzej Siewior 2011-09-23  498  {
> 421aa841a134f6 Sebastian Andrzej Siewior 2011-09-23  499  	return 0;
> 421aa841a134f6 Sebastian Andrzej Siewior 2011-09-23  500  }
> 421aa841a134f6 Sebastian Andrzej Siewior 2011-09-23  501
> 
> :::::: The code at line 497 was first introduced by commit
> :::::: 01bb59ebffdec314da8da66266edf29529372f9b usb/xhci: fix compilation warning when !CONFIG_PCI && !CONFIG_PM
> 
> :::::: TO: David Cohen <david.a.cohen@linux.intel.com>
> :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 

This issue gets resolved in the next upstream patch in that series:
fabbd95cc47c xhci: Move functions to setup msi to xhci-pci

If that is not on its way to 6.3 stable then I can write some custom
fix for it.

Thanks
-Mathias
