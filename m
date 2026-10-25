Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792968081;
	b=me4xo560jieng9Sf7QmXOCJiKZoWqmy2s/ID4kkR/hiqpLLs6Q0bmO9/AwecME39bj4N
	 GAl+1NsRbchtmXpnbfbizFOoXg+of6JHLSfVPWoMaG8Thz2VmDbunNXyZUHFFa2nVR7Od
	 avvIurYE7jgDk1ZjiaG5fW5e4Op0pZqAbBGlFxjTJre8c93JxGpl1erDo24kdXI0G5ocH
	 qRKMNEjXBrwuexgPuwxZWl8kHikkGIW2eC0iVc/U88yA6gBE4EK4f9JceaVtTs2HcgPUq
	 7qfVL9aKciZsu5trCqfNccw/xBza/KbFtd/fZTcGeJu7YYUDUuwUe4VprFjmeiio4rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792968081;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=BYhwEPlk5ecLTu4XbRi6L+u2Q7cMf+48BjLiZm8/FDg=;
	b=A62YVTnzHRS54O8tCDGeNfBQXThZIWHfsYKb5djImqnMM7BAq/ik1Bj0+Nc12Qq03WNW
	 P0dzHW9qtg7SOyeyX3iR5aGV48CTe+mq//o67SkmXGoDjiX2mIxDBAxJaNQBHKnIn6LRF
	 IkrickDIj69uWQ54u4Z8EtzJmcE4dr2hIfflgZYy9EPiHk0CU7cH6+z3dVcVjBWGe7Gsx
	 ZUOPQ3zeUy19wif00nPjYPe5SbdZovAtxWTPqwxpykuvbYrHjAbuktzBDZpR8BaY+1YAh
	 65qbZvTpS6cAZNPOKNvzm6Zu0ZVxXh9/m+wfbn3/KtpUnw46Sar1JWRkvm9M8FmGPAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E1oBN3nm;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF91606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 22:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF91606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E1oBN3nm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792968078; x=1824504078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kvzwoR+8VNI8tNzfRJsQ8MOvQ6RSGD+e6l76DLCTh2s=;
  b=E1oBN3nmDpGkZzzX+C83blUDNOZifLvqsh0p6RZ0Gl1XJn9v59GRO97W
   jkP9jGtaS4DBlLcF4HQ2gG7X7lbB2ce1fUADT3ez1bno2OiZHN3VgGRuU
   Ch6bHQbj8vo1UMnKi1fkZH8T57X3oXK/fl0YZvo9OKSJdGDia2qQ0wcyE
   2VUCbyDhLADV9yvmx99DSRoo2FLQBrbLuP8G1uc9RcYzng/HD+IxUUCc6
   4T11+Q3SXG3rFR1EzmM1j6knPWinxeo7hJYMDzv1ZaHm/aqXruTLoAxac
   c9XfxMIu+k5oPZTkeAw2/LxSZ/emoCxXEhwCNb2CkPn1qsJITzSLE51cj
   w==;
X-CSE-ConnectionGUID: LuztqQVZQPaaKKcuApABzQ==
X-CSE-MsgGUID: BbjUsNpcT7O1413qW+Fz4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1516594"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1516594"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 15:41:17 -0700
X-CSE-ConnectionGUID: sldzHzjYQtKokEHKL9G8+A==
X-CSE-MsgGUID: iaNmNMiMS+mcTQoLjeiqZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4009937"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Oct 2026 15:41:16 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL6ts-00000000VDO-32qq;
	Sun, 25 Oct 2026 22:41:12 +0000
Date: Mon, 26 Oct 2026 06:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: Wang Zhaolong <wangzhaolong3@outlook.com>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ksmbd: fix named-pipe reply loss with small output
 buffers
Message-ID: <202610260610.5prVfJss-lkp@intel.com>
References: <TYZPR02MB695916EEB5AC02FE8DBC31BCE6622@TYZPR02MB6959.apcprd02.prod.outlook.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR02MB695916EEB5AC02FE8DBC31BCE6622@TYZPR02MB6959.apcprd02.prod.outlook.com>

Hi Wang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f47d223627f80cb7a1eb14c585fe6cb35de5e984]

url:    https://github.com/intel-lab-lkp/linux/commits/Wang-Zhaolong/ksmbd-avoid-races-between-named-pipe-operations/20261025-173237
base:   f47d223627f80cb7a1eb14c585fe6cb35de5e984
patch link:    https://lore.kernel.org/r/TYZPR02MB695916EEB5AC02FE8DBC31BCE6622%40TYZPR02MB6959.apcprd02.prod.outlook.com
patch subject: [PATCH 2/2] ksmbd: fix named-pipe reply loss with small output buffers
config: powerpc64-randconfig-1001-20261026 (https://download.01.org/0day-ci/archive/20261026/202610260610.5prVfJss-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610260610.5prVfJss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610260610.5prVfJss-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/smb/server/smb2pdu.c:8670 function parameter 'rpc' not described in 'smb2_pipe_response_done'
>> Warning: fs/smb/server/smb2pdu.c:8670 function parameter 'nbytes' not described in 'smb2_pipe_response_done'
>> Warning: fs/smb/server/smb2pdu.c:8670 expecting prototype for smb2_read_pipe(). Prototype was for smb2_pipe_response_done() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
