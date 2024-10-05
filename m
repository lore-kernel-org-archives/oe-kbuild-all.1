Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1B01C2BD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 03:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728100143; cv=none; b=Do1Ul3hbomk8Ls9oGJkqSxuudt4zIkH6LWy/VFDCxhhcy1yKHgS4J+vxSMhRhDvOdJeIxxYUPB1QNyERrzr0FCzFFYpcZSORcRdIgVmiguzGLt5HqoMyrZd0luIxhHlmd6it0jukB/6XhbqRXheRXK0ZRYs6uw4B8xmrvshBWBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728100143; c=relaxed/simple;
	bh=Rl9H/4uXicjr8Khdfjhs8QAZ6pUx+IOd9fPowrw0QrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C17NWjIqQTuu1TkvYAilffAVlloT/N97iWRdk/2hUJrJwTPpj0AhxwncgKamjjTktC4AM3+Kq+YyBf3kacRseaxLJkyjTXGTbyT/6FCM6FTD1XBAQ6furLngmtvWj3uZnUln8WmNmUMeKSTlg0iTPoawOKzMItwgyigV9MpHwnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gp4FccHo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gp4FccHo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728100142; x=1759636142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rl9H/4uXicjr8Khdfjhs8QAZ6pUx+IOd9fPowrw0QrA=;
  b=Gp4FccHoNkYNd+DcqeAxy+/ZtMHmx7H858LVBRxs+lCMPRvktxUz8+8p
   gpxOCI4mEKL8EWv43RXAoTp8b8wLlmm0QM2k09Cyb4ozDiwDS70rsgKS/
   L8tlS2Jm8XvvDDPdpETZn/nH1acz84e4OZ+LxOVaMuPDB1Rn53DXNiR0W
   6OHyE9kE/cT0Y1L201sFxBYZYsbhKTIBBXNwjPEzC+cNykTJipFW1pWJY
   +ZL7fWg7roz6a9IZrmcQGKE8fqri4hWbiYI83+fNNlSWyPGEKalPQgESs
   HjvMczfWZ6pZYBxZqEMs++zgzBL9CFUesOhxUMzeAbSru8huYPb3TMLdK
   g==;
X-CSE-ConnectionGUID: 3OH/YIyZS5CcAmd3UOH/rA==
X-CSE-MsgGUID: z4h/kJpIQjStw0ZJPiHTPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37931930"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="37931930"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 20:49:01 -0700
X-CSE-ConnectionGUID: oNZme5hgRGCPYSwWigtLLA==
X-CSE-MsgGUID: OEqRuqUwSuiL8fs0xhePMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="75719530"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Oct 2024 20:48:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swvml-0002X3-1T;
	Sat, 05 Oct 2024 03:48:51 +0000
Date: Sat, 5 Oct 2024 11:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: Taehee Yoo <ap420073@gmail.com>, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, edumazet@google.com, almasrymina@google.com,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	donald.hunter@gmail.com, corbet@lwn.net, michael.chan@broadcom.com
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, kory.maincent@bootlin.com,
	andrew@lunn.ch, maxime.chevallier@bootlin.com, danieller@nvidia.com,
	hengqi@linux.alibaba.com, ecree.xilinx@gmail.com,
	przemyslaw.kitszel@intel.com, hkallweit1@gmail.com,
	ahmed.zaki@intel.com, paul.greenwalt@intel.com,
	rrameshbabu@nvidia.com, idosch@nvidia.com, asml.silence@gmail.com,
	kaiyuanz@google.com, willemb@google.com,
	aleksander.lobakin@intel.com, dw@davidwei.uk,
	sridhar.samudrala@intel.com, bcreeley@amd.com, ap420073@gmail.com
Subject: Re: [PATCH net-next v3 7/7] bnxt_en: add support for device memory
 tcp
Message-ID: <202410051156.r68SYo4V-lkp@intel.com>
References: <20241003160620.1521626-8-ap420073@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003160620.1521626-8-ap420073@gmail.com>

Hi Taehee,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Taehee-Yoo/bnxt_en-add-support-for-rx-copybreak-ethtool-command/20241004-000934
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241003160620.1521626-8-ap420073%40gmail.com
patch subject: [PATCH net-next v3 7/7] bnxt_en: add support for device memory tcp
config: x86_64-kismet-CONFIG_NET_DEVMEM-CONFIG_BNXT-0-0 (https://download.01.org/0day-ci/archive/20241005/202410051156.r68SYo4V-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410051156.r68SYo4V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051156.r68SYo4V-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NET_DEVMEM when selected by BNXT
   WARNING: unmet direct dependencies detected for NET_DEVMEM
     Depends on [n]: NET [=y] && DMA_SHARED_BUFFER [=n] && GENERIC_ALLOCATOR [=y] && PAGE_POOL [=y]
     Selected by [y]:
     - BNXT [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && PCI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
