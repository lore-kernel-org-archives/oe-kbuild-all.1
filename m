Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214032;
	b=Ci+5mSdkCYQFinJY6x9WzFvoOboXGlJpnv8W1SR/XlX9C+nStdS4oJY+miZxhRe+wmRV
	 pltCtHooBNQGEzsuoEAGa5SpFJraYRwZo56zMrV4anWC7olLMB3OfDE9K1AU2res0TYWW
	 wPky2On/tSi7w8lB3UzI07DsyLuAW1TvZjdfZflCvphcLReyYPgiAPL5mrqIFcKsBAhk+
	 R8/vhTpiPES/ASTEgqmpx24FUR1Z4nO5W2sRROQyHyBn8NeHKFWOmmWt6IgWNZ2reTIQ9
	 Dbr4vQUZSvrUUOhBJOG3n2iZh9XEyr0cxWX+XfLNm5fFNSC5tRv8QqI7P4KnyGmySKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214032;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0SF6Z6fkYcC3mNc32hQG4riaKfE87q4Tb0lTvxci1qc=;
	b=TRVSwMQlgvyU1acEIr67eXSQlQSyYAmNWOdm/aE/4BkyLGZvwV+7cuifI5x+T19E39lv
	 DBDimM7P64M+LZdvHpj/iJj3Ma4SpVhldDTxDT2k8oNHZ9loq0KecXf44ZMvFq2bWMmeG
	 8GM8fYGHxX60Aa4VM8Yrkg/G8bhD5orfufQ8wIoE3Ea7oIsfYRfCBOvlq9pg2rdka9iaY
	 lVzilqDYefOfdiY45Q5PXzbUvyBIUcMWe4Z9svKEgHVpuC8IceBW6pShE1vVsf5Sr1kEu
	 cAjLdw17/pEgRvycQx2Y3PIZ2gyIBdrWOysq7ZIXou4YVJudnrYbIGhR+RDiLNRXpeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="l/etsA9F";
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53913606A31E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 19:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53913606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l/etsA9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793214027; x=1824750027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SvF0qrPpa1mze0SmaiTONN6P7h8s1a5USFeiNzRZx70=;
  b=l/etsA9Fe93Z4/Lj0vUhDHucNoErpbLS8WLcBqyptToKLY6bVUoLXmca
   +/ONWZo28LlBg6Szd3HcuqzornyxfwChvHXWQ+JOSc2iTYHCfuSF4z/ES
   5drWG6JuWwBVpqFOVExzJn/8OJK/PCqvTNdDdQ5YD/eAr6sQvfNhBwfOK
   UR+yAKHXe1TQB4PB09bMz7nr0ZRp56QED08jx1tj6DSCvxox4MfiBfLZ5
   mmIWCZtH60WBIuFsOZsXQMTrfAGWot+17a2T3Jnjev04pkYZjHi5+QCEB
   a5cSbOrhMDgZdRxaq8fo4a41+6qRV6pi9w59a9jE/uvZ9rGQLhn1cDjA7
   Q==;
X-CSE-ConnectionGUID: XgDTgKVnRXq2S37LbCAxdQ==
X-CSE-MsgGUID: xsDOoTKYS0i4VBseWI0ZOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1962914"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1962914"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 11:59:47 -0700
X-CSE-ConnectionGUID: kAwP7TzjT2a7K5T1rBaG6Q==
X-CSE-MsgGUID: zEn4UmG8RQ6ShkL/enzcxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4789786"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Oct 2026 11:59:44 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM8s9-00000000Z8O-0v7S;
	Wed, 28 Oct 2026 18:59:41 +0000
Date: Thu, 29 Oct 2026 02:58:42 +0800
From: kernel test robot <lkp@intel.com>
To: Henry Martin <bsdhenrymartin@gmail.com>,
	Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] cifs: fix UAF read of server->hostname in
 cifs_get_spnego_key()
Message-ID: <202610290208.vMXHYOZa-lkp@intel.com>
References: <20261027150438.943354-1-bsdhenrymartin@gmail.com>
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
In-Reply-To: <20261027150438.943354-1-bsdhenrymartin@gmail.com>

Hi Henry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on manguebit/cifs-next]
[also build test WARNING on manguebit/cifs-fixes linus/master v7.3 next-20261027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Henry-Martin/cifs-fix-UAF-read-of-server-hostname-in-cifs_get_spnego_key/20261027-230438
base:   https://git.manguebit.org/linux.git cifs-next
patch link:    https://lore.kernel.org/r/20261027150438.943354-1-bsdhenrymartin%40gmail.com
patch subject: [PATCH] cifs: fix UAF read of server->hostname in cifs_get_spnego_key()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261029/202610290208.vMXHYOZa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290208.vMXHYOZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610290208.vMXHYOZa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/cifs_spnego.c: In function 'cifs_get_spnego_key':
>> fs/smb/client/cifs_spnego.c:199:1: warning: the frame size of 1304 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     199 | }
         | ^


vim +199 fs/smb/client/cifs_spnego.c

f1d662a7d5e532 fs/cifs/cifs_spnego.c Steve French  2007-11-05  195  
f1d662a7d5e532 fs/cifs/cifs_spnego.c Steve French  2007-11-05  196  out:
f1d662a7d5e532 fs/cifs/cifs_spnego.c Steve French  2007-11-05  197  	kfree(description);
f1d662a7d5e532 fs/cifs/cifs_spnego.c Steve French  2007-11-05  198  	return spnego_key;
f1d662a7d5e532 fs/cifs/cifs_spnego.c Steve French  2007-11-05 @199  }
b74cb9a80268be fs/cifs/cifs_spnego.c Sachin Prabhu 2016-05-17  200  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
